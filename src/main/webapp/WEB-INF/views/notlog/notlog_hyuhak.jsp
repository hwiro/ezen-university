<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 휴학/복학 -->
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

		<body>
		<br><br><br><br>
			<div align="center">
				<h1>학사소개 &nbsp; <img src="resources/img/lowerButton.png" alt="내리기 버튼" onmouseover="showTableOfContents('toc16')" onmouseout="setTimeout(function() { hideTableOfContents('') }, 5000)"></h1>
				<h2>휴학 <img src="resources/img/lowerButton.png" alt="내리기 버튼" onmouseover="showTableOfContents('toc15')" onmouseout="setTimeout(function() { hideTableOfContents('') }, 5000)"></h2>	
				
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
		 							<li><p><a href="notlog_returnSchool.do" ><i class="bi bi-dot"></i>복학</a></p></li>
								</ul>
							</th>
						</tr>
					</table>
				</div>
			</div>
			
			<div>
				<table width="80%" align="center" border="1">
					<tr>
						<td colspan="2"><hr class="bold-text" color="gray" align="left" width="17px"></td>
					</tr>
					<tr>
						<td colspan="2"><h4 align="left">휴학의 종류</h4></td>
					</tr>
					<tr align="center" bgcolor="#edebe4" height="30px">
						<td width="10%">구분</td>
						<td width="10%">가능기간</td>
						<td width="50%">휴학종류 및 가능기간에 대한 설명</td>
					</tr>
					<tr>
						<td align="center">가사휴학</td>
						<td align="center">4년</td>
						<td>개인사정으로 인한 휴학</td>
					</tr>
					<tr>
						<td align="center">입영휴학(군휴학)</td>
						<td align="center">3년</td>
						<td>군 입대로 인한 휴학(입영일로부터 전역일 후 1년 이내)</td>
					</tr>
					<tr>
						<td align="center">임신`출산`육아휴학</td>
						<td align="center">3년</td>
						<td>여학생의 임신 출산 육아시 통산3년/남학생의 육아1년이내 가능</td>
					</tr>
					<tr>
						<td align="center">창업휴학</td>
						<td align="center">2년</td>
						<td>학생 본인 창업시 가능</td>
					</tr>
					<tr>
						<td align="center">질병휴학</td>
						<td align="center">해당기간</td>
						<td>치료기간</td>
					</tr>
				</table>
			</div>
				<table  align="center" width="80%">
					<tr>
						<td colspan="2"><hr class="bold-text" color="gray" align="left" width="1%"></td>
					</tr>
					<tr>
						<td><h4 align="left">가사휴학 신청</h4></td>
					</tr>
					<tr>
						<td><p>가.신청기간: 개강 전 소정기간 및 학기개시일 후 90일 이내</p></td>
						<td rowspan="4"><input type="image" width="600px" height="400px" src="resources/img/hyuhakImage.png" alt="휴학이미지"></td>
					</tr>
					<tr>
						<td><p>나.신청방법</p></td>
					</tr>
					<tr>
						<td>&nbsp;개강전 또는 학기개시일 후 90일 이내 - ON국민포털 신청( 로그인 → 학사서비스 → 학적정보 → 휴학/복학신청 → 휴학신청)</td>
					</tr>
					<tr>
						<td>&nbsp;신입학 학생은 입학 후 1년간 휴학이 제한 됨</td>
					</tr>
				</table>
					
				<table align="center" width="80%" border="1">
					<tr align="left"> 
						<td colspan="3"><hr class="bold-text" color="gray" align="left" width="1%"></td>
					</tr>
					<tr align="left">
						<td colspan="3"><h4 align="left">군 입영휴학 신청</h4></td>
					</tr>					
					<tr bgcolor="#edebe4" align="center" height="30px">
						<td>구분</td>
						<td>신청기간</td>
						<td>준비서류 및 유의사항</td>
					</tr>
					<tr align="center">
						<td>군휴학</td>
						<td>입대 1개월 전부터</td>
						<td>입영통지서를 군휴학신청시 첨부, 행정정보공동이용 동의</td>
					</tr>
				</table>
		
				<table align="center" width="80%">
					<tr height="2%">
						<td  colspan="3">&nbsp;<hr class="bold-text" color="gray" align="left" width="1%"></td>
					</tr>
					<tr border="1">
						<td colspan="3"><h4 align="left">임신·출산·육아/질병/창업휴학 신청</h4>	&nbsp;&nbsp;※ "병원"이란 의료법 제3조의2에 해당하는 병원 임.(의원급 의료기관이 아닌 병원급으로 30개이상의 병상요건 충족)</td>
					</tr>
					<tr bgcolor="#edebe4" align="center" height="30px">
						<td width="15%">질병휴학</td>
						<td width="15%">신청시기</td>
						<td width="40%">준비서류 및 신청기간</td>
					</tr>
					<tr align="center">
						<td>질병휴학</td>
						<td rowspan="2">사유 발생 시</td>
						<td>병원의 “2개월 이상의 치료가 필요”하다는 “진단서”</td>
					</tr>
					<tr align="center">
						<td>임신·출산·육아</td>
						<td>해당사실을 입증할 증빙서류</td>
					</tr>
					<tr align="center">
						<td>창업휴학</td>
						<td>학사공지참조</td>
						<td>본인 명의 사업자등록증</td>
					</tr>
					<tr>
						<td colspan="3">&nbsp;&nbsp;가. 신청방법: ON국민포털내 신청</td>
					</tr>
					<tr>
						<td colspan="3">&nbsp;&nbsp;나. 창업 휴학 신청제한: 신입생은 입학 후 1년간 창업휴학이 제한됨</td>
					</tr>
				</table>
			</body>
				
				
<%@ include file="notlog_bottom.jsp"%>	