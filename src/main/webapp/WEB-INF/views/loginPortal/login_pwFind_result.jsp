<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<!-- login_pwFind_result.jsp -->

<%@ include file="login_top.jsp" %>

<div align="center">
	<table style="border-collapse:collapse; width:1280px;">
		<tr>
			<td colspan="2" height="150">
				<div align="center">
					<h2>해당 이메일을 가진 아이디 정보입니다</h2>
				</div>
			</td>
		</tr>
		
		<tr style="height:15px;">
			<td align="center" width="50%">이름[아이디]</td>
			<td align="center" width="50%">비밀번호</td>
		</tr>
			
		<c:forEach var="dto" items="${list}">
			<tr style="height:15px;">
				<td align="center">${dto.name}[${dto.student_id}]</td>
				<td align="center">${dto.student_pw}</td>
			</tr>
		</c:forEach>
	</table>
</div>
	
<%@ include file="login_bottom.jsp" %>