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
	
	@PostMapping(value="addregister")
	public String addregister(@ModelAttribute Reg a)
	{
		repo.save(a);
		return "login";
	}
	
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String loginvalid(
		@RequestParam("email") String email,
		@RequestParam("password") String password,
		HttpSession session,
		ModelMap modelMap) {
			
		Reg name = repo.findByEmailAndPassword(email, password);
		try {
		if(email.equalsIgnoreCase(name.getEmail()) && password.equalsIgnoreCase(name.getPassword())) {
			session.setAttribute("name", name.getName());
			session.setAttribute("email", name.getEmail());
			session.setAttribute("password", name.getPassword());
			session.setAttribute("gender", name.getGender());
			session.setAttribute("phone", name.getPhone());
			session.setAttribute("city", name.getCity());
			session.setAttribute("country", name.getCountry());
			
			session.setAttribute("logged1","yes");
			return "index";
			

		
		} }
		catch(NullPointerException e) {
		modelMap.put("error", "Invaid Credentials. Please Enter the Vaild Credentials");
		return "login";
	}
	return "";		
	}
	
	
	@RequestMapping("/")
	public String home(HttpSession session,ModelMap modelMap)
	{
		if(session.getAttribute("logged1") == "yes")
		     return "index";
		else
		     return "login"; 
	}
	


	
	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.removeAttribute("logged1");
		return "login";
	}
	
	
}	
	
