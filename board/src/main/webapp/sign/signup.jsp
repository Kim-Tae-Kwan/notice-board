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
<%
request.setCharacterEncoding("utf-8");
if(request.getMethod().equals("POST")){
	UserDto user = new UserDto();
	UserService userService = new UserService();
	
	user.setEmail(request.getParameter("email").trim());
	user.setPassword(request.getParameter("password").trim());
	user.setName(request.getParameter("name").trim());
	
	userService.sign(user);
	
	response.sendRedirect("./loginForm.jsp");
}else response.sendRedirect("./signupForm.jsp");
%>
</body>
</html>