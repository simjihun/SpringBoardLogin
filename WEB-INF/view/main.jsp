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

<title>지훈 페이지</title>


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
			<h1>심지훈 프로젝트</h1>
        	<br>
        	<br>
        	이 프로젝트는 Java / Jsp / Spring Framwork / Mybatis / Maven을 이용한 라이브러리 / Ajax 아이디 중복 체크 / 게시판 글 미리보기를 구현하였습니다. <br>
        	초기 버전은 Spring Upgrade Board의 이름으로 게시판만 있었으나, 2개월간 지인 회사에서 구글 클라우드 플랫폼 교육을 받는 동안 여러 기능을 추가하였습니다.<br>
        	<br>
        	■ 추가한 기능 : 회원가입, 로그인, 쿠키저장으로 ID저장, 회원정보 수정, 관리자 권한 및 페이지 <br>
        	■ 업그레이드한 기술 : 기존 Model2 방식 중 View 과정을 Resolve View 에서 Tiles로 변경하여 Top / Side / Footer 영역을 공통으로 적용시켰습니다. <br>
        	<br>
        	■ 프로젝트 About<br>
        	1. 개발환경 ▶ Eclipse Mars.1 Release (4.5.1) / JDK 1.7 / Apache Tomcat 7.0 / MySql / BootStrap <br>
        	2. DB설정 ▶ 포트 = 3306 / 접속 ID 및 Password = root | 1234  / 데이터베이스이름 = test / 테이블 = user_tbl <br>
        	3. 컬럼 및 데이터 <br>
				<div class="card">
					<div class="content table-responsive table-full-width">
						<table class="table table-hover table-striped">
							<thead>
								<th>user_id</th>
								<th>password</th>
								<th>permission</th>
								<th>name</th>
								<th>ename</th>
								<th>email</th>
								<th>telephone</th>
								<th>address</th>
								<th>memo</th>
							</thead>
							<tbody>
								<tr>
									<td>test</td>
									<td>1234</td>
									<td>2</td>
									<td>심지훈</td>
									<td>SimJiHun</td>
									<td>test@test.com</td>
									<td>01094147008</td>
									<td>서울시 금천구 시흥동 1002-1 럭키아파트</td>
									<td>지훈입니다</td>
								</tr>
								<tr>
									<td>test1</td>
									<td>1234</td>
									<td>0</td>
									<td>관리자</td>
									<td>admin</td>
									<td>admin@admin.com</td>
									<td>01012345678</td>
									<td>인천시 계양구 계산동 팬더아파트</td>
									<td>메모 관리자</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			 4. 설명 <br>
        	(1) index.jsp를 실행하면 SessionIntercept.java에서 세션을 체크 한 뒤, 세션이 담겨 있지 않으면 로그인 화면으로 이동합니다.<br>
        	(2) 로그인 시도를 하면 LoginValidator.java에서 불일치 여부를 판단하고, LoginController에서 로그인 처리를 합니다.<br>
        	(3) 로그인이 실패하면 메시지를 띄우면서 로그인 화면을 유지하고, 로그인이 성공하면 메인 View로 이동합니다.<br>
        	(4) 로그인시 아이디 저장을 체크하여 로그인 성공시 쿠키를 7일동안 저장합니다. 다른 아이디로 로그인시에도 업데이트 됩니다.<br>
        	(5) 게시판은 검색기능, 페이징 처리, AJAX를 이용한 본문 미리보기가 가능합니다.<br>
        	(6) Go Admin 메뉴를 클릭하면 관리자 페이지로 갈 수 있습니다. (권한이 0이나 1이면 이동, 권한이 2면 접근 불가)<br>
        	(7) 관리자 페이지에선 회원의 정보를 일괄적으로 수정이 가능합니다.<br>        	
        	(8) 회원가입시 AJAX를 이용하여 아이디 중복체크가 가능합니다.
        	<br>

        	     	
        	
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

