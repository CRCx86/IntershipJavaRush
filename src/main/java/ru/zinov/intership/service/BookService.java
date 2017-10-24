package ru.zinov.intership.service;

import ru.zinov.intership.model.Book;

import java.util.List;

/**
 * Created by a.zinov on 23.10.2017.
 */
public interface BookService {
    Book findBook(int id);
    boolean addBook(Book book);
    boolean updateBook(Book book);
    boolean deleteBook(int id);
    List<Book> findAllBooks();
    List<Book> findAllBooks(String title);
}
