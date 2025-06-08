<%@ page import="java.util.List" %>
<%@ page import="servlets.RequestBloodServlet.Donor" %>
<!DOCTYPE html>
<html>
<head>
    <title>Donor List</title>
    <style>
        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
        }
        table, th, td {
            border: 1px solid #ddd;
        }
        th, td {
            padding: 10px;
            text-align: center;
        }
        th {
            background-color: #e74c3c;
            color: white;
        }
        button {
            background-color: #27ae60;
            color: white;
            padding: 5px 15px;
            border: none;
            cursor: pointer;
            border-radius: 5px;
        }
        button:hover {
            background-color: #2ecc71;
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
    <h1 style="text-align:center;">Available Donors</h1>
    <table>
        <tr>
            <th>Name</th>
            <th>Mobile Number</th>
            <th>City</th>
            <th>Blood Group</th>
            <th>Call</th>
        </tr>
        <%
            // Fetching the list of donors from the request
            List<Donor> donorList = (List<Donor>) request.getAttribute("donorList");
            
            if (donorList != null && !donorList.isEmpty()) {
                for (Donor donor : donorList) {
        %>
                    <tr>
                        <td><%= donor.getName() %></td>
                        <td><%= donor.getMobileNumber() %></td>
                        <td><%= donor.getCity() %></td>
                        <td><%= donor.getBloodGroup() %></td>
                        <td>
                            <!-- Call button, you can link it to a dialer or any contact page -->
                            <button onclick="window.location.href='tel:<%= donor.getMobileNumber() %>'">Call</button>
                        </td>
                    </tr>
        <%
                }
            } else {
        %>
                <tr>
                    <td colspan="5">No donors found for the selected blood group.</td>
                </tr>
        <%
            }
        %>
    </table>
    
       <footer>
        <p>&copy;@AKASH:2024 Blood Donation System. All rights reserved.</p>
    </footer>
</body>
</html>
