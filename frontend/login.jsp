<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh; /* Full viewport height */
            margin: 0;
        }
        .login-container {
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            width: 300px; /* Fixed width */
            text-align: center; /* Center text */
        }
        h2 {
            color: #333;
            margin-bottom: 20px;
        }
        label {
            display: block;
            margin: 10px 0 5px;
            text-align: left; /* Align labels to the left */
        }
        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box; /* Include padding in width calculation */
            transition: border-color 0.3s; /* Smooth transition for border color */
        }
        input[type="text"]:focus,
        input[type="password"]:focus {
            border-color: #5cb85c; /* Change border color on focus */
            outline: none; /* Remove default outline */
        }
        input[type="submit"] {
            background-color: #5cb85c;
            color: white;
            border: none;
            border-radius: 4px;
            padding: 10px;
            cursor: pointer;
            width: 100%;
            transition: background-color 0.3s; /* Smooth transition for background color */
        }
        input[type="submit"]:hover {
            background-color: #4cae4c;
        }
        .error {
            color: red;
            margin-top: 15px;
        }
        .success {
            color: green;
            margin-top: 15px;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <h2>Login</h2>
        <form action="login" method="post">
            <label>Email:</label>
            <input type="text" name="email" required />
            <label>Password:</label>
            <input type="password" name="password" required />
            <input type="submit" value="Login" />
        </form>
        <p>Don't have an account? <a href="register.jsp">Register here</a></p>
        
        <!-- Display success message if 'message' parameter is present -->
        <c:if test="${not empty message}">
            <p class="success">${message}</p>
        </c:if>
        
        <!-- Display error message if 'error' parameter is present -->
        <c:if test="${not empty error}">
            <p class="error">${error}</p>
        </c:if>
    </div>
</body>
</html>
