<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 복학 -->
<%@ include file="notlog_top.jsp" %>

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
<br><br><br><br>
	<body>
		<div align="center">
			<h1>학사소개 &nbsp; <img src="resources/img/lowerButton.png" alt="내리기 버튼" onmouseover="showTableOfContents('toc16')" onmouseout="setTimeout(function() { hideTableOfContents('') }, 5000)"></h1>
			<h2>복학 <img src="resources/img/lowerButton.png" alt="내리기 버튼" onmouseover="showTableOfContents('toc15')" onmouseout="setTimeout(function() { hideTableOfContents('') }, 5000)"></h2>	
			<div id="toc16" class="toc hidden" >
		 	 	<table>
		 	 		<tr>
	 					<th>
	 						<ul>
	 							<li><p><a href="notlog_schoolCalender.do" ><i class="bi bi-dot"></i>학사일정</a></p></li>
	 							<li><p><a href="notlog_courseRegistration.do"><i class="bi bi-dot"></i>수강신청 안내</a></p></li>
	 							<li><p><a href="notlog_schoolScholarship.do" ><i class="bi bi-dot"></i>교내/교외장학</a></p></li>
	 							<li><p><a href="notlog_graduationRequirement.do" ><i class="bi bi-dot"></i>졸업요건</a></p></li>
	 							<li><p><a href="notlog_majorRelated.do" ><i class="bi bi-dot"></i>전공/교과</a></p></li>
							</ul>
						</th>
					</tr>
				</table>
			</div>
		 	 
			 <div id="toc15" class="toc hidden" >
		 	 <table>
		 		 <tr>
	 				<th>
	 					<ul>
	 						<li><p><a href="notlog_hyuhak.do" ><i class="bi bi-dot"></i>휴학</a></p></li>
						</ul>
					</th>
				</tr>
			</table>
		</div>
	</div>
		
			<table width="80%" border="1">
				<tr>
					<td colspan="2"><hr class="bold-text" color="gray" align="left" width="17px"></td>
				</tr>
				<tr>
					<td colspan="2"><h4 align="left">복학의 종류</h4></td>
				</tr>
				<tr align="center" bgcolor="#edebe4" height="33px">
					<td width="10%">종류</td>
					<td width="25%">대상</td>
					<td width="10%">신청시기</td>
					<td width="25%">신청방법</td>
				</tr>
				<tr align="center">
					<td>일반복학</td>
					<td>원학년/원학기 복학</td>
					<td rowspan="2">매학기 신청기간</td>
					<td rowspan="2">로그인 – 학사서비스 – 학적정보 - 휴학/복학신청 – 복학신청</td>
				</tr>
				<tr align="center">
					<td>월기복학</td>
					<td>정상학기에 복학하지 않고 조기에 복학</td>
				</tr>
			</table>
			 &nbsp; &nbsp; &nbsp; &nbsp;
			<table width="80%" border="1">
				<tr>
					<td colspan="2"><hr class="bold-text" color="gray" align="left" width="17px"></td>
				</tr>
				<tr>
					<td colspan="2"><h4 align="left">미전역자 복학신청</h4></td>
				</tr>					
				<tr align="center" bgcolor="#edebe4" height="33px">
					<td width="15%">구분</td>
					<td width="15%">신청방법</td>
					<td width="40%">준비서류</td>
				</tr>
				<tr align="center">
					<td>미전역자 복학</td>
					<td>준비서류를 스캔하여 파일첨부</td>
					<td>부대발급 : 전역예정증명서, 잔여휴가 확인서(휴가증)</td>
				</tr>
			</table>


<%@ include file="notlog_bottom.jsp"%>	