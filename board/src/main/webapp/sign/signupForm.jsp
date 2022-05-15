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
<body>
	<jsp:include page="../template/header.jsp">
		<jsp:param value=".." name="root" />
	</jsp:include>
	<div class="sectionAndAside">
		<section>
			<span class="title">Sign in to My-Site</span>
			<div class="form">
				<form action="signup.jsp" method="post">
					<label for="email">Email</label>
					<input id="email" type="email" name="email"/>
					<label for="password">Password</label>
					<input id="password" type="password" name="password"/>
					<label for="name">Name</label>
					<input id="name" type="text" name="name"/>
					<button>Sign up</button>
				</form>
			</div>
			<div class="signup">
				<span>
					Login to my-site? 
					<a href="signup.jsp">Login.</a>
				</span>
			</div>
		</section>
	</div>
	<jsp:include page="../template/footer.jsp"></jsp:include>
</body>
</html>