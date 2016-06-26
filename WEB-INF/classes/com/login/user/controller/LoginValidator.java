package com.login.user.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.login.user.dto.UserDto;
import com.login.user.service.LoginService;

@Component
public class LoginValidator implements Validator{
	private UserDto userInfo;
	@Resource(name="loginService")
	private LoginService loginService;	
	@Override
	public boolean supports(Class<?> c){
		return UserDto.class.isAssignableFrom(c);
	}
	
	/**
	 *  validate 메소드에서 command는 내가 로그인창에 입력하는 것. 그래서 userDto와 userInfo를 다르게 줬음
	 */
	@Override
	public void validate(Object command, Errors err){
		ValidationUtils.rejectIfEmptyOrWhitespace(err, "user_id", "login.id.empty");
		ValidationUtils.rejectIfEmptyOrWhitespace(err, "password", "login.password.empty");
		
		UserDto userDto = (UserDto) command;
		userInfo = loginService.loginCon(userDto.getUser_id(), userDto.getPassword());
		if(err.hasErrors())
		{
			return;
		}
		
		if(!checkID(userDto)){
			System.out.println("no matching ID : userDto와 userInfo가 불일치 ");
			err.rejectValue("user_id", "login.id.wrong");
		}else if(!checkPassword(userDto)){
			System.out.println("no matching Password : userDto와 userInfo가 불일치");
			err.rejectValue("password", "login.password.nomatching");
		}
	}

	private boolean checkID(UserDto userDto){
		boolean result = false;
		if(!("null".equals(userInfo.getUser_id()))){
			if(userDto.getUser_id().equals(userInfo.getUser_id())){
				result = true;
			}
		}else if(loginService.checkId(userDto.getUser_id())>0){
			System.out.println("아이디는 있네 ?");
			result = true;
		}
		return result;
	}
	
	private boolean checkPassword(UserDto userDto){
		boolean result = false;
		if(!("null".equals(userInfo.getPassword()))){
			if(userDto.getPassword().equals(userInfo.getPassword())){
				result = true;
			}
		}
		return result;
	}	

}
