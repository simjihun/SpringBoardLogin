package com.login.user.service;

import java.util.List;

import javax.annotation.Resource;

import com.login.user.dao.LoginDao;
import com.login.user.dto.UserDto;

public class LoginServiceImpl implements LoginService{

	@Resource(name="loginDaoImpl")
	private LoginDao loginDao;
	
	@Override
	public UserDto loginCon(String user_id, String password) {
		System.out.println("LoginService.login()에 접속됨");
		return loginDao.loginCon(user_id, password);
	}

	@Override
	public int checkId(String user_id) {
		return loginDao.checkId(user_id);
	}

	@Override
	public int checkAdmin(String user_id) {
		return loginDao.checkAdmin(user_id);
	}

	@Override
	public UserDto userInfo(String user_id) {
		return loginDao.userInfo(user_id);
	}

	@Override
	public void lastLogout(String user_id) {
		loginDao.lastLogout(user_id);
		
	}

	@Override
	public int updateProfile(UserDto userDto) {
		return loginDao.updateProfile(userDto);
	}

	@Override
	public List<UserDto> getUlist() {
		return loginDao.getUlist();
	}

	@Override
	public void adminUpdate(UserDto userDto) {
		loginDao.adminUpdate(userDto);
	}

	@Override
	public int signUp(UserDto userDto) {
		return loginDao.signUp(userDto);
	}



}
