package com.skilldistillery.rpginfo.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.skilldistillery.rpginfo.data.RPGameInfoDAO;
import com.skilldistillery.rpginfo.entities.CharacterBuild;
import com.skilldistillery.rpginfo.entities.CharacterClass;
import com.skilldistillery.rpginfo.entities.Race;

@Controller
public class RPGameInfoController {
	
	@Autowired
	private RPGameInfoDAO dao;
	
	@GetMapping(path= {"/","home.do"})
	public String homePage (Model model) {
		model.addAttribute("builds", dao.findAllBuilds());
		return "home";
	}
	
	//Redirect to find-a-build form
	@GetMapping(path= "get.do")
	public String getterForm () {
		return "views/getBuild";
	}
	
	//Redirect to insert-a-build form
	@GetMapping(path= "insert.do")
	public String insertForm (Model model) {
		model.addAttribute("builds", dao.findAllBuilds());
		model.addAttribute("races", dao.findAllRaces());
		model.addAttribute("classes", dao.findAllClasses());
		return "views/insertBuild";
	}
	
	//Redirect to update-a-build form
	@GetMapping(path= "update.do")
	public String updateForm (Model model) {
		model.addAttribute("builds", dao.findAllBuilds());
		return "views/updateBuildQuery";
	}
	
	//Redirect to delete-a-build form
	@GetMapping(path= "delete.do")
	public String deleteForm (Model model) {
		model.addAttribute("builds", dao.findAllBuilds());
		return "views/deleteBuild";
	}
	
	//Get a Build when given an ID, Redirect to GET method
	@RequestMapping(path="getterForm.do")
	public String getterFormProcessing (String id, RedirectAttributes redir) {
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
		return "views/deleteBuildResult";
	}
	
	@RequestMapping(path="updateFormQuery.do")
	public String updateFormQuery (String id, Model model) {
		CharacterBuild cb = null;
		boolean success = false;
		if (id != "") {
			Integer parseId = 0;
			try {
				parseId = Integer.parseInt(id);
				cb = dao.findById(parseId);
				success = true;
			} catch (NumberFormatException e) {
				System.out.println("Invalid number provided");
			}
		}
		
		
		model.addAttribute("success", success);
		model.addAttribute("build", cb);
		model.addAttribute("races", dao.findAllRaces());
		model.addAttribute("classes", dao.findAllClasses());
		
		return "views/updateBuild";
	}
	
	@PostMapping(path="updateForm.do")
	public String updateFormProcessing (String id, String characterRace, String characterClass, CharacterBuild cb, RedirectAttributes redir) {
		Integer parseId = 0;
		Integer charaRace = 0;
		Integer charaClass = 0;
		if (id != "") {
			try {
				parseId = Integer.parseInt(id);
				charaRace = Integer.parseInt(characterRace);
				charaClass = Integer.parseInt(characterClass);
				
				cb.setCharClass(dao.findClassById(charaClass));
				cb.setRace(dao.findRaceById(charaRace));
			} catch (NumberFormatException e) {
				System.out.println("Invalid number provided");
			}
		}
		CharacterBuild build = dao.updateCharacterBuild(parseId, cb);
		redir.addFlashAttribute("updateBuild", build);
		return "redirect:updateFormResult.do";
	}
	
	@GetMapping(path="updateFormResult.do")
	public String updateFormResult (CharacterBuild updateBuild) {
		return "views/updateBuildResult";
	}
	
	
	@PostMapping(path="insertForm.do")
	public String insertFormProcessing (String characterRace, String characterClass, CharacterBuild cb, RedirectAttributes redir) {
		Integer charaRace = 0;
		Integer charaClass = 0;
		try {
			charaRace = Integer.parseInt(characterRace);
			charaClass = Integer.parseInt(characterClass);
			
			cb.setCharClass(dao.findClassById(charaClass));
			cb.setRace(dao.findRaceById(charaRace));
		} catch (NumberFormatException e) {
			System.out.println("Invalid number provided");
		}
		dao.insertCharacterBuild(cb);
		redir.addFlashAttribute("insertBuild", cb);
		
		
		return "redirect:insertFormResult.do";
	}
	
	@GetMapping(path="insertFormResult.do")
	public String insertFormResult (CharacterBuild insertBuild, Model model) {
		
		return "views/insertBuildResult";
	}

}
