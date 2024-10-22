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
        // Retrieve the user object from session
        HttpSession session = request.getSession();
        User currentUser = (User) session.getAttribute("user");

        // Ensure the user is logged in
        if (currentUser == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        // Get updated data from the form
        String newUserId = request.getParameter("userId");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String dob = request.getParameter("dob");

        // Log the parameters for debugging
        System.out.println("Updating user profile with:");
        System.out.println("New User ID: " + newUserId);
        System.out.println("Name: " + name);
        System.out.println("Email: " + email);
        System.out.println("DOB: " + dob);

        UserDAO userDAO = new UserDAO();

        try {
            // Check if the new user ID already exists and doesn't belong to the current user
            if (!currentUser.getUserId().equals(newUserId) && userDAO.isUserIdExists(newUserId)) {
                response.sendRedirect("edit.jsp?error=User ID already exists. Please choose a different ID.");
                return;
            }

            // Update the user's profile information in the database
            userDAO.updateUserProfile(currentUser.getUserId(), name, email, dob); // Use currentUser's ID for update

            // Update the currentUser object with new values
            currentUser.setUserId(newUserId);
            currentUser.setName(name);
            currentUser.setEmail(email);
            currentUser.setDob(dob); // Assuming dob is a field in the User object

            // Update the session with the modified user object
            session.setAttribute("user", currentUser);

            // Redirect to the profile page with a success message
            response.sendRedirect("edit.jsp?success=Profile updated successfully.");
            
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("edit.jsp?error=Something went wrong. Please try again.");
        }
    }
}
