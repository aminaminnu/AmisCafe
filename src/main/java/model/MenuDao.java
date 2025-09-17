package model;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;

import util.HibernateUtil;

public class MenuDao {

    public List<MenuItem> findByCuisineAndType(String cuisine, String type) {
        Transaction tx = null;
        List<MenuItem> items = null;

        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            tx = session.beginTransaction();

            items = session.createQuery(
                    "FROM MenuItem WHERE cuisine = :cuisine AND type = :type",
                    MenuItem.class
            )
            .setParameter("cuisine", cuisine)
            .setParameter("type", type)
            .getResultList();

            tx.commit();
        } catch (Exception e) {
            if (tx != null)
			 {
				tx.rollback(); // rollback if something fails
			}
            e.printStackTrace();
        }
        return items;
    }

    public MenuItem getMenuItemById(int id) {
        Transaction tx = null;
        MenuItem item = null;

        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            tx = session.beginTransaction();

            item = session.get(MenuItem.class, id);

            tx.commit();
        } catch (Exception e) {
            if (tx != null) {
				tx.rollback();
			}
            e.printStackTrace();
        }
        return item;
    }

}
