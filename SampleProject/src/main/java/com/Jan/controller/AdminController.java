package com.Jan.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.Jan.model.Book;
import com.Jan.repository.BookRepo;

@Controller
public class AdminController {

    @Autowired
    private BookRepo bookRepo;

    // Admin login page
    @GetMapping("/adminlogin")
    public String loginPage() {
        return "adminlogin";
    }

    // Admin login action
    @PostMapping("/adminlogin")
    public String login(@RequestParam String emailid,
                        @RequestParam String password,
                        @RequestParam String adminkey,
                        HttpSession session,
                        Model model) {

        if (emailid.equals("admin123@gmail.com") &&
            password.equals("admin@123") &&
            adminkey.equals("1822")) {

            session.setAttribute("admin", emailid);
            return "adminhomepage";
        }

        model.addAttribute("error", "Invalid email, password, or admin key.");
        return "adminlogin";
    }


//    // Common Home Page
//    @GetMapping("/home")
//    public String home() {
//        return "home";
//    }

    // Admin Dashboard
    @GetMapping("/adminhomepage")
    public String adminHomepage(HttpSession session) {
        if (session.getAttribute("admin") == null)
            return "redirect:/adminlogin";
        return "adminhomepage";
    }

    // Add Book Page
    @GetMapping("/addbook")
    public String addBook(HttpSession session) {
        if (session.getAttribute("admin") == null)
            return "redirect:/adminlogin";
        return "addbook";
    }
    
    @GetMapping("/managebooks")
    public String manageBooks(HttpSession session, Model model) {
        if (session.getAttribute("admin") == null) {
            return "redirect:/adminlogin";
        }

        model.addAttribute("manage_books", bookRepo.findAll());
        return "managebooks"; // ✅ Renders managebooks.jsp, does not redirect
    }

    // Edit Book Page
    @GetMapping("/editbook/{id}")
    public String editBook(@PathVariable long id, HttpSession session, Model model) {
        if (session.getAttribute("admin") == null)
            return "redirect:/adminlogin";

        model.addAttribute("edit_data", bookRepo.findById(id).orElse(null));
        return "editbook";
    }

    // Save New Book
    @PostMapping("/savebook")
    public String saveBook(@ModelAttribute Book book, HttpSession session) {
        if (session.getAttribute("admin") == null)
            return "redirect:/adminlogin";

        bookRepo.save(book);
        return "adminhomepage";
    }

    // Update Existing Book
    @PostMapping("/edit/{isbnno}")
    public String updateBook(@PathVariable long isbnno,
                             @ModelAttribute Book updated,
                             HttpSession session) {
        if (session.getAttribute("admin") == null)
            return "redirect:/adminlogin";

        Book book = bookRepo.findById(isbnno).orElse(null);
        if (book != null) {
            book.setBooktitle(updated.getBooktitle());
            book.setAuthorname(updated.getAuthorname());
            book.setCategory(updated.getCategory());
            book.setYopublication(updated.getYopublication());
            book.setPrice(updated.getPrice());
            book.setDiscount(updated.getDiscount());
            book.setStockquantity(updated.getStockquantity());
            bookRepo.save(book);
        }

        return "redirect:/managebooks";  // ✅ Correct redirection
    }


    // Delete Book or Decrease Quantity
    @PostMapping("/delete/{id}")
    public String deleteBook(@PathVariable long id,
                             @RequestParam int quantity,
                             HttpSession session) {
        if (session.getAttribute("admin") == null)
            return "redirect:/adminlogin";

        Book book = bookRepo.findById(id).orElse(null);
        if (book != null) {
            if (quantity >= book.getStockquantity()) {
                bookRepo.deleteById(id);
            } else {
                book.setStockquantity(book.getStockquantity() - quantity);
                bookRepo.save(book);
            }
        }

        return "managebooks";
    }

    // Categories Page
    @GetMapping("/categories")
    public String categories(HttpSession session) {
        if (session.getAttribute("admin") == null)
            return "redirect:/adminlogin";

        return "categories";
    }

    // Stats Page
    @GetMapping("/stats")
    public String stats(HttpSession session) {
        if (session.getAttribute("admin") == null)
            return "redirect:/adminlogin";

        return "stats";
    }

    // Admin Logout
    @GetMapping("/adminlogout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "home";
    }
}
