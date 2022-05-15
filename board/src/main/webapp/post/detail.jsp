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
<link rel="stylesheet" href="../css/detail.css">
<script type="text/javascript" src="../js/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
$(function(){
	$('#popup-delete').hide();
	$('#popup-update').hide();
	
	// 글 수정 팝업 열기
	$('section .actions .update').click(function () {
		$('#popup-update').show();
	})
	
	// 글 삭제 팝업 열기
	$('section .actions .delete').click(function () {
		$('#popup-delete').show();
	})
	
	// 팝업창 제거.
	$('#popup-delete button.cancel').click(function(e){
		$('#popup-delete').hide();
	});
	$('#popup-update button.cancel').click(function(e){
		$('#popup-update').hide();
	});
	
	// 팝업창 이벤트 전파 방지.
	$('#popup-delete>div').click(function(e){
		e.stopPropagation();
	});
	$('#popup-update>div').click(function(e){
		e.stopPropagation();
	});
	
	// 글 삭제
	$('#popup-delete .actions .delete').click(function(e){
		var value = $('#popup-delete .confirm').val();
		
		if(value === $('#popup-delete .title').text()) $('#popup-delete form').submit();
		else{
			$('#popup-delete .confirm').focus().select()
				.next( ".fail" ).css( "display", "inline" );
			return false;
		}
	});
});
	
</script>
</head>
<jsp:useBean id="login" class="com.kim.board.Login" scope="session"></jsp:useBean>

<%!
public static String toHTML(String s) {
    StringBuilder builder = new StringBuilder();
    boolean previousWasASpace = false;
    for( char c : s.toCharArray() ) {
        if( c == ' ' ) {
            if( previousWasASpace ) {
                builder.append("&nbsp;");
                previousWasASpace = false;
                continue;
            }
            previousWasASpace = true;
        } else {
            previousWasASpace = false;
        }
        switch(c) {
            case '<': builder.append("&lt;"); break;
            case '>': builder.append("&gt;"); break;
            case '&': builder.append("&amp;"); break;
            case '"': builder.append("&quot;"); break;
            case '\n': builder.append("<br>"); break;
            // We need Tab support here, because we print StackTraces as HTML
            case '\t': builder.append("&nbsp; &nbsp; &nbsp;"); break;  
            default:
                if( c < 128 ) {
                    builder.append(c);
                } else {
                    builder.append("&#").append((int)c).append(";");
                }    
        }
    }
    return builder.toString();
}
%>
<%
	int postId = 0;
try {
	postId = Integer.parseInt(request.getParameter("id"));
} catch (NumberFormatException e) {
	response.sendRedirect("../");
	return;
}

PostService postService = new PostService();
UserService userService = new UserService();
CatalogService catalogService = new CatalogService();

PostDto post = postService.getById(postId);
UserDto user = userService.getById(post.getUserId());
CatalogDto catalog = catalogService.getById(post.getCatalogId());
%>
<body>
	<jsp:include page="../template/header.jsp">
		<jsp:param value=".." name="root" />
	</jsp:include>
	<div class="detail-head">
		<span class="catalog"><%=catalog.getName()%></span>
		<spna class="title"><%=post.getTitle()%></spna>
		<span class="meta">by <%=user.getName()%> - <%=post.getCreateDate()%></span>
	</div>
	<div class="sectionAndAside">
		<section>
			<div class="actions">
			<%
			if(login.getUserId() == user.getId()){
			%>
				<button class="update">수정</button>
				<button class="delete">삭제</button>
			<%} %>
			</div>
			<%=toHTML(post.getContent())%>
		</section>
		<jsp:include page="../template/aside.jsp">
			<jsp:param value=".." name="root" />
		</jsp:include>
	</div>
	<jsp:include page="../template/footer.jsp"></jsp:include>
	<div id="popup-update">
		<div>
			<h2>수정 페이지</h2>
			<form action="update.jsp" method="post">
				<div class="control">
					<input type="hidden" name="id" value="<%=post.getId()%>">
					<label for="title">제목</label>
					<input type="text" id="title" name="title" value="<%=post.getTitle() %>">
					<label for="content">내용</label>
					<textarea id="content" name="content"><%=post.getContent() %></textarea>
				</div>
				<div class="actions">
					<button class="update">수정</button>
					<button class="cancel" type="button">취소</button>
				</div>
			</form>
		</div>
	</div>
	<div id="popup-delete">
		<div>
			<h2>삭제하시겠습니까?</h2>
			<span>삭제할 <span class="title"><%=post.getTitle() %></span> 을/를 입력하시오.</span>
			<form action="delete.jsp" method="post">
				<input type="hidden" name="id" value="<%=post.getId()%>">
				<input class="confirm" type="text" placeholder="Please write a title">
				<span class="fail">제목이 일치하지 않습니다.</span></p>
				<div class="actions">
					<button class="delete">삭제</button>
					<button class="cancel" type="button">취소</button>
				</div>
			</form>
		</div>
	</div>
</body>
</html>