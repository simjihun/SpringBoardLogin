<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" 	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="kr">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="icon" type="image/png" href="images/favicon.ico">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
<meta name="viewport" content="width=device-width" />
<style type="text/css">
       #layer1{
			 position:absolute;
             padding:5px;
             filter:alpha(opacity=50);
             width:250px; height:auto;
             background-color:white;
             border:2px #000000 dotted;
             display:none;
             z-index:9999;
       }
}
</style>
    <!-- core CSS     -->
    <link href="css/main.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" media="screen, projection" href="css/board.css" />

    <!-- Animation  -->
    <link href="css/main/animation.css" rel="stylesheet"/>
    <!--  Table  -->
    <link href="css/main/light-dashboard.css" rel="stylesheet"/>
    <link href="css/board.css" rel="stylesheet" />
    <!-- Board -->

    <!--     Fonts and icons     -->
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
    <link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300' rel='stylesheet' type='text/css'>
    <link href="css/icon.css" rel="stylesheet" />
    
    <!-- select -->

<title>게시판</title>


</head>
<body>
<div id="layer1">게시물 본문 미리 보기</div>
		<div class="wrapper">		
		<!-- 사이드 메뉴-->
		<t:insertAttribute name="side"/>		
		<!-- 상단 메뉴 -->
		<t:insertAttribute name="top"/>
		
		
		<!-- 본문 내용 -->
		<div class="content" align="center">
		<div class="container-fluid" >
		
	
	<form action="boardList.do" name="search" method="post" >
		
		<table border=0 width=800 cellpadding=5 cellspacing=0 >
		<tr>
			<td align=left>▶전체게시물수 : ${page.totalRecord }개 ▶현재 페이지 ( <font
				color=red> ${page.nowPage+1 } / ${page.totalPage} 페이지</font>)
			</td>
			<td align=right valign=top>
			
			<select name="keyField" size="1" id="intro">
				<option value="name" <c:if test="${'name'==keyField }"> selected</c:if>> 이름 </option>
				<option value="title" <c:if test="${'title'==keyField }"> selected</c:if>> 제목 </option>
				<option value="content" <c:if test="${'content'==keyField }"> selected</c:if>> 내용 </option>
			</select>
			
			<input type="text" size="16" name="keyWord" value="${keyWord }">
			<input type="button" value="검색" onClick="check()">
			<input type="hidden" name="page" value="0"></td>
		</tr>				
		</table>
	</form>
	
	<table class="blist">
		<tr>
			<th class="col-seq">번호</th>
			<th class="col-comment">제목</th>
			<th class="col-name">작성자</th>
			<th class="col-day">작성일</th>
			<th class="col-list">조회수</th>
		</tr>
		<tr>
					<c:choose>
					<c:when test="${empty list }">
					등록된 글이 없습니다.
					</c:when>
					<c:otherwise>
						<c:set var="doneLoop" value="false" />
						<c:forEach begin="${page.beginPerPage }" end="${page.beginPerPage + page.numPerPage -1}" var="i">
								<c:if test="${not doneLoop }">
									<tr>
										<td align=center class="col-seq">${list[i].seq }</td>
										<td class="col-comment" onmouseover="contentprev('${list[i].seq}');showlayer('layer1');" 
															onmouseout="hidelayer('layer1');">
											<!-- depth --> <c:if test="${list[i].depth != 0 }">
												<c:forEach begin="0" end="${list[i].depth}">
												&nbsp; &nbsp;
												</c:forEach>
											</c:if><a href="javascript:read(${list[i].seq })" >${list[i].title }</a>
										</td>
										<td align="center" class="col-name">${list[i].name }</td>
										<td align=center class="col-day">${list[i].regdate }</td>
										<td align=center class="col-list">${list[i].count }</td>
									</tr>
									<c:if test="${i+1 == page.totalRecord} }">
										<c:set var="doneLoop" value="true" />
									</c:if>
								</c:if>
						</c:forEach>
					</c:otherwise>
				</c:choose>		
		</tr>		
	</table>

<table border=0 width=800 cellpadding=5 cellspacing=0>
				<tr>
				<td align="left"><c:if test="${page.totalRecord !=0}">Page→ 
				
				<c:if test="${page.nowBlock >0 }">
					<a href="javascript:blockMoveb()"><font color="red"> 이전</font></a>
				</c:if>
				
				
				<c:set var="doneLoop2" value="false" />
				<c:forEach begin="0" end="${page.pagePerBlock-1 }" var="i">
					<c:if test="${not doneLoop2 }">
					<a href="javascript:pagemove(${i })"> ${(page.nowBlock*page.pagePerBlock)+i+1}</a>
					<c:if test="${(page.pagePerBlock*page.nowBlock+i+1) == page.totalPage }">
					<c:set var="doneLoop2" value="true" />  
					</c:if>
					</c:if>
				</c:forEach>
				
				
				<c:if test="${page.totalBlock > page.nowBlock+1 }">
					<a href="javascript:blockmovef()"><font color="red"> 다음</font></a>
				</c:if>
				</c:if>
				</td> 
					<td align=right>	<a href="boardWrite.do">[글쓰기]</a>&nbsp;<a href ="javascript:list()">[목록으로]</a>
				</td>
			</tr>
		</table>        	     	
        	
        	</div>
        	</div>
		<!-- footer -->
        <t:insertAttribute name="footer"/>		
		</div>
		
		
			<!-- 히든 정의 -->
	<form name="read" method="post">
		<input type="hidden" name="seq"/><input type="hidden" name="keyField"/><input type="hidden" name="keyWord"/>
	</form>

		<form name="pagemove" method="POST" action="boardList.do" >
			<input type="hidden" name="nowBlock" value="${page.nowBlock}" /> 
			<input type="hidden" name="nowPage" value="${page.nowBlock*page.pagePerBlock}" /> 
			<input type="hidden"name="keyField" value="${keyField }" /> 
			<input type="hidden"name="keyWord" value="${keyWord }" />
		</form>
	
	<form name="blockmovef" method="get" action="boardList.do">
		<input type="hidden" name="nowBlock" value="${page.nowBlock+1 }" /> 
		<input type="hidden" name="nowPage" value="${(page.nowBlock+1)*page.pagePerBlock}" />
		<input type="hidden" name="keyField" value="${keyField }" />
		<input type="hidden" name="keyWord" value="${keyWord }" />
	</form>
	
	<form name="blockmoveb" method="POST" action="boardList.do">
		<input type="hidden" name="nowBlock" value="${page.nowBlock-1 }" /> 
		<input type="hidden" name="nowPage" value="${(page.nowBlock-1)*page.pagePerBlock}" />
		<input type="hidden" name="keyField" value="${keyField }" />
		<input type="hidden" name="keyWord" value="${keyWord }" />
	</form>
	
	<form name="list" method="GET">
		<input type="hidden" name="reload" value="true">
	</form>
	
</body>


    <!--   Core JS Files   -->
    <script src="js/main/jquery-1.10.2.js" type="text/javascript"></script>
	<script src="js/main/bootstrap.min.js" type="text/javascript"></script>
	<!--  Checkbox, Radio & Switch Plugins -->
	<script src="js/main/bootstrap-checkbox-radio-switch.js"></script>
    <!--  Notifications Plugin    -->
    <script src="js/main/bootstrap-notify.js"></script>
    <!-- Light Bootstrap Table Core javascript and methods -->
	<script src="js/main/light-bootstrap-dashboard.js"></script>
	
	<!-- board -->
	<script language="javascript" type="text/javascript" src="js/board/createXMLHttpRequest.js"></script>
	<script language="javascript" type="text/javascript" src="js/board/list.js"></script>
	


</html>

