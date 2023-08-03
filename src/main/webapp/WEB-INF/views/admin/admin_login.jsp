<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<!-- admin_login.jsp -->

<html>
<head>
	<meta charset="UTF-8">
	<title>이젠대학교 관리자 로그인</title>
</head>
<body>
	<div align="center" style="vertical-align: center">
		<form name="login_admin" action="admin_login_pro.do" method="post">
			<table border="1" width="600" height="400">
					<tr>
						<th colspan="2"><h1>관리자 로그인</h1></th>
					</tr>
					<tr>
						<th>아이디</th>
						<td><input type="text" name="admin_id" required/></td>
					</tr>
					
					<tr>
						<th>비밀번호</th>
						<td><input type="password" name="admin_pw" required/></td>
					</tr>
					
					<tr>
						<td colspan="2" align="center">
							<input type="submit" value="로그인"/>
						</td>
					</tr>
			</table>
		</form>
	</div>
</body>
</html>