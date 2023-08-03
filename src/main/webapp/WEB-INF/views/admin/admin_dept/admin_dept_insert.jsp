<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<!-- admin_dept_insert.jsp -->

<%@ include file="../admin_top.jsp" %>

<h1>새 학과 개설</h1>

<form name="book_insert" action="admin_dept_insert_pro.do" method="post">
	<table border="1" width="80%">
	
		<tr>
			<th width="20%">전공코드</th>
			<td width="80%"><input type="text" name="dept_id" onkeyup="fn_checkByte(this, 20)" required/></td>
		</tr>
		
		<tr>
			<th>학과이름</th>
			<td><input type="text" name="dept_name" onkeyup="fn_checkByte(this, 50)" required/></td>
		</tr>
		
		<tr>
			<th>학과장 이름</th>
			<td><input type="text" name="dept_head" onkeyup="fn_checkByte(this, 20)" required/></td>
		</tr>
		
		<tr>
			<th>학과장 연락처</th>
			<td><input type="text" name="dept_tel" onkeyup="fn_checkByte(this, 13)" required/><h5>* - 없이 입력하세요</h5></td>
		</tr>
		
		<tr>
			<th>학과 위치</th>
			<td><textarea name="dept_location" cols="50" rows="15" onkeyup="fn_checkByte(this, 200)" required></textarea></td>
		</tr>
		
		<tr>
			<th>단과대 여부</th>
			<td>해당한다 : <input type="checkbox" name="issingle" value="ㅇ"/></td>
		</tr>
		
		<tr>
			<th>관리자 메모(사유)</th>
			<td><input type="text" name="memo" onkeyup="fn_checkByte(this, 100)" required/></td>
		</tr>
		
		<tr>
			<td colspan="2" align="center">
				<input type="submit" value="제출"/>
			</td>
		</tr>
	</table>
</form>

<%@ include file="../admin_bottom.jsp" %>