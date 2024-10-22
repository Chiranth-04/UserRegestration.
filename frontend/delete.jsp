<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page session="true" %>
<%@ include file="header.jsp" %> <!-- Include navigation bar or header -->

<%
    String userId = (String) session.getAttribute("userId");
    if (userId == null) {
        response.sendRedirect("login.jsp"); // Redirect to login if user is not logged in
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Delete Account</title>
    <style>
        .container {
            width: 50%;
            margin: 50px auto;
            text-align: center;
        }

        h2 {
            color: red;
        }

        p {
            font-size: 1.2em;
        }

        .buttons {
            margin-top: 20px;
        }

        .btn {
            padding: 10px 20px;
            font-size: 1em;
            margin: 5px;
            cursor: pointer;
        }

        .btn-danger {
            background-color: red;
            color: white;
        }

        .btn-cancel {
            background-color: gray;
            color: white;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Are you sure you want to delete your account?</h2>
        <p>This action cannot be undone.</p>

        <!-- Confirmation form -->
        <<form action="DeleteRegistrationServlet" method="post">
    <div class="buttons">
        <input type="submit" class="btn btn-danger" value="Yes, Delete My Account">
        <a href="your_redirect_page.jsp" class="btn btn-cancel">Cancel</a>
    </div>
</form>

    </div>
</body>
</html>
