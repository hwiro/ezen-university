<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- notlog_campusGuide.jsp -->
<%@ include file="notlog_top.jsp" %>
<html>
	<head>
		<title>캠퍼스 안내</title>
			<style>
				hr {
			 	 border: none;
				  height: 3px;
				  background-color: gray;
				}
	
				.hidden {
					display: none;
				}
	
				table {
					border: 1px solid white; /* 테이블 테두리 색상을 흰색으로 설정 */
				}
			</style>		
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
				<h1>대학소개&nbsp;<img src="resources/img/lowerButton.png" alt="내리기 버튼" onmouseover="showTableOfContents('toc9')" onmouseout="setTimeout(function() { hideTableOfContents('') }, 5000)"></h1>
				<h4>캠퍼스안내 <img src="resources/img/lowerButton.png" alt="내리기 버튼" onmouseover="showTableOfContents('toc8')" onmouseout="setTimeout(function() { hideTableOfContents('') }, 5000)"></h4>
			
			<div id="toc9" class="toc hidden" >
		 	 	<table>
		 	 		<tr>
	 					<th>
	 						<ul>
	 							<li><p><a href="notlog_vision.do" ><i class="bi bi-dot"></i>비전</a></p></li>
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
	 							<li><p><a href="notlog_campusBus_seoul.do" ><i class="bi bi-dot"></i>통학버스 안내</a></p></li>
							</ul>
						</th>
					</tr>
				</table>
			</div>
		
			<table border="1" width="80%" align="center">
				<tr align="left">
					<td colspan="4">
						<h4>찾아오시는길</h4>
						<p>이젠 대학교를 찾아오실 때 아래 정보를 참고하세요.</p>
						<hr color="gray" width="100%">
					</td>
				</tr>
				<tr align="left">
					<td colspan="4">
						<h4>지하철 이용안내</h4>
						<hr color="gray" width="100%">
					</td>
				</tr>
				<tr align="center">
					<td bgcolor="#D2B48C" colspan="2" width="30%" valign="middle">
						<p class="bold-text">역명</p>
					</td>
					<td bgcolor="#D2B48C" width="70%" colspan="2" valign="middle">
						<p class="bold-text">출구</p>
					</td>
				</tr>
				<tr align="center">
					<td align="center"><p class="bold-text" >7호선 노원역</p></td>
					<td><p>8번출구</p></td>
					<td><p>이젠대학교 서울캠퍼스 정문</p></td>
					<td><button class="borderless-button" onclick="redirectToURL('https://map.naver.com/v5/directions/14144312.720286991,4530759.677583119,%EB%85%B8%EC%9B%90%EC%97%AD%207%ED%98%B8%EC%84%A0,713,SUBWAY_STATION/14144510.234459508,4530915.400947731,%EC%9D%B4%EC%A0%A0%EC%95%84%EC%B9%B4%EB%8D%B0%EB%AF%B8%EC%BB%B4%ED%93%A8%ED%84%B0%ED%95%99%EC%9B%90%20%EB%85%B8%EC%9B%90,924646500,PLACE_POI/-/walk?c=15,0,0,0,dh')">경로보기</button></td>
				</tr>
			
				<tr align="center">
					<td><p class="bold-text" >4호선 노원역</p></td>
					<td><p>2번출구</p></td>
					<td><p>이젠대학교 서울캠퍼스 후문</p></td>
					<td><button class="borderless-button" onclick="redirectToURL('https://map.naver.com/v5/directions/14144563.845926274,4530955.109019751,%EB%85%B8%EC%9B%90%EC%97%AD2%EB%B2%88%EC%B6%9C%EA%B5%AC,21405571,PLACE_POI/14144510.234459508,4530915.400947731,%EC%9D%B4%EC%A0%A0%EC%95%84%EC%B9%B4%EB%8D%B0%EB%AF%B8%EC%BB%B4%ED%93%A8%ED%84%B0%ED%95%99%EC%9B%90%20%EB%85%B8%EC%9B%90,924646500,PLACE_POI/-/transit?c=18,0,0,0,dh')">경로보기</button></td>
				
				<tr align="center">
					<td align="left" colspan="5" >
						<h4>버스 이용안내</h4>
						<hr color="gray" width="100%">
					</td>
				</tr>
				<tr align="center">
					<td rowspan="2" bgcolor="#F5DEB3">
						<p class="bold-text">의정부 출발</p>
					</td>
					<td><p>3100,3600</p></td>
					<td rowspan="2"><p>의정부버스터미널->장암주공단지->수락산역->마들역->도봉면허시험장 하차</p></td>
					<td><button class="borderless-button" onclick="redirectToURL('https://map.naver.com/v5/directions/14143713.198037382,4543475.958455151,%EC%9D%98%EC%A0%95%EB%B6%80%EC%8B%9C%EC%99%B8%EB%B2%84%EC%8A%A4%ED%84%B0%EB%AF%B8%EB%84%90,13034103,PLACE_POI/14144510.234459508,4530915.400947731,%EC%9D%B4%EC%A0%A0%EC%95%84%EC%B9%B4%EB%8D%B0%EB%AF%B8%EC%BB%B4%ED%93%A8%ED%84%B0%ED%95%99%EC%9B%90%20%EB%85%B8%EC%9B%90,924646500,PLACE_POI/-/transit?c=12,0,0,0,dh')">경로보기</button></td>								
				</tr>
				<tr>
					<td align="center"><p>3500</p></td>
				</tr>
			
				<tr align="center">
					<td bgcolor="#F5DEB3" class="bold-text"><p>강남역 출발</p></td>
					<td><p>3100</p></td>
					<td><p>강남역->신사역->태릉입구->공릉역->하계역->상계주공6단지->도봉면허시험장 하차</p></td>
					<td width="10%"><button class="borderless-button" onclick="redirectToURL('https://map.naver.com/v5/directions/14140649.841498036,4508743.98950235,%EA%B0%95%EB%82%A8%EC%97%AD%202%ED%98%B8%EC%84%A0,222,SUBWAY_STATION/14144510.234459508,4530915.400947731,%EC%9D%B4%EC%A0%A0%EC%95%84%EC%B9%B4%EB%8D%B0%EB%AF%B8%EC%BB%B4%ED%93%A8%ED%84%B0%ED%95%99%EC%9B%90%20%EB%85%B8%EC%9B%90,924646500,PLACE_POI/-/transit/2?c=11,0,0,0,dh')">경로보기</button></td>
				</tr>		
			</table>
		</div>
	</body>
</html>

<%@ include file="notlog_bottom.jsp"%>
