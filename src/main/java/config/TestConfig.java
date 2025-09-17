package config;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class TestConfig {
	 public static void main(String[] args) {
	        // Just building SessionFactory will connect to DB and create tables
	        SessionFactory factory = new Configuration().configure().buildSessionFactory();
	        factory.close();
	    }

}
