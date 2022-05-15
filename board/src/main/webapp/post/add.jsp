<%@page import="com.kim.board.PostDto"%>
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
request.setCharacterEncoding("UTF-8");
if(request.getMethod().equals("POST")){
	int userId = Integer.parseInt(request.getParameter("user-id"));
	int catalogId = Integer.parseInt(request.getParameter("catalog-id"));
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	System.out.println(content);
	
	PostDto post = new PostDto();
	post.setUserId(userId);
	post.setCatalogId(catalogId);
	post.setTitle(title);
	post.setContent(content);
	
	PostService postService = new PostService();
	postService.insert(post);
}
response.sendRedirect("../");
%>
</body>
</html>