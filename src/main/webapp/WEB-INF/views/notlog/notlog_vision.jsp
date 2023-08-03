<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 건학이념.jsp -->
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
	
		<title>건학이념</title>
	</head>
		<body>
		<br><br><br><br>
			<div align="center">
				<h1>대학소개&nbsp; <img src="resources/img/lowerButton.png" alt="내리기 버튼" onmouseover="showTableOfContents('toc8')" onmouseout="setTimeout(function() { hideTableOfContents('') }, 5000)"></h1>
			<div id="toc8" class="toc hidden" >
	 	 		<table>
	 	 			<tr>
 						<th>
 							<ul>
 								<li><p><a href="notlog_campusGuide.do" ><i class="bi bi-dot"></i>캠퍼스안내</a></p></li>
							</ul>
						</th>
					</tr>
				</table>
			</div>
		
				<table border="1" width="80%">
					<tr align="center" bgcolor="#E1F5FE">
						<td align="center" colspan="2" bgcolor="#edebe4" >
							<h4>건학이념 </h4>
						</td>
					</tr>
					<tr bgcolor="#fafafa">
						<td align="center">
							<input type="image" src="resources/img/foundingPhilosophy.png" alt="건학이념" class="image" width="500px" height="400px">
						</td>
						<td align="center">
							<h4>이젠건학정신</h4>
							<p>이젠대학교는 '너희가 내 말에 거하면 참 내 제자가 되고 진리를 알자니</p>
							<p>진리가 너희를 자유케 하리라' 는 </p>
							<p>성경말씀(요한복음8:13~32)을 바탕으로</p>
							<p>진리와 자유의 정신을 체득한</p>
							<p>지도자를 양성한다.</p>
						</td>
					</tr>
			
					<tr height="60"></tr>			
					<tr>
						<td align="center" colspan="2" width="3%" >
							<hr class="bold-text" color="gray" align="left" width="17px">
							<h4>이젠대학교 교육목적</h4>
							<p>민주교육의 근본이념을 바탕으로</p>
							<p>학술이론과 그 응용방법을 교수 연구하는 동시에</p>
							<p>국가와 인류사회 발전에 필요한 인재를 육성한다.</p>
						</td>
					</tr>
					<tr height="60"></tr>
					<tr>
						<td align="center" colspan="2">
							<hr class="bold-text" color="gray" align="left" width="17px">
							<h4>교육목표</h4>
							<p>지덕체를 겸비한 인격을 연마하고, 창의적 학문 탐구와 전문적 실천능력을 배양하며,</p>
							<p>국제사회에 기여할 개방적 지도력을 육성한다.</p>
						</td>		
					</tr>
					<tr bgcolor="#fafafa">
						<td align="center" colspan="2">
							<input type="image" src="resources/img/ezenn.png" alt="ezen이미지" class="image" width="500px" height="400px">
						</td>
					</tr>
					<tr><td align="center" height="300"></td></tr>
				</table>
			</div>
		</body>
</html>

<%@ include file="notlog_bottom.jsp"%>	