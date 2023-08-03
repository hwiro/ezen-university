<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<!-- admin_acc_editstaff.jsp -->

<%@ include file="../admin_top.jsp" %>

<h1>교직원 정보 수정</h1>

<form name="acc_edit" action="admin_acc_editpro.do?mode=staff" method="post">
	<table border="1" width="90%">
	
		<tr>
			<th width="20%">교직원 ID</th>
			<td width="80%"><input type="text" name="staff_id" value="${dto.staff_id}" readOnly/></td>
		</tr>
		
		<tr>
			<th>교직원 PW</th>
			<td><input type="password" name="staff_pw" value="${dto.staff_pw}" readOnly/></td>
		</tr>
		
		<tr>
			<th>이름</th>
			<td><input type="text" name="name" value="${dto.name}" onkeyup="fn_checkByte(this, 20)" required/></td>
		</tr>
		
		<tr>
			<th>권한</th>
			<td><input type="text" name="authority_level" value="${dto.authority_level}" onkeyup="fn_checkByte(this, 50)" required/></td>
		</tr>
		
		<tr>
			<th>생년월일</th>
			<td><input type="text" name="birthdate" value="${dto.birthdate}" onkeyup="fn_checkByte(this, 20)"/></td>
		</tr>
		
		<tr>
			<th>전화번호</th>
			<td><input type="text" name="tel" value="${dto.tel}" onkeyup="fn_checkByte(this, 13)"/></td>
		</tr>
		
		<tr>
			<th>주소</th>
			<td><input type="text" name="address" value="${dto.address}" onkeyup="fn_checkByte(this, 50)"/></td>
		</tr>
		
		<tr>
			<th>이메일</th>
			<td><input type="text" name="email" value="${dto.email}" onkeyup="fn_checkByte(this, 40)"/></td>
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