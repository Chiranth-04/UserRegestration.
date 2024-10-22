package controller;

import dao.UserDAO;
import model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userId = request.getParameter("userId");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String dob = request.getParameter("dob");

        User newUser = new User(userId, name, email, password, dob); // User constructor with userId

        try {
            // Check if the userId already exists
            if (UserDAO.isUserIdExists(userId)) {
                // If the userId exists, redirect with an error message
                response.sendRedirect("register.jsp?error=1");
            } else {
                // Proceed with registration if userId is unique
                if (UserDAO.registerUser(newUser)) {
                    response.sendRedirect("login.jsp");
                } else {
                    response.sendRedirect("register.jsp?error=1");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("register.jsp?error=1");
        }
    }
}
