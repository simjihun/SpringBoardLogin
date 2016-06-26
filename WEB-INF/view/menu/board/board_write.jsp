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

<title>글 쓰기</title>
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
	} else if (document.post.email.value == "" || document.post.email.value == null) {
		alert("이메일을 입력하세요.");
		document.post.email.focus();
		return;
	} else if (document.post.title.value == "" || document.post.title.value == null) {
		alert("제목을 입력하세요.");
		document.post.title.focus();
		return;
	} else if (document.post.content.value == "" || document.post.content.value == null) {
		alert("내용을 입력하세요.");
		document.post.content.focus();
		return;
	} else if (document.post.password.value == "" || document.post.password.value == null) {
		alert("비밀번호를 입력하세요.");
		document.post.password.focus();
		return;
	} else {
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
				
	<table summary="글쓰기 전체 테이블">
		<form name="post" method="post" action="boardWrite.do">
			<input type="hidden" name="iseq" value="${userInfo.iseq}"/>
			<colgroup>
				<col width="20%">
				<col width="80%">
			</colgroup>


			<table summary="테이블 구성">
				<caption>게시판 글쓰기</caption>
				<tr>
					<td>작성자</td>
					<td><input name="name" type="text" readonly value="${userInfo.name}" style="background-color:grey"></td>
				</tr>
				<tr>
					<td>E-Mail</td>
					<td><input type=text name=email size=30></td>
				</tr>
				<tr>
					<td>홈페이지</td>
					<td><input type=text name=homepage size=30></td>
				</tr>
				<tr>
					<td>제 목</td>
					<td><input type=text name=title></td>
				</tr>
				<tr>
					<td>내 용</td>
					<td><textarea name=content rows="10" cols="100"></textarea></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type=password name=password size=15 maxlength=15></td>
				</tr>
				<tr>
					<td colspan=2><hr size=1></td>
				</tr>
				<tr>
					<td colspan="3"><div align="center">
							<input type="button" value="등록" onclick="check()" >&nbsp;&nbsp;
							<input type="button" value="뒤로" onclick="history.back()">
						</div>&nbsp;&nbsp;</td>
				</tr>
			</table>
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