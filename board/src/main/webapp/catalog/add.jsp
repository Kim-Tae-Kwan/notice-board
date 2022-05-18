<%@page import="com.kim.board.CatalogService"%>
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
	String catalogName = request.getParameter("name");
	CatalogService catalogService = new CatalogService();
	catalogService.insert(catalogName);
}
response.sendRedirect("../");
%>
</body>
</html>