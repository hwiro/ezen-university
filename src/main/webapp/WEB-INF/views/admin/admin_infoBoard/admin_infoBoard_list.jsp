<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<!-- admin_infoBoard_list.jsp -->

<%@ include file="../admin_top.jsp" %>

<c:if test="${type == 'infoEvent'}">
	<h1>행사 공지</h1>
</c:if>

<c:if test="${type == 'infoLib'}">
	<h1>도서 공지</h1>
</c:if>

<c:if test="${type == 'infoLecture'}">
	<h1>특강 공지</h1>
</c:if>

<c:if test="${type == 'infoScholar'}">
	<h1>장학 공지</h1>
</c:if>

<form name="listType" action="admin_infoBoard_list.do" method="post">
	<select name="type">
		<option value="infoEvent">행사</option>
		<option value="infoLib">도서</option>
		<option value="infoLecture">특강</option>
		<option value="infoScholar">장학</option>
	</select>
	<input type="submit" value="이동"/>
</form>

<div align="right">
	<button onclick="location.href='admin_infoBoard_insert.do?type=${type}'">새 공지 작성</button>
	<br>
</div>

<table border="1" width="100%" style="table-layout:fixed;" class="table table-striped">
	<thead>
		<tr>
			<th width="40%">제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>조회수</th>
			<th>수정|삭제</th>
		</tr>
	</thead>
	
	<tbody>
		<c:if test="${list != null || list.size() != 0}">
			<c:forEach var="ldto" items="${list}">
				<tr align="center">
					<td>
						<a href="admin_infoBoard_view.do?info_code=${ldto.info_code}&type=${type}">${ldto.info_title}</a>
						<c:if test="${ldto.image != 'none'}">
							<img src="resources/img/favicons/imgch.png" width="15px" height="15px">
						</c:if>
						<c:if test="${ldto.content eq 'yes'}">
							<img src="resources/img/favicons/filech.png" width="15px" height="15px">
						</c:if>
					</td>
					<td>${ldto.writer}</td>
					<td>${ldto.reg_date}</td>
					<td>${ldto.readcount}</td>
					<td>
						<a href="admin_infoBoard_edit.do?info_code=${ldto.info_code}&type=${type}">수정</a>
						|
						<a href="admin_infoBoard_del.do?info_code=${ldto.info_code}&type=${type}">삭제</a>
					</td>
				</tr>
			</c:forEach>
		</c:if>
		
		<c:if test="${list == null || list.size() == 0}">
			<tr>
				<td colspan="5"><h1 align="center">등록된 공지가 없습니다</h1></td>
			</tr>
		</c:if>
		
		<tr align="center">
			<td colspan="5">
				<c:forEach begin="1" end="${pageCount}" var="i">
					<a href="admin_infoBoard_list.do?page=${i}&type=${type}"><font size="3">[${i}]</font></a>	
				</c:forEach>
			</td>
		</tr>
	</tbody>
	
</table>

<div align="right">
	<form name="searchInfoBoard" action="admin_infoBoard_list.do" method="post">
		<select name="search">
			<option value="all">전체보기</option>
			<option value="info_title">제목</option>
			<option value="writer">작성자</option>
		</select>
		<input type="text" name="searchString"/>
		<input type="hidden" name="type" value="${type}"/>
		<input type="submit" value="검색"/>
	</form>
</div>

<%@ include file="../admin_bottom.jsp" %>