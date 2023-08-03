<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<!-- class_apply_detail.jsp -->

<%@ include file="class_apply_top.jsp" %>

<div>
	<form name="apply_class" action="class_apply_pro.do" method="post">
		<table width="100%" height="660px">
			<tr style="height:10px;">
				<td colspan="7" align="left">강의 : ${dto.class_name}</td>
			</tr>
			
			<tr style="height:10px;">
				<td width="30%" colspan="3">강의명</td>
				<td width="70%" colspan="4">${dto.class_name}</td>
			</tr>
			
			<tr style="height:10px;">
				<td width="30%" colspan="3">강의명</td>
				<td width="70%" colspan="4">${dto.dept_name}</td>
			</tr>
			
			<tr style="height:10px;">
				<td width="30%" colspan="3">지도교수</td>
				<td width="70%" colspan="4">${dto.teacher_name}</td>
			</tr>
			
			<tr style="height:10px;">
				<td width="30%" colspan="3">강의 요일</td>
				<td width="70%" colspan="4">${dto.onday}</td>
			</tr>
			
			<tr style="height:10px;">
				<td width="30%" colspan="3">강의 시간 (24시간 기준)</td>
				<td width="70%" colspan="4">${dto.ontime}시</td>
			</tr>
			
			<tr style="height:10px;">
				<td width="30%" colspan="3">강의실</td>
				<td width="70%" colspan="4">${dto.classroom}</td>
			</tr>
			
			<tr>
				<td colspan="7"><input type="hidden" name="num" value="${dto.class_code}"/></td>
			</tr>
			
			<tr style="height:10px;">
				<td colspan="7" align="right">
					<button onclick="javascript:apply()" style="font-size:24px;">신청하기</button>
				</td>
			</tr>
		</table>
	</form>
</div>

<%@ include file="class_apply_bottom.jsp" %>