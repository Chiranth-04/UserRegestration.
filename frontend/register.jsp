<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register</title>
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
        .register-container {
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            width: 300px; /* Fixed width */
            text-align: center; /* Center text */
            box-sizing: border-box; /* Include padding in width */
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
        input[type="email"],
        input[type="password"],
        input[type="date"] {
            width: calc(100% - 20px); /* Full width minus padding */
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box; /* Include padding and border in width calculation */
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
    </style>
</head>
<body>
    <div class="register-container">
        <h2>User Registration</h2>

        <form action="register" method="post">
            <!-- User ID Field -->
            <label for="userId">User ID:</label>
            <input type="text" id="userId" name="userId" required><br>

            <!-- Name Field -->
            <label for="name">Name:</label>
            <input type="text" id="name" name="name" required><br>

            <!-- Email Field -->
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required><br>

            <!-- Password Field -->
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required><br>

            <!-- Date of Birth Field -->
            <label for="dob">Date of Birth:</label>
            <input type="date" id="dob" name="dob" required><br>

            <!-- Submit Button -->
            <input type="submit" value="Register">
        </form>

        <!-- Display error message if user_id already exists -->
        <% if (request.getParameter("error") != null) { %>
            <p class="error">User ID already exists. Please choose a different one.</p>
        <% } %>
    </div>
</body>
</html>
