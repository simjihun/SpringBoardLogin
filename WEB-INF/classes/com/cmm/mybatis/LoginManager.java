package com.cmm.mybatis;

import java.io.IOException;
import java.io.Reader;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.login.user.dto.UserDto;
import com.menu.board.dto.BoardDto;


public class LoginManager {
	
	private static SqlSessionFactory sqlMapper;
	static{
		try {
			Reader reader = Resources.getResourceAsReader("com/cmm/mybatis/sqlmapConfig.xml");
			
			sqlMapper = new SqlSessionFactoryBuilder().build(reader); 
		} catch (IOException err){
			throw new RuntimeException("SQL세션팩토리 인스턴스 생성 실패" + err,err);
		}
	}
	
	public static UserDto login(String user_id, String password){
		UserDto ud = new UserDto();
		SqlSession session = sqlMapper.openSession();
		if(user_id != null && password != null && user_id !="" && password !=""){
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("user_id",user_id);
			map.put("password", password);
			if(!(session.selectOne("login",map) == null)){
				ud = session.selectOne("login",map);
				System.out.println("LoginManager - 로그인정보 일치");
			}else{
				System.out.println("LoginManager - 로그인정보가 불일치");
				ud.setUser_id("null");
				ud.setPassword("null");
			}
			session.close();
			return ud;
		}else{
			session.close();
			System.out.println("ID / Password 하나 이상이 NULL");
			return ud;
		}
	}
	
	public static int checkId(String user_id){
		SqlSession session = sqlMapper.openSession();
		int idcnt = 0;
		if(!(null ==user_id)){
			idcnt = session.selectOne("checkId",user_id);
		}
		System.out.println("@@@@@@idcnt : " + idcnt);
		session.close();
		return idcnt;
	}

/*	public static int checkAdmin(String user_id){
		SqlSession session = sqlMapper.openSession();
		int pm = 0;
		if(!(session.selectOne("checkAdmin",user_id) ==null)){
			System.out.println("LoginMager - checkAdmin 접속하고 user_id는 null값이 아님");
			pm = session.selectOne("checkAdmin",user_id);		}

		System.out.println("user_id : " + user_id);
		session.close();
		return pm;
	}*/

	public static int checkAdmin(String user_id){
		SqlSession session = sqlMapper.openSession();
		
		int permission = 0;
		if(!(user_id == null || "".equals(user_id))){
			permission = session.selectOne("checkAdmin",user_id);
		}else{
				permission = session.selectOne("checkAdmin",user_id);
			}
	
		System.out.println("permission 값 : " + permission);
		session.close();
		return permission;
	}

	public static UserDto userInfo(String user_id){
		SqlSession session = sqlMapper.openSession();
		UserDto ud = new UserDto();
		ud = session.selectOne("userInfo",user_id);
		//session.close();		
		return ud;
	}
	
	public static void lastLogout(String user_id){
		SqlSession session = sqlMapper.openSession();
		session.update("lastLogout",user_id);
		session.commit();
		session.close();		
	}
	
	public static int updateProfile(UserDto userDto){
		SqlSession session = sqlMapper.openSession();
		Map<String, UserDto> map = new HashMap<String, UserDto>();
		//map.put(key, value);
		//map.put("profile", userDto);
		System.out.println(userDto.getUser_id() +" "+userDto.getEmail()+" " + userDto.getMemo() + " "  + " " + userDto.getTelephone());
		System.out.println(userDto.getName());
		int result = session.update("updateProfile",userDto);
		session.commit();
		session.close();
		return result;
	}
	
	public static List<UserDto> getUlist(){
		List<UserDto> list = null;
		SqlSession session = sqlMapper.openSession();
		list = session.selectList("getUlist");
		session.close();
		return list;
	}
	
	public static void adminUpdate(UserDto dto){
		SqlSession session = sqlMapper.openSession();
		session.update("adminUpdate",dto);
		session.commit();
		session.close();
	}
	
	public static int signUp(UserDto userDto){
		SqlSession session = sqlMapper.openSession();
		Map<String, UserDto> map = new HashMap<String, UserDto>();
		System.out.println("잘들어가나!!!!!!!!"+userDto.getUser_id2());
		int result = session.update("signUp",userDto);
		session.commit();
		session.close();
		return result;
	}	
}
