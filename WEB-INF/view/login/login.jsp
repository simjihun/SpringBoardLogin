<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="kr">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="icon" type="image/png" href="images/favicon.ico">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
<meta name="viewport" content="width=device-width" />
<title>로그인</title>
<style type="text/css">

#checkMsg{
	color : red;
	font-size: 12px;
}
#checkPwd{
	color : red;
	font-size: 12px;
}
</style>

<!-- Fonts -->
<link href='http://fonts.googleapis.com/css?family=Lato:300,400,700,900' rel='stylesheet' type='text/css'>
    
<link rel="stylesheet" type="text/css" href="css/JihunLogin.css" />
<link rel="stylesheet" type="text/css" href="css/login/loginStyle.css" />
<link rel="stylesheet" type="text/css" href="css/login/animate-custom.css" />
	
<script type="text/javascript" src="js/login/jquery.min.js"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.2.6/jquery.min.js"></script>
<script type="text/javascript" src="js/loginSave.js"></script>
<script type="text/javascript" src="js/login/httpRequest.js"></script><!-- Ajax 아이디 중복확인 -->


<script type="text/javascript">
var flag = "1";


$(document).ready(function() {
	$(".username").focus(function() {
		$(".user-icon").css("left","-48px");
	});
	$(".username").blur(function() {
		$(".user-icon").css("left","0px");
	});
	
	$(".password").focus(function() {
		$(".pass-icon").css("left","-48px");
	});
	$(".password").blur(function() {
		$(".pass-icon").css("left","0px");
	});
});


var checkFirst = false;
var lastKeyword = '';
var loopSendKeyword = false;


function regGo(){
	var id = $("#user_id2").val();
	var pass = $("#password2").val();
	var passCheck = $("#pwd_check").val();
	if(id == ""){
		alert("아이디가 비어있습니다.");
		return;
	}else if(flag == "1"){
		alert("아이디가 이미 존재합니다.")
		return;
	}else if(pass == ""){
		alert("패스워드가 비어있습니다.");
		return;
	}else if(passCheck == ""){
		alert("패스워드 확인이 비어있습니다.");
		return;
	}else if(pass != passCheck){
		alert("패스워드 확인을 제대로 하세요");
		return;
	}	else{
		document.sign.submit();
	}
	
}

function checkId() {
 if (checkFirst == false) {
  //0.5초 후에 sendKeyword()함수 실행
  setTimeout("sendId();", 500);
  loopSendKeyword = true;
 }
 checkFirst = true;
}

function checkPwd(){
 if($("#password2").val()!=$("#pwd_check").val()){
  document.getElementById('checkPwd').style.color = "red";
  document.getElementById('checkPwd').innerHTML = "비밀번호가 다릅니다."; 
 }else{
  document.getElementById('checkPwd').style.color = "blue";
  document.getElementById('checkPwd').innerHTML = "비밀번호가 일치합니다."; 
  
 }
 
}


function sendId() {
 if (loopSendKeyword == false) return;
 
 var keyword = document.sign.user_id2.value;
 if (keyword == '') {
  lastKeyword = '';
  document.getElementById('checkMsg').style.color = "black";
  document.getElementById('checkMsg').innerHTML = "아이디를 입력하세요.";
 } else if (keyword != lastKeyword) {
  lastKeyword = keyword;
  
  if (keyword != '') {
   var params = "user_id="+encodeURIComponent(keyword) +"&signup=signup";
   
   $.ajax({      
			   type:'POST',  
			   url:"idCheck.do",   
			   dataType : 'json',
			   data:{
				   user_id:encodeURIComponent(keyword),
				   signup:"signup"
	   },      
	   success:function(data){
		   if(data == "1"){
			   $("#checkMsg").html("등록된 아이디가 존재합니다.");
			   $("#checkMsg").css("color","red");	
		   }else{
			   $("#checkMsg").html("아이디 사용이 가능합니다.");
			   $("#checkMsg").css("color","blue");
		   }
		   flag = data;
	   },   
	   beforeSend:function(){
	   },  
	   error:function(e){  
	     alert(e.responseText);  
	   }  
	 });   

  } else {
  }
 }
 setTimeout("sendId();", 500);
}

</script>
</head>
<body>
	<div class="container">
	<header>
	<br>
	<h1> Sim Ji Hun <span>Project</span></h1>            
	</header>
	
	<section>				
	<div id="container_demo" >
		<a class="hiddenanchor" id="toregister"></a>
		<a class="hiddenanchor" id="tologin"></a>
	<div id="wrapper">
	
                    
	<!-- 아이콘 -->
    <div class="user-icon"></div>
    <div class="pass-icon"></div>
    
    
	<div id="login" class="animate form">
	<form:form name="login-form" commandName="loginInfo" class="login-form" action="${pageContext.request.contextPath}/login.do" method="POST">
	<h1> Login Page</h1>                                 
	<p> 
		<label for="user_id" class="uname"  > Your ID </label> &nbsp;&nbsp;&nbsp;<form:errors path="user_id" cssStyle="color:red;" />
		<form:input path="user_id" class="input username" name="username"  placeholder="ID"  />
	</p>
                                
	<p> 
		<label for="password" class="youpasswd" > Your password </label> &nbsp;&nbsp;&nbsp;<form:errors path="password" cssStyle="color:red;" />
		<form:password path="password" class="input password"  name="password"   placeholder="Password" /> 
	</p>
                       
                                
	<p class="keeplogin"> 
		<input type="checkbox" name="idSave" id="idSaveCheck"/> 
		<label for="loginkeeping" id="chk_label" class="chk_txt"> ID 저장하기</label>
	</p>
	<p class="login button"> 
		<input type="submit" name="submit" value="접속" class="button" /> 
	</p>
	<p class="change_link">
		회원가입을 하시겠습니까?
		<a href="#toregister" class="to_register">회원가입</a>
	</p>
	</form:form>
	</div>


	<!-- 회원가입 -->
	<div id="register" class="animate form">
	<form name="sign"  action="signUp.do" method="POST"> 
	<input type="hidden" name="signup" value="signup"/>
	<h1> 회원 가입 </h1> 
	<p> 
		<label for="userIDsignup" class="userID">아이디</label><br>
 		<input type="text" name="user_id2" id="user_id2" placeholder="Your ID" onkeydown="checkId()" /><div id="checkMsg">아이디를 입력하세요</div>
				
	</p>

	<p> 
		<label for="passwordsignup" class="userpassword">비밀번호 </label><br>
		<input type="password" name="password2" id="password2" placeholder="Your Password"/>
	</p>
	
 	<p> 
		<label for="pwd_check" class="uesrCpassword">비밀번호 확인 </label><br>
		<input type="password" name="pwd_check" id="pwd_check" placeholder="Your Password Confirm" onkeyup="checkPwd()"/><div id="checkPwd">동일한 암호를 입력하세요</div>
		
	</p>	
	
	<p> 
		<label for="userName" class="username"> 이름 </label><br>
		<input type="text" name="name"  placeholder="Your Name" />
	</p>	
		
	<p> 
		<label for="emailsignup" class="usermail" > 이메일 </label><br>
		<input type="text" name="email" placeholder="test@email.com"/> 
	</p>
	
	<p> 
		<label for="userTelephone" class="userTelephnoe"> 핸드폰 번호 </label><br>
		<input type="text" name="telephone" placeholder="010-1234-5678"/> 
	</p>
	
	<p> 
		<label for="userName" class="username"> 주소 </label><br>
		<input type="text"  name="address"  placeholder=" ex) 서울시 금천구 시흥동 럭키아파트" />
	</p>
	
	<p> 
		<label for="userName" class="username"> 메모 (선택사항) </label><br>
		<input type="text"  name="address"  />
	</p>		
	
	
	<p class="signin button"> 
		<input type="button" id="reg" onclick="regGo()" value="가입하기"/>
	</p>
	<p class="change_link">  
		이미 가입되어있으면??
		<a href="login.do" class="to_register"> 로그인 창으로 </a>
	</p>
	 </form>
	</div>
						
	</div>
	</div>  
	</section>
	</div>
</body>

</html>
