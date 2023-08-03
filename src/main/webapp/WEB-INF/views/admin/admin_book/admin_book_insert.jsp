<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<!-- admin_book_insert.jsp -->

<%@ include file="../admin_top.jsp" %>

<script type="text/javascript">
	function insert() {
		document.book_insert.action = 'admin_book_insert_pro.do';
		document.book_insert.submit();
	}
	function edit() {
		document.book_insert.action = 'admin_book_edit_pro.do';
		document.book_insert.submit();
	}
</script>

<c:if test="${mode == 'insert'}">
	<h1>새 도서 등록</h1>
</c:if>

<c:if test="${mode == 'edit'}">
	<h1>도서 수정</h1>
</c:if>

<form name="book_insert" action="" method="post" enctype="multipart/form-data">
	<table border="1" width="80%">
	
		<tr>
			<th width="20%">도서 isbn코드</th>
			<td width="80%">
				<c:if test="${mode == 'insert'}">
					<input type="text" name="book_id" onkeyup="fn_checkByte(this, 20)" required/>
				</c:if>
				<c:if test="${mode == 'edit'}">
					<input type="text" name="book_id" value="${bdto.book_id}" readOnly/>
				</c:if>
			</td>
		</tr>
		
		<tr>
			<th width="20%">도서 제목</th>
			<td width="80%"><input type="text" name="book_title" value="${bdto.book_title}" onkeyup="fn_checkByte(this, 30)" required/></td>
		</tr>
		
		<tr>
			<th>장르</th>
			<td><input type="text" name="genre" value="${bdto.genre}" onkeyup="fn_checkByte(this, 20)" required/></td>
		</tr>
		
		<tr>
			<th>저자</th>
			<td><input type="text" name="author" value="${bdto.author}" onkeyup="fn_checkByte(this, 20)" required/></td>
		</tr>
		
		<tr>
			<th>출판사</th>
			<td><input type="text" name="publisher" value="${bdto.publisher}" onkeyup="fn_checkByte(this, 20)" required/></td>
		</tr>
		
		<tr>
			<th>이미지</th>
			<td>
				<input type="file" name="image"/>
				<input type="hidden" name="image2" value="${bdto.image}"/>
			</td>
		</tr>
		
		<tr>
			<th>도서 개요</th>
			<td><textarea name="book_intro" cols="50" rows="15" onkeyup="fn_checkByte(this, 1000)" required>${bdto.book_intro}</textarea></td>
		</tr>
		
		<tr>
			<th>관리자 메모(사유)</th>
			<td><textarea name="memo" cols="55" rows="7" onkeyup="fn_checkByte(this, 100)" required></textarea></td>
		</tr>
		
		<tr>
			<td colspan="2" align="center">
				<c:if test="${mode == 'insert'}">
					<button onclick="javascript:insert()">등록하기</button>
				</c:if>
				<c:if test="${mode == 'edit'}">
					<button onclick="javascript:edit()">수정하기</button>
				</c:if>
			</td>
		</tr>
	</table>
</form>

<%@ include file="../admin_bottom.jsp" %>