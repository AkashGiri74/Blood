<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome - Blood Donation System</title>
    <link rel="stylesheet" href="css/style.css">
    <style>
        /* General Styles */
        body {
            margin: 0;
            padding: 0;
            font-family: "Arial", sans-serif;
            line-height: 1.6;
            background: linear-gradient(to bottom, #f9f9f9, #e74c3c 85%);
            color: #333;
        }
        header {
            background: #e74c3c;
            color: #fff;
            padding: 10px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }
        .logo img {
            height: 60px;
        }
        nav ul {
            list-style: none;
            display: flex;
            margin: 0;
            padding: 0;
        }
        nav ul li {
            margin: 0 15px;
        }
        nav ul li a {
            text-decoration: none;
            color: #fff;
            font-weight: bold;
            font-size: 16px;
            padding: 5px 10px;
            transition: background-color 0.3s ease;
        }
        nav ul li a:hover {
            background-color: #c0392b;
            border-radius: 5px;
        }
        main {
            text-align: center;
            padding: 50px 20px;
            margin-top: 20px;
        }
        main h1 {
            font-size: 3em;
            color: #e74c3c;
            margin-bottom: 20px;
            text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.2);
        }
        main img {
            max-width: 90%;
            height: auto;
            border-radius: 15px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            transition: transform 0.3s ease;
        }
        main img:hover {
            transform: scale(1.05);
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
        /* Marquee Styles */
        .marquee {
            background-color: #f39c12;
            color: white;
            font-size: 18px;
            font-weight: bold;
            padding: 10px;
            text-align: center;
        }
    </style>
</head>
<body>
    <header>
        <div class="logo">
            <img src="images/3.jpeg" alt="Blood Bank Logo">
        </div>
        <nav>
            <ul>
                <li><a href="jsp/registerDonor.jsp">RegisterAsDonor</a></li>
                <li><a href="jsp/requestBlood.jsp">RequestForBloodDonorList</a></li>
                <li><a href="terms.jsp">Terms & Conditions</a></li>
               
                <li><a href="jsp/adminLogin.jsp">Admin Login</a></li>

            </ul>
        </nav>
    </header>
    
    <!-- Marquee Section -->
    <div class="marquee">
        <marquee>Important: Please read the <a href="terms.jsp" style="color: white; font-weight: bold;">Terms and Conditions</a> before registering or donating blood!</marquee>
    </div>

    <main>
        <h1>Welcome to the Blood Donation System</h1>
        <img src="images/1.jpeg" alt="Welcome Image">
    </main>

    <footer>
        <p>&copy;@AKASH:2024 Blood Donation System. All rights reserved.</p>
    </footer>
</body>
</html>
