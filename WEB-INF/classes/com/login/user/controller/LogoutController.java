package com.login.user.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.login.user.service.LoginService;

@Controller
public class LogoutController {
	@Resource(name="loginService")
	private LoginService loginService;

	
	@RequestMapping(value="/logout.do", method=RequestMethod.POST)
	public ModelAndView logout(HttpSession session, HttpServletRequest request)
	{
		String user_id = (String)request.getParameter("user_id");
		
		session.removeAttribute("user_id");
		session.removeAttribute("local_ip");
		
		loginService.lastLogout(user_id);
		
		System.out.println("Logout Success ");
		return new ModelAndView("redirect:/login.do");
	}
}
