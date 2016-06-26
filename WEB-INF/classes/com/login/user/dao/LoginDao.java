package com.login.user.dao;

import java.util.List;

import com.login.user.dto.UserDto;

public interface LoginDao {

	public UserDto loginCon(String user_id, String password);
	public int checkId(String user_id);
	public int checkAdmin(String user_id);
	public UserDto userInfo(String user_id);
	public void lastLogout(String user_id);
	public int updateProfile(UserDto userDto);
	public List<UserDto> getUlist();
	public void adminUpdate(UserDto userDto);
	public int signUp(UserDto userDto);
}
