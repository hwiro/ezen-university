<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="notlog_top.jsp" %>
<html>
	<head>
		<title>재학생리스트</title>
	</head>
		<body>
			<div align="center">
				<br>
				<h2>재학생</h2>
				<hr color="blue">
				<br>
					<table width="500" class="outline">
						<tr align="center"> 				
						</tr>
						<tr>
							<td align="left">
							&nbsp;&nbsp;
								<input type="image" width="90" height="90" src="resources/img/portal3.png" alt="포털" class="image-button" onclick="location.href='login_main.do'">
								<input type="image" width="90" height="90" src="resources/img/huhak.png" alt="휴학/복학" class="image-button" onclick="location.href='notlog_hyuhak.do'">
								<input type="image" width="90" height="90" src="resources/img/scholarship.png" alt="장학금" class="image-button" onclick="location.href='notlog_schoolScholarship.do'" >
								<input type="image" width="90" height="90" src="resources/img/bus.png" alt="통학버스" class="image-button" onclick="location.href='notlog_campusBus_seoul.do'">
								<input type="image" width="90" height="90" src="resources/img/sungjuk.png" alt="성적" class="image-button" onclick="location.href='login_main.do'">&nbsp;&nbsp;
								<input type="image" width="90" height="90" src="resources/img/community.png" alt="커뮤니티" class="image-button" onclick="location.href='login_main.do'">			
							</td>
						</tr>
						<tr height="200">
						</tr>		
					</table>
			</div>
		</body>
</html>
<%@ include file="notlog_bottom.jsp"%>