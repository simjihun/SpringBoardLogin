package com.login.user.controller;

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
import org.springframework.web.servlet.ModelAndView;

import com.login.user.dto.UserDto;
import com.login.user.service.LoginService;


@Controller
public class IdCheckController {

	@Resource(name="loginService")
	private LoginService loginService;
	
	@RequestMapping(value="idCheck.do", method=RequestMethod.POST)
	public void loginCheck(@ModelAttribute UserDto userDto, HttpSession session, HttpServletRequest request,HttpServletResponse response)
			throws IOException, ServletException
	{
		request.setCharacterEncoding("UTF-8");
//		ModelAndView modelAndView = new ModelAndView();

		int cnt = loginService.checkId(request.getParameter("user_id"));
		PrintWriter out = response.getWriter();
		out.print(cnt);
//	    modelAndView.addObject("cnt", cnt);
//	    modelAndView.setViewName("jsonView");
	}

}
