package com.menu.board.service;

import java.util.List;

import com.menu.board.dto.BoardDto;
import com.menu.board.dto.PageDto;

public interface BoardService {

	public List<BoardDto> boardList(String keyfield, String keyword);
	public BoardDto findBySeq(int seq);
	public BoardDto viewContent(int seq);
	public void insertBoard(BoardDto board);
	public int updateBoard(BoardDto board, String pass);
	public String deleteView(int seq);
	public int deleteBoard(int seq, String storpass);
	public void replyBoard(BoardDto board);
	public void replyUpPos(BoardDto board);
	public PageDto pagingProc(int nowPage, int nowBlock, int totalRecord);
	public BoardDto getUser(int iseq);

	
/*	boardList : 게시물리스트보기
	preView : 본문 미리보기가 서비스에서 빠짐 (xxxxxx)
	findByseq : 시퀀스에 의한 리스트 뽑기
	ViewContent : 본문 읽기
	insertBoard : 글쓰기
	updateBoard : 글 수정
	deleteView : 삭제후 넘어가는 페이지
	deleteBoard : 글 삭제
	replyBoard : 답변하기
	replyUpPos : 리플라이업포스(부모글)
	pagingProc : 페이징 등록<----------------서비스에서 새로생김
	*/
}
