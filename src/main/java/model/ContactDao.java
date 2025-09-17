package model;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;

import util.HibernateUtil;

public class ContactDao {

    public boolean saveContact(Contact contact) {
        Transaction tx = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            tx = session.beginTransaction();
            session.save(contact);
            tx.commit();
            return true;
        } catch (Exception e) {
            if (tx != null) {
				tx.rollback();
			}
            e.printStackTrace();
            return false;
        }
    }

    public List<Contact> getAllContacts() {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            return session.createQuery("from Contact", Contact.class).list();
        }
    }

    public Contact getContactById(int id) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            return session.get(Contact.class, id);
        }
    }

    public boolean deleteContact(int id) {
        Transaction tx = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            tx = session.beginTransaction();
            Contact contact = session.get(Contact.class, id);
            if (contact != null) {
                session.delete(contact);
                tx.commit();
                return true;
            }
            return false;
        } catch (Exception e) {
            if (tx != null) {
				tx.rollback();
			}
            e.printStackTrace();
            return false;
        }
    }
}
