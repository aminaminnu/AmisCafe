package service;

import java.util.List;

import model.Booking;
import model.BookingDao;

public class BookingServiceImpl implements BookingService {

    private BookingDao bookingDao = new BookingDao();

    @Override
    public boolean bookTable(Booking booking) {
        return bookingDao.saveBooking(booking);
    }

    @Override
    public List<Booking> viewAllBookings() {
        return bookingDao.getAllBookings();
    }

    @Override
    public boolean deleteBooking(int bookingId) {
        return bookingDao.deleteBooking(bookingId); // delegate to DAO
    }
}
