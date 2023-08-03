<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<!-- admin_acc_insertadmin.jsp -->

<%@ include file="../admin_top.jsp" %>

<h1>새 관리자 계정 등록</h1>

<form name="acc_insert" action="admin_acc_insertpro.do?mode=admin" method="post">
	<table border="1" width="90%">
	
		<tr>
			<th width="20%">관리자 ID</th>
			<td width="80%"><input type="text" name="admin_id" onkeyup="fn_checkByte(this, 20)" required/></td>
		</tr>
		
		<tr>
			<th>관리자 PW</th>
			<td><input type="text" name="admin_pw" onkeyup="fn_checkByte(this, 20)" required/></td>
		</tr>
		
		<tr>
			<th>이름</th>
			<td><input type="text" name="name" onkeyup="fn_checkByte(this, 20)" required/></td>
		</tr>
		
		<tr>
			<th>권한</th>
			<td>
				<select name="authority_level" required>
					<option value="" selected>관리자 권한을 선택 해 주세요</option>
					<option value="도서관리자">도서관리자</option>
					<option value="학과관리자">학과관리자</option>
					<option value="계정관리자">계정관리자</option>
					<option value="게시판관리자">게시판관리자</option>
				</select>
			</td>
		</tr>
		
		<tr>
			<th>관리자 메모</th>
			<td><textarea name="memo" cols="55" rows="7" onkeyup="fn_checkByte(this, 100)"></textarea></td>
		</tr>
		
		<tr>
			<td colspan="2" align="center">
				<input type="submit" value="등록하기"/>
			</td>
		</tr>
	</table>
</form>

<%@ include file="../admin_bottom.jsp" %>