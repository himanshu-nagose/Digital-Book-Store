package com.Jan.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.Jan.model.Order;
import com.Jan.model.OrderService;
import com.Jan.model.User;
import com.Jan.repository.BookRepo;
import com.Jan.repository.UserRepo;


@Controller
public class UserController {

    @Autowired 
    private UserRepo urepo;
    
    @Autowired 
    private BookRepo bookRepo;
    
    @Autowired
    private OrderService orderService;

    @GetMapping({"/", "/home"}) 
    public String home() { 
    	return "home"; 
    }
    
    @GetMapping("/about") 
    public String about() { 
    	return "about"; 
    }
    
    @GetMapping("/contactus") 
    public String contact() { 
    	return "contactus"; 
    }

    @GetMapping("/userlogin") 
    public String loginPage() { 
    	return "userlogin"; 
    }
    
    @PostMapping("/userlogin")
    public String login(@RequestParam String emailid, @RequestParam String password, HttpSession s) {
        User user = urepo.findByEmailid(emailid);
        if (user != null && user.getPassword().equals(password)) {
            s.setAttribute("user", user);
            return "redirect:/homepage";
        }
        return "userlogin";
    }

    @PostMapping("/usersignup")
    public String signup(@ModelAttribute User user) {
        urepo.save(user);
        return "redirect:/userlogin";
    }

    @GetMapping("/logout")
    public String logout(HttpSession s) {
        s.invalidate();
        return "redirect:/home";
    }

    @GetMapping("/homepage") 
    public String homepage() { 
    	return "homepage"; 
    }
    
    @GetMapping("/profile")
    public String profile(HttpSession session) {
        if (session.getAttribute("user") == null) {
            return "redirect:/userlogin";
        }
        return "profile";
    }
    
    @PostMapping("/updateProfile")
    public String updateProfile(@ModelAttribute User updatedUser,
                                @RequestParam(required = false) String password,
                                @RequestParam(required = false) String confirmPassword,
                                HttpSession session) {
        User sessionUser = (User) session.getAttribute("user");
        if (sessionUser != null) {
            // Update editable fields
            sessionUser.setName(updatedUser.getName());
            sessionUser.setMobileno(updatedUser.getMobileno());
            sessionUser.setCity(updatedUser.getCity());
            sessionUser.setAddress(updatedUser.getAddress());
            sessionUser.setPincode(updatedUser.getPincode());
            sessionUser.setCountry(updatedUser.getCountry());
            sessionUser.setLandmark(updatedUser.getLandmark());
            sessionUser.setGender(updatedUser.getGender());
            sessionUser.setGenre(updatedUser.getGenre());
            sessionUser.setDob(updatedUser.getDob());

            // Handle password update if provided and matches
            if (password != null && !password.isEmpty() && password.equals(confirmPassword)) {
                sessionUser.setPassword(password);
            }

            urepo.save(sessionUser);
            session.setAttribute("user", sessionUser); // refresh session user
        }

        return "redirect:/homepage";
    }

    @GetMapping("/booksection")
    public String bookSection(Model model) {
        model.addAttribute("bookList", bookRepo.findAll());
        return "booksection";
    }

    @GetMapping("/orderhistory")
    public String orderHistory(Model model, HttpSession session) {
        User user = (User) session.getAttribute("user");
        List<Order> orders = orderService.getOrdersByUser(user);
        model.addAttribute("orders", orders);
        return "orderhistory";
    }

}
