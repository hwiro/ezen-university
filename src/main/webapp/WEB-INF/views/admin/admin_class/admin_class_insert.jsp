<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<!-- admin_class_insert.jsp -->

<%@ include file="../admin_top.jsp" %>

<h1>새 강의 개설</h1>

<form name="book_insert" action="admin_class_insert_pro.do" method="post">
	<table border="1" width="80%">
	
		<tr>
			<th width="25%">강의 이름</th>
			<td width="75%"><input type="text" name="class_name" onkeyup="fn_checkByte(this, 50)" required/></td>
		</tr>
		
		<tr>
			<th width="25%">학과</th>
			<td width="75%">
				<select name="dept_id">
					<c:if test="${deptlist.size() != 0}">
						<c:forEach var="ddto" items="${deptlist}">
							<option value="${ddto.dept_id}">[${ddto.dept_id}]${ddto.dept_name}</option>
						</c:forEach>
					</c:if>
					<c:if test="${deptlist.size() == 0}">
						<option value="null">개설된 학과가 없습니다</option>
					</c:if>
				</select>
			</td>
		</tr>
		
		<tr>
			<th>학점</th>
			<td><input type="text" name="class_credit" required/></td>
		</tr>
		
		<tr>
			<th>담당교수</th>
			<td>
				<select name="teacher_id">
					<option value="">담당 교수를 선택 해 주세요</option>
					<c:forEach var="tdto" items="${teachList}">
						<option value="${tdto.teacher_id}">${tdto.name}</option>
					</c:forEach>
				</select>
			</td>
		</tr>
		
		<tr>
			<th>강의일</th>
			<td><input type="text" name="onday" onkeyup="fn_checkByte(this, 20)" required/><h5>* 월,화,수,목,금 이렇게 ,로 구별자를 넣어주세요</h5></td>
		</tr>
		
		<tr>
			<th>강의시간</th>
			<td><input type="number" name="ontime" required/><h5>* 24시간 기준</h5></td>
		</tr>
		
		<tr>
			<th>강의실</th>
			<td><input type="text" name="classroom" onkeyup="fn_checkByte(this, 20)" required/></td>
		</tr>
		
		<tr>
			<th>학기</th>
			<td><input type="text" name="semester" value="${semester}" onkeyup="fn_checkByte(this, 30)" required/></td>
		</tr>
		
		<tr>
			<th>교양 여부</th>
			<td>해당한다 : <input type="checkbox" name="course" value="yes"/></td>
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