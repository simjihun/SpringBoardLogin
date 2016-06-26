package com.menu.board.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.menu.board.dao.BoardDaoImpl;
import com.menu.board.dto.BoardDto;
import com.menu.board.dto.PageDto;
import com.menu.board.service.BoardService;

@Controller
public class ListController {
	@Resource(name="boardService")
	private BoardService boardService;

	/*  서비스 주입이 잘되는지 테스트하는 코드
	public void setBoardService(BoardService boardService){
		System.out.println(boardService + " 서비스 주입 확인");
		this.boardService = boardService;
	} */
	
	@RequestMapping(value="/boardList.do")
	public ModelAndView list(@RequestParam(required=false) Integer nowPage,@RequestParam(required=false)Integer nowBlock,
			@RequestParam(required=false) String keyField, @RequestParam(required=false) String keyWord,HttpSession session)
	{
		ModelAndView view = new ModelAndView();
		List<BoardDto> list = boardService.boardList(keyField, keyWord);
		
		PageDto page = null;
		try{
			page = boardService.pagingProc(nowPage, nowBlock, list.size());
		}
		catch(Exception err){
			System.out.println("now페이지와 now블럭이 존재하지 않아 0을 대입했습니다.");
			System.out.println("에러내용은 다음과 같습니다." + err);
			page = boardService.pagingProc(0, 0, list.size());
		}
		view.addObject("iseq", session.getAttribute("iseq"));
		view.addObject("dao", new BoardDaoImpl());
		view.addObject("list", list);
		view.addObject("page",page);
		view.addObject("keyWord",keyWord);
		view.addObject("keyField",keyField);
		view.setViewName("board_list");
		
		return view;
	}
}
