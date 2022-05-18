<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<link rel="stylesheet" href="../css/board.css">
<link rel="stylesheet" href="../css/signin.css">
<script type="text/javascript" src="../js/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
$(function(){
	$('#email').focus();
	$('form button').click(function(){
		var email = $('form #email').val();
		var password = $('form #password').val();
		
		if(email === ""){
			$('form #email').focus();
			return false;
		}
		else if(password === "") {
			$('form #password').focus();
			return false;
		}
	});
});
</script>
</head>
<%
String fail = request.getParameter("fail");
if(fail == null) fail = "";

%>
<body>
	<div class="container">
		<jsp:include page="../template/header.jsp">
			<jsp:param value=".." name="root" />
		</jsp:include>
		<div class="sectionAndAside">
			<section>
				<span class="title">Sign in to My-Site</span>
				<%
				if(fail.equals("true")){
				%>
				<span class="fail">아이디/비밀번호가 맞지 않습니다.</span>
				<%} %>
				<div class="form">
					<form action="login.jsp" method="post">
						<label for="email">Email</label>
						<input id="email" type="email" name="email" placeholder="test@gmail.com"/>
						<label for="password">Password</label>
						<input id="password" type="password" name="password"/>
						<button>Sign in</button>
					</form>
				</div>
				<div class="signup">
					<span>
						New to my-site? 
						<a href="signupForm.jsp">Create an account.</a>
					</span>
				</div>
			</section>
		</div>
		<jsp:include page="../template/footer.jsp"></jsp:include>
	</div>
</body>
</html>