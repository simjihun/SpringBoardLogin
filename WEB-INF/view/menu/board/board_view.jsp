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

    <!-- core CSS     -->
    <link href="css/main.css" rel="stylesheet" />

    <!-- Animation  -->
    <link href="css/main/animation.css" rel="stylesheet"/>
    <!--  Table  -->
    <link href="css/main/light-dashboard.css" rel="stylesheet"/>

    <!--     Fonts and icons     -->
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
    <link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300' rel='stylesheet' type='text/css'>
    <link href="css/icon.css" rel="stylesheet" />

<title>글 읽기</title>
<style>
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);

body {
	font-family: 'Nanum Gothic', sans-serif;
}
</style>
<script type="text/javascript">
function list(){
	document.list.action="boardList.do";
 	document.list.submit();
 } 
</script>

</head>
<body>

		<div class="wrapper">		
		<!-- 사이드 메뉴-->
		<t:insertAttribute name="side"/>		
		<!-- 상단 메뉴 -->
		<t:insertAttribute name="top"/>
		<!-- 본문 내용 -->
		    <div class="content">
				<div class="container-fluid">
				
	<table summary="전체 테이블 구성" width=900 height=400 cellpadding=5 cellspacing=0>
	<tr>
		<td ><div align="center"><h3><b>글 읽기</b></h3></div></td>
	</tr>
	<tr>
		<td colspan=2>
		<table border="1" summary="목록 테이블 구성" width=900 height=300 cellpadding=5 cellspacing=0> 
    <tr> 
		<td align=center bgcolor=#dddddd width=20%> 작성자</td>
		<td bgcolor=#ffffe8 width=30%>${dto.name}</td>
		<td align=center bgcolor=#dddddd width=15%> 작성일</td>
		<td bgcolor=#ffffe8 width=50%>${dto.regdate }</td>
	</tr>
    <tr>
		<td align=center bgcolor=#dddddd> E-mail </td>
		<td bgcolor=#ffffe8 >${dto.email }</td> 
		<td align=center bgcolor=#dddddd> 홈페이지 </td>
		<td bgcolor=#ffffe8><a href="http://${dto.homepage}" target="_new">http://${dto.homepage}</a></td> 
	</tr>
	<tr> 
		<td align=center bgcolor=#dddddd> 제 목</td>
		<td bgcolor=#ffffe8 colspan=3>${dto.title}</td>
   </tr>
   <tr> 
		<td colspan=4><br>${dto.content }<br></td>
   </tr>
   <tr>
		<td colspan=4 align=right> 조회수  : ${dto.count}</td>
   </tr>
	</table>
	</td>
 	</tr>
	<tr>
		<td align=center colspan=2> 
		<hr size=1>
		<div align="center">
		[ <a href="javascript:list()">목 록</a> | 
			<a href="boardUpdate.do?seq=${dto.seq}">수 정</a> |
			<a href="boardReply.do?seq=${dto.seq}">답 변</a> |
			<a href="boardDelete.do?seq=${dto.seq}">삭 제 </a>]<br>
		
		</div>
		</td>
	</tr>
	</table>
	<form name="list" method="post">
		<input type="hidden" name="seq" value="${dto.seq}">
		<input type="hidden" name="keyField" value="${keyField}">
		<input type="hidden" name="keyWord" value="${keyWord}">
	</form>

			</div>
        	</div>
		<!-- footer -->
        <t:insertAttribute name="footer"/>		
		</div>
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

</html>
