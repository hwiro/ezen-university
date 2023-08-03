<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<!-- admin_freeB_view.jsp -->

<%@ include file="../admin_top.jsp" %>

<table class="table">
	
	<tr>
		<td colspan="5">${vdto.subject}</td>
	</tr>
	
	<tr>
		<td colspan="5">
			<a href="admin_freeB_edit.do?code=${vdto.etc_board_code}">수정하기</a>
			|
			<a href="admin_freeB_delete.do?code=${vdto.etc_board_code}&image=${vdto.image}">삭제하기</a>
		</td>
	</tr>
	
	<tr>
		<td colspan="3">${vdto.writer}</td>
		<td>작성일: ${vdto.reg_date}</td>
		<td>조회수: ${vdto.readcount}</td>
	</tr>
	
	<tr>
		<td colspan="5" height="30%" align="center" style="word-break:break_all; padding:0;">
			<c:if test="${vdto.image != 'none'}">
				<img src="resources/freeB_img/${vdto.image}" style="max-height:300px; max-width:400px"><br>
			</c:if>
			<textarea style="text-align:left; white-space:pre-wrap; height:300px;" cols="100%" readOnly>${vdto.content}</textarea>
			<br>
			<img src="resources/img/favicons/thumbsup.png" width="25px" height="25px">
			<h4>추천수:${vdto.thumb}</h4>
		</td>
	</tr>
	
	<c:if test="${relist != null && relist.size() != 0}">
		<c:forEach var="rvdto" items="${relist}">
			<tr style="height:20px;">
				<td align="center" width="10" nowrap>${rvdto.writer}</td>
				<td>${rvdto.content}</td>
				<td align="center" width="10">${rvdto.reg_date}</td>
				<td align="center" width="10">${rvdto.ip}</td>
				<td align="center" width="10" style="font-size:14px">
					<a href="freeB_reply_delete.do?code=${rvdto.etc_board_reply_code}&id=${rvdto.writer_id}&ref_group=${rvdto.ref_group}">삭제</a>
				</td>
			</tr>
		</c:forEach>
	</c:if>
	
	<c:if test="${relist == null || relist.size() == 0}">
		<tr>
			<td colspan="5">작성된 댓글이 없습니다</td>
		</tr>
	</c:if>
	
	<tr>
		<td colspan="5"></td>
	</tr>

</table>

<%@ include file="../admin_bottom.jsp" %>