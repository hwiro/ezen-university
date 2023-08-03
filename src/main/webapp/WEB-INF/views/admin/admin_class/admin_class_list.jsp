<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<!-- admin_class_list.jsp -->

<%@ include file="../admin_top.jsp" %>

<h1>강의 관리</h1>

<div align="right">
	<button onclick="location.href='admin_class_insert.do'">새 강의 개설</button>
	<br>
</div>

<table border="1" class="table table-striped">
	<thead>
		<tr>
			<th>강의이름</th>
			<th>학점</th>
			<th>담당교수ID</th>
			<th>담당교수이름</th>
			<th>요일</th>
			<th>시간</th>
			<th>강의실</th>
			<th>학기</th>
			<th>삭제</th>
		</tr>
	</thead>
	
	<tbody>
		<c:if test="${classlist != null || classlist.size() != 0}">
			<c:forEach var="cdto" items="${classlist}">
				<tr align="center">
					<td>${cdto.class_name}</td>
					<td>${cdto.class_credit}</td>
					<td>${cdto.teacher_id}</td>
					<td>${cdto.teacher_name}</td>
					<td>${cdto.onday}</td>
					<td>${cdto.ontime}시</td>
					<td>${cdto.classroom}</td>
					<td>${cdto.semester }</td>
					<td><a href="admin_class_del.do?class_code=${cdto.class_code}&semester=${cdto.semester}">삭제</a></td>
				</tr>
			</c:forEach>
		</c:if>
		
		<c:if test="${classlist == null || classlist.size() == 0}">
			<tr>
				<td colspan="9"><h1 align="center">등록된 강의가 없습니다</h1></td>
			</tr>
		</c:if>
		
		<tr align="center">
			<td colspan="9">
				<c:forEach begin="1" end="${pageCount}" var="i">
					<a href="admin_class_list.do?page=${i}"><font size="3">[${i}]</font></a>	
				</c:forEach>
			</td>
		</tr>
	</tbody>
	
</table>

<div align="right">
	<form name="searchClass" action="admin_class_list.do" method="post">
		<select name="dept_id">
			<c:if test="${deptlist.size() != 0}">
				<option value="all">전체보기</option>
				<c:forEach var="ddto" items="${deptlist}">
					<option value="${ddto.dept_id}">[${ddto.dept_id}]${ddto.dept_name}</option>
				</c:forEach>
			</c:if>
			<c:if test="${deptlist.size() == 0}">
				<option value="null">개설된 학과가 없습니다</option>
			</c:if>
		</select>
		<input type="submit" value="검색"/>
	</form>
</div>
					
<%@ include file="../admin_bottom.jsp" %>