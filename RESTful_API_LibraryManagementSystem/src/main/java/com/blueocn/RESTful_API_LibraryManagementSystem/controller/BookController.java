package com.blueocn.RESTful_API_LibraryManagementSystem.controller;

import com.blueocn.RESTful_API_LibraryManagementSystem.data.entity.Book;
import com.blueocn.RESTful_API_LibraryManagementSystem.data.exception.InvalidInputException;
import com.blueocn.RESTful_API_LibraryManagementSystem.data.exception.ResourceNotFoundException;
import com.blueocn.RESTful_API_LibraryManagementSystem.data.repository.BookRepository;
import jakarta.validation.Valid;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

import java.sql.Timestamp;
import java.util.List;

@RestController
@RequestMapping("/books")
public class BookController {

    private final BookRepository bookRepository;

    public BookController(BookRepository bookRepository) {
        this.bookRepository = bookRepository;
    }

    //GET /books: Retrieve a list of all books.
    @GetMapping
    public List<Book> getBooks() {
        return bookRepository.findAll();
    }

    //GET /books/{id}: Retrieve details of a specific book by its ID.
    @GetMapping("/{id}")
    public Book getBookById(@PathVariable Long id) {
        return bookRepository.findById(id).orElseThrow(() -> new ResourceNotFoundException("Book with ID " + id + " not found"));
    }

    //POST /books: Add a new book to the system.
    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    public Book addBook(@Valid @RequestBody Book book) {
        if (book.getTitle().isEmpty() || book.getAuthor().isEmpty()) {
            throw new InvalidInputException("Title and Author cannot be empty");
        }
        return bookRepository.save(book);
    }

    //PUT /books/{id}: Update the details of an existing book.
    @PutMapping("/{id}")
    public Book updateBook(@PathVariable long id, @Valid @RequestBody Book updatedBook){
        return bookRepository.findById(id)
                .map(book -> {
                    book.setTitle(updatedBook.getTitle());
                    book.setAuthor(updatedBook.getAuthor());
                    book.setIsbn(updatedBook.getIsbn());
                    book.setPublishedDate(updatedBook.getPublishedDate());
                    book.setUpdatedAt(updatedBook.getUpdatedAt());
                    return bookRepository.save(book);
                }).orElseThrow(() -> new RuntimeException("Book with ID " + id + " not found"));
    }

    //DELETE /books/{id}: Delete a book from the system.
    @DeleteMapping("/{id}")
    public void removeBook(@PathVariable long id) {
        bookRepository.deleteById(id);
    }

}
