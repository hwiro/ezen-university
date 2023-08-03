<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="top.jsp" %>
<script type="text/javascript">
	function checkPasswd(){
		if(document.f.passwd.value == "" || document.f.passwd.value != "${accStudent.student_pw}"){
			alert("비밀번호를 다시 입력해주세요")
			f.passwd.focus()
			return false;
		}
		if(document.f.passwd.value == "${accStudent.student_pw}") document.f.submit()
	}
</script>
<form name="f" action="editInfoForm.do" method="post"> 
	<table align="center">
		<tr> 
			<th width="20%">비밀번호를 입력해주세요</th>
		</tr>
		<tr>
			<td width="30%" align="center">입력 : <input type="password" name="passwd" onkeyup="fn_checkByte(this, 20)"></td>
		</tr>
		<tr>
			<td align="center"><input type="button" value="전송" onclick="checkPasswd()"></td>
		</tr>
	</table>
</form>
<%@ include file="bottom.jsp" %>