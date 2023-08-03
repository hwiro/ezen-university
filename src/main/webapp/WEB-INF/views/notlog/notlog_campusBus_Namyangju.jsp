<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- notlog_campusBus_Namyangju.jsp -->
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
	
		<title>통학버스 안내</title>
	</head>
		<body>
			<br><br><br><br>
			<div align="center">
				<h1>대학소개&nbsp;<img src="resources/img/lowerButton.png" alt="내리기 버튼" onmouseover="showTableOfContents('toc19')" onmouseout="setTimeout(function() { hideTableOfContents('') }, 5000)"></h1>
				<h3>통학버스 안내 <img src="resources/img/lowerButton.png" alt="내리기 버튼" onmouseover="showTableOfContents('toc18')" onmouseout="setTimeout(function() { hideTableOfContents('') }, 5000)"></h3>
			<div id="toc19" class="toc hidden">
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
			
			<div id="toc18" class="toc hidden" >
		 		 <table>
		 			 <tr>
	 					<th>
	 						<ul>
	 							<li><p><a href="notlog_campusGuide.do" ><i class="bi bi-dot"></i>캠퍼스 안내</a></p></li>
							</ul>
						</th>
					</tr>
				</table>
			</div>
		
		<br>
		
		<h4>스쿨/셔틀버스 안내</h4>
		<hr color="gray" width="80%">
			<table width="80%" align="center" border="1">
				<tr align="center">
					<td><a href="notlog_campusBus_seoul.do"><button style="background-color:#ccdfeb;" class="borderless-button full-width-button cell-button">서울강북</button></a></td>
					<td><a href="notlog_campusBus_gyeonggi.do"><button style="background-color:#ccdfeb;" class="borderless-button full-width-button cell-button">경기/서부</button></a></td>
					<td><a href="notlog_campusBus_deokjeong.do"><button style="background-color:#ccdfeb;" class="borderless-button full-width-button cell-button">덕정/잠실</button></a></td>
					<td><a href="notlog_campusBus_Namyangju.do"><button style="background-color:#adc6f0;" class="borderless-button full-width-button cell-button">남양주</button></a></td>
				</tr>
			</table>
			<table width="80%" border="1" align="center">
				<tr><td><h4>이젠대학교 통학버스 이용 안내</h4></td></tr>
				<tr><td>&nbsp;-&nbsp;재학생/교직원 모두 이용 가능 합니다.</td>
						<td rowspan="9"><input type="image" src="resources/img/buscard.png" alt="셔틀버스카드 이미지" width="320px" height="240px"></td></tr>
				<tr><td>&nbsp;-&nbsp;등교/하교 전노선 예약제 시행 합니다.</td></tr>
				<tr><td>&nbsp;-&nbsp;이용절차 : 회원가입 > 카드수령 > 충전 > 예약 > 카드 태깅 > 탑승</td></tr>
				<tr><td>&nbsp;-&nbsp;카드수령 : 종합서비스센터(012-123-1234, 정보전산원 123호)</td></tr>
				<tr><td>&nbsp;-&nbsp;신분증 지참 > ID : 학번 확인 > 카드 무료 지급</td></tr>				
				<tr><td>&nbsp;-&nbsp;은행선택 > 금액선택 > 포인트 충전 > 계좌 수신 > 입급(계좌이체)</td></tr>
				<tr><td>&nbsp;-&nbsp;충전 금액 만큼 1:1 포인트 충전됨, 기본 30,000원부터 충전</td></tr>
				<tr><td>&nbsp;-&nbsp;카드 재발급 : 종합서비스센터(031-539-1303, 정보전산원 106호)</td></tr>
				<tr><td>&nbsp;-&nbsp;카드 재발급수수료 8,000원 부과</td></tr>
				<tr><td></td>
						<td  align="left" class="cell-spacing">&nbsp;[이젠 셔틀 카드]</td></tr>
				
			</table>
			
		<h3 align="center">&nbsp;진접/오남</h3>
		<hr color="gray" width="80%">
			<table class="table table-bordered custom-table" width="80%" border="1">
				<tr align="center">
					<td style="background-color:#dfe3eb;" width="20%">노선안내</td>
					<td width="60%">오남도서관 - 16단지 금강아파트 정류장 - 반도유보라 정문 정류장 - 학교</td>
				</tr>
				<tr align="center">
					<td style="background-color:#dfe3eb;" width="20%" >요금 안내(편도)</td>
					<td width="60%">2,300원 / 약 40분 소요</td>
				</tr>
			</table>
			<table class="table table-bordered custom-table" width="80%" border="1">
				<tr align="center">
					<td class="cell-spacing" width="40%"><input type="image" src="resources/img/onam.png" alt="오남도서관" width="360px" height="220px"></td>
					<td class="cell-spacing" width="40%"><input type="image" src="resources/img/onam1.png" alt="오남도서관1" width="390px" height="220px"></td>
				</tr>	
				<tr align="center">	
					<td class="cell-spacing1">오남도서관</td>
					<td class="cell-spacing1">16단지금강아파트 정류장</td>
				</tr>
			</table>	


<%@ include file="notlog_bottom.jsp"%>