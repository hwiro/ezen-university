<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<!-- admin_infoBoard_insert.jsp -->

<%@ include file="../admin_top.jsp" %>

<script type="text/javascript">
	function chooseMode(frm) {
		frm.action = "admin_infoBoard_edit_pro.do";
		frm.submit();
		return true;
	}
</script>

<c:if test="${mode == 'insert'}">
	<h1>새 공지 등록</h1>
</c:if>

<c:if test="${mode == 'edit'}">
	<h1>공지 수정</h1>
</c:if>

<form name="info_do" action="admin_infoBoard_insert_pro.do" method="post" enctype="multipart/form-data">
	<table border="1" width="100%" style="table-layout:fixed">
	
		<tr>
			<th width="25%">공지 제목</th>
			<td width="75%"><input type="text" name="info_title" value="${ldto.info_title}" onkeyup="fn_checkByte(this, 255)" required/></td>
		</tr>
		
		<tr>
			<th width="25%">작성자</th>
			<td width="75%"><input type="text" name="writer" value="${sessionScope.id}" readOnly/></td>
		</tr>
		
		<tr>
			<th width="25%">게시판 선택</th>
			<td width="75%">
				<c:if test="${ldto.type != null}">
					<input type="text" name="type" value="${ldto.type}" readOnly/>
				</c:if>
				<c:if test="${ldto == null}">
					<select name="type" required>
						<option value="">작성할 게시판을 선택 해 주세요</option>
						<option value="infoEvent">행사공지</option>
						<option value="infoLib">도서공지</option>
						<option value="infoLecture">특강공지</option>
						<option value="infoScholar">장학공지</option>
					</select>
				</c:if>
			</td>
		</tr>
		
		<tr>
			<th>내용</th>
			<td><textarea cols="70%" rows="8" name="content"  onkeyup="fn_checkByte(this, 2000)">${ldto.content}</textarea></td>
		</tr>
		
		<tr>
			<th>이미지</th>
			<td>
				<input type="file" name="image"/>
				<input type="hidden" name="image2" value="${ldto.image}"/>
			</td>
		</tr>
		
		<tr>
			<th>첨부파일</th>
			<td><input type="file" name="original_name" multiple="multiple"/></td>
		</tr>
		
		<tr>
			<th>관리자 메모(사유)</th>
			<td><textarea name="memo" cols="70%" rows="7" onkeyup="fn_checkByte(this, 100)" required></textarea></td>
		</tr>
		
		<tr>
			<td colspan="2" align="center">
				<input type="hidden" name="info_code" value="${ldto.info_code}"/>
				<c:if test="${mode == 'insert'}">
					<input type="submit" value="제출"/>
				</c:if>
				<c:if test="${mode == 'edit'}">
					<input type="button" value="제출" onclick="return chooseMode(this.form);"/>
				</c:if>
			</td>
		</tr>
	</table>
</form>


<%@ include file="../admin_bottom.jsp" %>