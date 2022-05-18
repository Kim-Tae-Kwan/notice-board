<%@page import="java.util.ArrayList"%>
<%@page import="com.kim.board.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="login" class="com.kim.board.Login" scope="session"></jsp:useBean>
<%
	String path = request.getParameter("root");
	path = path != null ? path : ".";
	
	CatalogService catalogService = new CatalogService();
	ArrayList<CatalogDto> list =catalogService.getAll();
%>
<header>
	<div class="logo">
		<a href="<%=path %>/">
			<img alt="" src="<%=path %>/image/main_logo.png">
		</a>
	</div>
	
	<div class="sign">
		<%
		if(login.getResult()){	
		%>
			
			<span class="user"><%=login.getUserName()%>님 환영합니다.</span>
			<a class="logout" href="<%=path %>/sign/logout.jsp">로그아웃</a>
			
		<%}else{ %>
			<a class="login" href="<%=path %>/sign/loginForm.jsp">Login</a>
		<%} %>
	</div>
</header>
<nav>
	<ul>
		<li><a class="active" href="<%=path %>/">홈</a></li>
		<%
		for(CatalogDto catalog : list){
		%>
		<li><a href="<%=path %>/?catalog=<%=catalog.getId()%>"><%=catalog.getName() %></a></li>
		<%} %>
		<%
		if(login.getResult()){
		%>
		<li><a class="add" href="<%=path %>/">+</a></li>
		<%} %>
	</ul>
</nav>