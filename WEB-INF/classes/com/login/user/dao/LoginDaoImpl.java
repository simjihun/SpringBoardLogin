package com.login.user.dao;

import java.util.List;

import com.cmm.mybatis.LoginManager;
import com.login.user.dto.UserDto;

public class LoginDaoImpl implements LoginDao{

	@Override
	public UserDto loginCon(String user_id, String password) {
		UserDto result = new UserDto();
		System.out.println("--------------------------------------------");
		System.out.println(" ID : " + user_id + " 패스워드 : " + password);
		System.out.println("--------------------------------------------");
		result = LoginManager.login(user_id, password);
		return result;
	}

	@Override
	public int checkId(String user_id) {
		return LoginManager.checkId(user_id);
	}

	@Override
	public int checkAdmin(String user_id) {
		return LoginManager.checkAdmin(user_id);
	}

	@Override
	public UserDto userInfo(String user_id) {
		return LoginManager.userInfo(user_id);
	}

	@Override
	public void lastLogout(String user_id) {
		LoginManager.lastLogout(user_id);
		
	}

	@Override
	public int updateProfile(UserDto userDto) {
		return LoginManager.updateProfile(userDto);
	}

	@Override
	public List<UserDto> getUlist() {
		return LoginManager.getUlist();
	}

	@Override
	public void adminUpdate(UserDto userDto) {
		LoginManager.adminUpdate(userDto);
	}

	@Override
	public int signUp(UserDto userDto) {
		return LoginManager.signUp(userDto);
	}





}
