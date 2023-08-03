<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 학사 일정 -->
<%@ include file="notlog_top.jsp" %>
<html>
	<head>
	
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
	
		<title>학사 일정</title>
	</head>
	<br><br><br><br>
		<body>
			<div align="center">
				<h1>학사소개&nbsp;<img src="resources/img/lowerButton.png" alt="내리기 버튼" onmouseover="showTableOfContents('toc7')" onmouseout="setTimeout(function() { hideTableOfContents('') }, 5000)"></h1>
				<h3>2024학년도</h3>
				<div id="toc7" class="toc hidden" >
		 	 		<table>
		 	 			<tr>
	 						<th>
	 							<ul>
	 								<li><p><a href="notlog_courseRegistration.do"><i class="bi bi-dot"></i>수강신청 안내</a></p></li>
	 								<li><p><a href="notlog_schoolScholarship.do" ><i class="bi bi-dot"></i>교내/교외장학</a></p></li>
	 								<li><p><a href="notlog_graduationRequirement.do" ><i class="bi bi-dot"></i>졸업요건</a></p></li>
	 								<li><p><a href="notlog_majorRelated.do" ><i class="bi bi-dot"></i>전공/교과</a></p></li>
								</ul>
							</th>
						</tr>
					</table>
				</div>
			
					<table border="1" width="80%">
						<tr align="center">
							<th rowspan="3" style="vertical-align:middle;" bgcolor="#b4d6de">3월</th>
								<td align="center"><p>03.04(월)</p></td>
								<td><p>2024년도 입학식</p></td>
						</tr>
						<tr align="center">
							<td><p>03.04(월)</p></td>
							<td><p>1학기 개강일</p></td>
						</tr>
						<tr align="center">
							<td><p>03.04(월)~03.08(금)</p></td>
							<td><p>1학기 수강신청 변경/포기 기간</p></td>
						</tr>
						<tr align="center">
							<th scope="col" style="vertical-align:middle;"bgcolor="#b4d6de"><p>4월</p></th>
							<td><p>04.22(월)~04.26(금)</p></td>
							<td><p>1학기 중간시험 기간(수업8주차)</p></td>
						</tr>
						<tr align="center">
							<th scope="col" style="vertical-align:middle;" bgcolor="#b4d6de"><p>5월</p></th>
							<td><p>05.30(목)~06.01(토)</p></td>
							<td><p>하계 계절학기 수강신청 기간</p></td>
						</tr>
						<tr align="center">
							<th scope="col" style="vertical-align:middle;" rowspan="7" bgcolor="#b4d6de"><p>6월</p></th>
							<td><p>06.10(월)~06.14(금)</p></td>
							<td><p>1학기 기말고사 기간(수업15주차)</p></td>
						</tr>
						<tr align="center">
							<td><p>06.11(화)~06.21(금)</p></td>
							<td><p>1학기 성적입력 기간</p></td>
						</tr>
						<tr align="center">
							<td><p>06.12(수)~06.23(일)</p></td>
							<td><p>2학기 재입학 신청기간</p></td>
						</tr>
						<tr align="center">
							<td><p>06.17(월)~06.28(금)</p></td>
							<td><p>1학기 성적 공시 기간</p></td>
						</tr>
						<tr align="center">
							<td><p>06.21(금)</p></td>
							<td><p>하계 방학 시작일</p></td>
						</tr>
						<tr align="center">
							<td><p>06.21(금)~07.12(금)</p></td>
							<td><p>하계 계절학기 수업기간</p></td>
						</tr>
						<tr align="center">
							<td><p>06.24(월)~06.28(금)</p></td>
							<td><p>1학기 성적이의 신청/정정기간</p></td>
						</tr>
						<tr align="center">
							<th scope="col" style="vertical-align:middle;" bgcolor="#b4d6de"><p>7월</p></th>
							<td><p>07.15(월)~07.19(금)</p></td>
							<td><p>2학기 휴`복학, 유급 신청기간</p></td>
						</tr>
						<tr align="center">
							<th scope="col" rowspan="2" style="vertical-align:middle;" bgcolor="#b4d6de"><p>8월</p></th>
							<td><p>08.19(월)~08.30(금)</p></td>
							<td><p>2학기 수강신청 기간</p></td>
						</tr>
						<tr align="center">
							<td><p>08.19(월)~08.23(금)</p></td>
							<td><p>2학기 등록기간</p></td>
						</tr>
						<tr align="center">
							<th scope="col" rowspan="3" style="vertical-align:middle;" bgcolor="#b4d6de"><p>9월</p></th>
							<td><p>09.02(월)</p></td>
							<td><p>79회 개교기념일</p></td>
						</tr>
						<tr align="center">
							<td><p>09.03(화)</p></td>
							<td><p>2학기 개강일</p></td>
						</tr>
						<tr align="center">
							<td><p>09.03(화)~09.06(금)</p></td>
							<td><p>2학기 수강신청 변경/포기 기간</p></td>
						</tr>
						<tr align="center">
							<th scope="col" style="vertical-align:middle;" bgcolor="#b4d6de"><p>10월</p></th>
							<td><p>10.21(월)~10.25(금)</p></td>
							<td><p>2학기 중간시험 기간(수업8주차)</p></td>
						</tr>
						<tr align="center">
							<th scope="col" style="vertical-align:middle;" bgcolor="#b4d6de"><p>11월</p></th>
							<td><p>11.27(수)~11.29(금)</p></td>
							<td><p>동계 계절학기 수강신청 기간</p></td>
						</tr>
						<tr align="center">
							<th scope="col" rowspan="5" style="vertical-align:middle;" bgcolor="#b4d6de"><p>12월</p></th>
							<td><p>12.9(월)~12.13(금)</p></td>
							<td><p>2학기 기말시험 기간(수업15주차)</p></td>
						</tr>
						<tr align="center">
							<td><p>12.16(월)~12.20(금)</p></td>
							<td><p>2학기 성적 공시기간</p></td>
						</tr>
						<tr align="center">
							<td><p>12.23(월)</p></td>
							<td><p>동계방학 시작일</p></td>
						</tr>
						<tr align="center">
							<td><p>12.23(월)~1.17(금)</p></td>
							<td><p>동계 계절학기 수업 기간</p></td>
						</tr>
						<tr align="center">
							<td><p>12.23(월)~12.27(금)</p></td>
							<td><p>2학기 성적 이의신청/정정기간</p></td>
						</tr>
						<tr align="center">
							<th scope="col" style="vertical-align:middle;" bgcolor="#b4d6de"><p>1월</p></th>
							<td><p>1.6(월)~1.17(금)</p></td>
							<td><p>2025학년도 1학기 휴`복학, 유급신청 기간</p></td>
						</tr>
						<tr align="center">
							<th scope="col" rowspan="3" style="vertical-align:middle;" bgcolor="#b4d6de"><p>2월</p></th>
							<td><p>2.10(월)~2.21(금)</p></td>
							<td><p>2025학년도 1학기 수강신청 기간</p></td>
						</tr>
						<tr align="center">
							<td><p>2.14(금)</p></td>
							<td><p>2025학년도 1학기 학위수여식</p></td>
						</tr>
						<tr align="center">
							<td><p>2.24(월)~2.28(금)</p></td>
							<td><p>2025학년도 1학기 등록기간</p></td>
						</tr>
				
						<tr height="50">
						</tr>
					</table>
				</div>
			</body>
	</html>

<%@ include file="notlog_bottom.jsp"%>
