package controller;

import java.io.IOException;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

//LogoutController.java
@WebServlet("/logout")
public class LogoutController extends HttpServlet {
 @Override
protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
     HttpSession session = request.getSession(false);
     if (session != null) {
         session.invalidate(); // removes all session attributes
     }
     response.sendRedirect("index.jsp"); // redirect to home page
 }
}
