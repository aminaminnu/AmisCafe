package controller;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Booking;
import model.Contact;
import model.Order;
import model.User;
import service.BookingService;
import service.BookingServiceImpl;
import service.ContactService;
import service.ContactServiceImpl;
import service.OrderService;
import service.OrderServiceImpl;
import service.UserService;
import service.UserServiceImpl;

@WebServlet("/admin")
public class AdminController extends HttpServlet {

    private UserService userService = new UserServiceImpl();
    private BookingService bookingService = new BookingServiceImpl();
    private OrderService orderService = new OrderServiceImpl();
    private ContactService contactService = new ContactServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        switch (action != null ? action : "") {
            case "viewUsers":
                List<User> users = userService.listAllUsers();
                request.setAttribute("users", users);
                request.setAttribute("section", "users");
                break;
            case "viewBookings":
                List<Booking> bookings = bookingService.viewAllBookings();
                request.setAttribute("bookings", bookings);
                request.setAttribute("section", "bookings");
                break;
            case "viewOrders":
                List<Order> orders = orderService.getAllOrders();
                request.setAttribute("orders", orders);
                request.setAttribute("section", "orders");
                break;
            case "viewContacts":
                List<Contact> contacts = contactService.getAllContacts();
                request.setAttribute("contacts", contacts);
                request.setAttribute("section", "contacts");
                break;
            default:
                request.setAttribute("section", "dashboard");
                break;
        }

        RequestDispatcher rd = request.getRequestDispatcher("adminDashboard.jsp");
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        switch (action != null ? action : "") {
            case "deleteUser":
                int userId = Integer.parseInt(request.getParameter("userId"));
                boolean deleted = userService.deleteUser(userId);
                response.sendRedirect("admin?action=viewUsers&deleted=" + deleted);
                break;
            case "deleteBooking":
                int bookingId = Integer.parseInt(request.getParameter("bookingId"));
                boolean bookingDeleted = bookingService.deleteBooking(bookingId);
                response.sendRedirect("admin?action=viewBookings&deleted=" + bookingDeleted);
                break;
            case "deleteOrder":
                int orderId = Integer.parseInt(request.getParameter("orderId"));
                boolean orderDeleted = orderService.deleteOrder(orderId);
                response.sendRedirect("admin?action=viewOrders&deleted=" + orderDeleted);
                break;
            case "deleteContact":
                int contactId = Integer.parseInt(request.getParameter("contactId"));
                boolean contactDeleted = contactService.deleteContact(contactId);
                response.sendRedirect("admin?action=viewContacts&deleted=" + contactDeleted);
                break;
            default:
                response.sendRedirect("admin");
                break;
        }
    }
}
