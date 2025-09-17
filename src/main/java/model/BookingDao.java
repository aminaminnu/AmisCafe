package model;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;

import util.HibernateUtil;

public class BookingDao {

    public boolean saveBooking(Booking booking) {
        Transaction transaction = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();
            session.save(booking);
            transaction.commit();
            return true;
        } catch (Exception e) {
            if (transaction != null) {
				transaction.rollback();
			}
            e.printStackTrace();
            return false;
        }
    }

    public List<Booking> getAllBookings() {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            return session.createQuery("from Booking", Booking.class).list();
        }
    }

    // <-- New method to delete booking
    public boolean deleteBooking(int bookingId) {
        Transaction transaction = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();

            Booking booking = session.get(Booking.class, bookingId);
            if (booking != null) {
                session.delete(booking);
                transaction.commit();
                return true;
            } else {
                return false;
            }
        } catch (Exception e) {
            if (transaction != null) {
				transaction.rollback();
			}
            e.printStackTrace();
            return false;
        }
    }
}
