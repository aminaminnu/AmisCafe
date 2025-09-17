package controller;

import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalTime;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Booking;
import service.BookingService;
import service.BookingServiceImpl;

@WebServlet("/BookingController")
public class BookingController extends HttpServlet {

	private BookingService bookingService = new BookingServiceImpl();


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        LocalDate date = LocalDate.parse(request.getParameter("date"));
        LocalTime time = LocalTime.parse(request.getParameter("time"));
        int people = Integer.parseInt(request.getParameter("people"));
        String message = request.getParameter("message");

        Booking booking = new Booking();
        booking.setName(name);
        booking.setEmail(email);
        booking.setPhone(phone);
        booking.setDate(date);
        booking.setTime(time);
        booking.setPeople(people);
        booking.setMessage(message);

        boolean isBooked = bookingService.bookTable(booking);

        if(isBooked) {
            request.setAttribute("success", "Booking successful! We will contact you soon.");
        } else {
            request.setAttribute("error", "Booking failed! Please try again.");
        }

        request.getRequestDispatcher("index.jsp#book-a-table").forward(request, response);
    }
}
