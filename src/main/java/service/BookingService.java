package service;

import java.util.List;

import model.Booking;

public interface BookingService {
    boolean bookTable(Booking booking);
    List<Booking> viewAllBookings();

    boolean deleteBooking(int bookingId); // <-- add this
}
