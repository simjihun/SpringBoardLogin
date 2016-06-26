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

<title>답글 달기</title>
<style>
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);

body {
	font-family: 'Nanum Gothic', sans-serif;
}
</style>
<script type="text/javascript">
function check() {
	if (document.post.name.value == "" || document.post.name.value == null) {
		alert("이름을 입력하세요.");
		document.post.name.focus();
		return;
	}
	else if(document.post.email.value == "" || document.post.email.value == null) {
		alert("이메일을 입력하세요.");
		document.post.email.focus();
		return;
	} 
	else if(document.post.title.value == "" || document.post.title.value == null) {
		alert("제목을 입력하세요.");
		document.post.title.focus();
		return;
	}
	else if(document.post.content.value == "" || document.post.content.value == null) {
		alert("내용을 입력하세요.");
		document.post.content.focus();
		return;
	} 
	else if(document.post.password.value == "" || document.post.password.value == null) {
		alert("비밀번호를 입력하세요.");
		document.post.password.focus();
		return;
	} 
	else {
		document.post.submit();
	}
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
	<table class="contatiner">
 	<tr>
  		<td bgcolor=#dcdcdc height=25 align=center>답변달기</td>
 	</tr>
	</table>
	<br>
	
	<table class="table-bordered">
	<form name="post" method="post" action="boardReply.do">
	<input type="hidden" name="temp_seq" value="${dto.seq }">
		<tr>
		<td>
		<table border=0 width=100% align=center>
	    <tr>
			<td align="center">작성자</td>
			<td ><input type=text name=name size=10 maxlength=8></td>
    	</tr>
    	<tr>
	 		<td align="center">E-Mail</td>
	 		<td><input type=text name=email size=30 maxlength=30></td>
    	</tr>
    	<tr>
			<td align="center">홈페이지</td>
			<td><input type=text name=homepage size=40 maxlength=30></td>
	    </tr>
		<tr>
			<td width=10% align="center">제 목</td>
			<td width=50%><input type=text name=title size=50 maxlength=30 value="RE : ${dto.title }"></td>
		</tr>
		<tr>
			<td width=10% align="center">내 용</td>
			<td><textarea name=content rows=10 cols=70> ${dto.content} 

----------------------------------------------

|댓글|

		</textarea></td>
		</tr>
		<tr>
			<td width=10% align="center">비밀번호</td> 
			<td width=70% ><input type=password name="password" size=15 maxlength=15></td>
		    </tr>
		<tr>
			<td colspan=2><hr size=2></td>
		</tr>
		<tr>
			<td colspan="3" align="center">
				<input type="button" onclick="check()" value="답변 등록" class="btn" >&nbsp;&nbsp;
				<input type="button" value="뒤로가기" class="btn" onclick="javascript:history.back()">&nbsp;&nbsp;
     		</td>
		</tr> 
		</table>
		</td>
		</tr>	
	</form>
	</table>
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