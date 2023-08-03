<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<!-- admin_acc_listteacher.jsp -->

<%@ include file="../admin_top.jsp" %>

<h1>교수 계정 관리</h1>

<div align="right">
	<button onclick="location.href='admin_acc_insert.do?mode=teacher'">
		새 계정 등록
	</button>
</div>

<table border="1" class="table table-striped">
	<thead>
		<tr>
			<th width="20%">아이디</th>
			<th width="20%">이름</th>
			<th width="20%">학과</th>
			<th width="20%">전화번호</th>
			<th width="20%">수정|삭제</th>
		</tr>
	</thead>
	
	<tbody>
		<c:if test="${list != null || list.size() != 0}">
			<c:forEach var="adto" items="${list}">
				<tr align="center">
					<td>${adto.teacher_id}</td>
					<td>${adto.name}</td>
					<td>${adto.dept}</td>
					<td>${adto.tel}</td>
					<td>
					<a href="admin_acc_edit.do?mode=teacher&id=${adto.teacher_id}">수정</a>
					|
					<a href="admin_acc_delete.do?mode=teacher&id=${adto.teacher_id}">삭제</a>
					</td>
				</tr>
			</c:forEach>
		</c:if>
		
		<c:if test="${list == null || list.size() == 0}">
			<tr>
				<td colspan="5">교수가 없는 유령대학입니다</td>
			</tr>
		</c:if>
		
		<tr align="center">
			<td colspan="6">
				<c:forEach begin="1" end="${pageCount}" var="i">
					<a href="admin_acc_list.do?mode=teacher&page=${i}"><font size="3">[${i}]</font></a>	
				</c:forEach>
			</td>
		</tr>
	</tbody>
</table>

<%@ include file="../admin_bottom.jsp" %>