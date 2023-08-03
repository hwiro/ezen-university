<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<!-- login_pwFind.jsp -->

<%@ include file="login_top.jsp" %>

<div align="center">
	<h2>비밀번호 찾기</h2><br>
	<h4>비밀번호 찾기를 위한 아이디를 입력 해 주세요</h4><br>
	<form name="pwFind" action="ezenUnivLinkConfirm.do" method="post">
		<input type="text" name="id" placeholder="ID" required/>
		<input type="submit" value="제출"/>
	</form>
</div>
					
<%@ include file="login_bottom.jsp" %>