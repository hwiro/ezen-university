<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- admin_contentBoard.jsp -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../admin_top.jsp" %>

<head>
<script type="text/javascript">
function check(){
	if (f.content.value==""){
		alert("내용을 입력해 주세요!!")
		f.content.focus()
		return false
	}
	return true
}
</script>
</head>
<table class="table">
	
	<tr>
		<td colspan="5">${getBoard.subject}</td>
	</tr>
	
	<tr>
		<td colspan="5">
			<a href="admin_update_major_board.do?major_board_code=${getBoard.major_board_code}">수정하기</a>
			|
			<a href="admin_delete_major_board.do?major_board_code=${getBoard.major_board_code}&image=${getBoard.image }">삭제하기</a>
		</td>
	</tr>
	
	<tr>
		<td colspan="3">${getBoard.writer}</td>
		<td>작성일: ${getBoard.reg_date}</td>
		<td>조회수: ${getBoard.readcount}</td>
	</tr>
	
	<tr>
		<td colspan="5" height="30%" align="center" style="word-break:break_all; padding:0;">
			<c:if test="${getBoard.image != 'none'}">
				<img src="${path }/${getBoard.image}" style="max-height:300px; max-width:400px"><br>
			</c:if>
			<textarea style="text-align:left; white-space:pre-wrap; height:300px;" cols="100%" readOnly>${getBoard.content}</textarea>
		</td>
	</tr>
	
	<c:if test="${replyList != null && replyList.size() != 0}">
		<c:forEach var="rvdto" items="${replyList}">
			<tr style="height:20px;">
				<td align="center" width="10" nowrap>${rvdto.writer}</td>
				<td>${rvdto.content}</td>
				<td align="center" width="100"><fmt:formatDate value="${rvdto.reg_date}" pattern="yyyy-MM-dd" /></td>
				<td align="center" width="10" style="font-size:14px">
					<a href="admin_delete_reply_mb.do?rno=${rvdto.rno}&major_board_code=${getBoard.major_board_code }">삭제</a>
				</td>
			</tr>
		</c:forEach>
	</c:if>
	
	<c:if test="${replyList == null || replyList.size() == 0}">
		<tr>
			<td colspan="5">작성된 댓글이 없습니다</td>
		</tr>
	</c:if>
	
	<tr>
		<td colspan="5"></td>
	</tr>
</table>
<form name="f" action="admin_major_board_reWrite.do" method="post" onsubmit="return check()">
	<input type="hidden" name="major_board_code"
		value="${getBoard.major_board_code }" />
	<div>
		<label for="content"></label> <input type="text" id="content" name="content" placeholder="댓글 내용을 입력하세요." />
	</div>
	<div align="right">
	<br>
		<button type="submit" class="btn btn-outline-primary">작성</button>
	</div>
</form>
<%@ include file="../admin_bottom.jsp" %>