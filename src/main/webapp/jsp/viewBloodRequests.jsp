<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Blood Requests</title>
    <link rel="stylesheet" href="css/st1.css">
</head>
<body>
    <div class="container">
        <h2 class="header">Blood Requests</h2>
        <table class="blood-request-table">
            <thead>
                <tr>
                    <th>Request ID</th>
                    <th>Name</th>
                    <th>Mobile Number</th>
                    <th>City</th>
                    <th>Blood Group</th>
                    <th>Request Date</th>
                </tr>
            </thead>
            <tbody>
                <!-- Iterate over the 'requests' attribute set by the servlet -->
                <c:forEach var="request" items="${requests}">
                    <tr>
                        <td>${request.id}</td>
                        <td>${request.name}</td>
                        <td>${request.mobileNumber}</td>
                        <td>${request.city}</td>
                        <td>${request.bloodGroup}</td>
                        <td>${request.requestDate}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
     
</html>
