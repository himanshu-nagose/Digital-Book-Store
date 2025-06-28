package com.Jan.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.Jan.model.Book;
import com.Jan.repository.BookRepo;

@Controller
public class BookController {

	@Autowired
    private BookRepo bookRepo;
	
	@GetMapping("/search")
    public String searchBooks(@RequestParam("query") String keyword, Model model) {
        List<Book> result = bookRepo.findByBooktitleContainingIgnoreCaseOrAuthornameContainingIgnoreCaseOrCategoryContainingIgnoreCase(
            keyword, keyword, keyword);
        model.addAttribute("searchResults", result);
        model.addAttribute("keyword", keyword);
        return "searchresults"; // JSP file name
    }
	
	@GetMapping("/bestsellers")
	public String viewBestSellers(Model model) {
	    List<Book> bestSellers = bookRepo.findAllByOrderByPurchaseCountDesc();
	    model.addAttribute("bestSellers", bestSellers);
	    return "bestsellers";
	}
	
	@GetMapping("/newarrivals")
	public String showNewArrivals(Model model) {
	    List<Book> books = bookRepo.findAll(Sort.by(Sort.Direction.DESC, "isbnno")); // newest books first
	    model.addAttribute("newBooks", books);
	    return "newarrivals"; // maps to newarrivals.jsp
	}


}

