package model;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import util.HibernateUtil;

public class UserDao {

    // Save user (signup)
	public boolean saveUser(User user) {
	    Transaction transaction = null;
	    try (Session session = HibernateUtil.getSessionFactory().openSession()) {
	        transaction = session.beginTransaction();
	        session.save(user);
	        transaction.commit();
	        return true; // <-- return true on success
	    } catch (Exception e) {
	        if (transaction != null) {
	            transaction.rollback();
	        }
	        e.printStackTrace();
	        return false; // <-- return false on exception
	    }
	}


    // Get user by email & password (login)
    public User getUserByEmailAndPassword(String email, String password) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            Query<User> query = session.createQuery(
                "FROM User WHERE email = :email AND password = :password", User.class);
            query.setParameter("email", email);
            query.setParameter("password", password);
            return query.uniqueResult();
        }
    }

    // Get all users (for admin)
    public List<User> getAllUsers() {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            return session.createQuery("FROM User", User.class).list();
        }
    }


 // Delete user by ID (for admin)
    public boolean deleteUser(int userId) {
        Transaction transaction = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();

            User user = session.get(User.class, userId); // get user by ID
            if (user != null) {
                session.delete(user);  // delete the user
                transaction.commit();
                return true;           // deletion successful
            } else {
                return false;          // user not found
            }

        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
            return false;              // deletion failed
        }
    }

}
