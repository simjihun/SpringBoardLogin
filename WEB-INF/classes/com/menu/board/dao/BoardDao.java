package com.menu.board.dao;

import java.util.List;

import com.menu.board.dto.BoardDto;

public interface BoardDao {

	public List<BoardDto> boardList(String keyfield, String keyword);
	public String preView(int seq);
	public BoardDto findBySeq(int seq);
	public BoardDto viewContent(int seq);
	public void insertBoard(BoardDto board);
	public int updateBoard(BoardDto board, String pass);
	public String deleteView(int seq);
	public int deleteBoard(int seq, String storPass);
	public void replyBoard(BoardDto board);
	public void replyUpPos(BoardDto board);
	public BoardDto getUser(int iseq);
	
/*	boardList : 게시물리스트보기
	preView : 본문 미리보기
	findByseq : 시퀀스에 의한 리스트 뽑기
	ViewContent : 본문 읽기
	insertBoard : 글쓰기
	updateBoard : 글 수정
	deleteView : 삭제후 넘어가는 페이지
	deleteBoard : 글 삭제
	replyBoard : 답변하기
	replyUpPos : 리플라이업포스(부모글)
	
	select 구문 = list / preView / findBySeq / viewContent인데 
	           데이터를 한개만 저장해도 되면 원시타입 또는 DTo, Hashmap 모두가능 
	          데이터가 여러개의 속성을 갖는 경우는 무조건 DTO와 Hashmap사용
	
	result type은 select절에서 가져온 것을 저장할 자료형           
	insert, delete, update는 parameterType이 필수 / select도 가능하지만 where절이 있으면 쓰고 없으면 생략(변하는 데이터가있을때 사용)
	*/
}
