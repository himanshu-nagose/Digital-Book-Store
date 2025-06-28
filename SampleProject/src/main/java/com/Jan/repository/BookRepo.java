package com.Jan.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.Jan.model.Book;

@Repository
public interface BookRepo extends JpaRepository<Book, Long> {
	 List<Book> findByBooktitleContainingIgnoreCaseOrAuthornameContainingIgnoreCaseOrCategoryContainingIgnoreCase(
		        String title, String author, String category
		    );
	 
	 List<Book> findAllByOrderByPurchaseCountDesc();

}
