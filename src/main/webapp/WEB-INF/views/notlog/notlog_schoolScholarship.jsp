<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 교내/교외장학 -->
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
		
		
		<title>교내장학</title>
	</head>
	<br><br><br><br>
		<body>
			<div align="center">
				<h1>학사소개&nbsp;<img src="resources/img/lowerButton.png" alt="내리기 버튼" onmouseover="showTableOfContents('toc9')" onmouseout="setTimeout(function() { hideTableOfContents('') }, 5000)"></h1>
				<h2>교내장학금 <img src="resources/img/lowerButton.png" alt="내리기 버튼" onmouseover="showTableOfContents('toc8')" onmouseout="setTimeout(function() { hideTableOfContents('') }, 5000)"></h2>
			<div id="toc9" class="toc hidden" >
		 	 	<table>
		 	 		<tr>
	 					<th>
	 						<ul>
	 							<li><p><a href="notlog_schoolCalender.do" ><i class="bi bi-dot"></i>학사일정</a></p></li>
	 								<li><p><a href="notlog_courseRegistration.do" ><i class="bi bi-dot"></i>수강신청 안내</a></p></li>
	 								<li><p><a href="notlog_graduationRequirement.do" ><i class="bi bi-dot"></i>졸업요건</a></p></li>
	 								<li><p><a href="notlog_majorRelated.do" ><i class="bi bi-dot"></i>전공/교과</a></p></li>
							</ul>
						</th>
					</tr>
				</table>
			</div>
			
			<div id="toc8" class="toc hidden" >
		 		 <table align="center">
		 			 <tr>
	 					<th>
	 						<ul>
	 							<li><p><a href="notlog_off_CampusScholarship.do" ><i class="bi bi-dot"></i>교외 장학금</a></p></li>
							</ul>
						</th>
					</tr>
				</table>
			</div>
			<p align="center">학생들의 학업의욕을 고취하고 후생복지를 진작하기 위하여 본교에는 신입장학금을 포함한 60여종의 각종 교내·외 장학금이 있으며, 
					연간 15,000여명에게 500억여원이 지급되고 있다. 이러한 풍부한 장학금 지원덕택으로 전교생의 약 60%에<br> 해당하는 많은 학생이 
					장학금 수혜를 받으면서 진리 탐구에 매진하고 있다. 본교는 장학수혜 혜택을 더욱 확대하기 위하여 매년 장학금을 확충하고 있으며 학교, 재단, 교직원, 동문들이 
					혼연일체가 되어 장학기금모금사업을 활발히 전개하고 있다.</p>
				<table border="1" width="70%" bgcolor="#edebe4">
					<tr align="center" >
						<td >성적장학금</td>
						<td>면학장학금</td>
						<td>보훈장학금</td>
						<td>학술장학금</td>
					</tr>
					<tr align="center" >
						<td>근로장학금</td>
						<td>창업장학금</td>
						<td>기타장학금</td>
					</tr>
				</table>
			</div>
			&nbsp;
			<div align="center">
				<table  border="1" width="80%" >
					<tr>
						<td colspan="2"><hr class="bold-text" color="gray" align="left" width="17px"></td>
					</tr>
					<tr>
						<td><h4 align="left">성적 장학금</h4></td>
					</tr>
					<tr align="center">
						<td width="10%" bgcolor="#edebe4">지급대상</td>
						<td width="60%">학업성적이 우수하고 학교생활에 모범이 되는 학생</td>
					</tr>
					<tr align="center">
						<td td width="10%" bgcolor="#edebe4">자격기준</td>
						<td td width="60%">직전학기 취득학점 : 17학점(최종직전학기 12학점)이상
						직전학기 신청학점 평점평균 : 3.0이상, F과목이 없어야 함.</td>
					</tr>
					<tr align="center">
						<td bgcolor="#edebe4" style="vertical-align:middle;">장학금액</td>
						<td width="60%"><p>-성적장학금 : 수업료 전액</p>
													 <p>-수석장학금 : 수업료의 70%</p>
													 <p>-성적1종장학금 : 수업료의 50%</p>
													 <p>-성적2종장학금 : 수업료의 30%</p>
													 <p>-성적3종장학금 : 수업료의 20%</p></td>
					</tr>
					<tr align="center">
						<td bgcolor="#edebe4">제출서류</td>
						<td>학과전공에 문의</td>
					</tr>
					<tr align="center">
						<td bgcolor="#edebe4">제출처</td>
						<td>학과전공에 문의</td>
					</tr>
					<tr align="center">
						<td bgcolor="#edebe4">신청기간</td>
						<td>학과전공에 문의</td>
					</tr>
					<tr align="center">
						<td bgcolor="#edebe4" style="vertical-align:middle;">비고</td>
						<td>장학생선발기준이 되는 성적은 성적정정기간 이후 확정된 석차연명부상의 성적을 의미</td>
					</tr>
				</table>
			</div>
		
			<div align="center">
				<table border="1" width="80%">
					<tr>
						<td colspan="2"><hr class="bold-text" color="gray" align="left" width="17px"></td>
					</tr>
					<tr>
						<td><h4 align="left">면학 장학금</h4></td>
					</tr>		
					<tr align="center">
						<td width="15%" bgcolor="#edebe4">지급대상</td>
						<td width="65%">학업성적이 우수하고 학교생활에 모범이 되는 학생</td>
					</tr>
					<tr align="center">
						<td bgcolor="#edebe4">자격기준</td>
						<td>
							<p>직전학기 취득학점(계절학기 제외)이 15학점 이상</p>
							<p>국가장학금 소득분위가 0-8분위인 재학생</p>
						</td>
					</tr>
					<tr align="center">
						<td bgcolor="#edebe4" style="vertical-align:middle;">장학금액</td>
						<td>
							<p>-면학 1종장학금 : 수업료의 70%</p>
							<p>-면학 2종장학금 : 수업료의 50%</p>
							<p>-면학 3종장학금 : 수업료의 30%</p>
							<p>-면학 4종 장학금 : 수업료의 20%</p>
							<p>-면학 5종 장학금 : 수업료의 10%</p>
						</td>
					</tr>
					<tr align="center">
						<td bgcolor="#edebe4">신청방법</td>
						<td>학생종합정보시스템(http://ktis.kookmin.ac.kr) 로그인 후 메뉴선택 후 온라인으로 신청</td>
					</tr>
					<tr align="center">
						<td bgcolor="#edebe4">신청기간</td>
						<td>매학기 신청기간(별도공지)</td>
					</tr>
				</table>
			</div>
		
			<div align="center">
				<table border="1" width="80%">
					<tr>
						<td colspan="2"><hr class="bold-text" color="gray" align="left" width="17px"></td>
					</tr>
					<tr>
						<td><h4 align="left">보훈 장학금</h4></td>
					</tr>	
					<tr  align="center">
						<td width="15%" bgcolor="#edebe4">지급대상</td>
						<td width="65%">국가유공자(북한이탈주민) 본인 또는 자녀, 독립유공자 손자녀</td>
					</tr>
					<tr align="center">
						<td bgcolor="#edebe4">자격기준</td>
						<td>직전학기의 성적이 1.88이상(백분율 70점이상)</td>
					</tr>
					<tr  align="center">
						<td bgcolor="#edebe4">장학금액</td>
						<td>등록금 전액(수학년학 8개학기 내 총 8번 지급)</td>
					</tr>
					<tr  align="center">
						<td bgcolor="#edebe4">제출서류</td>
						<td>보훈장학금 신청서, 대학수업료등면제대상자증명서(보훈청)</td>
					</tr>
					<tr align="center">
						<td bgcolor="#edebe4">제출처</td>
						<td>학생지원팀(종합복지관 503호)</td>
					</tr>
					<tr align="center">
						<td bgcolor="#edebe4">신청기간</td>
						<td>수시</td>
					</tr>
					<tr align="center">
						<td bgcolor="#edebe4">신청기간</td>
						<td>수시</td>
					</tr>	
					<tr align="center">
						<td bgcolor="#edebe4" style="vertical-align:middle;">비고</td>
						<td>
							<p>-계속장학생의 경우 장학금은 등록금고지서에 감면처리하여 지급</p>
							<p>-휴학 후 복학자의 경우 학생지원팀에 재신청</p>
						</td>
					</tr>
				</table>
			</div>
			
			<div align="center">
				<table border="1" width="80%">
					<tr>
						<td colspan="2"><hr class="bold-text" color="gray" align="left" width="17px"></td>
					</tr>
					<tr>
						<td><h4 align="left">학술 장학금</h4></td>
					</tr>	
					<tr align="center">
						<td width="15%" bgcolor="#edebe4">지급대상</td>
						<td width="65%">이젠대 신문방송사 주관 북악문화상 공모 입상자</td>
					</tr>
					<tr align="center">
						<td bgcolor="#edebe4">자격기준</td>
						<td>직전학기 취득학점 : 해당사항 없음</td>
					</tr>
					<tr align="center">
						<td bgcolor="#edebe4">장학금액</td>
						<td>50만원 ~ 100만원</td>
					</tr>
					<tr align="center">
						<td bgcolor="#edebe4">제출서류</td>
						<td>해당사항 없음</td>
					</tr>
					<tr align="center">
						<td bgcolor="#edebe4">제출처</td>
						<td>해당사항 없음</td>
					</tr>
					<tr align="center">
						<td bgcolor="#edebe4">신청기간</td>
						<td>매년 11월 중순</td>
					</tr>
					<tr align="center">
						<td bgcolor="#edebe4">비고</td>
						<td>장학금 중복수혜 가능</td>
					</tr>
				</table>
			</div>
		
			<div align="center">
				<table border="1" width="80%">
					<tr>
						<td colspan="2"><hr class="bold-text" color="gray" align="left" width="17px"></td>
					</tr>
					<tr>
						<td><h4 align="left">근로 장학금</h4></td>
					</tr>	
					<tr align="center">
						<td width="15%" bgcolor="#edebe4">지급대상</td>
						<td width="65%">교내 각 행정부서 및 도서관 업무보조 학생</td>
					</tr>
					<tr align="center">
						<td bgcolor="#edebe4">자격기준</td>
						<td>직전학기 취득학점 : 해당사항 없음</td>
					</tr>
					<tr align="center">
						<td bgcolor="#edebe4" style="vertical-align:middle;">장학금액</td>
						<td>
							<p>-일반근로장학생: 소정금액</p>
							<p>-도서관근로장학생: 소정금액</p>
							<p>-장기근로장학생: 소정금액</p>
							<p>-국가근로장학생: 소정금액</p>
						</td>
					</tr>
					<tr align="center">
						<td bgcolor="#edebe4">제출서류</td>
						<td>해당사항 없음</td>
					</tr>	
					<tr align="center">
						<td bgcolor="#edebe4">제출처</td>
						<td>해당사항 없음</td>
					</tr>
					<tr align="center">
						<td bgcolor="#edebe4">신청기간</td>
						<td>매학기 2월초 / 8월초</td>
					</tr>
					<tr align="center">
						<td bgcolor="#edebe4">비고</td>
						<td>장학금 중복수혜 가능</td>
					</tr>				
				</table>
			</div>
	
			<div align="center">
				<table border="1" width="80%">
					<tr>
						<td colspan="2"><hr class="bold-text" color="gray" align="left" width="17px"></td>
					</tr>
					<tr>
						<td><h4 align="left">창업 장학금</h4></td>
					</tr>	
					<tr align="center">
						<td width="15%" bgcolor="#edebe4">지급대상</td>
						<td width="65%">기업가정신을 함양하는 진취적인 교육, 연구 및 활동에 참여하는 학생</td>
					</tr>
					<tr align="center">
						<td bgcolor="#edebe4">자격기준</td>
						<td>직전학기 취득학점 : 해당사항 없음</td>
					</tr>
					<tr align="center">
						<td bgcolor="#edebe4">장학금액</td>
						<td>해당사항 없음</td>
					</tr>
					<tr align="center">
						<td bgcolor="#edebe4">제출서류</td>
						<td>해당사항 없음</td>
					</tr>
					<tr align="center">
						<td bgcolor="#edebe4">제출처</td>
						<td>해당사항 없음</td>
					</tr>
					<tr align="center">
						<td bgcolor="#edebe4">신청기간</td>
						<td>해당사항 없음</td>
					</tr>
					<tr align="center">
						<td bgcolor="#edebe4">비고</td>
						<td></td>
					</tr>				
				</table>
			</div>
	
			<div align="center">
				<table border="1" width="80%">
					<tr>
						<td colspan="2"><hr class="bold-text" color="gray" align="left" width="17px"></td>
					</tr>
					<tr>
						<td><h4 align="left">기타 장학금</h4></td>
					</tr>		
					<tr align="center">
						<td width="15%" bgcolor="#edebe4">지급대상</td>
						<td width="65%">교내 각 부서의 특성에 따라 해당 기준을 충족한 학생</td>
					</tr>
					<tr align="center">
						<td bgcolor="#edebe4" >자격기준</td>
						<td>직전학기 취득학점 : 해당사항 없음</td>
					</tr>
					<tr align="center">
						<td bgcolor="#edebe4">장학금액</td>
						<td>해당사항 없음</td>
					</tr>
					<tr align="center">
						<td bgcolor="#edebe4">제출서류</td>
						<td>해당사항 없음</td>
					</tr>
					<tr align="center">
						<td bgcolor="#edebe4">제출처</td>
						<td>해당사항 없음</td>
					</tr>
					<tr align="center">
						<td bgcolor="#edebe4">신청기간</td>
						<td>해당사항 없음</td>
					</tr>
					<tr align="center">
						<td bgcolor="#edebe4">비고</td>
						<td></td>
					</tr>
				</table>
			</div>
		</body>
</html>
<%@ include file="notlog_bottom.jsp"%>
