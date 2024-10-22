<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="model.User" %>
<%@ page session="true" %>
<%@ include file="header.jsp" %> <!-- Include the navigation bar -->

<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp"); // Redirect if user is not logged in
        return;
    }

    // Retrieve success or error messages from the URL parameters
    String successMessage = request.getParameter("success");
    String errorMessage = request.getParameter("error");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Edit Profile</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding-top: 60px;
            display: flex;
            justify-content: center;
            align-items: center;
            height: calc(100vh - 60px);
        }
        .edit-profile-container {
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            width: 300px;
            text-align: center;
        }
        h2 {
            color: #333;
            margin-bottom: 20px;
        }
        label {
            display: block;
            margin: 10px 0 5px;
            text-align: left;
        }
        input[type="text"],
        input[type="email"],
        input[type="date"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        input[type="submit"] {
            background-color: #5cb85c;
            color: white;
            border: none;
            border-radius: 4px;
            padding: 10px;
            cursor: pointer;
            width: 100%;
        }
        input[type="submit"]:hover {
            background-color: #4cae4c;
        }
        .success {
            color: green;
            margin-bottom: 15px;
        }
        .error {
            color: red;
            margin-bottom: 15px;
        }
    </style>
</head>
<body>
    <div class="edit-profile-container">
        <h2>Edit User Profile</h2>

        <!-- Display success or error messages -->
        <%
            if (successMessage != null) {
        %>
            <p class="success"><%= successMessage %></p>
        <%
            } else if (errorMessage != null) {
        %>
            <p class="error"><%= errorMessage %></p>
        <%
            }
        %>

        <form action="EditProfileServlet" method="post">
            <label for="userId">User ID:</label>
            <input type="text" id="userId" name="userId" value="<%= user.getUserId() %>" required><br>

            <label for="email">Email:</label>
            <input type="email" id="email" name="email" value="<%= user.getEmail() %>" required><br>

            <label for="name">Name:</label>
            <input type="text" id="name" name="name" value="<%= user.getName() %>" required><br>

            <label for="dob">Date of Birth:</label>
            <input type="date" id="dob" name="dob" value="<%= user.getDob() %>" required><br>

            <input type="submit" value="Save Changes">
        </form>
    </div>
</body>
</html>
