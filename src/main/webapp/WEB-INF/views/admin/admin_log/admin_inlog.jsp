<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<!-- admin_inlog -->

<%@ include file="../admin_top.jsp" %>

<h1>접속 로그</h1>

<div align="right">
	<button onclick="location.href='admin_expired_del.do'">만료된 인증DB 비우기[${expiredMail}]</button>
</div>

<div align="right">
	<button onclick="location.href='admin_inlog_del.do'">로그 비우기</button>
</div>

<table border="1" class="table table-striped">
	<thead>
		<tr>
			<th width="30%">아이디</th>
			<th width="30%">아이피</th>
			<th width="30%">일시</th>
		</tr>
	</thead>
	
	<tbody>
		<c:if test="${inlog != null || inlog.size() != 0}">
			<c:forEach var="idto" items="${inlog}">
				<tr align="center">
					<td>${idto.id}</td>
					<td>${idto.ip}</td>
					<td>${idto.indate}</td>
				</tr>
			</c:forEach>
		</c:if>
		
		<c:if test="${inlog == null || inlog.size() == 0}">
			<tr>
				<td colspan="6"><h1 align="center">최근에 로그를 비웠습니다</h1></td>
			</tr>
		</c:if>
		
		<tr align="center">
			<td colspan="3">
				<c:forEach begin="1" end="${pageCount}" var="i">
					<a href="admin_inlog_list.do?page=${i}"><font size="3">[${i}]</font></a>	
				</c:forEach>
			</td>
		</tr>
	</tbody>
</table>
	
<%@ include file="../admin_bottom.jsp" %>