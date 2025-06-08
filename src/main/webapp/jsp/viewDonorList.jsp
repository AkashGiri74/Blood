<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Donor List</title>
    <link rel="stylesheet" href="css/st.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 80%;
            margin: 30px auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        .header {
            text-align: center;
            color: #333;
        }

        .donor-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        .donor-table th, .donor-table td {
            padding: 12px;
            border: 1px solid #ddd;
            text-align: left;
        }

        .donor-table th {
            background-color: #4CAF50;
            color: white;
        }

        .donor-table tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        .donor-table tr:hover {
            background-color: #ddd;
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

    <div class="container">
        <h2 class="header">Donor List</h2>
        
        <!-- Display success or error messages -->
        <c:if test="${not empty donors}">
            <table class="donor-table">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>City</th>
                        <th>Blood Group</th>
                        <th>Email</th>
                        <th>Mobile Number</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="donor" items="${donors}">
                        <tr>
                            <td>${donor.id}</td>
                            <td>${donor.name}</td>
                            <td>${donor.city}</td>
                            <td>${donor.bloodGroup}</td>
                            <td>${donor.email}</td>
                            <td>${donor.mobileNumber}</td> <!-- Display mobile number -->
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>

        <c:if test="${empty donors}">
            <p>No donors found.</p>
        </c:if>
    </div>

    

</body>
</html>
