package com.menu.board.controller;

import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.login.user.dto.UserDto;
import com.menu.board.dto.BoardDto;
import com.menu.board.service.BoardService;

@Controller
public class WriteController {

	@Resource(name="boardService")
	private BoardService boardService;
	
	@RequestMapping(value="/boardWrite.do", method=RequestMethod.GET)
	public ModelAndView wirteView(UserDto loginInfo, HttpSession session, HttpServletRequest request, HttpServletResponse response)
	throws IOException,ServletException{
		ModelAndView mv = new ModelAndView("board_write");
		mv.addObject("userInfo",boardService.getUser(Integer.parseInt(session.getAttribute("iseq").toString())));
/*		mv.addObject("userInfo", loginService.userInfo((String)session.getAttribute("user_id")));*/
		return mv;
	}
	
	@RequestMapping(value="/boardWrite.do", method=RequestMethod.POST)
	public String insert(@ModelAttribute BoardDto dto){
		String content = dto.getContent();
		String content2 = content.replace("\n", "<br/>");
		dto.setContent(content2);
		boardService.insertBoard(dto);
		return "redirect:boardList.do";
	}
}
