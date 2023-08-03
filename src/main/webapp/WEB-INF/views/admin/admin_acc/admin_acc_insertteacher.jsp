<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<!-- admin_acc_insertteacher.jsp -->

<%@ include file="../admin_top.jsp" %>

<h1>새 교수 계정 등록</h1>

<form name="acc_insert" action="admin_acc_insertpro.do?mode=teacher" method="post">
	<table border="1" width="90%">
	
		<tr>
			<th width="20%">교수 ID</th>
			<td width="80%"><input type="text" name="teacher_id" onkeyup="fn_checkByte(this, 20)" required/></td>
		</tr>
		
		<tr>
			<th>교수 PW</th>
			<td><input type="text" name="teacher_pw" onkeyup="fn_checkByte(this, 20)" required/></td>
		</tr>
		
		<tr>
			<th>이름</th>
			<td><input type="text" name="name" onkeyup="fn_checkByte(this, 20)" required/></td>
		</tr>
		
		<tr>
			<th>학과</th>
			<td>
				<select name="dept" required>
					<option value="">학과를 선택 해 주세요</option>
					<c:forEach var="ddto" items="${deptlist}">
						<option value="${ddto.dept_name}">${ddto.dept_name}</option>
					</c:forEach>
				</select>
			</td>
		</tr>
		
		<tr>
			<th>약력</th>
			<td><textarea name="history" cols="55" rows="7" onkeyup="fn_checkByte(this, 1000)"></textarea></td>
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
			<td><textarea name="address" cols="55" rows="7" onkeyup="fn_checkByte(this, 1000)"></textarea></td>
		</tr>
		
		<tr>
			<th>이메일</th>
			<td><input type="text" name="email" onkeyup="fn_checkByte(this, 40)" required/></td>
		</tr>
		
		<tr>
			<th>관리자 메모</th>
			<td><textarea name="memo" cols="55" rows="7" onkeyup="fn_checkByte(this, 100)" required></textarea></td>
		</tr>
		
		<tr>
			<td colspan="2" align="center">
				<input type="hidden" name ="type" value="teacher"/>
				<input type="submit" value="등록하기"/>
			</td>
		</tr>
	</table>
</form>

<%@ include file="../admin_bottom.jsp" %>