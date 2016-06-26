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
			<h2>관리자페이지입니다. </h2>
			
			<br>
			<br>
			관리자 페이지에서는 회원의 권한을 수정할 수 있습니다.

        	
        	
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

