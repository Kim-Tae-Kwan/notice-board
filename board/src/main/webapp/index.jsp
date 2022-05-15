<%@page import="com.kim.board.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/board.css">
<script type="text/javascript" src="./js/jquery-1.12.4.min.js"></script>
<jsp:useBean id="login" class="com.kim.board.Login" scope="session"></jsp:useBean>
<script type="text/javascript">
var cnt = 2;
var max = 0;
$(function(){
	
	// 페이징 max value
	max = $('.max').val();
	
	// more 버튼 페이징
	$('.more').click(function(){
		if(cnt > max) return false;
		console.log(cnt, max);
		
		 $.getJSON('./post/post-json.jsp',
				'page=' + cnt + '&catalog=' + $('.catalog-num').val() ,
				function(data){
					$(data.posts).each(function(idx, ele){
						var item = $('.item').first().clone();
						item.find('.title').text(ele.title);
						item.find('.content').text(ele.content);
						item.find('.date').text(ele.date);
						item.find('a').attr('href','./post/detail.jsp?id=' + ele.id)
						
						$('.posts').append(item);
						
					});
			
				$('.post-header .num').text($('.post-header .num').text() * 1 + data.posts.length)
			
				cnt++;
				return false;
       		});
	});
	
	// active
	var catalog = $('.catalog-num').val();
	$('nav li').each(function(idx, ele){
			$(ele).find('a').removeClass('active');
	});
	
	$('nav li').eq(catalog).find('a').addClass('active');
	
});
</script>
</head>

<%
	int catalogId;
 	try{
 		catalogId = Integer.parseInt(request.getParameter("catalog"));
 	}catch (NumberFormatException e){
 		catalogId = 0;
 	}
	 
	PostService postService = new PostService();
	ArrayList<PostDto> list;
	if(catalogId == 0) list = postService.getByPage(1);
	else list = postService.getAllBycatalogIdAndPage(catalogId, 1);
	
%>
<body>
	<div class="container">
		<input class="catalog-num" type="hidden" value="<%=catalogId %>">
		<jsp:include page="template/header.jsp"></jsp:include>
		<div class="sectionAndAside">
			<section>
				<div class="posts">
					<div class="post-header">
						<span class="post-num"> 전체 글 <span class="num"><%=list.size()%></span></span>
						<%
						if(login.getResult()){
						%>
							<a class="write" href="post/write.jsp">글쓰기</a>
						<%}else{ %>
							<a class="write" href="sign/loginForm.jsp">글쓰기</a>
						<%} %>
					</div>
					<%
						for (PostDto post : list) {
					%>
					<div class="item">
						<a href="./post/detail.jsp?id=<%=post.getId()%>">
							<div class="title"><%=post.getTitle()%></div>
							<div class="content"><%=post.getContent()%></div>
							<div class="date"><%=post.getCreateDate()%></div>
						</a>
					</div>
					<%
						}
					%>
				</div>
				<button class="more">more</button>
				<input class="max" type="hidden" value="<%=postService.getPageCount() %>">
			</section>
			<jsp:include page="template/aside.jsp"></jsp:include>
		</div>
	</div>
	<div class="logos">
        <ul>
            <li><img src="./image/bizplay.png" alt=""></li>
            <li><img src="./image/bit.jpg" alt=""></li>
            <li><img src="./image/webcash.png" alt=""></li>
            <li><img src="./image/coocon.PNG" alt=""></li>
            <li><img src="./image/flow.png" alt=""></li>
            <li><img src="./image/bizplay.png" alt=""></li>
            <li><img src="./image/bit.jpg" alt=""></li>
            <li><img src="./image/webcash.png" alt=""></li>
            <li><img src="./image/coocon.PNG" alt=""></li>
            <li><img src="./image/flow.png" alt=""></li>
        </ul>
    </div>
    <div class="container">
		<jsp:include page="template/footer.jsp"></jsp:include>
	</div>
</body>
</html>