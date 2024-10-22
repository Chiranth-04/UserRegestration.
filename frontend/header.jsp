<!-- header.jsp -->
<div class="navbar">
    <ul>
        <li><a href="dashboard.jsp">Dashboard</a></li>
        <li><a href="edit.jsp">Edit Profile</a></li>
        <li><a href="delete.jsp">Delete Account</a></li>
        <li><a href="LogoutServlet">Logout</a></li>
    </ul>
</div>

<style>
/* Style for the navigation bar */
.navbar {
    background-color: #333;
    overflow: hidden;
    position: fixed;
    top: 0;
    width: 100%;
    z-index: 1000; /* Make sure the navbar is above other elements */
    height: 50px; /* Set height for the navbar */
}

/* Style for the list inside the navbar */
.navbar ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
    display: flex;
    justify-content: flex-start;
}

/* Style for list items */
.navbar ul li {
    padding: 14px 20px;
}

/* Style for links */
.navbar ul li a {
    text-decoration: none;
    color: white;
    padding: 14px 20px;
    display: block;
}

/* Change the color of links on hover */
.navbar ul li a:hover {
    background-color: #ddd;
    color: black;
}

/* Ensure the body content has enough top padding so it doesn't overlap the navbar */
body {
    margin: 0;
    padding: 0;
    padding-top: 60px; /* Adjust this based on navbar height */
    font-family: Arial, sans-serif;
}
</style>
