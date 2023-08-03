<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- library_main.jsp -->
<%@ include file="library_top.jsp" %>
<main> <!-- 이미지슬라이드  -->
<div class="imgSlide">
	<a href="#"><img src="resources/library_slide/librarySlide1.jpg"
		alt=""></a> <a href="#"><img
		src="resources/library_slide/librarySlide2.jpg" alt=""></a> <a
		href="#"><img src="resources/library_slide/librarySlide3.jpg"
		alt=""></a>
</div>
<!-- 컨텐츠 -->
<div class="contents">
	<div class="notice">
		<h4>
			<a href="library_notice.do?page=1">공지사항</a>
		</h4>
		<c:if test="${noticelist != null || noticelist.size() != 0}">
			<ul>
				<c:forEach var="lbdto" items="${noticelist}" end="6">
					<c:if test="${fn:length(lbdto.info_title) > 50}">
						<li><a
							href="library_noticeView.do?info_code=${lbdto.info_code}">${fn:substring(lbdto.info_title,0,50)}...<span>${lbdto.reg_date}</span></a></li>
					</c:if>
					<c:if test="${fn:length(lbdto.info_title) <= 50}">
						<li><a
							href="library_noticeView.do?info_code=${lbdto.info_code}">${lbdto.info_title}<span>${lbdto.reg_date}</span></a></li>
					</c:if>
				</c:forEach>
			</ul>
		</c:if>
	</div>

	<div class="gallery">
		<h4>베스트도서10</h4>
		<div id="carousel-example-generic" class="carousel slide">
			<!-- carousel의 지시자 -->
			<!-- 지시자라고는 하는데 ol태그의 class에 carousel-indicators를 넣는다. -->
			<ol class="carousel-indicators">
				<!-- li는 이미지 개수만큼 추가하고 data-target은 carousel id를 가르킨다. -->
				<!-- data-slide-to는 순서대로 0부터 올라가고 0은 active를 설정한다. -->
				<!-- 딱히 이 부분은 옵션별로 설정하게 없다. -->
				<li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
				<li data-target="#carousel-example-generic" data-slide-to="1"></li>
				<li data-target="#carousel-example-generic" data-slide-to="2"></li>
				<li data-target="#carousel-example-generic" data-slide-to="3"></li>
				<li data-target="#carousel-example-generic" data-slide-to="4"></li>
				<li data-target="#carousel-example-generic" data-slide-to="5"></li>
				<li data-target="#carousel-example-generic" data-slide-to="6"></li>
				<li data-target="#carousel-example-generic" data-slide-to="7"></li>
				<li data-target="#carousel-example-generic" data-slide-to="8"></li>
				<li data-target="#carousel-example-generic" data-slide-to="9"></li>
			</ol>
			<!-- 실제 이미지 아이템 -->
			<!-- class는 carousel-inner로 설정하고 role은 listbox에서 설정한다. -->
			<div class="carousel-inner" role="listbox">
				<!-- 이미지의 개수만큼 item을 만든다. 중요한 포인트는 carousel-indicators의 li 태그 개수와 item의 개수는 일치해야 한다. -->
				<c:forEach var="bdto" items="${bookImage}" end="0">
					<div class="item active" align="center">
						<!-- 아미지 설정- -->
						<a href="library_bookView.do?book_id=${bdto.book_id}&genre=${bdto.genre}">
							<img src="resources/book_img/${bdto.image}" width="200" height="260">
						</a>
					</div>
				</c:forEach>
				<c:forEach var="bdto" items="${bookImage}" begin="1" end="9">
					<div class="item" align="center">
						<!-- 아미지 설정- -->
						<a href="library_bookView.do?book_id=${bdto.book_id}&genre=${bdto.genre}">
							<img src="resources/book_img/${bdto.image}" width="200" height="260">
						</a>
					</div>
				</c:forEach>
			</div>
			<!-- 왼쪽 화살표 버튼 -->
			<!-- href는 carousel의 id를 가르킨다. -->
			<a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev"> 
			<!-- 왼쪽 화살표 --> 
				<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
			</a>
			<!-- 오른쪽 화살표 버튼 -->
			<!-- href는 carousel의 id를 가르킨다. -->
			<a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next"> 
			<!-- 오른쪽 화살표 --> 
				<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
			</a>
		</div>
	</div>
</div>
</main>
<%@ include file="library_bottom.jsp" %>