package servlets;

import java.io.IOException;
import java.sql.*;
import java.util.logging.*;

import javax.servlet.*;
import javax.servlet.http.*;

public class RegisterDonorServlet extends HttpServlet {
    private static final Logger logger = Logger.getLogger(RegisterDonorServlet.class.getName());

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	
    	
        // Retrieve form parameters from JSP
        String name = request.getParameter("name");
        String fatherName = request.getParameter("fatherName");
        String motherName = request.getParameter("motherName");
        String mobileNumber = request.getParameter("mobileNumber");
        String email = request.getParameter("email");
        String city = request.getParameter("city");
        String address = request.getParameter("address");
        String bloodGroup = request.getParameter("bloodGroup");

        // Server-side validation for critical fields
        if (name == null || name.isEmpty() ||
            mobileNumber == null || !mobileNumber.matches("\\d{10}") ||
            city == null || city.isEmpty() ||
            bloodGroup == null || bloodGroup.isEmpty()) {
            
            // Redirect back with error message
            response.sendRedirect("jsp/registerDonor.jsp?error=Missing or invalid fields. Please check your input.");
            return;
        }

        // Database operation
        try (Connection con = ConnectionProvider.getConnection()) {
            String query = "INSERT INTO donor (name, father_name, mother_name, mobile_number, email, city, address, blood_group) "
                         + "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

            try (PreparedStatement ps = con.prepareStatement(query)) {
                ps.setString(1, name);
                ps.setString(2, fatherName);
                ps.setString(3, motherName);
                ps.setString(4, mobileNumber);
                ps.setString(5, email);
                ps.setString(6, city);
                ps.setString(7, address);
                ps.setString(8, bloodGroup);

                ps.executeUpdate();
            }

        } catch (SQLException e) {
            // Log error and redirect to form with message
            logger.log(Level.SEVERE, "Database error occurred while registering donor", e);
            response.sendRedirect("jsp/registerDonor.jsp?error=Database error occurred. Please try again.");
            return;
        }

        logger.log(Level.SEVERE, "Donor Registration Scussessfull");
        response.sendRedirect("index.jsp?success=Donor registered successfully");
    }
}