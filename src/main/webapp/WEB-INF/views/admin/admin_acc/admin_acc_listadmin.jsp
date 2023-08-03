<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<!-- admin_acc_listadmin.jsp -->

<%@ include file="../admin_top.jsp" %>

<h1>관리자 계정 관리</h1>

<div align="right">
	<button onclick="location.href='admin_acc_insert.do?mode=admin'">
		새 계정 등록
	</button>
</div>

<table border="1" width="90%" class="table table-striped">
	<thead>
		<tr>
			<th width="25%">아이디</th>
			<th width="25%">이름</th>
			<th width="25%">권한</th>
			<th width="25%">수정|삭제</th>
		</tr>
	</thead>
	
	<tbody>
		<c:if test="${list != null || list.size() != 0}">
			<c:forEach var="adto" items="${list}">
				<tr align="center">
					<td>${adto.admin_id}</td>
					<td>${adto.name}</td>
					<td>${adto.authority_level}</td>
					<td>
					<a href="admin_acc_edit.do?mode=admin&id=${adto.admin_id}">수정</a>
					|
					<a href="admin_acc_delete.do?mode=admin&id=${adto.admin_id}">삭제</a>
					</td>
				</tr>
			</c:forEach>
		</c:if>
		
		<c:if test="${list == null || list.size() == 0}">
			<tr>
				<td colspan="4">관리자는 존재하지 않는다. 어떻게 들어왔는가</td>
			</tr>
		</c:if>
		
		<tr align="center">
			<td colspan="6">
				<c:forEach begin="1" end="${pageCount}" var="i">
					<a href="admin_acc_list.do?mode=admin&page=${i}"><font size="3">[${i}]</font></a>	
				</c:forEach>
			</td>
		</tr>
	</tbody>
	
</table>

<%@ include file="../admin_bottom.jsp" %>