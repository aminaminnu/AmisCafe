package listener;

import org.hibernate.SessionFactory;

import com.mysql.cj.jdbc.AbandonedConnectionCleanupThread;

import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;
import util.HibernateUtil;

@WebListener
public class AppContextListener implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        // Nothing needed on startup
        System.out.println("Application started.");
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        System.out.println("Application stopping...");

        // --- 1. Close Hibernate SessionFactory ---
        try {
            SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
            if (sessionFactory != null && !sessionFactory.isClosed()) {
                sessionFactory.close();
                System.out.println("Hibernate SessionFactory closed.");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        // --- 2. Cleanup MySQL abandoned connection threads ---
        try {
            AbandonedConnectionCleanupThread.checkedShutdown();
            System.out.println("MySQL AbandonedConnectionCleanupThread stopped.");
        } catch (Exception e) {
            e.printStackTrace();
        }

        System.out.println("Application stopped successfully.");
    }
}
