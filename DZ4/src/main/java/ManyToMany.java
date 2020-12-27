import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import java.util.List;

public class ManyToManyApp {
    public static void main(String[] args) {


        SessionFactory factory = new Configuration()
                .configure("configs/many_to_many/hibernate.cfg.xml")
                .buildSessionFactory();

        Session session = null;
        try {
            session = factory.getCurrentSession();
            session.beginTransaction();
            Price price = session.get(Price.class, 1L);
            System.out.println(price);
            System.out.println("Books: ");
            for (Seansi b : price.getSeanses()) {
                System.out.println(b.getRaspisanie());
            }

            List<Price> prices = session.createQuery("SELECT r FROM Price r ORDER BY size(r.seanses) DESC").getResultList();
            System.out.println(prices);
            session.getTransaction().commit();

            session = factory.getCurrentSession();
            session.beginTransaction();
            List<Seanses> allseanses = session.createQuery("SELECT b FROM Seanses b").getResultList();

            session = factory.getCurrentSession();
            session.beginTransaction();
            session.createQuery("DELETE FROM Seanses b WHERE b.id = 1").executeUpdate();
            session.getTransaction().commit();
            System.out.println(2);
//            session = factory.getCurrentSession();
//            session.beginTransaction();
//            System.out.println(session.createQuery("SELECT b.title FROM Book b WHERE b.id = 1", String.class).getSingleResult());
//            session.getTransaction().commit();
//
//            session = factory.getCurrentSession();
//            session.beginTransaction();
//            List<Book> books = session.createQuery("FROM Book").getResultList();
//            session.getTransaction().commit();
        } finally {
            factory.close();
            if (session != null) {
                session.close();
            }
        }
    }
}
