<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard - Blood Donation System</title>
    <link rel="stylesheet" href="../css/style.css">
   
  
   <style>
    /* Simplified Styles for Admin Dashboard */
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        background-color: #f9f9f9;
        color: #333;
    }

    header {
        background-color: #0073e6;
        color: white;
        padding: 20px;
        text-align: center;
    }

    header .logo img {
        width: 40px;
        vertical-align: middle;
        margin-right: 10px;
    }

    header nav span {
        font-size: 20px;
        font-weight: bold;
    }

    main {
        padding: 20px;
        text-align: center;
    }

    main h1 {
        font-size: 28px;
        color: #0073e6;
        margin-bottom: 10px;
    }

    main p {
        font-size: 16px;
        margin-bottom: 20px;
    }

    .dashboard-links {
        display: flex;
        flex-direction: column;
        align-items: center;
        gap: 15px;
    }

    .dashboard-links a {
        display: inline-block;
        background-color: #0073e6;
        color: white;
        padding: 10px 20px;
        text-decoration: none;
        border-radius: 5px;
        font-size: 16px;
    }

    .dashboard-links a:hover {
        background-color: #005bb5;
    }

    .input-form {
        background-color: white;
        padding: 15px;
        border: 1px solid #ddd;
        border-radius: 5px;
        max-width: 300px;
        margin: 15px auto;
    }

    .input-form label {
        display: block;
        margin-bottom: 5px;
        font-size: 14px;
    }

    .input-form input {
        width: 100%;
        padding: 8px;
        margin-bottom: 10px;
        border: 1px solid #ddd;
        border-radius: 4px;
        font-size: 14px;
    }

    .input-form button {
        width: 100%;
        padding: 10px;
        background-color: #0073e6;
        color: white;
        border: none;
        border-radius: 5px;
        font-size: 14px;
        cursor: pointer;
    }

    .input-form button:hover {
        background-color: #005bb5;
    }

    .alert {
        padding: 10px;
        margin: 10px auto;
        border-radius: 5px;
        max-width: 400px;
        text-align: center;
        font-size: 14px;
    }

    .alert-success {
        background-color: #dff0d8;
        color: #3c763d;
    }

    .alert-danger {
        background-color: #f2dede;
        color: #a94442;
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
    <!-- Header Section -->
    <header>
        <div class="logo">
            <img src="<%= request.getContextPath() %>/images/3.jpeg" alt="Blood Bank Logo">
        </div>
        <nav>
            <span>Blood Donation System</span>
        </nav>
    </header>

    <!-- Main Content -->
    <main>
        <h1>Welcome, Admin</h1>
        <p>Manage the Blood Donation System from here.</p>

        <!-- Display Status Message -->
        <c:if test="${not empty status}">
            <div class="alert ${status == 'Failed to delete donor information.' || status == 'Failed to delete blood request information.' ? 'alert-danger' : 'alert-success'}">
                ${status}
            </div>
        </c:if>

        <div class="dashboard-links">
            <!-- Link to View Donors -->
            <a href="<%= request.getContextPath() %>/AdminServlet?action=viewDonorList">View Donors</a>
            <!-- Link to View Blood Requests -->
            <a href="<%= request.getContextPath() %>/AdminServlet?action=viewBloodRequests">View Blood Requests</a>

            <!-- Form to Enter Donor ID for Update or Delete -->
            <form action="<%= request.getContextPath() %>/AdminServlet" method="get" class="input-form">
                <label for="donorId">Donor ID:</label>
                <input type="text" id="donorId" name="donorId" placeholder="Donor ID" required>

                <!-- Button to Update Donor -->
                <button type="submit" name="action" value="updateDonorForm">Update Donor</button>
                <br>

                <!-- Button to Delete Donor -->
                <button type="submit" name="action" value="deleteDonor">Delete Donor</button>
            </form>

            <!-- Form to Enter Blood Request ID for Delete Operation -->
            <form action="<%= request.getContextPath() %>/AdminServlet" method="get" class="input-form">
                <label for="requestId">Blood Request ID:</label>
                <input type="text" id="requestId" name="requestId" placeholder="Request ID" required>
                
                <!-- Button to Delete Blood Request -->
                <button type="submit" name="action" value="deleteBloodRequest">Delete Blood Request</button>
            </form>
        </div>
    </main>

      <footer>
        <p>&copy;@AKASH:2024 Blood Donation System. All rights reserved.</p>
    </footer>
</body>
</html>
