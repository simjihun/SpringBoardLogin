package com.login.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class LginSaveController {
	
	@RequestMapping("/loginSave.do")
	public String loginSave(){
		
		return "login";
	}
}
