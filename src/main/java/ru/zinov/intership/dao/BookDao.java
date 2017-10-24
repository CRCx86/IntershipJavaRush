package ru.zinov.intership.dao;

import ru.zinov.intership.model.Book;

import java.util.List;

/**
 * Created by a.zinov on 23.10.2017.
 */
public interface BookDao {
    Book find(int id);
    boolean save(Book book);
    boolean update(Book book);
    boolean delete(int id);
    List<Book> findAll();
    List<Book> findAll(String title);
}
