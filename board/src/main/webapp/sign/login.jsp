<%@page import="com.kim.board.UserService"%>
<%@page import="com.kim.board.UserDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="login" class="com.kim.board.Login" scope="session"></jsp:useBean>
<%
request.setCharacterEncoding("utf-8");
if(request.getMethod().equals("POST")){
	UserDto user = new UserDto();
	UserService userService = new UserService();
	
	user.setEmail(request.getParameter("email").trim());
	user.setPassword(request.getParameter("password").trim().replace("#", ""));
	
	user = userService.login(user);
	
	if(user.getName() != null){
		login.setUserId(user.getId());
		login.setUserName(user.getName());
		login.setResult(true);
		response.sendRedirect("../");
	}else response.sendRedirect("./loginForm.jsp?fail=true");
}else response.sendRedirect("./loginForm.jsp");
%>
</body>
</html>