package com.blueocn.RESTful_API_LibraryManagementSystem.data.repository;

import com.blueocn.RESTful_API_LibraryManagementSystem.data.entity.Book;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BookRepository extends JpaRepository<Book, Long> {
}
