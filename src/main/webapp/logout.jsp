<%@ page session="false" %> 
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Logout - Blood Donation System</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <header>
        <div class="logo">
            <img src="images/logo.png" alt="Blood Bank Logo">
        </div>
        <nav>
            <ul>
                <li><a href="index.jsp">Home</a></li>
                <li><a href="donor-register.jsp">Donor Register</a></li>
                <li><a href="blood-request.jsp">Blood Requests</a></li>
            </ul>
        </nav>
    </header>
    
    <main>
        <h1>You have been logged out</h1>
        <p>You have successfully logged out of the Blood Donation System.</p>
        
        <a href="index.jsp">Click here to return to the Home page</a>
    </main>

    <footer>
        <p>&copy;@AKASH:2024 Blood Donation System. All rights reserved.</p>
    </footer>

    <%
        // Invalidate the session to log the user out
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate(); // End the session
        }
        // Redirect to the homepage or login page after logout
        response.sendRedirect("index.jsp");
    %>
</body>
</html>  