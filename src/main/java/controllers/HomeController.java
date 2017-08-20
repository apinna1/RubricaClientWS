package controllers;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import services.*;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	/*@Autowired
	UserService_Service service;*/
	
	@RequestMapping(value = "/" )
	public String goTohomePage( Model model) {
		UserService_Service service = new UserService_Service();
		List<Anagrafica> list = service.getUserServicePort().listUsers();
		model.addAttribute("list", list);
		return "home";	
	}
	
	
	
	@RequestMapping(value = "/goTohome")
	public String goToAddPage(Model model) {	
		UserService_Service service = new UserService_Service();
		List<Anagrafica> list = service.getUserServicePort().listUsers();
		model.addAttribute("list", list);
		return "home";	
	}
	
	
		
	@RequestMapping(value = "/add", method = RequestMethod.GET )
	public String addUser(/*@RequestParam("id") int id,*/
			@RequestParam("nome") String nome ,
			@RequestParam("cognome") String cognome ,
			@RequestParam("cf") String cf ,
			@RequestParam("telefono") String telefono ,
			@RequestParam("cellulare") String cellulare ,
			@RequestParam("email") String email ,Model model) {
		UserService_Service service = new UserService_Service();
		
		/*String nome = "Valeria1111";
		String cognome = " ";
		String cf = " ";
		String telefono = " ";
		String cellulare= " ";
		String email = " ";*/

		service.getUserServicePort().addUser(nome, cognome, cf, telefono, cellulare, email);
		
		List<Anagrafica> list = service.getUserServicePort().listUsers();
		model.addAttribute("list", list);
		return "home";
	
	}
	
	
	
	
	@RequestMapping(value = "/delete")
	public String deleteUser(@RequestParam("id") int id , Model model) {
		UserService_Service service = new UserService_Service();
		service.getUserServicePort().deleteUser(id);
		List<Anagrafica> list = service.getUserServicePort().listUsers();
		model.addAttribute("list", list);
		return "home";			
	}
	
	
	
	
	@RequestMapping(value = "/update")
	public String updateUser(@RequestParam("id") int id , Model model) {
		UserService_Service service = new UserService_Service();
		Anagrafica an = service.getUserServicePort().getUserById(id);
		model.addAttribute("user", an);
		
		List<Anagrafica> list = service.getUserServicePort().listUsers();
		model.addAttribute("list", list);
		return "home";			
	}
	
}
