<%@page import="com.kim.board.PostService"%>
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
if(request.getMethod().equals("POST")){
	int postId = Integer.parseInt(request.getParameter("id"));
	PostService postService = new PostService();
	postService.deleteById(postId);
}
response.sendRedirect("../");
%>
</body>
</html>