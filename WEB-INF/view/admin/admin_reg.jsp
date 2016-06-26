<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="kr">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="icon" type="image/png" href="images/favicon.ico">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta
	content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0'
	name='viewport' />
<meta name="viewport" content="width=device-width" />

<!-- core CSS     -->
<link href="css/main/bootstrap.min.css" rel="stylesheet" />

<!-- Animation  -->
<link href="css/main/animation.css" rel="stylesheet" />
<!--  Table  -->
<link href="css/main/light-dashboard.css" rel="stylesheet" />
<link href="css/board.css" rel="stylesheet" />

<!--     Fonts and icons     -->
<link
	href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css"
	rel="stylesheet">
<link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300'
	rel='stylesheet' type='text/css'>
<link href="css/icon.css" rel="stylesheet" />
<style type="text/css">

</style>
<title>지훈 페이지</title>


</head>
<body>

	<div class="wrapper">
		<!-- 사이드 메뉴-->
		<t:insertAttribute name="side" />
		<!-- 상단 메뉴 -->
		<t:insertAttribute name="top" />
		<!-- 본문 내용 -->
		<div class="content">
			<div class="container-fluid">
				<div class="row">
					<div class="col-md-12">
						<div class="card">
							<div class="header">
								<center>
									<h4 class="title">회원 권한 관리</h4>
								</center>
								<p class="category" align="right">권한 0 or 1 은 관리자 / 권한 2는 일반
									회원</p>
							</div>
							<div class="content table-responsive table-full-width">
								<table class="table table-hover table-striped">
									<thead>
										<th>번호</th>
										<th>아이디</th>
										<th>이름</th>
										<th>이메일</th>
										<th>전화번호</th>
										<th>권한</th>
										<th>수정하기</th>
									</thead>
									<tbody>
										<c:choose>
											<c:when test="${empty ulist }">
												<tr>
													<td colspan=7>등록된 회원이 없습니다.</td>
												</tr>
											</c:when>
											<c:otherwise>
												<c:forEach begin="0" end="${ulist.size()-1}" var="i">
													<form action="admin_reg.do" method="post">
													<input type="hidden" name="iseq" value="${ulist[i].iseq}"/>
														<tr>
															<td>${i}</td>
															<td>${ulist[i].user_id }</td>
															<td><input type="text" name="name" value="${ulist[i].name}"/></td>
															<td>${ulist[i].email }</td>
															<td>${ulist[i].telephone }</td>
															<td>
												<select name="permission" size="1" >
													<option value="0" <c:if test="${'0'==ulist[i].permission }"> selected</c:if>>0</option>
													<option value="1" <c:if test="${'1'==ulist[i].permission }"> selected</c:if>>1</option>
													<option value="2" <c:if test="${'2'==ulist[i].permission }"> selected</c:if>>2</option>
												</select>															
															</td>
															<td><input type="submit" value="변경" class="modify"/></td>	
														</tr>
													</form>
												</c:forEach>
											</c:otherwise>
										</c:choose>
									</tbody>
								</table>
							</div>

						</div>
						<!-- card -->
					</div>
					<!-- colmd -->
				</div>
				<!-- row -->
			</div>
			<!-- fluid -->
		</div>
		<!-- content -->
	</div>
	<!-- 래퍼 -->
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

