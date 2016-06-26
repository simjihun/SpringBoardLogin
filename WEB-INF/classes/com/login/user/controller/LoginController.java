package com.login.user.controller;

import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.login.user.dto.UserDto;
import com.login.user.service.LoginService;

/*@EnableWebMvc*/
@Controller
public class LoginController {
	@Resource(name="loginService")
	private LoginService loginService;

	/**  로그인 인증 불러오기 */
	private LoginValidator validator = null;	
	public LoginValidator getValidator(){
		return validator;
	}
	@Autowired
	public void setValidator(LoginValidator validator) {
		this.validator = validator;
	}
	

	@RequestMapping(value="/login.do", method=RequestMethod.GET)
	public String showLogin(ModelMap map)
	{
		UserDto userDto= new UserDto();
		map.addAttribute("loginInfo",userDto);        
		return "login";		
	}

	
	/**
	 * ModelAttibute로 들어오면 model의 검증한 결과를 BindingResult에 대입함.
	 * 그 결과는 hasErrors로 처리!!
	 */
	@RequestMapping(value="/login.do", method=RequestMethod.POST)
	public ModelAndView login(@ModelAttribute(value="loginInfo") UserDto loginInfo, BindingResult result, HttpSession session, 
			HttpServletRequest request)throws IOException, ServletException{
		request.setCharacterEncoding("UTF-8");
		
		UserDto ud = loginService.loginCon(loginInfo.getUser_id(),loginInfo.getPassword());

		validator.validate(loginInfo, result);
		ModelAndView view = new ModelAndView();


		if(!result.hasErrors()){
			session.setAttribute("user_id", loginInfo.getUser_id());
			session.setAttribute("name", ud.getName());
			session.setAttribute("permission", loginService.checkAdmin(loginInfo.getUser_id()));
			session.setAttribute("iseq", ud.getIseq());
			System.out.println("aaaaaaaa : " + ud.getName());
			
			view.addObject("list",ud);
			view.setViewName("redirect:main.do");
		}else{
			view.setViewName("login");
		}		
	
		view.addObject("loginInfo",loginInfo);		
		return view;
	}
	

}
