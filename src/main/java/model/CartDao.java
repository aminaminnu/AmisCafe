package model;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;

import util.HibernateUtil;

public class CartDao {

    public void addToCart(Cart cart) {
        Transaction tx = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            tx = session.beginTransaction();
            session.save(cart);
            tx.commit();
        } catch (Exception e) {
            if (tx != null) {
				tx.rollback();
			}
            e.printStackTrace();
        }
    }

    public List<Cart> getCartByUserId(int userId) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            return session.createQuery("FROM Cart WHERE user.id = :userId", Cart.class)
                    .setParameter("userId", userId)
                    .list();
        }
    }

    public void updateCartQuantity(int cartId, int quantity) {
        Transaction tx = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            tx = session.beginTransaction();
            Cart cart = session.get(Cart.class, cartId);
            if (cart != null) {
                cart.setQuantity(quantity);
                session.update(cart);
            }
            tx.commit();
        } catch (Exception e) {
            if (tx != null) {
				tx.rollback();
			}
            e.printStackTrace();
        }
    }

    public void removeCartItem(int cartId) {
        Transaction tx = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            tx = session.beginTransaction();
            Cart cart = session.get(Cart.class, cartId);
            if (cart != null) {
                session.delete(cart);
            }
            tx.commit();
        } catch (Exception e) {
            if (tx != null) {
				tx.rollback();
			}
            e.printStackTrace();
        }
    }

    public void clearCartByUserId(int userId) {
        Transaction tx = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            tx = session.beginTransaction();
            session.createQuery("DELETE FROM Cart WHERE user.id = :userId")
                   .setParameter("userId", userId)
                   .executeUpdate();
            tx.commit();
        } catch (Exception e) {
            if (tx != null) {
				tx.rollback();
			}
            e.printStackTrace();
        }
    }

    public User getUserById(int userId) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            return session.get(User.class, userId);
        }
    }
}
