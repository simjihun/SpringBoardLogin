package com.login.admin.controller;

import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.login.user.service.LoginService;



@Controller
public class AdminController {
	@Resource(name="loginService")
	private LoginService loginService;

	
	@RequestMapping(value="/admin.do", method=RequestMethod.POST)
	public ModelAndView moveAdmin(ModelMap map, HttpServletRequest request,HttpSession session,HttpServletResponse response) throws IOException{
		System.out.println("어드민컨트롤러에접속했다~");
		request.setCharacterEncoding("UTF-8");
		int permission = 0;		
		if(!(request.getParameter("user_id")==null)){
			permission = loginService.checkAdmin(request.getParameter("user_id"));
			System.out.println("user_id의 permission 값은 ??  : " + permission);
		}else{
			permission = loginService.checkAdmin(request.getParameter("user_id"));
			System.out.println("user_id가 널값이네 permission값은  : " + permission);			
		}
		ModelAndView view = new ModelAndView();		
		session.setAttribute("permission", permission);
		
		if(permission == 0 || permission ==1){
			view.addObject("permission",permission);
			view.setViewName("admin");
		}else{
			view.setViewName("main");
		}
		
		return view;
	}
	
	@RequestMapping(value="/admin.do", method=RequestMethod.GET)
	public ModelAndView showAdmin(HttpSession session, HttpServletRequest request, HttpServletResponse response)throws IOException
	{
		ModelAndView mv = new ModelAndView("admin");
		System.out.println("MainController connect - move - main");
		return mv;
	}
	
		
}


