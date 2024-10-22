package controller;

import dao.UserDAO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/DeleteRegistrationServlet")
public class DeleteRegistrationServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get user ID from the session
        String userId = (String) request.getSession().getAttribute("userId");

        // Validate if user ID exists in session
        if (userId != null) {
            // Perform user deletion
            UserDAO userDAO = new UserDAO();
            try {
                userDAO.deleteUser(userId);
                
                // Invalidate session after deletion
                request.getSession().invalidate();
                
                // Redirect to login page after deletion
                response.sendRedirect("login.jsp?message=Account successfully deleted");
            } catch (Exception e) {
                e.printStackTrace();
                // Redirect to error page or show an error message
                response.sendRedirect("login.jsp?error=Unable to delete account. Please try again.");
            }
        } else {
            // Redirect to login page if the session is invalid
            response.sendRedirect("login.jsp");
        }
    }
}
