package servlets;

import java.io.IOException;
import java.sql.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;

public class AdminServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	doGet(request,response);
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        try (Connection con = ConnectionProvider.getConnection()) {
            if ("viewDonorList".equals(action)) {
                viewDonorList(request, response);
            } else if ("viewBloodRequests".equals(action)) {
                viewBloodRequests(request, response);
            } else if ("updateDonorForm".equals(action)) {
                showUpdateDonor(con, request, response);
            } else if ("updateDonor".equals(action)) {
                updateDonor(con, request, response);
            } else if ("deleteDonor".equals(action)) {
                deleteDonor(con, request, response);
            } else if ("deleteBloodRequest".equals(action)) {
                deleteBloodRequest(con, request, response);
            } else {
                response.sendRedirect("admin.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }

    private void showUpdateDonor(Connection con,HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String donorIdStr = request.getParameter("donorId");
        if (donorIdStr != null && !donorIdStr.isEmpty()) {
            try {
                int donorId = Integer.parseInt(donorIdStr);
                String sql = "SELECT * FROM donor WHERE id = ?";
                
                try (PreparedStatement ps = con.prepareStatement(sql)) {
                    ps.setInt(1, donorId);
                    ResultSet rs = ps.executeQuery();
                    
                    if (rs.next()) {
                        Donor donor = new Donor(
                            rs.getInt("id"),
                            rs.getString("name"),
                            rs.getString("email"),
                            rs.getString("city"),
                            rs.getString("blood_group"),
                            rs.getString("mobile_number")  // Fetch mobile number as well
                        );
                        
                        // Set the donor object as an attribute to be accessed in the JSP
                        request.setAttribute("donor", donor);
                        
                        // Forward the request to the JSP page
                        RequestDispatcher dispatcher = request.getRequestDispatcher("jsp/updateDonorForm.jsp");
                        dispatcher.forward(request, response);
                    } else {
                        // Donor not found, redirect to an error page or display a message
                        response.sendRedirect("errorPage.jsp?status=donorNotFound");
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
                response.sendRedirect("errorPage.jsp?status=errorFetchingDonor");
            }
        } else {
            // If donorId is not provided in the request, redirect to an error page or show a message
            response.sendRedirect("errorPage.jsp?status=invalidDonorId");
        }
    }


    private void updateDonor(Connection con,HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            String donorId = request.getParameter("donorId");
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String city = request.getParameter("city");
            String bloodGroup = request.getParameter("bloodGroup");
            String mobileNumber = request.getParameter("mobileNumber");  // Get mobile number

            String sql = "UPDATE donor SET name = ?, email = ?, blood_group = ?, city = ?, mobile_number = ? WHERE id = ?";
            try (PreparedStatement ps = con.prepareStatement(sql)) {
                ps.setString(1, name);
                ps.setString(2, email);
                ps.setString(3, bloodGroup);
                ps.setString(4, city);
                ps.setString(5, mobileNumber);  // Set the mobile number in the query
                ps.setInt(6, Integer.parseInt(donorId));  // Ensure the ID is set as integer if needed

                int rows = ps.executeUpdate();
                response.sendRedirect("jsp/admin.jsp?status=" + (rows > 0 ? "updateSuccess" : "updateFail"));
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error updating donor: " + e.getMessage());
        }
    }

    private void viewDonorList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Donor> donors = new ArrayList<>();
        try (Connection con = ConnectionProvider.getConnection()) {
            // SQL query to retrieve all donors, now including mobile_number
            String query = "SELECT id, name, email, city, blood_group, mobile_number FROM donor";
            
            try (PreparedStatement ps = con.prepareStatement(query);
                 ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    // Construct donor object from result set
                    Donor donor = new Donor(
                            rs.getInt("id"),
                            rs.getString("name"),
                            rs.getString("email"),
                            rs.getString("city"),
                            rs.getString("blood_group"),
                            rs.getString("mobile_number") // Added mobile_number
                    );
                    donors.add(donor);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle any exception (e.g., by forwarding to an error page or setting an error attribute)
            request.setAttribute("error", "Error fetching donor list. Please try again later.");
           
            return;
        }

        // Set the list of donors as a request attribute
        request.setAttribute("donors", donors);
        
        // Forward the request to the JSP page to display the donor list
        request.getRequestDispatcher("jsp/viewDonorList.jsp").forward(request, response);
    }


    private void viewBloodRequests(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<BloodRequest> requests = new ArrayList<>();
        try (Connection con = ConnectionProvider.getConnection()) {
            String query = "SELECT * FROM request_for_blood";
            try (PreparedStatement ps = con.prepareStatement(query);
                 ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    BloodRequest bloodRequest = new BloodRequest(
                        rs.getInt("request_id"),
                        rs.getString("name"),
                        rs.getString("mobile_number"),
                        rs.getString("city"),
                        rs.getString("blood_group"),
                        rs.getTimestamp("request_date")
                    );
                    requests.add(bloodRequest);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        request.setAttribute("requests", requests);
        RequestDispatcher rd = request.getRequestDispatcher("jsp/viewBloodRequests.jsp");
        rd.forward(request, response);
    }
    private void deleteDonor(Connection con, HttpServletRequest request, HttpServletResponse response) throws IOException 
    ,ServletException{
        try {
            String donorIdStr = request.getParameter("donorId");
            int donorId = Integer.parseInt(donorIdStr); // Convert the string to integer

            String sql = "DELETE FROM donor WHERE id = ?";
            try (PreparedStatement ps = con.prepareStatement(sql)) {
                ps.setInt(1, donorId);//setString()
                int rows = ps.executeUpdate();
                if (rows > 0) {
                    request.setAttribute("status", "Donor information deleted successfully.");
                } else {
                    request.setAttribute("status", "Failed to delete donor information.");
                }
                RequestDispatcher rd = request.getRequestDispatcher("jsp/admin.jsp");
                rd.forward(request, response);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().println("Error deleting donor: " + e.getMessage());
        }
    }


    private void deleteBloodRequest(Connection con, HttpServletRequest request, HttpServletResponse response) throws IOException ,
    ServletException{
        try {
            String requestIdStr = request.getParameter("requestId");
            int requestId = Integer.parseInt(requestIdStr); // Convert the string to integer
            String sql = "DELETE FROM request_for_blood WHERE request_id = ?";
            try (PreparedStatement ps = con.prepareStatement(sql)) {
                ps.setInt(1, requestId);//setString()
                int rows = ps.executeUpdate();
                if (rows > 0) {
                    request.setAttribute("status", "Blood request information deleted successfully.");
                } else {
                    request.setAttribute("status", "Failed to delete blood request information.");
                }
                RequestDispatcher rd = request.getRequestDispatcher("jsp/admin.jsp");
                rd.forward(request, response);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().println("Error deleting blood request: " + e.getMessage());
        }
    }

}
