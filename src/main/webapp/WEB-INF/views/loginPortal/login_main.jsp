<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!-- login_main.jsp -->

<%@ include file="login_top.jsp" %>

<!-- Marketing messaging and featurettes
	================================================== -->
	<!-- Wrap the rest of the page in another container to center all the content. -->

	<div class="container marketing">

		<!-- Three columns of text below the carousel -->
		<div class="row row-cols-1 row-cols-md-4">
			<div class="col mb-4" align="center">
				<svg class="bd-placeholder-img" width="80" height="80" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder" preserveAspectRatio="xMidYMid meet" focusable="false"><title>마이페이지</title><image xlink:href="resources/img/favicons/person-circle.svg" width="100%" height="100%" preserveAspectRatio="xMidYMid meet"/></svg>
				<h2 class="fw-normal">마이페이지</h2>
				<p>스스로를 개조하는 탐구의 공간</p>
				<p>
					<c:if test="${sessionScope.type == '학생'}">
						<a class="btn btn-secondary" href="javascript:openWindow('stuMyPage.do', '마이페이지');">이동 &raquo;</a>
					</c:if>
					<c:if test="${sessionScope.type == '교수'}">
						<a class="btn btn-secondary" href="javascript:openWindow('ProEditMyInfo.do', '마이페이지');">이동 &raquo;</a>
					</c:if>
					<c:if test="${sessionScope.type == '교직원'}">
						<a class="btn btn-secondary" href="javascript:openWindow('StaffPage.do', '교직원메뉴');">이동 &raquo;</a>
					</c:if>
					<c:if test="${sessionScope.type == null}">
						<a class="btn btn-secondary" href="#">로그인 후 이용 가능합니다 &raquo;</a>
					</c:if>
				</p>
			</div><!-- /.col mb-4 -->
			<div class="col mb-4" align="center">
				<svg class="bd-placeholder-img" width="80" height="80" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder" preserveAspectRatio="xMidYMid meet" focusable="false"><title>수강신청</title><image xlink:href="resources/img/favicons/journal-text.svg" width="100%" height="100%" preserveAspectRatio="xMidYMid meet"/></svg>
				<h2 class="fw-normal">수강신청</h2>
				<p>지식의 총본산</p>
				<p>
					<c:if test="${sessionScope.id != null}">
						<a class="btn btn-secondary" href="javascript:openWindow('class_apply_main.do', '수강신청');">이동 &raquo;</a>
					</c:if>
					<c:if test="${sessionScope.id == null}">
						<a class="btn btn-secondary" href="#">로그인 후 이용 가능합니다 &raquo;</a>
					</c:if>
				</p>
			</div><!-- /.col mb-4 -->
			<div class="col mb-4" align="center">
				<svg class="bd-placeholder-img" width="80" height="80" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder" preserveAspectRatio="xMidYMid meet" focusable="false"><title>이젠도서관</title><image xlink:href="resources/img/favicons/book.svg" width="100%" height="100%" preserveAspectRatio="xMidYMid meet"/></svg>
				<h2 class="fw-normal">이젠도서관</h2>
				<p>엘레강스하고 품격있는 도서관</p>
				<p>
					<c:if test="${sessionScope.id != null}">
						<a class="btn btn-secondary" href="library_main.do">이동 &raquo;</a>
					</c:if>
					<c:if test="${sessionScope.id == null}">
						<a class="btn btn-secondary" href="#">로그인 후 이용 가능합니다 &raquo;</a>
					</c:if>	
				</p>
			</div><!-- /.col mb-4 -->
			<div class="col mb-4" align="center">
				<svg class="bd-placeholder-img" width="80" height="80" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder" preserveAspectRatio="xMidYMid meet" focusable="false"><title>자유게시판</title><image xlink:href="resources/img/favicons/people.svg" width="100%" height="100%" preserveAspectRatio="xMidYMid meet"/></svg>
				<h2 class="fw-normal">자유게시판</h2>
				<p>소통과 화합의 장</p>
				<p><a class="btn btn-secondary" href="freeB_list.do?page=1">이동 &raquo;</a></p>
			</div><!-- /.col mb-4 -->
		</div><!-- /.row -->


		<!-- START THE FEATURETTES -->

		<hr class="featurette-divider">
		
		<div class="row featurette">
			<div class="tab">
				<ul class="tabnav">
					<li><a href="#tab01">행사공지</a></li>
					<li><a href="#tab02">특강공지</a></li>
					<li><a href="#tab03">장학공지</a></li>
				</ul>
				<div class="tabcontent">
					<div id="tab01">
						<table>
							<c:if test="${infoEvent != null || infoEvent.size() != 0}">
								<c:forEach var="eibdto" items="${infoEvent}" end="5">
									<tr>
										<c:if test="${fn:length(eibdto.info_title) > 20}">
											<td width="65%"><a href="notlog_eventBoardList_Content.do?info_code=${eibdto.info_code}&type=${eibdto.type}">${fn:substring(eibdto.info_title,0,20)}...</a></td>
										</c:if>
										<c:if test="${fn:length(eibdto.info_title) <= 20}">
											<td width="65%"><a href="notlog_eventBoardList_Content.do?info_code=${eibdto.info_code}&type=${eibdto.type}">${eibdto.info_title}</a></td>
										</c:if>
										<td width="35%" align="right">${eibdto.reg_date}</td>
									</tr>
								</c:forEach>
							</c:if>
						</table>
					</div>
					<div id="tab02">
						<table>
							<c:if test="${infoLecture != null || infoLecture.size() != 0}">
								<c:forEach var="libdto" items="${infoLecture}" end="5">
									<tr>
										<c:if test="${fn:length(libdto.info_title) > 20}">
											<td width="65%"><a href="notlog_specialLectureBoardList_Content.do?info_code=${libdto.info_code}&type=${libdto.type}">${fn:substring(libdto.info_title,0,20)}...</a></td>
										</c:if>
										<c:if test="${fn:length(libdto.info_title) <= 20}">
											<td width="65%"><a href="notlog_specialLectureBoardList_Content.do?info_code=${libdto.info_code}&type=${libdto.type}">${libdto.info_title}</a></td>
										</c:if>
										<td width="35%" align="right">${libdto.reg_date}</td>
									</tr>
								</c:forEach>
							</c:if>
						</table>
					</div>
					<div id="tab03">
						<table>
							<c:if test="${infoScholar != null || infoScholar.size() != 0}">
								<c:forEach var="sibdto" items="${infoScholar}" end="5">
									<tr>
										<c:if test="${fn:length(sibdto.info_title) > 20}">
											<td width="65%"><a href="notlog_scholarBoard_Content.do?info_code=${sibdto.info_code}&type=${sibdto.type}">${fn:substring(sibdto.info_title,0,20)}...</a></td>
										</c:if>
										<c:if test="${fn:length(sibdto.info_title) <= 20}">
											<td width="65%"><a href="notlog_scholarBoard_Content.do?info_code=${sibdto.info_code}&type=${sibdto.type}">${sibdto.info_title}</a></td>
										</c:if>
										<td width="35%" align="right">${sibdto.reg_date}</td>
									</tr>
								</c:forEach>
							</c:if>
						</table>
					</div>
				</div>
			</div>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<div class="col-md-5">
				<img class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto" width="500" height="500" src="resources/img/majorRelated.png" role="img" aria-label="Placeholder: 500x500" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title></img>
			</div>
		</div>

		<hr class="featurette-divider">

		<div class="row featurette">
			<div class="col-md-7 order-md-2">
				<h2 class="featurette-heading fw-normal lh-1">Quick Link</h2>
				<p class="lead">
					<a href="notlog_main.do">대표 홈페이지</a> | 
					<a href="library_main.do">이젠대 도서관</a> | 
					<a href="notlog_qnaBoard_list.do">Q&A게시판</a> | 
					<a href="notlog_campusGuide.do">찾아오시는 길</a>
				</p>
			</div>
			<div class="col-md-5 order-md-1">
				<img width="450" height="250" src="resources/img/schoolEvent.png"/>
			</div>
		</div>

		<hr class="featurette-divider">

		<!-- /END THE FEATURETTES -->

	</div><!-- /.container -->
	
	
<%@ include file="login_bottom.jsp" %>