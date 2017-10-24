package ru.zinov.intership.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import ru.zinov.intership.model.Book;
import ru.zinov.intership.service.BookService;

import java.util.List;

/**
 * Created by a.zinov on 23.10.2017.
 */
@Controller
public class BookController {

    private BookService bookService;

    @Autowired(required = true)
    @Qualifier(value = "bookService")
    public void setBookService(BookService bookService) {
        this.bookService = bookService;
    }

//    @RequestMapping (value = "/books", method = RequestMethod.GET)
//    public String listBooks(Model model) {
//        model.addAttribute("book", new Book());
//        model.addAttribute("listBooks", this.bookService.findAllBooks());
//
//        return "books";
//    }

    @RequestMapping(value = "/books", method = RequestMethod.GET)
    public ModelAndView listBooks(@RequestParam(required = false) Integer page) {
        ModelAndView modelAndView = new ModelAndView("books");

        List<Book> books = bookService.findAllBooks();
        int pageSize = 10;
        PagedListHolder<Book> pagedListHolder = new PagedListHolder<Book>(books);
        pagedListHolder.setPageSize(pageSize);
        pagedListHolder.setPage((int) Math.round((double)books.size() / 10));
        modelAndView.addObject("maxPages", pagedListHolder.getPageCount());

        if(page == null || page < 1 || page > pagedListHolder.getPageCount())
            page=1;

        modelAndView.addObject("page", page);

        if(page == null || page < 1 || page > pagedListHolder.getPageCount()){
            pagedListHolder.setPage(0);
            modelAndView.addObject("listBooks", pagedListHolder.getPageList());
        }
        else if(page <= pagedListHolder.getPageCount()) {
            pagedListHolder.setPage(page-1);
            modelAndView.addObject("listBooks", pagedListHolder.getPageList());
        }

        modelAndView.addObject("book", new Book());

        return modelAndView;
    }

    @RequestMapping(value = "/books", method = RequestMethod.POST)
    public String addBook(@ModelAttribute("book") Book book) {
        book.setAuthor(book.getAuthor());
        book.setDescription(book.getDescription());
        book.setId(book.getId());
        book.setIsbn(book.getIsbn());
        book.setTitle(book.getTitle());
        book.setPrintYear(book.getPrintYear());
        book.setReadAlready(book.isReadAlready());
        bookService.addBook(book);

        return "redirect:/books";
    }

    @RequestMapping("searchBook")
    public ModelAndView searchBook(@RequestParam("searchName") String searchName) {
        List<Book> bookList = bookService.findAllBooks(searchName);
        return new ModelAndView("books", "listBooks", bookList);
    }

    @RequestMapping(value = "/books", method = RequestMethod.DELETE)
    public String removeBook(@RequestParam("id") int id) {
        bookService.deleteBook(id);
        return "redirect:books";
    }

    @RequestMapping(value = "/books", method = RequestMethod.PUT)
    public String editBook(@ModelAttribute("book") Book book) {

        Book b = bookService.findBook(book.getId());

        if (!b.isReadAlready() && book.isReadAlready()) {
            b.setReadAlready(true);
        }

        int lastReadYear = b.getPrintYear();
        int currentPrintYear = book.getPrintYear();

        if (lastReadYear != currentPrintYear) {
            b.setTitle(book.getTitle());
            b.setDescription(book.getDescription());
            b.setIsbn(book.getIsbn());
            b.setPrintYear(book.getPrintYear());
            b.setReadAlready(false);
        }

        bookService.updateBook(b);
        return "redirect:books";
    }

    @RequestMapping(value = "books/create", method = RequestMethod.GET)
    public ModelAndView showCreate() {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("book", new Book());
        modelAndView.setViewName("addBook");
        return modelAndView;
    }

    @RequestMapping(value = "books/{id}", method = RequestMethod.GET)
    public ModelAndView showEdit(@PathVariable("id") int id) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("book", bookService.findBook(id));
        modelAndView.setViewName("editBook");
        return modelAndView;
    }
}
