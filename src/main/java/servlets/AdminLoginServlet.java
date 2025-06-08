package servlets;


import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;


public class AdminLoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Hardcoded admin credentials (for demonstration)
        String adminUsername = "AkashGiri";
        String adminPassword = "Akash@747288"; 

        // Get the user input from the login form
        String enteredUsername = request.getParameter("username");
        String enteredPassword = request.getParameter("password");

        // Validate credentials
        if (adminUsername.equals(enteredUsername) && adminPassword.equals(enteredPassword)) {
            // Successful login, redirect to admin page
            response.sendRedirect("jsp/admin.jsp");
        } else {
            // Invalid login, show error message and reload login page
            request.setAttribute("error", "Invalid username or password.");
            request.getRequestDispatcher("/jsp/adminLogin.jsp").forward(request, response);
        }
    }
}
