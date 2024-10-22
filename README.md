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

### Setting Up the Project in Eclipse as a Dynamic Web Project

Follow these steps to set up the project in Eclipse as a Dynamic Web Project:

1. **Install Eclipse IDE for Java EE Developers**
   - Download and install the Eclipse IDE for Java EE Developers from [Eclipse Downloads](https://www.eclipse.org/downloads/).

2. **Create a New Dynamic Web Project**
   - Open Eclipse and select `File` > `New` > `Dynamic Web Project`.
   - Enter the project name, e.g., `UserRegistration`.
   - Configure the settings (like target runtime if using Apache Tomcat).
   - Click `Finish`.

3. **Create the Backend Package Structure**
   - In the `UserRegistration` project, navigate to `src/main/java` (if Maven is set up) or `src` for regular dynamic projects.
   - Right-click on the `src` folder (or `src/main/java`), select `New` > `Package`, and name it `controller`.
   - Inside the `src` package (or `src/main/java`), create another package called `dao`.

4. **Add Java Files to Backend**
   - Right-click on the `controller` package and select `New` > `Class` for each of the following:
     - `LoginServlet.java`
     - `RegisterServlet.java`
     - `DashboardServlet.java`
     - `EditProfileServlet.java`
     - `DeleteAccountServlet.java`
     - `LogoutServlet.java`
   - Similarly, right-click on the `dao` package and create classes for:
     - `UserDAO.java`
     - `DatabaseConnection.java`

5. **Create the Frontend Structure for JSP Files**
   - In the project, navigate to `WebContent` (or `src/main/webapp` for Maven projects).
   - Right-click on the `WebContent` folder and select `New` > `Folder`, then name it `web`.
   - Inside the `web` folder, create the following JSP files:
     - `login.jsp`
     - `register.jsp`
     - `dashboard.jsp`
     - `edit.jsp`
     - `delete.jsp`

6. **Configure Deployment Descriptor (web.xml)**
   - In the `WebContent/WEB-INF` directory, ensure there is a `web.xml` file to configure servlets and their mappings. If not, create one and define your servlet configurations there.

7. **Run the Project**
   - To run the project, you will need to set up a server (like Apache Tomcat) in Eclipse. Follow these instructions to add a server in Eclipse:
     - Go to the `Servers` view, right-click, and select `New` > `Server`.
     - Choose your server type (e.g., Apache Tomcat) and click `Next`.
     - Add your project to the server and click `Finish`.
   - Right-click on the project and select `Run As` > `Run on Server`.

### Conclusion

You have now set up the User Registration System project as a Dynamic Web Application in Eclipse. You can start adding your code to the respective Java files and JSP pages as needed. For any further instructions or help, please refer to the project's documentation or reach out to the development team.

