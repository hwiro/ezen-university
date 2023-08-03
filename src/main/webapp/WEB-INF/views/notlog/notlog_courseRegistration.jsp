<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- notlog_courseRegistration.jsp -->
<%@ include file="notlog_top.jsp" %>
<html>
	<head>
		<title>수강신청 안내</title>
		
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
			<h2>수강신청 안내 <img src="resources/img/lowerButton.png" alt="내리기 버튼" onmouseover="showTableOfContents('toc8')" onmouseout="setTimeout(function() { hideTableOfContents('') }, 5000)"></h2>
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
 							<li><p><a href="notlog_courseTimetable.do" ><i class="bi bi-dot"></i>수업시간표 안내</a></p></li>
						</ul>
					</th>
				</tr>
			</table>
		</div>
	
		<div align="center">
			<table width="80%" bgcolor="#f9faf2">
				<tr>
					<td><p align="left">※ 2024-1학기 개강일 : 2024.03.04.(월)</p></td>
				</tr>
				<tr align="left">
					<td><p>※ 장바구니 및 수강신청은 이젠대학교 수강신청시스템(sugang.ezen.ac.kr)에서 진행됩니다.</p></td>
				</tr>
				<tr align="left">
					<td><p>※ 2020학년도 동계 계절학기부터 수강신청 방식이 변경되었으므로 참고해주세요.</p></td>
				</tr>
				<tr align="left">
					<td><p>&nbsp;&nbsp;●&nbsp;변경된 수강신청 방식 (수강신청시스템 – sugang.ezen.ac.kr</p></td>
				</tr>&nbsp;
				<tr align="center">
					<td>&nbsp;&nbsp;<strong>수강희망 교과목 ‘수강신청’을 통해 수강신청 (저장버튼 없음)</strong></td>
				</tr>
				<tr align="center">
					<td><input type="image" width="900px" src="resources/img/sugang.png" alt="수강신청화면"></td>
				</tr>
				<tr align="center">
					<th><strong>↓</strong></th>
				</tr>
				<tr>
					<td align="center"><strong>수강신청이 가능한 상황일 경우, ‘수강신청 완료’ 문구 확인 및 수강신청 완료!!</strong></td>
				</tr>
				<tr align="center">
					<td><input type="image" width="900px" src="resources/img/sugang2.png" alt="수강신청화면2"></td>
				</tr>
				<tr height="20px"></tr>				
			</table>
			
			&nbsp;
			<hr color="black" width="80%">
			<table width="80%" border="1" align="center">
				<tr align="center">
					<td colspan="4"><h2><strong>수강신청 일정</strong></h2></td>
				</tr>
				<tr align="center" bgcolor="#f9faf2">
					<td colspan="2" width="13%">구분</td>
					<td width="37%">일정 및 시간</td>
					<td width="20%">비고</td>
				</tr>
				<tr align="center">
					<td colspan="2" border-top>수업계획서 조회</td>
					<td>※ 이젠 포털 → 수강신청 → 강좌조회(수업계획서)</td>
					<td>수강신청기간 중열람제한</td>
				</tr>
				<tr align="center">
					<td rowspan="5" width="10px">수강신청</td>
					<td>4학년</td>
					<td>02.10.(금) 10:00 ~ 16:00</td>
					<td>4학년/건축대 4~5학년</td>
				</tr>
				<tr align="center">
					<td>3학년</td>
					<td>02.13.(월) 10:00 ~ 16:00</td>
					<td>-</td>
				</tr>
				<tr align="center">
					<td>1,2학년</td>
					<td>02.14.(화) 10:00 ~ 16:00</td>
					<td>-</td>
				</tr>
				<tr align="center">
					<td>졸업연기 및 탈락자</td>
					<td>02.21.(화) 10:00 ~ 16:00</td>
					<td>초과학기생</td>
				</tr>
				<tr align="center">
					<td>신・편입생</td>
					<td>02.24.(금) 10:00 ~ 16:00</td>
					<td>2024학년도 신·편입생(외국인포함)</td>
				</tr>
				<tr align="center">
					<td colspan="2">변경 및 포기</td>
					<td>03.02.(목) ~ 03.07.(화) / 시간: 10:00 ~ 17:00</td>
					<td>일자별 해당기간</td>
				</tr>
				<tr align="center">
					<td colspan="2">폐강일</td>
					<td>
						<p>1차 : 02.27.(월) 예정</p>
						<p>2차 : 03.09.(목) ~ 03.10.(금) 예정폐강 이후 반드시 본인수강신청 내역 확인</p>
					</td>
					<td>폐강 이후 반드시 본인수강신청 내역 확인</td>
				</tr>
				&nbsp;
				<tr>
					<td colspan="4" align="left"><font color="red">&nbsp;&nbsp;가. 수강신청 학년기준: 2023학년도 1학기 진급(예정)학년을 기준으로 함.</font></td>
				</tr>
				<tr>	
					<td colspan="4" align="left">&nbsp;&nbsp;나. 복학생은 복학신청 - 복학승인 완료 후, 수강신청이 가능함</td>
				</tr>
				<tr>
					<td colspan="4" align="left">&nbsp;&nbsp;다. 졸업연기 및 탈락자(초과학기자)는 졸업연기 및 탈락자 기간과 수강신청 변경 및 포기기간에 수강신청을 진행</td>
				</tr>
				<tr height="60px"></tr>
			</table>
		</div>
	</div>	




<%@ include file="notlog_bottom.jsp"%>	