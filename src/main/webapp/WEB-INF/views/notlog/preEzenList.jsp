<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="notlog_top.jsp" %>
<html>
	<head>
		<title>예비이젠인리스트</title>
	</head>
		<body>
			<div align="center">
				<br>
					<h2>예비이젠인</h2>
					<hr color="blue">
				<br>
				<table width="500" class="outline">
					<tr align="center">
					</tr>
					<tr>
						<td align="left">
							<input type="image" width="90" height="90" src="resources/img/certificate_image.png" alt="증명서 발급" class="image-button" onclick="location.href='notlog_certificate_domestic.do'">
							<input type="image" width="90" height="90" src="resources/img/admissionGuide.png" alt="입학안내" class="image-button" onclick="location.href='notlog_earlyDecision.do'">
							<input type="image" width="90" height="90" src="resources/img/bus.png" alt="통학버스" class="image-button" onclick="location.href='notlog_campusBus_seoul.do'">
							<input type="image" width="90" height="90" src="resources/img/directions.png" alt="찾아오시는길" class="image-button" onclick="location.href='notlog_campusGuide.do'">
							<input type="image" width="90" height="90" src="resources/img/campusGuide.png" alt="캠퍼스안내" class="image-button" onclick="location.href='notlog_campusGuide.do'">
						</td>
					</tr>		
					<tr height="290">
					</tr>				
				</table>	
			</div>
		</body>
</html>
<%@ include file="notlog_bottom.jsp"%>