package com.Jan.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.Jan.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.Jan.model.Book;
import com.Jan.model.Order;
import com.Jan.model.OrderItem;
import com.Jan.repository.BookRepo;
import com.Jan.repository.OrderRepo;

@Controller
public class OrderController {

    @Autowired
    public BookRepo bookRepo;
    
    @Autowired
    public OrderRepo orderRepo;
   
    // Show Cart
    @GetMapping("/cart")
    public String showCart(HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "redirect:/userlogin"; // user must login
        }

        Map<String, Map<Long, Integer>> allCarts = (Map<String, Map<Long, Integer>>) session.getAttribute("userCarts");
        Map<Long, Integer> cart = (allCarts != null) ? allCarts.get(user.getEmailid()) : null;

        List<Book> booksInCart = new ArrayList<>();
        int totalAmount = 0;

        if (cart != null) {
            for (Map.Entry<Long, Integer> entry : cart.entrySet()) {
                Book book = bookRepo.findById(entry.getKey()).orElse(null);
                if (book != null) {
                    int qty = entry.getValue();
                    booksInCart.add(book);
                    totalAmount += book.getPrice() * qty;
                }
            }
        }

        model.addAttribute("booksInCart", booksInCart);
        model.addAttribute("cartQuantities", cart);
        model.addAttribute("totalAmount", totalAmount);
        return "cart";
    }

    // Add to Cart
    @PostMapping("/addToCart")
    public String addToCart(@RequestParam("isbnno") Long isbnno,
                            @RequestParam("quantity") int quantity,
                            HttpSession session) {

        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "redirect:/userlogin";
        }

        Book book = bookRepo.findById(isbnno).orElse(null);
        if (book == null) {
            return "redirect:/booksection";
        }

        Map<String, Map<Long, Integer>> allCarts = (Map<String, Map<Long, Integer>>) session.getAttribute("userCarts");
        if (allCarts == null) {
            allCarts = new HashMap<>();
        }

        Map<Long, Integer> cart = allCarts.getOrDefault(user.getEmailid(), new HashMap<>());
        cart.put(isbnno, cart.getOrDefault(isbnno, 0) + quantity);
        allCarts.put(user.getEmailid(), cart);
        session.setAttribute("userCarts", allCarts);

        return "redirect:/cart";
    }

    // Update Quantity
    @PostMapping("/cart/update")
    public String updateQuantity(@RequestParam("isbnno") Long isbnno,
                                 @RequestParam("quantity") int quantity,
                                 HttpSession session) {
        User user = (User) session.getAttribute("user");
        if (user == null) return "redirect:/userlogin";

        @SuppressWarnings({ "unchecked" })
		Map<String, Map<Long, Integer>> allCarts = (Map<String, Map<Long, Integer>>) session.getAttribute("userCarts");
        if (allCarts != null && allCarts.containsKey(user.getEmailid())) {
            Map<Long, Integer> cart = allCarts.get(user.getEmailid());
            cart.put(isbnno, quantity);
        }

        return "redirect:/cart";
    }

    // Remove Book
    @PostMapping("/cart/remove")
    public String removeFromCart(@RequestParam("isbnno") Long isbnno, HttpSession session) {
        User user = (User) session.getAttribute("user");
        if (user == null) return "redirect:/userlogin";

        @SuppressWarnings({ "unchecked"})
		Map<String, Map<Long, Integer>> allCarts = (Map<String, Map<Long, Integer>>) session.getAttribute("userCarts");
        if (allCarts != null) {
            Map<Long, Integer> cart = allCarts.get(user.getEmailid());
            if (cart != null) {
                cart.remove(isbnno);
            }
        }

        return "redirect:/cart";
    }
    
    @PostMapping("/placeorder")
    public String placeOrder(HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        if (user == null) return "redirect:/userlogin";

        Map<String, Map<Long, Integer>> allCarts = (Map<String, Map<Long, Integer>>) session.getAttribute("userCarts");
        if (allCarts == null || !allCarts.containsKey(user.getEmailid())) {
            model.addAttribute("message", "Cart is empty");
            return "cart";
        }

        Map<Long, Integer> cart = allCarts.get(user.getEmailid());
        if (cart == null || cart.isEmpty()) {
            model.addAttribute("message", "Cart is empty");
            return "cart";
        }

        Order order = new Order();
        order.setOrderDate(new java.sql.Date(System.currentTimeMillis()));
        order.setUser(user);
        order.setAddress(user.getAddress());
        order.setCity(user.getCity());
        order.setPincode(user.getPincode());
        order.setCountry(user.getCountry());
        order.setLandmark(user.getLandmark());
        order.setMobile(user.getMobileno());

        List<OrderItem> orderItems = new ArrayList<>();
        double total = 0;

        for (Map.Entry<Long, Integer> entry : cart.entrySet()) {
            Book book = bookRepo.findById(entry.getKey()).orElse(null);
            int quantity = entry.getValue();

            if (book == null || book.getStockquantity() < quantity) {
                model.addAttribute("message", "Stock not available for: " + (book != null ? book.getBooktitle() : "Unknown Book"));
                return "cart";
            }

            OrderItem orderItem = new OrderItem();
            orderItem.setBookId(book.getIsbnno());
            orderItem.setBookTitle(book.getBooktitle());
            orderItem.setQuantity(quantity);
            orderItem.setPrice(book.getPrice());
            orderItem.setOrder(order);

            orderItems.add(orderItem);
            total += book.getPrice() * quantity;

            // Reduce stock
            book.setStockquantity(book.getStockquantity() - quantity);
            book.setPurchaseCount(book.getPurchaseCount() + quantity);
            bookRepo.save(book);
        }

        order.setItems(orderItems);
        order.setTotalAmount(total);
        orderRepo.save(order);

        // Clear user's cart
        allCarts.remove(user.getEmailid());
        session.setAttribute("userCarts", allCarts);

        model.addAttribute("orderSuccess", "Order placed successfully!");
        return "placeorder";
    }
}
