<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" 	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script type="text/javascript">
	function logout(){
		document.out.submit();
	}	
</script>






		<div class="main-panel">
        <nav class="navbar navbar-default navbar-fixed">
        <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="">Admin Page</a>
                </div>
                <div class="collapse navbar-collapse">
                    <ul class="nav navbar-nav navbar-left">
                        <li>
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <i class="fa fa-dashboard"></i>
                            </a>
                        </li>
                        <li class="dropdown">
<!-- 알림받아오기  <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                    <i class="fa fa-globe"></i>
                                    <b class="caret"></b>
                                    <span class="notification">5</span>
                              </a> 
                              <ul class="dropdown-menu">
                                <li><a href="#">Notification 1</a></li>
                                <li><a href="#">Notification 2</a></li>
                                <li><a href="#">Notification 3</a></li>
                                <li><a href="#">Notification 4</a></li>
                                <li><a href="#">Another notification</a></li>
                              </ul>
                        </li>-->
                        <li>
                           <a href="main.do">
                                <i class="fa fa-search"></i>
                            </a>
                        </li>
                    </ul>

					<form action="logout.do" method="POST" name="out"> 
                    <ul class="nav navbar-nav navbar-right">
                        <li class="dropdown">
                              <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                              관리자 :『 <c:out value="${sessionMap.name}" /> 』 님 환영합니다
                                    <b class="caret"></b>
                              </a>          
                                                 
                              <ul class="dropdown-menu">
                                <li><a href="admin.do">아무거나</a></li>
                                <li class="divider"></li>
                                <li><a href="admin.do">어드민~</a></li>
                              </ul>
                        </li>                                                
                        <li>                        
                        <a href="javascript:logout()"> 로그아웃 </a>                         
                        </li>                       
                    </ul> 
                    </form>                   
                </div>
            </div>
        </nav>    
                

