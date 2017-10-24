package ru.zinov.intership.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import ru.zinov.intership.model.Book;

import java.util.List;

/**
 * Created by a.zinov on 23.10.2017.
 */
public class BookDaoImpl implements BookDao {

    SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public Book find(int id) {
        Session session = sessionFactory.getCurrentSession();
        Book book = (Book) session.get(Book.class, id);
        return book;
    }

    @Override
    public boolean save(Book book) {
        Session session = sessionFactory.getCurrentSession();
        session.save(book);
        return true;
    }

    @Override
    public boolean update(Book book) {
        Session session = sessionFactory.getCurrentSession();
        session.update(book);
        return true;
    }

    @Override
    public boolean delete(int id) {
        Session session = sessionFactory.getCurrentSession();
        session.delete(find(id));
        return true;
    }

    @Override
    public List<Book> findAll() {
        Session session = sessionFactory.getCurrentSession();
        List<Book> books = (List<Book>) session.createQuery(" FROM  Book ").list();
        return books;
    }

    @Override
    public List<Book> findAll(String title) {

        Session session = sessionFactory.getCurrentSession();
        List<Book> books = (List<Book>) session.createQuery("FROM Book WHERE title like '%" + title + "%'").list();
        return books;
    }
}
