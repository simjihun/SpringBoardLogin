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

<title>글 삭제하기</title>
<style>
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);

body {
	font-family: 'Nanum Gothic', sans-serif;
}
</style>
<script type="text/javascript">
function check(storPass) {
	if (document.form.password.value == "") {
		alert("패스워드를 입력하세요.");
		form.pass.focus();
		return false;
	}
	if(document.form.password.value != storPass){
		alert("비밀번호가 틀리셨습니다.");
			form.pass.focus();
		return false;
	}
	document.form.submit();
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
				<center>
					<br>
					<br>
					<table width=50% cellspacing=0 cellpadding=3>
						<tr>
							<td bgcolor=#dcdcdc height=21 align=center>
							작성자의 비밀번호를 입력해 주세요.</td>
						</tr>
					</table>

					<table width=70% cellspacing=0 cellpadding=2>
						<form name=form method=post action="boardDelete.do">
							<input type="hidden" name="storPass" value="${storPass}" /> 
							<input type="hidden" name="seq" value="${seq }" />
							<tr>
								<td align=center>
									<table align=center border=0 width=91%>
										<tr>
											<td align=center>
											<input type=password name="password" 	size=17 maxlength=15></td>
										</tr>
										<tr>
											<td><hr size=1 color=#eeeeee></td>
										</tr>
										<tr>
											<td align=center>
											<input type=button value="삭제완료" onClick="check('${storPass}')">
											<input type=reset value="다시쓰기">
											<input type=button value="뒤로" 	onClick="history.go(-1)"></td>
										</tr>
									</table>
								</td>
							</tr>
						</form>
					</table>
				</center>
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
