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
	
	//Redirect to find-a-build form
	@RequestMapping(path= "get.do")
	public String getterForm () {
		return "views/getBuild";
	}
	
	//Redirect to insert-a-build form
	@RequestMapping(path= "insert.do")
	public String insertForm () {
		return "views/insertBuild";
	}
	
	//Redirect to update-a-build form
	@RequestMapping(path= "update.do")
	public String updateForm () {
		return "views/updateBuild";
	}
	
	//Redirect to delete-a-build form
	@RequestMapping(path= "delete.do")
	public String deleteForm () {
		return "views/deleteBuild";
	}

}
