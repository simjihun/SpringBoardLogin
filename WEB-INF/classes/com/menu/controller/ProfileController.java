package com.menu.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.login.user.dto.UserDto;
import com.login.user.service.LoginService;
import com.mysql.fabric.Response;



@Controller
public class ProfileController {
	@Resource(name="loginService")
	private LoginService loginService;

	@RequestMapping(value="/profile.do", method=RequestMethod.GET) 
	public ModelAndView showMain(UserDto loginInfo, HttpSession session, HttpServletRequest request, HttpServletResponse response) 
			throws IOException
	{
		System.out.println("profileEditController connect");
		request.setCharacterEncoding("UTF-8");	
		ModelAndView mv = new ModelAndView("profile");
		
		
		mv.addObject("userInfo", loginService.userInfo((String)session.getAttribute("user_id")));
		return mv;
	}
	
	@RequestMapping(value="/profile.do", method=RequestMethod.POST)
	public ModelAndView updateView(@ModelAttribute UserDto userDto, HttpSession session, HttpServletRequest request)
			throws IOException, ServletException
	{
		request.setCharacterEncoding("UTF-8");
		ModelAndView view = new ModelAndView();
		//userDto.setUser_id((String)session.getAttribute("user_id"));
		int result = loginService.updateProfile(userDto);
		
		if(result==1){
			view.addObject("userInfo", loginService.userInfo((String)session.getAttribute("user_id")));
			view.setViewName("profile");
		}else{
			System.out.println("else로 빠짐");
		}
		return view;
	}
	
}
