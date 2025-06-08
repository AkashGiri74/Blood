<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register Donor</title>
    <style>
          body {
            margin: 0;
            padding: 0;
            font-family: "Arial", sans-serif;
            background: #f4f4f9;
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
            text-shadow: 1px 2px 5px rgba(0, 0, 0, 0.1);
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
        input, textarea, select, button {
            font-size: 16px;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            box-shadow: inset 0 2px 5px rgba(0, 0, 0, 0.05);
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
    <h1>Register as a Blood Donor</h1>

    <!-- Success/Error Messages will be shown here -->
    <div id="message" style="text-align: center; margin-bottom: 20px;"></div>

    <!-- Registration Form -->
    <form action="<%= request.getContextPath() %>/RegisterDonorServlet" method="post">
        <label for="name">Name:</label>
        <input type="text" id="name" name="name" placeholder="Enter your full name" required>

        <label for="fatherName">Father's Name:</label>
        <input type="text" id="fatherName" name="fatherName" placeholder="Enter your father's name" required>

        <label for="motherName">Mother's Name:</label>
        <input type="text" id="motherName" name="motherName" placeholder="Enter your mother's name" required>

        <label for="mobileNumber">Mobile Number:</label>
        <input type="text" id="mobileNumber" name="mobileNumber" placeholder="Enter your mobile number" required>

        <label for="email">Email:</label>
        <input type="email" id="email" name="email" placeholder="Enter your email address">

        <label for="city">City:</label>
        <input type="text" id="city" name="city" placeholder="Enter your city" required>

        <label for="address">Address:</label>
        <textarea id="address" name="address" placeholder="Enter your complete address" rows="4" required></textarea>

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

        <button type="submit">Register</button>
    </form>
</main>

<script>

window.onload = function() {
    const params = new URLSearchParams(window.location.search);
    const successMessage = params.get('success');
    if (successMessage) {
        alert(successMessage);
    }
}
    // Simple JavaScript function to show alert messages
    function showMessage(message, isSuccess) {
        var messageDiv = document.getElementById("message");
        messageDiv.style.color = isSuccess ? "green" : "red";
        messageDiv.innerHTML = message;
        alert(message); // This will display the message in a popup alert
    }

    // Form submit handler
    function handleFormSubmit(event) {
        event.preventDefault(); // Prevent form submission

        // Get form values (for demo purposes)
        var name = document.getElementById("name").value;
        var fatherName = document.getElementById("fatherName").value;
        var mobileNumber = document.getElementById("mobileNumber").value;
        
        // Simulate registration logic
        if (name && fatherName && mobileNumber) {
            // If the form is valid, show success message
            showMessage("Registration Successful!", true);

            // Redirect to index.jsp after success message is shown
            setTimeout(function() {
            	alert("Registration Successfull !!!!");
                window.location.href = "<%= request.getContextPath() %>/index.jsp"; // Redirect to the homepage
                showMessage("Registartion Successfull!!.", true);
            }, 100); // Delay of 2 seconds before redirect
        } else {
            // If the form is invalid, show error message
            showMessage("Please fill in all required fields.", false);
        }
    }
</script>
   <footer>
        <p>&copy;@AKASH:2024 Blood Donation System. All rights reserved.</p>
    </footer>

</body>
</html>