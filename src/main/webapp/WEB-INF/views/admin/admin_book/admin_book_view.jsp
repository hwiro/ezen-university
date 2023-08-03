<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<!-- admin_book_view.jsp -->

<%@ include file="../admin_top.jsp" %>

<h1>도서 : '${bdto.book_title}'의 정보</h1>

<table class="table table-striped">
	<tr>
		<th width="20%">도서 isbn코드</th>
		<td width="80%">${bdto.book_id}</td>
	</tr>
	
	<tr>
		<th width="20%">도서 제목</th>
		<td width="80%">${bdto.book_title}</td>
	</tr>
	
	<tr>
		<th>장르</th>
		<td>${bdto.genre}</td>
	</tr>
	
	<tr>
		<th>저자</th>
		<td>${bdto.author}</td>
	</tr>
	
	<tr>
		<th>출판사</th>
		<td>${bdto.publisher}</td>
	</tr>
	
	<tr>
		<th>이미지</th>
		<td><img src="resources/book_img/${bdto.image}" width="140" height="100"></td>
	</tr>
	
	<tr>
		<th>도서 개요</th>
		<td><textarea name="book_intro" cols="50" rows="15" readOnly>${bdto.book_intro}</textarea></td>
	</tr>
</table>

<%@ include file="../admin_bottom.jsp" %>