package com.Jan.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.Jan.model.UserQuery;
import com.Jan.repository.UserQueryRepo;

@Controller
public class ContactController {

	@Autowired
	public UserQueryRepo cRepo;
	
	@RequestMapping("/submitContact")
	public String submitContact(@ModelAttribute UserQuery uquery) {
		
		cRepo.save(uquery);
		return "redirect:/homepage";
	}
}
