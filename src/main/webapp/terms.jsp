<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Terms & Conditions</title>
    <link rel="stylesheet" href="css/style.css">
    <style>
        /* General Styles */
        body {
            margin: 0;
            padding: 0;
            font-family: "Arial", sans-serif;
            background: #f9f9f9;
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
            border-radius: 5px;
            transition: background-color 0.3s ease;
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
        main p {
            font-size: 1.2em;
            margin-bottom: 20px;
            line-height: 1.6;
            color: #555;
        }
        main ul {
            margin: 20px 0;
            padding-left: 20px;
        }
        main ul li {
            font-size: 1em;
            margin: 10px 0;
            line-height: 1.5;
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
        @media (max-width: 600px) {
            header {
                flex-direction: column;
                align-items: flex-start;
            }
            nav ul {
                flex-wrap: wrap;
                gap: 10px;
            }
            main {
                margin: 20px;
                padding: 15px;
            }
        }
    </style>
</head>
<body>
    <!-- Header Section -->
    <header>
        <div class="logo">
            <img src="<%= request.getContextPath() %>/images/3.jpeg" alt="Blood Bank Logo">
        </div>
        <nav>
            <ul>
                <li><a href="index.jsp">Home</a></li>
                 <li><a href="<%= request.getContextPath() %>/jsp/registerDonor.jsp">Register Donor</a></li>
              <li><a href="<%= request.getContextPath() %>/jsp/requestBlood.jsp">Request Blood</a></li>
                <li><a href="logout.jsp">Logout</a></li>
            </ul>
        </nav>
    </header>
    
    <!-- Main Content -->
    <main>
        <h1>Terms & Conditions</h1>
        <p>Welcome to the Blood Donation System. By registering as a donor or using this system, you agree to the following terms and conditions:</p>

        <h2>1. General Terms</h2>
        <ul>
            <li>You must be at least 18 years old and in good health to donate blood.</li>
            <li>By registering, you agree to donate blood voluntarily and without any expectation of compensation.</li>
            <li>All the information you provide during registration must be truthful, accurate, and up-to-date.</li>
            <li>By using the system, you agree to comply with the applicable laws and regulations governing blood donation in your region.</li>
        </ul>

        <h2>2. Privacy and Data Protection</h2>
        <ul>
            <li>Your personal information, including name, contact details, and medical history, will be kept confidential and used only for the purposes of blood donation.</li>
            <li>We will not share your personal data with third parties except as necessary for medical purposes or as required by law.</li>
            <li>You have the right to access, modify, and request the deletion of your personal information stored in the system, subject to applicable laws.</li>
        </ul>

        <h2>3. Blood Donation Guidelines</h2>
        <ul>
            <li>Donors must meet specific health criteria before donating. If you are deemed unfit to donate blood for any reason, you will be notified accordingly.</li>
            <li>You should refrain from donating blood if you have certain medical conditions or have engaged in activities that pose a risk to the safety of the blood supply (e.g., recent surgery, high-risk behaviors).</li>
            <li>The system reserves the right to reject any donation based on medical or safety reasons.</li>
        </ul>

        <h2>4. Blood Request and Availability</h2>
        <ul>
            <li>The system facilitates blood requests, but we cannot guarantee the immediate availability of specific blood types due to demand and supply constraints.</li>
            <li>The system will notify you in case your blood request has been fulfilled or if an issue arises with the request.</li>
            <li>Blood donations are subject to availability, and the system will attempt to meet the demand for blood as best as possible.</li>
        </ul>

        <h2>5. Liability and Disclaimers</h2>
        <ul>
            <li>The Blood Donation System is not responsible for any adverse reactions or health consequences that may arise from the blood donation process.</li>
            <li>Donors are advised to consult a healthcare professional if they have any concerns regarding their health prior to donation.</li>
            <li>The system makes no representations or warranties regarding the availability or accuracy of blood donation services.</li>
        </ul>

        <h2>6. Termination of Account</h2>
        <ul>
            <li>The Blood Donation System reserves the right to suspend or terminate any donor account that violates these terms or engages in fraudulent or harmful behavior.</li>
            <li>Upon termination of your account, you will no longer be able to access donation services or request blood through the system.</li>
        </ul>

        <h2>7. Modifications to Terms</h2>
        <ul>
            <li>We may update these terms from time to time. Any changes will be posted on this page, and the date of the last update will be indicated at the bottom.</li>
            <li>By continuing to use the system after any changes to the terms, you agree to abide by the updated terms.</li>
        </ul>

        <h2>8. Governing Law</h2>
        <ul>
            <li>These terms and conditions are governed by the laws of india. Any disputes arising from these terms will be resolved in the appropriate courts within india.</li>
        </ul>

        <p>If you have any questions about these terms or require further information, please contact us at [Akash Giri-8010236068].</p>
    </main>

      <footer>
        <p>&copy;@AKASH:2024 Blood Donation System. All rights reserved.</p>
    </footer>
</body>
</html>
