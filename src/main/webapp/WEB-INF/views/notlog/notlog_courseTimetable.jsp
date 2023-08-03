<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- notlog_courseTimetable.jsp -->
<%@ include file="notlog_top.jsp" %>
<html>
	<head>
		<title>수업시간표 안내</title>
		
		<script>
			function showTableOfContents(tocId) {
				var allToc = document.querySelectorAll(".toc");
					for (var i = 0; i < allToc.length; i++) {
						allToc[i].style.display = "none";
					}
		 			var toc = document.getElementById(tocId);
						toc.style.display = "block";
		        }
		
			function hideTableOfContents() {
				var allToc = document.querySelectorAll(".toc");
					for (var i = 0; i < allToc.length; i++) {
						allToc[i].style.display = "none";
					}
				}
		</script>	
		
	</head>
	<br><br><br><br>
	<body>
		<div align="center">
			<h1>학사소개&nbsp;<img src="resources/img/lowerButton.png" alt="내리기 버튼" onmouseover="showTableOfContents('toc9')" onmouseout="setTimeout(function() { hideTableOfContents('') }, 5000)"></h1>
			<h2>수업시간표 안내<img src="resources/img/lowerButton.png" alt="내리기 버튼" onmouseover="showTableOfContents('toc8')" onmouseout="setTimeout(function() { hideTableOfContents('') }, 5000)"></h2>
		<div id="toc9" class="toc hidden" >
	 	 	<table>
	 	 		<tr>
 					<th>
 						<ul>
 							<li><p><a href="notlog_schoolCalender.do" ><i class="bi bi-dot"></i>학사일정</a></p></li>
 							<li><p><a href="notlog_majorRelated.do" ><i class="bi bi-dot"></i>전공/교과</a></p></li>
 							<li><p><a href="notlog_schoolScholarship.do" ><i class="bi bi-dot"></i>교내/교외장학금</a></p></li>
 							<li><p><a href="notlog_graduationRequirement.do" ><i class="bi bi-dot"></i>졸업요건</a></p></li>
 							<li><p><a href="notlog_hyuhak.do"><i class="bi bi-dot"></i>휴/복학</a></p></li>
						</ul>
					</th>
				</tr>
			</table>
		</div>
		
		<div id="toc8" class="toc hidden" >
	 		 <table>
	 			 <tr>
 					<th>
 						<ul>
 							<li><p><a href="notlog_courseRegistration.do" ><i class="bi bi-dot"></i>수강신청 안내</a></p></li>
						</ul>
					</th>
				</tr>
			</table>
		</div>
			&nbsp;
			<table width="80%" align="center">					
				<tr align="center">
					<td colspan="3"><h4><strong>주간/야간 수업시간표 안내</strong></h4></td>
				</tr>
				<tr></tr>
				<tr align="center">
					<td colspan="3"><hr class="bold-text" color="gray" align="left" width="17px"></td>
				</tr>
				<tr></tr>
				<tr align="center">
					<td colspan="3"><strong>교시제</strong></td>
				</tr>
				<tr align="center"><td  colspan="3" ><hr align="left" color="gray" width="70%"></td></tr>
				<tr align="center">
					<td colspan="3">-주간: 1교시 ~ 9교시(09:00 ~ 18:00) : 교시당 휴식시간(10분)이 수업시간(50분)에 포함됨.</td>
				</tr>
				<tr align="center">
					<td colspan="3">-야간: 10 교시 ~ 13교시(18:00 ~ 21:50) : 교시당 수업시간 50분, 휴식시간 10분 </td>
				</tr>
				<tr align="center"><td colspan="3"><hr align="left" color="gray" width="70%"></td></tr>
				
				<tr height="30px"></tr>
			</table>
			<table width="80%" border="1">
				<tr align="center" bgcolor="#edebe4">
					<td width="22%">구분</td>
					<td width="22%">교시</td>
					<td width="22%">시간</td>
				</tr>	
				<tr align="center">
					<td rowspan="10" bgcolor="#f9faf2">주간</td>
					<td>1교시</td>
					<td>09:00 ~ 09:50</td>
				</tr>
				<tr align="center">
					<td>2교시</td>
					<td>10:00 ~ 10:50</td>
				</tr>
				<tr align="center">
					<td>2교시</td>
					<td>10:00 ~ 10:50</td>
				</tr>
				<tr align="center">
					<td>3교시</td>
					<td>11:00 ~ 11:50</td>
				</tr>
				<tr align="center">
					<td>4교시</td>
					<td>12:00 ~ 12:50</td>
				</tr>
				<tr align="center">
					<td>5교시</td>
					<td>13:00 ~ 13:50</td>
				</tr>
				<tr align="center">
					<td>6교시</td>
					<td>14:00 ~ 14:50</td>
				</tr>
				<tr align="center">
					<td>7교시</td>
					<td>15:00 ~ 15:50</td>
				</tr>
				<tr align="center">
					<td>8교시</td>
					<td>16:00 ~ 16:50</td>
				</tr>
				<tr align="center">
					<td>9교시</td>
					<td>17:00 ~ 17:50</td>
				</tr>
				<tr align="center">
					<td rowspan="4" bgcolor="#f9faf2">야간</td>
					<td>10교시</td>
					<td>18:00 ~ 18:50</td>
				</tr>
				<tr align="center">
					<td>11교시</td>
					<td>19:00 ~ 19:50</td>
				</tr>
				<tr align="center">
					<td>12교시</td>
					<td>20:00 ~ 20:50</td>
				</tr>
				<tr align="center">
					<td>13교시</td>
					<td>21:00 ~ 21:50</td>
				</tr>
				<tr height="50px">
				</tr>
			</table>
		</div>
		






<%@ include file="notlog_bottom.jsp"%>	