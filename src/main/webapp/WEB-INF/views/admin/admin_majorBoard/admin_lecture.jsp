<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<%@ include file="../admin_top.jsp" %>
<h3 align="center">강의 게시판</h3>
<form name="f" action="admin_majorBoard.do" method="post">
	<table align="center">
		<tr>
			<td>&nbsp;&nbsp;&nbsp; <select name="class_code">
					<c:forEach var="dto" items="${list }">
						<option value="${dto.class_code }">${dto.class_name }</option>
					</c:forEach>
			</select> <input type="submit" value="조회">
			</td>
		</tr>
	</table>
</form>
<%@ include file="../admin_bottom.jsp"%>