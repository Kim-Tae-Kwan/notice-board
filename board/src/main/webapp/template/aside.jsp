<%@page import="com.kim.board.*"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String path = request.getParameter("root");
path = path != null ? path : ".";
CatalogService catalogService = new CatalogService();
ArrayList<CatalogDto> list =catalogService.getAll();
%>	

<aside>
	<div class="catalog">
		<span class="large">Catalog</span>
		<ul>
			<%
			for(CatalogDto catalog : list){
			%>
			<li><a class="middle" href="<%=path %>/?catalog=<%=catalog.getId()%>"><%=catalog.getName() %></a>
			<%} %>
			
		</ul>
	</div>
</aside>