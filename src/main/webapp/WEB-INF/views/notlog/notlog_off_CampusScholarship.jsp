<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 교외장학금 -->
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
	
		<title>교외장학</title>
	</head>
	<br><br><br><br>
	<body>
		<div align="center">
			<h1>학사소개&nbsp;<img src="resources/img/lowerButton.png" alt="내리기 버튼" onmouseover="showTableOfContents('toc9')" onmouseout="setTimeout(function() { hideTableOfContents('') }, 5000)"></h1>
			<h2>교외장학금 <img src="resources/img/lowerButton.png" alt="내리기 버튼" onmouseover="showTableOfContents('toc8')" onmouseout="setTimeout(function() { hideTableOfContents('') }, 5000)"></h2>
			<div id="toc9" class="toc hidden" >
		 	 	<table>
		 	 		<tr>
	 					<th>
	 						<ul>
	 							<li><p><a href="notlog_schoolCalender.do" ><i class="bi bi-dot"></i>학사일정</a></p></li>
	 								<li><p><a href="notlog_courseRegistration.do" ><i class="bi bi-dot"></i>수강신청 안내</a></p></li>
	 								<li><p><a href="notlog_graduationRequirement.do" ><i class="bi bi-dot"></i>졸업요건</a></p></li>
	 								<li><p><a href="notlog_majorRelated.do" ><i class="bi bi-dot"></i>전공/교과</a></p></li>
	 								<li><p><a href="notlog_hyuhak.do" ><i class="bi bi-dot"></i>휴학/복학</a></p></li>
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
	 							<li><p><a href="notlog_schoolScholarship.do" ><i class="bi bi-dot"></i>교내 장학금</a></p></li>
							</ul>
						</th>
					</tr>
				</table>
			</div>
		</div>
		
		<div align="center">
			<table width="80%" border="1">
				<tr>
					<td>
						<hr color="gray" align="left" width="1%">
						<h4 align="left">외부장학금 지급절차</h4>
					</td>
				</tr>
				<tr align="left">
					<td align="left">
						<p>① 외부 각종 장학단체에서 장학생 추천의뢰 접수(1, 2학기 등록시기)</p>
						<p>② 교외 장학금 지급기준 및 장학재단의 추천조건을 검토하여, 단과대학에 장학생 추천 의뢰</p>
						<p>③ 단과대학에서 추천된 학생의 자격을 심사한 후 장학재단에 추천</p>
						<p>④ 장학재단에서 장학생을 확정하여 장학금을 송금하면, 장학증서를 발행하여 해당자에게 교부</p>
						<p>⑤ 장학재단에 장학금 영수증 송부</p>
						<input type="image" width="1450" height="500" src="resources/img/offScholarship.png" alt="외부장학금" class="image-button" align="left">
					</td>
				</tr>
				<tr>
					<td>
						<hr color="black" align="left" width="1%">
						<h4 align="left">외부장학금 종류</h4>
					</td>
				</tr>
				<tr>
					<td>
						<p>외부 60여개 장학재단으로부터 다양한 장학금이 지급되고 있으며 대표적인 장학재단은 다음과 같다.</p>
					</td>
				</tr>
				<tr>
					<td>
						<input type="image" width="1450" height="450" src="resources/img/offScholarship1.png" alt="외부장학재단" class="image-button" align="left">
					</td>
				<tr>	
			</table>	
		</div>
	</body>
</html>

<%@ include file="notlog_bottom.jsp"%>
