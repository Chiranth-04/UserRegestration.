<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="model.User" %>
<%@ page session="true" %>
<%@ include file="header.jsp" %> <!-- Include the navigation bar -->

<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return; // Ensure no further processing happens after redirection
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4; /* Light background for contrast */
            margin: 0;
            padding-top: 60px; /* Space for the fixed navbar */
            display: flex;
            justify-content: center; /* Center horizontally */
            align-items: center; /* Center vertically */
            height: calc(100vh - 60px); /* Full viewport height minus navbar */
        }
        .dashboard-container {
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            text-align: center; /* Center text */
            width: 300px; /* Fixed width for the container */
        }
        h2 {
            color: #333;
            margin-bottom: 20px; /* Space below the heading */
        }
        p {
            font-size: 1.1em;
            margin: 5px 0; /* Space above and below each paragraph */
        }
    </style>
</head>
<body>
    <div class="dashboard-container">
        <h2>Welcome to Your Profile</h2>
        <p>User ID: <%= user.getUserId() %></p>
        <p>Name: <%= user.getName() %></p>
        <p>Email: <%= user.getEmail() %></p>
        <p>Date of Birth: <%= user.getDob() %></p>
    </div>
</body>
</html>
