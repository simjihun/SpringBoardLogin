package com.login.user.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LoginRegController {

	
	@RequestMapping(value="/loginReg.do", method=RequestMethod.GET)
	public ModelAndView signUp(HttpSession session, HttpServletRequest request, HttpServletResponse response)throws IOException
	{
		ModelAndView mv = new ModelAndView("loginReg");
		return mv;
	}
	
}
