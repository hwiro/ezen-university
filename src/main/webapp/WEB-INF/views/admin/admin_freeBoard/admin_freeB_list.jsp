<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<!-- admin_freeB_list.jsp -->

<%@ include file="../admin_top.jsp" %>

<table class="table table-striped" style="font-size:20px;">
	<thead>
		<tr align="center">
			<th width="60%">글 제목</th>
			<th>작성자</th>
			<th>조회수</th>
			<th>작성일</th>
			<th>수정|삭제</th>
		</tr>
	</thead>
	
	<tbody>
		<tr>
			<th width="80%" colspan="3"></th>
			<th colspan="2">
				<a href="admin_freeB_insert.do">글 작성</a><br>
				<a href="admin_freeB_blacklist.do">유저 차단 목록</a>
			</th>
		</tr>
		
		<c:forEach var="dto" items="${list}">
			<tr align="center">
				<td style="overflow:hidden; width:400px;">
					<c:if test="${dto.thumb >= 10}">
						<img src="resources/img/favicons/thumbsup.png" width="20px" height="20px">
					</c:if>
					<a href="admin_freeB_view.do?code=${dto.etc_board_code}">${dto.subject}</a>
					<c:if test="${dto.image != 'none'}">
						<img src="resources/img/favicons/imgch.png" width="20px" height="20px">
					</c:if>
				</td>
				<td style="overflow:hidden; white-space:nowrap;">${dto.writer}</td>
				<td style="overflow:hidden;">${dto.readcount}</td>
				<td style="overflow:hidden;">${dto.reg_date}</td>
				<td style="overflow:hidden;">
					<a href="admin_freeB_edit.do?code=${dto.etc_board_code}">수정</a>
					|
					<a href="admin_freeB_delete.do?code=${dto.etc_board_code}&image=${dto.image}">삭제</a>
				</td>
			</tr>
		</c:forEach>
		
		<tr>
			<td colspan="5" align="right">
				<form name="search_freeB" action="admin_freeB_list.do" method="post">
					<select name="search">
						<option value="subject">글제목</option>
						<option value="writer">작성자</option>
					</select>
					<input type="text" name="searchString"/>
					<input type="hidden" name="mode" value="search"/>
					<input type="submit" value="검색"/>
				</form>
			</td>
		</tr>
		
		<tr>
			<td colspan="5" align="center">
				<c:forEach begin="1" end="${pageCount}" var="i">
					<a href="admin_freeB_list.do?page=${i}"><font size="3">[${i}]</font></a>	
				</c:forEach>
			</td>
		</tr>
		
		<tr>
			<td colspan="5"></td>
		</tr>
	</tbody>
</table>

<%@ include file="../admin_bottom.jsp" %>