<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<!-- admin_editlog -->

<%@ include file="../admin_top.jsp" %>

<h1>관리자 활동 내역</h1>

<div align="right">
	<button onclick="location.href='admin_editlog_del.do'">로그 비우기</button>
</div>

<table border="1" class="table table-striped">
	<thead>
		<tr>
			<th width="150">아이디</th>
			<th width="300">수정내역</th>
			<th width="400">메모</th>
			<th width="150">일시</th>
		</tr>
	</thead>
	
	<tbody>
		<c:if test="${editlog != null || editlog.size() != 0}">
			<c:forEach var="edto" items="${editlog}">
				<tr align="center">
					<td>${edto.id}</td>
					<td>${edto.content}</td>
					<td>${edto.memo}</td>
					<td>${edto.indate}</td>
				</tr>
			</c:forEach>
		</c:if>
		
		<c:if test="${editlog == null || editlog.size() == 0}">
			<tr>
				<td colspan="6"><h1 align="center">최근에 로그를 비웠습니다</h1></td>
			</tr>
		</c:if>
		
		<tr align="center">
			<td colspan="6">
				<c:forEach begin="1" end="${pageCount}" var="i">
					<a href="admin_editlog_list.do?page=${i}"><font size="3">[${i}]</font></a>	
				</c:forEach>
			</td>
		</tr>
	</tbody>
</table>

<%@ include file="../admin_bottom.jsp" %>