package com.skilldistillery.rpginfo.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.skilldistillery.rpginfo.data.RPGameInfoDAO;
import com.skilldistillery.rpginfo.entities.CharacterBuild;

@Controller
public class RPGameInfoController {
	
	@Autowired
	private RPGameInfoDAO dao;
	
	@GetMapping(path= {"/","home.do"})
	public String homePage (Model model) {
		model.addAttribute("builds", dao.findAll());
		return "home";
	}
	
	//Redirect to find-a-build form
	@GetMapping(path= "get.do")
	public String getterForm () {
		return "views/getBuild";
	}
	
	//Redirect to insert-a-build form
	@GetMapping(path= "insert.do")
	public String insertForm () {
		return "views/insertBuild";
	}
	
	//Redirect to update-a-build form
	@GetMapping(path= "update.do")
	public String updateForm () {
		return "views/updateBuild";
	}
	
	//Redirect to delete-a-build form
	@GetMapping(path= "delete.do")
	public String deleteForm () {
		return "views/deleteBuild";
	}
	
	//Get a Build when given an ID, Redirect to GET method
	@PostMapping(path="getterForm.do")
	public String getterFormProcessing (String id, Model model, RedirectAttributes redir) {
		CharacterBuild cb = null;
		if (id != "") {
			Integer parseId = 0;
			try {
				parseId = Integer.parseInt(id);
				cb = dao.findById(parseId);
			} catch (NumberFormatException e) {
				System.out.println("Invalid number provided");
			}
		}
		
		redir.addFlashAttribute("build", cb);
		
		return "redirect:getterFormResult.do";
	}
	
	//Redirected page from getterForm.do
	@GetMapping(path="getterFormResult.do")
	public String getterFormResult (CharacterBuild build, Model model) {
		return "views/getBuildResult";
	}
	
	@PostMapping(path="deleteForm.do")
	public String deleteFormProcessing (String id, RedirectAttributes redir) {
		CharacterBuild cb = null;
		boolean success = false;
		if (id != "") {
			Integer parseId = 0;
			try {
				parseId = Integer.parseInt(id);
				cb = dao.findById(parseId);
			} catch (NumberFormatException e) {
				System.out.println("Invalid number provided");
			}
			
			success = dao.deleteCharacterBuild(parseId);
		}
		
		redir.addFlashAttribute("success", success);
		redir.addFlashAttribute("deletedBuild", cb);
		
		return "redirect:deleteFormResult.do";
	}
	
	@GetMapping(path="deleteFormResult.do")
	public String deleteFormResult (boolean success, CharacterBuild deletedBuild) {
		return "views/deleteResult";
	}

}
