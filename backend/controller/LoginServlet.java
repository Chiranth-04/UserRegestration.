package controller;

import dao.UserDAO;
import model.User;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        UserDAO userDAO = new UserDAO();
        User user;
		try {
			user = userDAO.validateUser(email, password);
			if (user != null) {
	            // Successful login, set user session and redirect to dashboard or another page
	            request.getSession().setAttribute("user", user);
	            response.sendRedirect("dashboard.jsp");
	        } else {
	            // Login failed, set an error message and redirect back to login page
	            request.setAttribute("error", "Invalid username or password!");
	            request.getRequestDispatcher("login.jsp").forward(request, response);
	        }
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} // Assuming this method returns a User object if valid, null otherwise.

        
    }
}
