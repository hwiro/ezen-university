<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<!-- admin_acc_editstudent.jsp -->

<%@ include file="../admin_top.jsp" %>

<h1>학생 계정 수정</h1>

<form name="acc_edit" action="admin_acc_editpro.do?mode=student" method="post">
	<table border="1" width="90%">
	
		<tr>
			<th width="20%">학생 ID</th>
			<td width="80%"><input type="text" name="student_id" value="${dto.student_id}" readOnly/></td>
		</tr>
		
		<tr>
			<th>학생 PW</th>
			<td><input type="password" name="student_pw" value="${dto.student_pw}" required/></td>
		</tr>
		
		<tr>
			<th>이름</th>
			<td><input type="text" name="name" value="${dto.name}" onkeyup="fn_checkByte(this, 20)" readOnly/></td>
		</tr>
		
		<tr>
			<th>학과</th>
			<td>
				<select name="dept" required>
					<option value="${dto.dept}">${dto.dept}</option>
					<c:forEach var="ddto" items="${deptlist}">
						<option value="${ddto.dept_name}">${ddto.dept_name}</option>
					</c:forEach>
				</select>
			</td>
		</tr>
		
		<tr>
			<th>소속대학</th>
			<td><input type="text" name="college" value="${ddto.college}" onkeyup="fn_checkByte(this, 30)" required/></td>
		</tr>
		
		<tr>
			<th>학년</th>
			<td><input type="text" name="grade" value="${dto.grade}" required/></td>
		</tr>
		
		<tr>
			<th>생년월일</th>
			<td><input type="text" name="birthdate" value="${dto.birthdate}" onkeyup="fn_checkByte(this, 20)" required/></td>
		</tr>
		
		<tr>
			<th>전화번호</th>
			<td><input type="text" name="tel" value="${dto.tel}" onkeyup="fn_checkByte(this, 13)" required/></td>
		</tr>
		
		<tr>
			<th>이메일</th>
			<td><input type="text" name="email" value="${dto.email}" onkeyup="fn_checkByte(this, 40)" required/></td>
		</tr>
		
		<tr>
			<th>주소</th>
			<td><textarea name="address" cols="55" rows="7" onkeyup="fn_checkByte(this, 50)">${dto.address}</textarea></td>
		</tr>
		
		<tr>
			<th>재적상태</th>
			<td>
				<select name="status" required>
					<option value="${dto.status}" selected>${dto.status}</option>
					<option value="재학중">재학중</option>
					<option value="휴학중">휴학중</option>
				</select>
			</td>
		</tr>
		
		<tr>
			<th>관리자 메모</th>
			<td><textarea name="memo" cols="55" rows="7" onkeyup="fn_checkByte(this, 100)" required></textarea></td>
		</tr>
		
		<tr>
			<td colspan="2" align="center">
				<input type="hidden" name ="type" value="student"/>
				<input type="submit" value="등록하기"/>
			</td>
		</tr>
	</table>
</form>

<%@ include file="../admin_bottom.jsp" %>