package com.login.user.controller;

import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.login.user.dto.UserDto;
import com.login.user.service.LoginService;


@Controller
public class MainController {
	@Resource(name="loginService")
	private LoginService loginService;
	
	@RequestMapping(value="/main.do", method=RequestMethod.GET) 
	public ModelAndView showMain(UserDto loginInfo, HttpSession session, HttpServletRequest request, HttpServletResponse response) throws IOException
	{	
		System.out.println("MainController connect");
		request.setCharacterEncoding("UTF-8");		
		ModelAndView mv = new ModelAndView("main");
		
		session.setAttribute("local_ip", request.getLocalAddr());
		
		
		mv.addObject("loginInfo",loginInfo);
		return mv;
	}

}
