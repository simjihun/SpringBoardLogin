package com.menu.board.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.menu.board.dto.BoardDto;
import com.menu.board.service.BoardService;

@Controller
public class UpdateController {
	@Resource(name="boardService")
	private BoardService boardService;
	
	@RequestMapping(value="boardUpdate.do",method=RequestMethod.GET)
	public ModelAndView updateView(@RequestParam int seq){
		ModelAndView view = new ModelAndView();
		BoardDto dto = boardService.findBySeq(seq);
		view.addObject("dto",dto);
		view.setViewName("board_update");
		return view;		
	}

	@RequestMapping(value="boardUpdate.do", method=RequestMethod.POST)
	public ModelAndView updateView(@ModelAttribute BoardDto board,@RequestParam String pass)
	{
		ModelAndView view = new ModelAndView();
		System.out.println("###############seq : " + board.getSeq());
		int result = boardService.updateBoard(board, pass);
		
		if(result == 1){
			System.out.println("수정 완료");
			view.setViewName("redirect:boardList.do");
		}else{
			System.out.println("수정 실패 이유 :" + result);
			view.addObject("result",result);
			view.setViewName("redirect:boardUpdate.do?seq="+board.getSeq());
		}return view;
	}
}