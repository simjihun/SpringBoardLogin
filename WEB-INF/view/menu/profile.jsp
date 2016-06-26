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


    <link href="css/main.css" rel="stylesheet" />
    <link href="css/main/animation.css" rel="stylesheet"/>
    <link href="css/main/light-dashboard.css" rel="stylesheet"/>
    <!--     Fonts and icons     -->
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
    <link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300' rel='stylesheet' type='text/css'>
    <link href="css/icon.css" rel="stylesheet" />

<title>프로필 수정</title>

</head>
<body>

		<div class="wrapper">
		<!-- 사이드메뉴 시작 -->
		<t:insertAttribute name="side"/>	

		<!--  상단메뉴 시작 -->
		<t:insertAttribute name="top"/>				

		<!--  본문내용 -->
		    <div class="content">
            <div class="container-fluid">
            
                <div class="row">
                    <div class="col-md-8">
                        <div class="card">
                            <div class="header">
                                <h4 class="title">프로필 수정</h4>
                            </div>                            
                            <div class="content">
                            
                                <form action="profile.do" method="POST">                                
								<div class="row">
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label>아이디 (disabled)</label>
                                                <input name="user_id" type="text" class="form-control" readonly  value="${userInfo.user_id}">
                                            </div>
                                        </div>
                                        
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label>한글 이름 (disabled)</label>
                                                <input name="name" type="text" class="form-control" readonly value="${userInfo.name}">
                                            </div>
                                        </div>
                                        
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label>영문 이름 (disabled)</label>
                                                <input name="ename" type="text" class="form-control" readonly value="${userInfo.ename}">
                                            </div>
                                        </div>
								</div>

								<div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>E-mail</label>
                                                <input name="email" type="text" class="form-control" value="${userInfo.email}">
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>핸드폰 번호</label>
                                                <input name="telephone" type="text" class="form-control" value="${userInfo.telephone}">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label>Address</label>
                                                <input name="address" type="text" class="form-control" value="${userInfo.address}">
                                            </div>
                                        </div>
									</div>

                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label>메모</label>
                                                <textarea name="memo" rows="5" class="form-control" >${userInfo.memo}</textarea>
                                            </div>
                                        </div>
                                    </div>

                                    <button type="submit" class="btn btn-info btn-fill pull-right">정보수정</button>
                                    <div class="clearfix"></div>
                                </form>
                            </div>
                        </div>
                    </div>
                    
                    
                    <div class="col-md-4">
                        <div class="card card-user">
                            <div class="image">
                                <img src="https://ununsplash.imgix.net/photo-1431578500526-4d9613015464?fit=crop&fm=jpg&h=300&q=75&w=400" alt="..."/>
                            </div>
                            <div class="content">
                                <div class="author">
                                     <a href="#">
                                    <img class="avatar border-gray" src="images/default-avatar.png" alt="..."/>

                                      <h4 class="title"><c:out value="${userInfo.name}" /><br />
                                         <small><c:out value="${userInfo.ename}" /></small>
                                      </h4>
                                    </a>
                                </div>
                                <p class="description text-center"> <br>
                                                     『 마지막 로그아웃 』 <br>  <c:out value="${userInfo.lastlogout}" /> <br>                                                      
                                </p>
                            </div>                            
                            <hr>
                            <div class="text-center">
                                <button href="#" class="btn btn-simple"><i class=""></i></button>
                                <button href="#" class="btn btn-simple"><i class=""></i></button>
                                <button href="#" class="btn btn-simple"><i class=""></i></button>
                            </div>
                        </div>
                    </div>
                </div>
                
                
            </div>
        </div>
        
        <!--  footer메뉴 -->
		<t:insertAttribute name="footer"/>		
		</div>	

</body>

    <script src="js/main/jquery-1.10.2.js" type="text/javascript"></script>
	<script src="js/main/bootstrap.min.js" type="text/javascript"></script>
	<script src="js/main/bootstrap-checkbox-radio-switch.js"></script>
    <script src="js/main/bootstrap-notify.js"></script>
	<script src="js/main/light-bootstrap-dashboard.js"></script>

</html>

