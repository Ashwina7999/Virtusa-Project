package com.virtusa.hiring;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.mysql.cj.Session;
import com.virtusa.hiring.model.Reg;

@Controller
public class HomeController 
{	
	
	@Autowired
	AlienRepo repo;
		
	
	@RequestMapping("/login")
	public String login()
	{
		return "login";
	}

	@RequestMapping("/register")
	public String register()
	{
		return "register";
	}
	
	
	@RequestMapping("/edit")
	public String edit()
	{
		return "edit profile";
	}
	
	
		
	@RequestMapping(value = "/addlogin", method = RequestMethod.POST)
	public String loginvalid(
		@RequestParam("email") String email,
		@RequestParam("password") String password,
		HttpSession session,
		ModelMap modelMap) {
			
		Reg field = repo.findByEmailAndPassword(email, password);
		try {
		if(email.equalsIgnoreCase(field.getEmail()) && password.equalsIgnoreCase(field.getPassword())) {
			session.setAttribute("name", field.getName());
			session.setAttribute("email", field.getEmail());
			session.setAttribute("password", field.getPassword());
			session.setAttribute("gender", field.getGender());
			session.setAttribute("phone", field.getPhone());
			session.setAttribute("city", field.getCity());
			session.setAttribute("country", field.getCountry());
			
			session.setAttribute("logged","yes");
			return "index";
			

		
		} }
		catch(NullPointerException e) {
		modelMap.put("error", "Invaid Credentials. Please Enter the Vaild Credentials");
		return "login";
	}
	return "";		
	}
	
	
	
	@RequestMapping(value = "/addregister", method = RequestMethod.POST)
	public String addregister(
		HttpSession session, @ModelAttribute Reg a) {
		
		repo.save(a);	
		
			session.setAttribute("name", a.getName());
			session.setAttribute("email", a.getEmail());
			session.setAttribute("password", a.getPassword());
			session.setAttribute("gender", a.getGender());
			session.setAttribute("phone", a.getPhone());
			session.setAttribute("city", a.getCity());
			session.setAttribute("country", a.getCountry());
			
			session.setAttribute("logged","yes");
			return "index";
	
	}
	
	
	
	@RequestMapping("/")
	public String home(HttpSession session,ModelMap modelMap)
	{
		if(session.getAttribute("logged") == "yes")
		     return "index";
		else
		     return "login"; 
	}
	


	
	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.removeAttribute("logged");
		return "login";
	}
	
	
}	
	
