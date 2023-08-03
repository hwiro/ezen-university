<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<!-- admin_dept_list.jsp -->

<%@ include file="../admin_top.jsp" %>

<h1>학과 관리</h1>

<div align="right">
	<button onclick="location.href='admin_dept_insert.do'">새 학과 개설</button>
</div>

<table border="1" class="table table-striped">
	<thead>
		<tr>
			<th width="15%">전공코드</th>
			<th width="35%">전공이름</th>
			<th width="25%">학과장</th>
			<th width="15%">단과</th>
			<th width="10%">삭제</th>
		</tr>
	</thead>
	
	<tbody>
		<c:if test="${deptlist != null || deptlist.size() != 0}">
			<c:forEach var="ddto" items="${deptlist}">
				<tr align="center">
					<td>${ddto.dept_id}</td>
					<td>${ddto.dept_name}</td>
					<td>${ddto.dept_head}</td>
					<td>${ddto.issingle}</td>
					<td><a href="admin_dept_del.do?dept_id=${ddto.dept_id}">삭제</a></td>
				</tr>
			</c:forEach>
		</c:if>
		
		<c:if test="${deptlist == null || deptlist.size() == 0}">
			<tr>
				<td colspan="6"><h1 align="center">등록된 전공이 없습니다</h1></td>
			</tr>
		</c:if>
		
		<tr align="center">
			<td colspan="6">
				<c:forEach begin="1" end="${pageCount}" var="i">
					<a href="admin_dept_list.do?page=${i}"><font size="3">[${i}]</font></a>	
				</c:forEach>
			</td>
		</tr>
	</tbody>
	
</table>
					
<%@ include file="../admin_bottom.jsp" %>