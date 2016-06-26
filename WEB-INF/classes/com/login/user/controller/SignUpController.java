package com.login.user.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.jasper.tagplugins.jstl.core.Out;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.login.user.dto.UserDto;
import com.login.user.service.LoginService;



@Controller
public class SignUpController {
	@Resource(name="loginService")
	private LoginService loginService;

	@RequestMapping(value="/signUp.do", method=RequestMethod.POST) 
	public ModelAndView signup(@ModelAttribute(value="loginInfo")UserDto loginInfo, HttpSession session, HttpServletRequest request, HttpServletResponse response) throws IOException
	{	
		
		request.setCharacterEncoding("UTF-8");	
		int result = 0;
		ModelAndView mv = new ModelAndView("signUp");		
		System.out.println(loginInfo.getUser_id2());
		result = loginService.signUp(loginInfo);
		
		if(result !=1){
			mv.setViewName("signUpfail");
		}

		return mv;
	}
	
}
