<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- admin_qnaBoard_edit.jsp -->

<%@ include file="../admin_top.jsp" %>

<form name="f" action="admin_qnaBoard_edit_pro.do" method="post">
	<table class="table">
		<tr>
			<td align="center" colspan="2">글 수정</td>
		</tr>
		<tr>
			<th width="20%">제 목</th>
			<td><input type="text" name="qna_title" value="${dto.qna_title}" onkeyup="fn_checkByte(this, 255)"/></td>
		</tr>
		<tr>
			<th width="20%">내 용</th>
			<td><textarea name="content" rows="11" cols="50" onkeyup="fn_checkByte(this, 2000)">${dto.content}</textarea></td>
		</tr>
		<tr>
			<td align="center" colspan="2">
				<input type="submit" value="글쓰기"/>
				<input type="reset" value="다시작성"/>
				<input type="button" value="목록보기" onclick="window.location='admin_qnaBoard_list.do?mode=all&page=1'; return false;"/>
				<input type="hidden" name="qna_code" value="${dto.qna_code}"/>
			</td>
		</tr>
	</table>
</form>

<%@ include file="../admin_bottom.jsp" %>