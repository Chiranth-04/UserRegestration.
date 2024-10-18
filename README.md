# UserRegestration.
# User Registration with JSP and Servlets

## Project Overview
This project is a simple user registration system using JSP and Servlets. It allows users to register, log in, view their dashboard, edit registration details, and delete their account.

## Features
- User registration
- User login
- Dashboard with user details
- Edit and delete user account
- Logout functionality

## Prerequisites
- Java JDK (version 8 or higher)
- Apache Tomcat server (version 9 or higher)
- MySQL Database
- JDBC Driver for MySQL ( MySQL Connector/J)

## Required JAR Files
- **MySQL Connector/J**: Required for connecting to the MySQL database.
  - Download from [MySQL Connector/J](https://dev.mysql.com/downloads/connector/j/).
- **JSTL**: JavaServer Pages Standard Tag Library (optional if using JSTL in your JSPs).
  - Download from [JSTL](https://mvnrepository.com/artifact/javax.servlet/jstl/1.2).  

## Folder Structure
Structure

backend/
└── src/
    └── controller/
        ├── LoginServlet.java
        ├── RegisterServlet.java
        ├── DashboardServlet.java
        ├── EditProfileServlet.java
        ├── DeleteAccountServlet.java
        ├── LogoutServlet.java
    └── dao/
        ├── UserDAO.java
        └── DatabaseConnection.java

frontend/
└── web/
    ├── login.jsp
    ├── register.jsp
    ├── dashboard.jsp
    ├── edit.jsp
    ├── delete.jsp
