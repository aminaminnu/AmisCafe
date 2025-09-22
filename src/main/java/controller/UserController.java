package controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;
import model.UserDao;

@WebServlet("/UserController")
public class UserController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserDao userDao;

    @Override
    public void init() throws ServletException {
        userDao = new UserDao();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("signup".equals(action)) {
            handleSignup(request, response);
        } else if ("login".equals(action)) {
            handleLogin(request, response);
        } else {
            response.sendRedirect("index.jsp");
        }
    }

    private void handleSignup(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {

        String fullName = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String role = request.getParameter("role");
        String deliveryAddress = request.getParameter("deliveryAddress"); // ✅ new field

        if (role == null || role.isEmpty()) {
            role = "USER";
        }

        User user = new User();
        user.setName(fullName);
        user.setEmail(email);
        user.setPassword(password);
        user.setRole(role);
        user.setDeliveryAddress(deliveryAddress); // ✅ set address

        boolean isSaved = userDao.saveUser(user);

        if (isSaved) {
            request.setAttribute("signupSuccess", "Signup successful! Please login.");
        } else {
            request.setAttribute("signupError", "Signup failed! Try again.");
        }

        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

    private void handleLogin(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        User user = userDao.getUserByEmailAndPassword(email, password);

        if (user != null) {
            HttpSession session = request.getSession();
            session.setAttribute("user", user);

            // Redirect back to previous page if user came from menu
            String redirectUrl = (String) session.getAttribute("redirectAfterLogin");
            if (redirectUrl != null) {
                session.removeAttribute("redirectAfterLogin");
                response.sendRedirect(redirectUrl);
                return;
            }

            if ("ADMIN".equalsIgnoreCase(user.getRole())) {
                response.sendRedirect("admin?action=viewUsers");
            } else {
                response.sendRedirect("index.jsp");
            }
        } else {
            request.setAttribute("loginError", "Invalid email or password!");
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
    }
}
