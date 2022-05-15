{
<%@page import="com.kim.board.*"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
public String escape(String raw) {
    String escaped = raw;
    escaped = escaped.replace("\\", "\\\\");
    escaped = escaped.replace("\"", "\\\"");
    escaped = escaped.replace("\b", "\\b");
    escaped = escaped.replace("\f", "\\f");
    escaped = escaped.replace("\n", "\\n");
    escaped = escaped.replace("\r", "\\r");
    escaped = escaped.replace("\t", "\\t");
    //escaped = escaped.replace("", "\\t");
    return escaped;
}
%>
    "posts" : [
        	
        	<%
	        	int pageNum = Integer.parseInt(request.getParameter("page"));
	        	int catalogId;
	         	try{
	         		catalogId = Integer.parseInt(request.getParameter("catalog"));
	         	}catch (NumberFormatException e){
	         		catalogId = 0;
	         	}
	         	
	         	PostService postService = new PostService();
	        	ArrayList<PostDto> list;
	        	if(catalogId == 0) list = postService.getByPage(pageNum);
	        	else list = postService.getAllBycatalogIdAndPage(catalogId, pageNum);
	         	
	        	Boolean first = true;
	        	for(PostDto post : list){
	        		if(first) first = false;
	        		else out.print(",");
        	%>
        	{
	        	"id" : <%=post.getId()%>, 
	        	"user_id" : <%=post.getUserId()%>,
	        	"title":"<%=escape(post.getTitle())%>",
	        	"create_date":"<%=post.getCreateDate()%>",
	        	"delete_date":"<%=post.getDeleteDate()%>",
	        	"content":"<%=escape(post.getContent())%>",
	        	"catalog_id":<%=post.getCatalogId()%>
	        }
        	<%} %>	
    ]
}