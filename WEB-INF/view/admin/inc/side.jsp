<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" 	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script type="text/javascript">
	function admin(permission){
		if(!(permission == 0 || permission == 1)){
			alert('관리자만 접근 가능합니다^^');
		}
		document.adm.submit();
	}
	
</script>

<form action="admin.do" method="POST" name="adm" >
	<input type="hidden"  name="user_id" value="${sessionMap.user_id}"/>
</form> 	

		<!-- 사이드메뉴 -->
<div class="sidebar" data-color=""	data-image="images/sidebar-2.jpg">
	<div class="sidebar-wrapper">
		<div class="logo">
			<a href="admin.do" class="simple-text"> 관리자 </a>
		</div>
		<ul class="nav">
			<li>
			<li><!--  <li class="active"> -->
			 <a href="admin.do"> <i class="pe-7s-graph"></i><p>ADMIN PAGE</p></a>
			</li>
			<li><a href="admin_reg.do"> <i class="pe-7s-user"></i><p>회원 권한 관리</p></a>
			</li>
			<li class="active-pro">
			<a href="main.do"> 
				<i	class="pe-7s-rocket"></i>
					<p>일반 페이지로</p>
			</a></li>
		</ul>
	</div>
</div>


