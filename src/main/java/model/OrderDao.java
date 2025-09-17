package model;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;

import util.HibernateUtil;

public class OrderDao {

    public boolean saveOrder(Order order) {
        Transaction tx = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            tx = session.beginTransaction();
            session.save(order);
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

    public List<Order> findOrdersByUserId(int userId) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            String hql = "FROM Order o WHERE o.user.id = :userId ORDER BY o.orderDate DESC";
            return session.createQuery(hql, Order.class)
                          .setParameter("userId", userId)
                          .list();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public List<Order> findAllOrders() {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            return session.createQuery("FROM Order", Order.class).list();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    // <-- New Hibernate-style delete
    public boolean deleteOrder(int orderId) {
        Transaction tx = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            tx = session.beginTransaction();

            Order order = session.get(Order.class, orderId);
            if (order != null) {
                session.delete(order);
                tx.commit();
                return true;
            } else {
                return false;
            }

        } catch (Exception e) {
            if (tx != null) {
				tx.rollback();
			}
            e.printStackTrace();
            return false;
        }
    }
}
