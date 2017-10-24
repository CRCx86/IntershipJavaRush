package ru.zinov.intership.service;

import ru.zinov.intership.dao.BookDao;
import ru.zinov.intership.model.Book;

import javax.transaction.Transactional;
import java.util.List;

/**
 * Created by a.zinov on 23.10.2017.
 */
public class BookServiceImpl implements BookService {

    private BookDao bookDao;

    public void setBookDao(BookDao bookDao) {
        this.bookDao = bookDao;
    }

    @Transactional
    @Override
    public Book findBook(int id) {
        return bookDao.find(id);
    }

    @Transactional
    @Override
    public boolean addBook(Book book) {
        return bookDao.save(book);
    }

    @Transactional
    @Override
    public boolean updateBook(Book book) {
        return bookDao.update(book);
    }

    @Transactional
    @Override
    public boolean deleteBook(int id) {
        return bookDao.delete(id);
    }

    @Transactional
    @Override
    public List<Book> findAllBooks() {
        return bookDao.findAll();
    }

    @Transactional
    @Override
    public List<Book> findAllBooks(String title) {
        return bookDao.findAll(title);
    }
}
