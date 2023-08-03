<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<!-- admin_book_list.jsp -->

<%@ include file="../admin_top.jsp" %>

<h1>도서 관리</h1>

<div align="right">
	<button onclick="location.href='admin_book_insert.do'">새 도서 등록</button>
</div>

<table border="1" class="table table-striped">
	<thead>
		<tr>
			<th width="15%">도서번호</th>
			<th width="20%">도서이름</th>
			<th width="17%">저자</th>
			<th width="17%">출판사</th>
			<th width="17%">입고일</th>
			<th width="19%">수정|삭제</th>
		</tr>
	</thead>
	
	<tbody>
		<c:if test="${booklist != null || booklist.size() != 0}">
			<c:forEach var="bdto" items="${booklist}">
				<tr align="center">
					<td>${bdto.book_id}</td>
					<td><a href="admin_book_view?book_id=${bdto.book_id}">${bdto.book_title}</a></td>
					<td>${bdto.author}</td>
					<td>${bdto.publisher}</td>
					<td>${bdto.regdate}</td>
					<td>
					<a href="admin_book_edit.do?book_id=${bdto.book_id}">수정</a>
					|
					<a href="admin_book_del.do?book_id=${bdto.book_id}">삭제</a>
					</td>
				</tr>
			</c:forEach>
		</c:if>
		
		<c:if test="${booklist == null || booklist.size() == 0}">
			<tr>
				<td colspan="6"><h1 align="center">등록된 책이 없습니다</h1></td>
			</tr>
		</c:if>
		
		<tr align="center">
			<td colspan="6">
				<c:forEach begin="1" end="${pageCount}" var="i">
					<a href="admin_book_list.do?page=${i}"><font size="3">[${i}]</font></a>	
				</c:forEach>
			</td>
		</tr>
	</tbody>
	
</table>
					
<%@ include file="../admin_bottom.jsp" %>