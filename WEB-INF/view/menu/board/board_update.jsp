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

<title>글 수정하기</title>
<style>
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);

body {
	font-family: 'Nanum Gothic', sans-serif;
}
</style>
<script type="text/javascript">
function check() {
	if (document.form.name.value == "" || document.form.name.value == null) {
		alert("이름을 입력하세요.");
		document.form.name.focus();
		return;
	}
	else if(document.form.email.value == "" || document.form.email.value == null) {
		alert("이메일을 입력하세요.");
		document.form.email.focus();
		return;
	} 
	else if(document.form.title.value == "" || document.form.title.value == null) {
		alert("제목을 입력하세요.");
		document.form.title.focus();
		return;
	}
	else if(document.form.content.value == "" || document.form.content.value == null) {
		alert("내용을 입력하세요.");
		document.form.content.focus();
		return;
	} else if(document.form.pass.value == "" || document.form.pass.value==null){
		alert("비밀번호를 입력하세요");
		document.form.pass.focus();
		return;
	} else if(document.form.pass.value != document.form.password.value){
		alert("비밀번호가 틀리셨습니다. 재입력해주세요");
		document.form.pass.focus();
		return;
	}else{
		document.form.submit();
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
	<table summary="글수정 전체 테이블">
		<form name="form" method="post" action="boardUpdate.do" >
		<input type="hidden" name="seq" value="${dto.seq }"/>
		<input type="hidden" name="password" value="${dto.password }"/>		
   		
   		<colgroup>
   			<col width="20%">
   			<col width="80%">
   		</colgroup>
   	

		<table summary="테이블 구성" >
		<caption>글 수정하기 [${dto.seq }번] 게시물</caption>	
    		<tr>
				<td>작성자</td>
				<td><input type=text name=name size=10 maxlength=8 value="${dto.name }"></td>
			</tr>
			<tr>
	 			<td>E-Mail</td>
	 			<td><input type=text name=email size=30 value="${dto.email }"></td>
    		</tr>
    		<tr>
     			<td>제 목</td>
     			<td><input type=text name=title value="${dto.title }"></td>
    		</tr>
    		<tr>
     			<td>내 용</td>
     			<td><textarea name=content rows ="10" cols="100">${dto.content }</textarea></td>
    		</tr>
    		<tr>
     			<td>비밀번호</td> 
     			<td><input type=password name=pass size=15 maxlength=15>수정시에는 비밀번호가 필요합니다.</td>
    		</tr>
    		<tr>
     			<td colspan=2><hr size=1></td>
    		</tr>
    		<tr>
     			<td colspan="3"><div align="center">
     			<input type="button" value="수정 완료" onclick="check()">&nbsp;&nbsp;
				<input type=reset value="다시 수정"> 
         		<input type="button" value="뒤로" onclick="history.back()"></div>
     			</td>
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