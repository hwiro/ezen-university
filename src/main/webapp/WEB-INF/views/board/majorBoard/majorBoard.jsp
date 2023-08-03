<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- majorBoard.jsp -->
<%@ include file="../top.jsp"%>
<div class="co-lg-6">
	<div class="card">
		<div class="card-body">
			<h5 class="card-title" align="center">강의 게시판</h5>
			<table class="table table-striped" width="70%">
				<tr class="table-primary">
					<th scope="col">번호</th>
					<th scope="col">제목</th>
					<th scope="col">작성자</th>
					<th scope="col">작성일</th>
					<th scope="col">조회</th>
					<th scope="col">IP</th>
				</tr>
			<c:if test="${mode ne 'find'}">
				<c:if test="${empty listMajorBoard}">
					<tr align="center">
						<td scope="row" colspan="6">등록된 글이 없습니다.</td>
					</tr>
				</c:if>
			</c:if>
			<c:forEach var="dto" items="${listMajorBoard}">
					<tr>
						<td>${dto.major_board_code}</td>
						<td><a
							href="content_major_board.do?major_board_code=${dto.major_board_code}">${dto.subject}&nbsp;</a><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chat-left-dots" viewBox="0 0 16 16">
  <path d="M14 1a1 1 0 0 1 1 1v8a1 1 0 0 1-1 1H4.414A2 2 0 0 0 3 11.586l-2 2V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12.793a.5.5 0 0 0 .854.353l2.853-2.853A1 1 0 0 1 4.414 12H14a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>
  <path d="M5 6a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm4 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm4 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0z"/>
</svg> [${dto.content }]
							<c:if test="${dto.readcount > 100}">
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
									fill="red" class="bi bi-fire" viewBox="0 0 16 16">
  								<path d="M8 16c3.314 0 6-2 6-5.5 0-1.5-.5-4-2.5-6 .25 1.5-1.25 2-1.25 2C11 4 9 .5 6 0c.357 2 .5 4-2 6-1.25 1-2 2.729-2 4.5C2 14 4.686 16 8 16Zm0-1c-1.657 0-3-1-3-2.75 0-.75.25-2 1.25-3C6.125 10 7 10.5 7 10.5c-.375-1.25.5-3.25 2-3.5-.179 1-.25 2 1 3 .625.5 1 1.364 1 2.25C11 14 9.657 15 8 15Z" />
								</svg>
							</c:if></td>
						<td>${dto.writer}</td>
						<td>${dto.reg_date}</td>
						<td>${dto.readcount}</td>
						<td>${dto.ip}</td>
					</tr>
				</c:forEach>
				<c:if test="${mode =='find'}">
					<c:if test="${empty find}">
						<tr align="center">
							<td scope="row" colspan="6">등록된 글이 없습니다.</td>
						</tr>
					</c:if>
				</c:if>
				<c:forEach var="dto" items="${find }">
					<tr>
						<td>${dto.major_board_code}</td>
						<td><a
							href="content_major_board.do?major_board_code=${dto.major_board_code}">${dto.subject}[${dto.content }]</a>
							<c:if test="${dto.readcount > 100}">
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
									fill="red" class="bi bi-fire" viewBox="0 0 16 16">
  								<path d="M8 16c3.314 0 6-2 6-5.5 0-1.5-.5-4-2.5-6 .25 1.5-1.25 2-1.25 2C11 4 9 .5 6 0c.357 2 .5 4-2 6-1.25 1-2 2.729-2 4.5C2 14 4.686 16 8 16Zm0-1c-1.657 0-3-1-3-2.75 0-.75.25-2 1.25-3C6.125 10 7 10.5 7 10.5c-.375-1.25.5-3.25 2-3.5-.179 1-.25 2 1 3 .625.5 1 1.364 1 2.25C11 14 9.657 15 8 15Z" />
								</svg>
							</c:if></td>
						<td>${dto.writer}</td>
						<td>${dto.reg_date}</td>
						<td>${dto.readcount}</td>
						<td>${dto.ip}</td>
					</tr>
				</c:forEach>
			</table>
			<br>
			<div align="right">
				<a href="write_major_board.do">
				<button type="button" class="btn btn-outline-primary">글쓰기</button></a>
			</div>
			<div align="center">
				<form name="f" action="find_major_board.do" method="post">
					<select name="search">
						<option value="subject">&nbsp;&nbsp;제목</option>
						<option value="writer">작성자</option>
					</select>&nbsp;&nbsp;
					<input type="text" name="searchString" placeholder="  검색어를 입력하세요."
						title="Enter search keyword">&nbsp;&nbsp;&nbsp;
					<button type="submit"
							class="btn btn-outline-primary btn-sm opacity-50"  
							style="--bs-btn-padding-y: .1rem; --bs-btn-padding-x: .5rem; --bs-btn-font-size: 1.0rem;">Search</button>
				</form>
			</div>
		</div>
	</div>
</div>
<div class="card">
	<div class="card-body">
		<nav aria-label="...">
			<c:if test="${count>0}">
				<ul class="pagination justify-content-center">
					<li class="page-item"><c:if test="${startPage > pageBlock}">
							<a class="page-link"
								href="majorBoard.do?pageNum=${startPage-pageBlock}"
								tabindex="-1" aria-disabled="true">이전</a>
						</c:if></li>
					<c:forEach var="i" begin="${startPage}" end="${endPage}">
						<li class="page-item"><a class="page-link"
							href="majorBoard.do?pageNum=${i}">${i}</a></li>
					</c:forEach>
					<li class="page-item">
						<c:if test="${endPage < pageCount}">
							<a class="page-link" href="majorBoard.do?pageNum=${startPage+pageBlock}">다음</a>
						</c:if>
					</li>
				</ul>
			</c:if>
		</nav>
		<!-- End Disabled and active states -->
	</div>
</div>
<%@ include file="../bottom.jsp"%>