<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<!-- admin_infoBoard_view.jsp -->

<%@ include file="../admin_top.jsp" %>

<table border="1" width="100%" style="font-size:20px;">
	
	<tr style="height:10px;">
		<td colspan="5">${dto.info_title}</td>
	</tr>
	
	<tr style="height:10px;">
		<td colspan="3">${dto.writer}</td>
		<td>작성일: ${dto.reg_date}</td>
		<td>조회수: ${dto.readcount}</td>
	</tr>
	
	<tr>
		<td colspan="5" height="30%" align="center" style="word-break:break_all;padding:0;">
			<c:if test="${dto.image != 'none'}">
				<img src="resources/infoBoard_img/${dto.image}" style="max-height:300px; max-width:400px"><br>
			</c:if>
			<textarea style="width:675px; height:350px; text-align:left; font-size:20px; white-space:pre-wrap;">${dto.content}</textarea>
		</td>
	</tr>
	
	<tr>
		<td colspan="5">
			<c:forEach var="fdto" items="${filelist}">
				<a href="admin_infoBoard_download.do?name=${fdto.save_name}&type=${type}&info_code=${dto.info_code}">${fdto.original_name}</a><br>
			</c:forEach>
		</td>
	</tr>
</table>

<%@ include file="../admin_bottom.jsp" %>