<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="top.jsp"%>
	<form name="f" action="changePasswdPro.do" method="post">
		<table>
			<tr>
				<td style="vertical-align: top">
					<br> 비밀번호 변경 후 변경된 비밀번호가 바로 반영됩니다.<br>
					교육부 개인정보보호 지침에 따라 비밀번호는 최소 9자리 이상으로 지정하여야 하며 <br>
					<font color="red"><b>영문자(대소문자 상관없이 영문자 1개이상), 숫자, 특수문자를 모두 포함</b></font>해야 합니다.
					<br><br><br><br>
				</td>
			</tr>
			<tr>
				<th>비밀번호 변경 <br><br></th>
			</tr>
			<tr>
				<td align="center">
					기존 비밀번호 : <input type="password" name="orig_passwd" onkeyup="fn_checkByte(this, 20)"><br><br>
				</td>
			</tr>
			<tr>
				<td align="center">
					새 비밀번호 : <input type="password" name="new_passwd" onkeyup="fn_checkByte(this, 20)"><br><br>
				</td>
			</tr>
			<tr>
				<td align="center">
					비밀번호 확인 : <input type="password" name="new_passwd_ch" onkeyup="fn_checkByte(this, 20)"><br><br>
				</td>
			</tr>
			<tr>
				<td align="center"><input type="submit" value="확인"></td>
			</tr>
		</table>
	</form> <%@ include file="bottom.jsp"%>