<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
<style>
.card-title2 {
  padding: 10px 0 15px 0;
  font-size: 18px;
  font-weight: 500;
  color: #012970;
  font-family: "Poppins", sans-serif;
}
</style>
<link href="resources/majorBoard_css/assets/css/main.css" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Orbit&display=swap" rel="stylesheet">
</head>
<%@ include file="../admin_top.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- admin_replyUdateBoard.jsp -->
<div class="card">
	<div class="card-body">
		<div class="container">
			<div class="row">
				<article class="box page-content">
					<header>
						<h3 style="font-family: 'Orbit', sans-serif;">${getBoard.subject }</h3>
							<a class="icon" href="#" data-bs-toggle="dropdown"
								aria-expanded="false"
								style="position: absolute; right: 30px; top: 50px;"> <i
								class="bi bi-three-dots"></i>
							</a>
							<ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow"
								style>
								<li class="dropdown-header text-start">
									<h6>편집</h6>
								</li>
								<li><a class="dropdown-item"
									href="admin_update_major_board.do?major_board_code=${getBoard.major_board_code}">수정</a>
								</li>
								<li><a class="dropdown-item"
									href="admin_delete_major_board.do?major_board_code=${getBoard.major_board_code}&image=${getBoard.image }">삭제</a>
								</li>
							</ul>
						<ul class="meta">
							<li style="font-family: 'Orbit', sans-serif;"><svg
									xmlns="http://www.w3.org/2000/svg" width="16" height="16"
									fill="currentColor" class="bi bi-calendar-heart"
									viewBox="0 0 16 16">
 							<path fill-rule="evenodd"
										d="M4 .5a.5.5 0 0 0-1 0V1H2a2 2 0 0 0-2 2v11a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V3a2 2 0 0 0-2-2h-1V.5a.5.5 0 0 0-1 0V1H4V.5ZM1 14V4h14v10a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1Zm7-6.507c1.664-1.711 5.825 1.283 0 5.132-5.825-3.85-1.664-6.843 0-5.132Z" />
							</svg>&nbsp;&nbsp;${getBoard.reg_date }</li>
							<li style="font-family: 'Orbit', sans-serif;"><svg
									xmlns="http://www.w3.org/2000/svg" width="16" height="16"
									fill="currentColor" class="bi bi-person" viewBox="0 0 16 16">
  								<path
										d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6Zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0Zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4Zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10Z" />
								</svg>&nbsp;&nbsp;${getBoard.writer }</li>
						</ul>
					</header>
					<section>
						<div align="center">
							<c:if test="${getBoard.image ne 'none' }">
								<img src="${path}/${getBoard.image}" width="50%" height="50%">
							</c:if>
							<p style="font-family: 'Orbit', sans-serif;">${getBoard.content }</p>
						</div>
					</section>
				</article>
			</div>
		</div>
	</div>
</div>
<div class="card">
	<c:forEach items="${replyList}" var="replyList">
		<div class="card info-card sales-card">
			<div align="right" class="filter"
				style="position: absolute; right: 15px; top: 10px;">
				<h6 style="font-family: 'Orbit', sans-serif;">
					<fmt:formatDate value="${replyList.reg_date}" pattern="yyyy-MM-dd" />
				</h6>
			</div>
			<c:if test="${getReply.rno eq replyList.rno }">
			<form name="f" action="admin_major_board_reUpdate.do" method="post">
				<input type="hidden" name="major_board_code" value="${getBoard.major_board_code }" /> 
				<input type="hidden" name="rno" value="${getReply.rno }" />
			<div class="card-body">
				<h1 style="font-family: 'Orbit', sans-serif;" class="card-title2">${replyList.writer }</h1>
				<div class="d-flex align-items-center">
						<input type="text" id="content" name="content" value="${getReply.content }" />
				</div>
				<br>
					<div align="left">
						<button type="submit" class="btn btn-outline-primary">수정</button>
					</div>
			</div>
			</form>
			</c:if>
			<c:if test="${getReply.rno ne replyList.rno }">
			<div class="card-body">
				<h1 style="font-family: 'Orbit', sans-serif;" class="card-title2">${replyList.writer }</h1>
				<div class="d-flex align-items-center">
					<div class="ps-3">
						<h6 style="font-family: 'Orbit', sans-serif;">${replyList.content }</h6>
					</div>
				</div>
			</div>
			</c:if>
		</div>
	</c:forEach>
</div>
<script src="resources/majorBoard_css/assets/js/jquery.min.js"></script>
<script src="resources/majorBoard_css/assets/js/jquery.dropotron.min.js"></script>
<script src="resources/majorBoard_css/assets/js/jquery.scrolly.min.js"></script>
<script src="resources/majorBoard_css/assets/js/browser.min.js"></script>
<script src="resources/majorBoard_css/assets/js/breakpoints.min.js"></script>
<script src="resources/majorBoard_css/assets/js/util.js"></script>
<script src="resources/majorBoard_css/assets/js/main2.js"></script>
<%@ include file="../admin_bottom.jsp"%>