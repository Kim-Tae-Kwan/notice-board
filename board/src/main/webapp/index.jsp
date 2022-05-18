<%@page import="com.kim.board.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 게시판</title>
<link rel="stylesheet" href="css/board.css">
<script type="text/javascript" src="./js/jquery-1.12.4.min.js"></script>
<jsp:useBean id="login" class="com.kim.board.Login" scope="session"></jsp:useBean>
<script type="text/javascript">
	var cnt = 2;
	var max = 0;
	$(function() {

		// 페이징 max value
		max = $('.max').val();

		// more 버튼 페이징
		$('.more').click(function() {
			if (cnt > max)
				return false;
			console.log(cnt, max);

			$.getJSON('./post/post-json.jsp', 'page=' + cnt + '&catalog=' + $('.catalog-num').val(), function(data) {
				$(data.posts).each(
						function(idx, ele) {
							var item = $('.item').first().clone();
							item.find('.title').text(ele.title);
							item.find('.content').text(ele.content);
							item.find('.date').text(ele.date);
							item.find('a').attr('href','./post/detail.jsp?id=' + ele.id)
							$('.posts').append(item);
						});
				cnt++;
				return false;
			});
		});

		// active
		var catalog = $('.catalog-num').val();
		$('nav li').each(function(idx, ele) {
			$(ele).find('a').removeClass('active');
		});
		$('nav li').eq(catalog).find('a').addClass('active');
		
		
		// catalog popup hide
		$('#popup-catalog').hide();
		
		// catalog 추가 팝업 열기.
		$('nav .add').click(function () {
			$('#popup-catalog').show();
			return false;
		})
		// 팝업창 이벤트 전파 방지.
		$('#popup-catalog>div').click(function(e){
			e.stopPropagation();
		});
		// 팝업창 제거.
		$('#popup-catalog button.cancel').click(function(e){
			$('#popup-catalog').hide();
		});
		// catalog add
		$('#popup-catalog .actions .update').click(function(){
			
			var name = $('#popup-catalog #name').val();
			if(name === '') $('#popup-catalog #name').focus();
			else return true;
			
			return false;
		});

	});
</script>
</head>
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
	int catalogId;
	int totalNum;
	try {
		catalogId = Integer.parseInt(request.getParameter("catalog"));
	} catch (NumberFormatException e) {
		catalogId = 0;
	}
	
	PostService postService = new PostService();
	ArrayList<PostDto> list;
	if (catalogId == 0){
		list = postService.getByPage(1);
		totalNum = postService.getTotaNlumber();
	}
	else{
		list = postService.getAllBycatalogIdAndPage(catalogId, 1);
		totalNum = postService.getTotaNlumberByCatalog(catalogId);
	}
	
	 
%>
<body>
	<div class="container">
		<input class="catalog-num" type="hidden" value="<%=catalogId%>">
		<jsp:include page="template/header.jsp"></jsp:include>
		<div class="sectionAndAside">
			<section>
				<div class="posts">
					<div class="post-header">
						<span class="post-num"> 전체 글 <span class="num"><%=totalNum%></span></span>
						<%
							if (login.getResult()) {
						%>
						<a class="write" href="post/write.jsp">글쓰기</a>
						<%
							} else {
						%>
						<a class="write" href="sign/loginForm.jsp">글쓰기</a>
						<%
							}
						%>
					</div>
					<%
						for (PostDto post : list) {
					%>
					<div class="item">
						<a href="./post/detail.jsp?id=<%=post.getId()%>">
							<div class="title"><%=post.getTitle()%></div>
							<div class="content"><%=toHTML(post.getContent())%></div>
							<div class="date"><%=post.getCreateDate()%></div>
						</a>
					</div>
					<%
						}
					%>
				</div>
				<button class="more">more</button>
				<input class="max" type="hidden" value="<%=postService.getPageCount()%>">
			</section>
			<jsp:include page="template/aside.jsp"></jsp:include>
		</div>
		<div class="logos">
			<ul>
				<li><a href="https://www.bizplay.co.kr/"><img src="./image/bizplay.png" alt=""></a></li>
				<li><a href="https://www.bitacademy.com/"><img src="./image/bit.jpg" alt=""></a></li>
				<li><a href="https://www.webcash.co.kr/"><img src="./image/webcash.png" alt=""></a></li>
				<li><a href="https://www.coocon.net/"><img src="./image/coocon.PNG" alt=""></a></li>
				<li><a href="https://flow.team/"><img src="./image/flow.png" alt=""></a></li>
				<li><a href="https://www.bizplay.co.kr/"><img src="./image/bizplay.png" alt=""></a></li>
				<li><a href="https://www.bitacademy.com/"><img src="./image/bit.jpg" alt=""></a></li>
				<li><a href="https://www.webcash.co.kr/"><img src="./image/webcash.png" alt=""></a></li>
				<li><a href="https://www.coocon.net/"><img src="./image/coocon.PNG" alt=""></a></li>
				<li><a href="https://flow.team/"><img src="./image/flow.png" alt=""></a></li>
				<li><a href="https://www.bizplay.co.kr/"><img src="./image/bizplay.png" alt=""></a></li>
				<li><a href="https://www.bitacademy.com/"><img src="./image/bit.jpg" alt=""></a></li>
				<li><a href="https://www.webcash.co.kr/"><img src="./image/webcash.png" alt=""></a></li>
				<li><a href="https://www.coocon.net/"><img src="./image/coocon.PNG" alt=""></a></li>
				<li><a href="https://flow.team/"><img src="./image/flow.png" alt=""></a></li>
			</ul>
		</div>
		<jsp:include page="template/footer.jsp"></jsp:include>
		<div id="popup-catalog">
			<div>
				<h2>카탈로그 추가</h2>
				<form action="./catalog/add.jsp" method="post">
					<div class="control">
						<label for="name">이름</label>
						<input type="text" id="name" name="name">
					</div>
					<div class="actions">
						<button class="update">추가</button>
						<button class="cancel" type="button">취소</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>