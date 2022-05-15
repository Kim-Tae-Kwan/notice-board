<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/board.css">
<link rel="stylesheet" href="../css/signin.css">
<script type="text/javascript" src="../js/jquery-1.12.4.min.js"></script>
</head>
<%
String fail = request.getParameter("fail");
if(fail == null) fail = "";

%>
<body>
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
					<input id="email" type="email" name="email"/>
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
</body>
</html>