<%@page import="com.kim.board.*"%>
<%@page import="java.util.*"%>
<%@page import="com.kim.board.PostService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/board.css">
<link rel="stylesheet" href="../css/write.css">
<script type="text/javascript" src="../js/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
$(function(){
	
	//완료 버튼 이벤트
	$('form button.complete').click(function(){
		var title = $('form .title').val();
		var content = $('form .content').val();
		
		if(title === ""){
			$('form .title').focus();
			return false;
		}
		else if(content === "") {
			$('form .content').focus();
			return false;
		}
	});
	
	//취소 버튼 이벤트
	$('form button.cancel').click(function(){
		history.back();
	});
});
	
</script>
</head>
<jsp:useBean id="login" class="com.kim.board.Login" scope="session"></jsp:useBean>
<%
	CatalogService catalogService = new CatalogService();
	ArrayList<CatalogDto> list = catalogService.getAll();
%>
<body>
	<jsp:include page="../template/header.jsp">
		<jsp:param value=".." name="root" />
	</jsp:include>
	<div class="sectionAndAside">
		<section>
			<form action="add.jsp" method="post">
				<input type="hidden" name="user-id" value="<%=login.getUserId()%>">
				<select class="catalog" name="catalog-id">
					<%
					for(CatalogDto catalog : list){
					%>
						<option value="<%=catalog.getId()%>"><%=catalog.getName() %></option>
					<%} %>
				</select>
				<textarea class="title" name="title" placeholder="제목을 입력하세요"></textarea>
				<span></span>
				<textarea class="content" name="content" placeholder="내용을 입력하세요"></textarea>
				<div class="actions">
					<button class="complete">완료</button>
					<button class="cancel" type="button">취소</button>
				</div>
			</form>
		</section>
	</div>
	<jsp:include page="../template/footer.jsp"></jsp:include>
</body>
</html>