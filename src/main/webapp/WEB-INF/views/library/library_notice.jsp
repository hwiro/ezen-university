<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- library_notice.jsp -->
<%@ include file="library_top.jsp" %>
<br><br>
<main>
	<div align="center">
		<form name="f" action="library_findNotice.do" method="post">
			<select class="form-select form-select-lg mb-3" name="search">
				<option value="info_title">제목</option>
				<option value="content">내용</option>
			</select>
			<input class="form-control" type="text" placeholder="검색어를 입력하세요." name="searchString" onkeyup="fn_checkByte(this, 100)">
			<input class="form-control mb-3" type="submit" value="검색">
		</form>
		<br><br>
		<table class="table">
			<thead>
				<tr>
					<th>순번</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>조회수</th>
				</tr>
			</thead>
			
			<tbody>
				<c:if test="${noticelist != null || noticelist.size() != 0}">
					<c:forEach var="lbdto" items="${noticelist}">
						<tr>
							<td>${lbdto.info_code}</td>
							<c:if test="${fn:length(lbdto.info_title) > 70}">
								<td><a href="library_noticeView.do?info_code=${lbdto.info_code}">${fn:substring(lbdto.info_title,0,70)}...</a></td>
							</c:if>
							<c:if test="${fn:length(lbdto.info_title) <= 70}">
								<td><a href="library_noticeView.do?info_code=${lbdto.info_code}">${lbdto.info_title}</a></td>
							</c:if>
							<td>${lbdto.writer}</td>
							<td>${lbdto.reg_date}</td>
							<td>${lbdto.readcount}</td>
						</tr>
					</c:forEach>
				</c:if>
				<c:if test="${noticelist == null || noticelist.size() == 0}">
					<tr>
						<td colspan="6"><h1 align="center">등록된 공지가 없습니다</h1></td>
					</tr>
				</c:if>
			</tbody>
		</table>
			<nav aria-label="Page navigation example">
		  		<ul class="pagination">
					<c:forEach begin="1" end="${pageCount}" var="i">
						<li class="page-item"><a class="page-item" href="library_notice.do?page=${i}">${i}</a>	
					</c:forEach>
				</ul>
			</nav>
		</div>
</main>
<%@ include file="library_bottom.jsp" %>