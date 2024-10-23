package controller;

import dao.UserDAO;
import model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/EditProfileServlet")
public class EditProfileServlet extends HttpServlet {
  @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    HttpSession session = request.getSession();
	    User currentUser  = (User ) session.getAttribute("user");

	    if (currentUser  == null) {
	        response.sendRedirect("login.jsp");
	        return;
	    }

	    String newUserId = request.getParameter("userId");
	    String name = request.getParameter("name");
	    String email = request.getParameter("email");
	    String dob = request.getParameter("dob");

	    UserDAO userDAO = new UserDAO();

	    try {
	        // Check if the new user ID already exists
	        if (!currentUser .getUserId().equals(newUserId) && userDAO.isUserIdExists(newUserId)) {
	            response.sendRedirect("edit.jsp?error=User  ID already exists. Please choose a different ID.");
	            return;
	        } else {
	            userDAO.updateUserId(currentUser.getUserId(), newUserId);
	        }

	        // Update the user's profile information in the database
	        userDAO.updateUserProfile(newUserId, name, email, dob); // Use newUser Id for update

	        // Update the currentUser  object with new values
	        currentUser.setUserId(newUserId);
	        currentUser.setName(name);
	        currentUser.setEmail(email);
	        currentUser.setDob(dob);

	        // Update the session with the modified user object
	        session.setAttribute("user", currentUser );
	        response.sendRedirect("edit.jsp?success=Profile updated successfully.");

	    } catch (Exception e) {
	        e.printStackTrace();
	        response.sendRedirect("edit.jsp?error=Something went wrong. Please try again.");
	    }
	}
}
