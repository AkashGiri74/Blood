<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Update Donor</title>
    <style>
        /* Body styling */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }

        h2 {
            color: #333;
            text-align: center;
            margin-top: 30px;
        }

        .form-container {
            width: 50%;
            margin: 20px auto;
            padding: 20px;
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        .form-container label {
            font-size: 16px;
            color: #555;
            margin: 10px 0 5px;
            display: block;
        }

        .form-container input[type="text"],
        .form-container input[type="email"],
        .form-container button {
            width: 100%;
            padding: 12px;
            margin: 8px 0;
            border: 1px solid #ccc;
            border-radius: 8px;
            box-sizing: border-box;
            font-size: 16px;
        }

        .form-container input[type="text"]:focus,
        .form-container input[type="email"]:focus {
            border-color: #4CAF50;
            outline: none;
        }

        .form-container button {
            background-color: #4CAF50;
            color: white;
            cursor: pointer;
            border: none;
            font-size: 18px;
        }

        .form-container button:hover {
            background-color: #45a049;
        }

        .form-container button:active {
            background-color: #3e8e41;
        }

        .form-container input[type="submit"]:hover {
            background-color: #45a049;
        }

        .message {
            margin-top: 20px;
            padding: 15px;
            font-size: 18px;
            font-weight: bold;
        }

        .message.success {
            color: green;
            background-color: #e7f7e7;
            border: 1px solid #4CAF50;
        }

        .message.error {
            color: red;
            background-color: #f7e7e7;
            border: 1px solid #e74c3c;
        }

        .form-container .form-row {
            margin-bottom: 15px;
        }

        /* Mobile responsiveness */
        @media screen and (max-width: 768px) {
            .form-container {
                width: 80%;
            }
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

    <h2>Update Donor Information</h2>

    <div class="form-container">
    
      <form id="updateForm" action="<%= request.getContextPath() %>/AdminServlet?action=updateDonor" method="post" onsubmit="return handleFormSubmit(event)">
    <input type="hidden" name="donorId" value="${donor.id}" />

    <div class="form-row">
        <label for="name">Name:</label>
        <input type="text" id="name" name="name" value="${donor.name}" required /><br/>
    </div>

    <div class="form-row">
        <label for="email">Email:</label>
        <input type="email" id="email" name="email" value="${donor.email}" required /><br/>
    </div>

    <div class="form-row">
        <label for="city">City:</label>
        <input type="text" id="city" name="city" value="${donor.city}" required /><br/>
    </div>

    <div class="form-row">
        <label for="bloodGroup">Blood Group:</label>
        <input type="text" id="bloodGroup" name="bloodGroup" value="${donor.bloodGroup}" required /><br/>
    </div>

    <div class="form-row">
        <label for="mobileNumber">Mobile Number:</label>
        <input type="text" id="mobileNumber" name="mobileNumber" value="${donor.mobileNumber}" required /><br/>
    </div>

    <button type="submit">Update Donor</button>
</form>


    <script>
        // JavaScript function to handle form submission
        function handleFormSubmit(event) {
            event.preventDefault(); // Prevent the form from submitting immediately

            // Get form data
            const name = document.getElementById("name").value;
            const email = document.getElementById("email").value;
            const city = document.getElementById("city").value;
            const bloodGroup = document.getElementById("bloodGroup").value;

            // Basic validation (can be expanded)
            if (!name || !email || !city || !bloodGroup) {
                alert("Please fill in all the fields.");
                return false;
            }

            // Confirm before submitting
            const confirmation = confirm("Are you sure you want to update the donor information?");
            if (confirmation) {
                document.getElementById("updateForm").submit(); // Submit the form manually
            }

            return false; // Prevent default form submission behavior
        }
    </script>

</body>
</html>
