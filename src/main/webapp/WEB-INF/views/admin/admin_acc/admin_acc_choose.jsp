<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<!-- admin_acc_choose.jsp -->

<%@ include file="../admin_top.jsp" %>

<h1>수정할 계정 타입 선택</h1>

<div align="center">
	<button onclick="location.href='admin_acc_list.do?mode=admin&page=1'" 
	style="width: 200px; height: 50px"><font size="4">관리자 계정</font></button><br><br>
	
	<button onclick="location.href='admin_acc_list.do?mode=staff&page=1'" 
	style="width: 200px; height: 50px"><font size="4">교직원 계정</font></button><br><br>
	
	<button onclick="location.href='admin_acc_list.do?mode=teacher&page=1'" 
	style="width: 200px; height: 50px"><font size="4">교수 계정</font></button><br><br>
	
	<button onclick="location.href='admin_acc_list.do?mode=student&page=1'" 
	style="width: 200px; height: 50px"><font size="4">학생 계정</font></button>
</div>

<%@ include file="../admin_bottom.jsp" %>