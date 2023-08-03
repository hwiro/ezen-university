<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<!-- login_pwFind_emailSent.jsp -->

<%@ include file="login_top.jsp" %>

<div align="center">
	<h2>본인인증</h2><br>
	<h4>계정에 저장된 이메일로 인증링크가 전송되었습니다.<br>인증링크를 확인한 뒤, 확인버튼을 눌러주세요.</h4><br>
	<img src="resources/img/happycat.gif"><br>
	<form name="emailConfirm" action="ezenUnivLinkConfirmCheck.do" method="post">
		<input type="hidden" name="email" value="${email}"/>
		<input type="submit" value="확인"/>
	</form>
</div>
					
<%@ include file="login_bottom.jsp" %>