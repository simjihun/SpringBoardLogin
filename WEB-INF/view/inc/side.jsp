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
<div class="sidebar" data-color="purple"
	data-image="images/sidebar-4.jpg">
	<div class="sidebar-wrapper">
		<div class="logo">
			<a href="main.do" class="simple-text">지훈 포트폴리오 </a>
		</div>
		<ul class="nav">
			<li>
			<li><!--  <li class="active"> -->
			 <a href="main.do"> <i class="pe-7s-graph"></i><p>MAIN PAGE</p></a>
			</li>
			<li><a href="profile.do"> <i class="pe-7s-user"></i><p>User Profile</p></a>
			</li>
			<li><a href="boardList.do"> <i class="pe-7s-note2"></i><p>Board</p></a>
			</li>
			
			<li class="active-pro">
			<a href="javascript:admin('${sessionMap.permission}')"> 
				<i	class="pe-7s-rocket"></i>
					<p>GO ADMIN</p>
			</a></li>
		</ul>
	</div>
</div>


