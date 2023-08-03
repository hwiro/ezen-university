<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<!-- admin_acc_insertstaff.jsp -->

<%@ include file="../admin_top.jsp" %>

<h1>새 교직원 계정 등록</h1>

<form name="acc_insert" action="admin_acc_insertpro.do?mode=staff" method="post">
	<table border="1" width="90%">
	
		<tr>
			<th width="20%">교직원 ID</th>
			<td width="80%"><input type="text" name="staff_id" onkeyup="fn_checkByte(this, 20)" required/></td>
		</tr>
		
		<tr>
			<th>교직원 PW</th>
			<td><input type="text" name="staff_pw" onkeyup="fn_checkByte(this, 20)" required/></td>
		</tr>
		
		<tr>
			<th>이름</th>
			<td><input type="text" name="name" onkeyup="fn_checkByte(this, 20)" required/></td>
		</tr>
		
		<tr>
			<th>권한</th>
			<td><input type="text" name="authority_level" onkeyup="fn_checkByte(this, 50)" required/></td>
		</tr>
		
		<tr>
			<th>생년월일</th>
			<td><input type="text" name="birthdate" onkeyup="fn_checkByte(this, 20)" required/></td>
		</tr>
		
		<tr>
			<th>전화번호</th>
			<td><input type="text" name="tel" onkeyup="fn_checkByte(this, 13)" required/></td>
		</tr>
		
		<tr>
			<th>주소</th>
			<td><input type="text" name="address" onkeyup="fn_checkByte(this, 50)" required/></td>
		</tr>
		
		<tr>
			<th>이메일</th>
			<td><input type="text" name="email" onkeyup="fn_checkByte(this, 40)" required/></td>
		</tr>
		
		<tr>
			<th>관리자 메모</th>
			<td><textarea name="memo" cols="55" rows="7" onkeyup="fn_checkByte(this, 100)"></textarea></td>
		</tr>
		
		<tr>
			<td colspan="2" align="center">
				<input type="hidden" name ="type" value="staff"/>
				<input type="submit" value="등록하기"/>
			</td>
		</tr>
	</table>
</form>

<%@ include file="../admin_bottom.jsp" %>