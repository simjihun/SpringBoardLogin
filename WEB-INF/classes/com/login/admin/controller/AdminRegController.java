package com.login.admin.controller;

import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tiles.request.render.RenderException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.login.user.dto.UserDto;
import com.login.user.service.LoginService;



@Controller
public class AdminRegController {
	@Resource(name="loginService")
	private LoginService loginService;

	
	@RequestMapping(value="/admin_reg.do", method=RequestMethod.POST)
	public ModelAndView moveAdmin(UserDto userDto, HttpServletRequest request,HttpSession session,HttpServletResponse response) 
			throws IOException, ServletException, RenderException
	{
		ModelAndView mv = new ModelAndView("admin_reg");
		loginService.adminUpdate(userDto);
		mv.addObject("ulist",loginService.getUlist());
		return mv;
	}
	
	@RequestMapping(value="/admin_reg.do", method=RequestMethod.GET)
	public ModelAndView showAdmin(HttpSession session, HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException, RenderException
	{
		ModelAndView mv = new ModelAndView("admin_reg");
		mv.addObject("ulist",loginService.getUlist());
		return mv;
	}
	
		
}


