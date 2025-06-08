<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Request Blood</title>
    <link rel="stylesheet" href="css/style.css">
    <style>
        /* General Styles */
        body {
            margin: 0;
            padding: 0;
            font-family: "Arial", sans-serif;
            background: #f7f7f7;
            color: #333;
        }
        header {
            background: #e74c3c;
            color: white;
            padding: 15px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }
        .logo img {
            height: 60px;
        }
        nav ul {
            list-style: none;
            margin: 0;
            padding: 0;
            display: flex;
        }
        nav ul li {
            margin: 0 15px;
        }
        nav ul li a {
            text-decoration: none;
            color: white;
            font-weight: bold;
            font-size: 16px;
            padding: 5px 10px;
            transition: background-color 0.3s ease;
            border-radius: 5px;
        }
        nav ul li a:hover {
            background: #c0392b;
        }
        main {
            max-width: 800px;
            margin: 50px auto;
            padding: 20px;
            background: white;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
        }
        main h1 {
            text-align: center;
            font-size: 2.5em;
            color: #e74c3c;
            margin-bottom: 20px;
        }
        form {
            display: flex;
            flex-direction: column;
            gap: 15px;
        }
        label {
            font-weight: bold;
            margin-bottom: 5px;
        }
        input, select, button {
            font-size: 16px;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }
        button {
            background: #e74c3c;
            color: white;
            border: none;
            font-weight: bold;
            cursor: pointer;
            transition: background 0.3s ease;
        }
        button:hover {
            background: #c0392b;
        }
     footer {
            background: #333;
            color: #fff;
            text-align: center;
            padding: 15px 0;
            margin-top: 30px;
            font-size: 14px;
            box-shadow: 0 -2px 5px rgba(0, 0, 0, 0.1);
        }
        footer p {
            margin: 0;
        }
    </style>
</head>
<body>
    <header>
        <div class="logo">
            <img src="<%= request.getContextPath() %>/images/3.jpeg" alt="Blood Bank Logo">
        </div>
        <nav>
            <ul>
                <li><a href="<%= request.getContextPath() %>/index.jsp">Home</a></li>
                <li><a href="<%= request.getContextPath() %>/index.jsp">Back to Dashboard</a></li>
                <li><a href="<%= request.getContextPath() %>/logout.jsp">Logout</a></li>
            </ul>
        </nav>
    </header>
    
    <main>
        <h1>Request Blood</h1>
        <!-- Error Message Display -->
        <% if (request.getAttribute("errorMessage") != null) { %>
            <p style="color: red; text-align: center;"><%= request.getAttribute("errorMessage") %></p>
        <% } %>

        <form action="<%= request.getContextPath() %>/RequestBloodServlet" method="post">
            <label for="name">Name:</label>
            <input type="text" id="name" name="name" placeholder="Enter your full name" required>
            
            <label for="mobileNumber">Mobile Number:</label>
            <input type="text" id="mobileNumber" name="mobileNumber" placeholder="Enter your mobile number" required>
            
            <label for="city">City:</label>
            <input type="text" id="city" name="city" placeholder="Enter your city" required>
            
            <label for="bloodGroup">Blood Group:</label>
            <select id="bloodGroup" name="bloodGroup" required>
                <option value="" disabled selected>Select your blood group</option>
                <option value="A+">A+</option>
                <option value="B+">B+</option>
                <option value="O+">O+</option>
                <option value="AB+">AB+</option>
                <option value="A-">A-</option>
                <option value="B-">B-</option>
                <option value="O-">O-</option>
                <option value="AB-">AB-</option>
            </select>

            <button type="submit">Submit Request</button>
        </form>
    </main>

      <footer>
        <p>&copy;@AKASH:2024 Blood Donation System. All rights reserved.</p>
    </footer>
</body>
</html>
