<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Login - Blood Donation System</title>
    <link rel="stylesheet" href="../css/style.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f9;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .login-container {
            background-color: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            width: 300px;
            text-align: center;
        }

        h1 {
            color: #e74c3c;
            font-size: 2em;
        }

        input[type="text"], input[type="password"] {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
        }

        input[type="submit"] {
            width: 100%;
            padding: 10px;
            background-color: #e74c3c;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        input[type="submit"]:hover {
            background-color: #c0392b;
        }

        .error-message {
            color: red;
            font-weight: bold;
            margin-top: 10px;
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

    <div class="login-container">
        <h1>Admin Login</h1>

        <!-- Display error message if login failed -->
        <c:if test="${not empty error}">
            <p class="error-message">${error}</p>
        </c:if>

        <form action="<%= request.getContextPath() %>/AdminLoginServlet" method="post">
            <input type="text" name="username" placeholder="Enter Username" required>
            <input type="password" name="password" placeholder="Enter Password" required>
            <input type="submit" value="Login">
        </form>
    </div>
    
       

</body>
</html>
