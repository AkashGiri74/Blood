package servlets;

import java.io.*;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.logging.*;

public class RequestBloodServlet extends HttpServlet {
    private static final Logger logger = Logger.getLogger(RequestBloodServlet.class.getName());

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve user input parameters
        String name = request.getParameter("name");
        String mobileNumber = request.getParameter("mobileNumber");
        String city = request.getParameter("city");
        String bloodGroup = request.getParameter("bloodGroup");
        
        
        if (name == null || name.isEmpty() ||
                mobileNumber == null || !mobileNumber.matches("\\d{10}") ||
                city == null || city.isEmpty() ||
                bloodGroup == null || bloodGroup.isEmpty()) {
                
                // Redirect back with error message
                response.sendRedirect("jsp/requestBlood.jsp?error=Missing or invalid fields. Please check your input.");
                return;
            }

        List<Donor> donorList = new ArrayList<>(); // List to hold donor details

        try (Connection con = ConnectionProvider.getConnection()) {
            // Step 1: Insert the user's blood request into the database
            String insertQuery = "INSERT INTO request_for_blood (name, mobile_number, city, blood_group) VALUES (?, ?, ?, ?)";
            try (PreparedStatement insertStmt = con.prepareStatement(insertQuery)) {
                insertStmt.setString(1, name);
                insertStmt.setString(2, mobileNumber);
                insertStmt.setString(3, city);
                insertStmt.setString(4, bloodGroup);
                insertStmt.executeUpdate();
            }

            // Step 2: Fetch matching blood donors
            String donorQuery = "SELECT name, mobile_number, city, blood_group FROM donor WHERE blood_group = ?";
            try (PreparedStatement donorStmt = con.prepareStatement(donorQuery)) {
                donorStmt.setString(1, bloodGroup);
                ResultSet rs = donorStmt.executeQuery();

                // Fetch data and populate donor list
                while (rs.next()) {
                    Donor donor = new Donor();
                    donor.setName(rs.getString("name"));
                    donor.setMobileNumber(rs.getString("mobile_number"));
                    donor.setCity(rs.getString("city"));
                    donor.setBloodGroup(rs.getString("blood_group"));
                    donorList.add(donor);
                }
            }

            // Step 3: Forward to JSP with donor list
            request.setAttribute("donorList", donorList);
            RequestDispatcher rd = request.getRequestDispatcher("jsp/showDonors.jsp");
            rd.forward(request, response);

        } catch (SQLException e) {
            // Log the exception and set an error message as a request attribute
            logger.log(Level.SEVERE, "Database error occurred while requesting blood", e);
            request.setAttribute("errorMessage", "Database error occurred. Please try again.");
            RequestDispatcher rd = request.getRequestDispatcher("jsp/requestBlood.jsp");
            rd.forward(request, response);
        }
    }

    // Inner class to represent a donor object
    public static class Donor {
        private String name;
        private String mobileNumber;
        private String city;
        private String bloodGroup;

        // Getters and Setters
        public String getName() {
            return name;
        }

        public void setName(String name) {
            this.name = name;
        }

        public String getMobileNumber() {
            return mobileNumber;
        }

        public void setMobileNumber(String mobileNumber) {
            this.mobileNumber = mobileNumber;
        }

        public String getCity() {
            return city;
        }

        public void setCity(String city) {
            this.city = city;
        }

        public String getBloodGroup() {
            return bloodGroup;
        }

        public void setBloodGroup(String bloodGroup) {
            this.bloodGroup = bloodGroup;
        }
    }
}
