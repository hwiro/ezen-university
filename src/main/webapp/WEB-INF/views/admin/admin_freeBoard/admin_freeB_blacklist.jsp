<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<!-- admin_freeB_blacklist.jsp -->

<%@ include file="../admin_top.jsp" %>

<table class="table table-striped" style="font-size:20px;">
	<thead>
		<tr align="center">
			<th>NUM</th>
			<th width="60%">사용자 ID</th>
			<th>차단된 게시판</th>
			<th>차단해제</th>
		</tr>
	</thead>
	
	<tbody>		
		<c:forEach var="dto" items="${list}">
			<tr align="center">
				<td style="overflow:hidden;">${dto.num}</td>
				<td style="overflow:hidden;">${dto.student_id}</td>
				<td style="overflow:hidden;">${dto.board}</td>
				<td style="overflow:hidden;"><a href="admin_freeB_Bdelete.do?student_id=${dto.student_id}">차단해제</a></td>
			</tr>
		</c:forEach>
		
		<c:if test="${list.size() == 0}">
			<tr>
				<td colspan="4" align="center">차단된 유저가 없습니다</td>
			</tr>
		</c:if>
		
		<tr>
			<td colspan="5">간편 차단</td>
		</tr>
		
		<form name="blacklist_insert" action="admin_freeB_Binsert.do" method="post">
			<tr>
				<td colspan="4">
					아이디 : <input type="text" name="student_id" required/>
					<select name="board" required>
						<option value="">차단할 게시판을 선택해주세요</option>
						<option value="freeB">자유게시판</option>
						<option value="majorB">학과게시판</option>
					</select>
					<input type="submit" value="차단"/>
				</td>
			</tr>
		</form>
	</tbody>
</table>

<%@ include file="../admin_bottom.jsp" %>