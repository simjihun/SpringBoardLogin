package com.login.user.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

/** * 
 *@author JiHun
 * 세션 확인 후 세션이 없으면 로그인페이지로 이동하는 인터셉터 클래스
 */
public class SessionIntercept extends HandlerInterceptorAdapter {

	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView mv){
		
		if(mv == null)
			return;
		
		Map<String, String> sessionMap = new HashMap<String, String>();
		HttpSession session = request.getSession();
		
		sessionMap.put("user_id", (String) session.getAttribute("user_id"));
		sessionMap.put("name", (String) session.getAttribute("name"));
		sessionMap.put("local_ip", (String) session.getAttribute("local_ip"));
		if(session.getAttribute("permission") != null)
			sessionMap.put("permission", session.getAttribute("permission").toString());
		
		mv.addObject("sessionMap",sessionMap);		
	}
	
	
	/**
	 *  Controller 접근 전 로그인 세션을 확인함.  세션정보가 없으면 로그인페이지 이동
	 */
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)throws Exception{
		String rootPath = request.getContextPath();
		String loginPath = rootPath + "/login.do";
		
		String url = request.getRequestURI();
		
		if(loginPath.equals(url)){
			return true;
		}
		
		HttpSession session = request.getSession(false);
		if(session == null){
			response.sendRedirect(loginPath);
			System.out.println("세션에정보가 없음.............. ");
			return false;
		}
		if(request.getParameter("signup") == null){
			if(!hasSessionInfo(request.getSession())){
				response.sendRedirect(loginPath);
				System.out.println("sessenInfo no session");
				return false;
			}
		}
		return true;
	}
	
	public boolean hasSessionInfo(HttpSession session){
		return (session.getAttribute("user_id")!=null);
	}
}


