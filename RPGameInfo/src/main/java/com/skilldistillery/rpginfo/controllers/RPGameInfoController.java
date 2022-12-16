package com.skilldistillery.rpginfo.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skilldistillery.rpginfo.data.RPGameInfoDAO;

@Controller
public class RPGameInfoController {
	
	@Autowired
	private RPGameInfoDAO dao;
	
	@RequestMapping(path= {"/","home.do"})
	public String homePage (Model model) {
		model.addAttribute("builds", dao.findAll());
		return "home";
	}

}
