<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- notlog_earlyDecision.jsp -->
<%@ include file="notlog_top.jsp" %>
<html>
	<head>
		<title>입학 안내</title>
		

		
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
			<h2>입학안내</h2>
			<h3>수시&nbsp;<img src="resources/img/lowerButton.png" alt="내리기 버튼" onmouseover="showTableOfContents('toc8')" onmouseout="setTimeout(function() { hideTableOfContents('') }, 5000)"></h3>
	
		<div id="toc8" class="toc hidden" >
	 		 <table>
	 			 <tr>
 					<th>
 						<ul>
 							<li><p><a href="notlog_regularDecision.do" ><i class="bi bi-dot"></i>정시</a></p></li>
						</ul>
					</th>
				</tr>
			</table>
		</div>
			<table width="80%" align="center">
				<tr>
					<td colspan="4"><h4 align="left"><strong>&nbsp;&nbsp;모집단위별 입학정원(1683명)</strong></h4></td>
				</tr>
				<tr align="center" bgcolor="#2E8B57">
					<td width="15%">계열</td>
					<td width="15%">대학</td>
					<td width="25%">모집단위</td>
					<td width="15%">정원(명)</td>
				</tr>
				<tr align="center">
					<td rowspan="11">인문</td>
					<td rowspan="3">글로벌 인문대학</td>
					<td>한국어문학부</td>
					<td>40</td>
				</tr>
				<tr align="center">
					<td>영어영문학부</td>
					<td>67</td>
				</tr>
				<tr align="center">
					<td>중국학부</td>
					<td>71</td>
				</tr>
				<tr align="center">
					<td rowspan="2">사회과학대학</td>
					<td>행정학과</td>
					<td>69</td>
				</tr>
				<tr align="center">
					<td>정치외교학부</td>
					<td>50</td>
				</tr>
				<tr align="center">
					<td rowspan="2">법과대학</td>
					<td>법학부</td>
					<td>100</td>
				</tr>
				<tr align="center">
					<td>기업융합법학부</td>
					<td>1(야간)</td>
				</tr>
				<tr align="center">
					<td rowspan="2">경상대학</td>
					<td>경제학과</td>
					<td>60</td>
				</tr>
				<tr align="center">
					<td>국제통상학과</td>
					<td>55</td>
				</tr>
				<tr align="center">
					<td rowspan="2">경영대학</td>
					<td>경영학부</td>
					<td>100</td>
				</tr>
				<tr align="center">
					<td>AI빅데이터융합경영학과</td>
					<td>70</td>
				</tr>
				
				<tr align="center">
					<td rowspan="8">자연</td>
					<td rowspan="3">창의공과대학</td>
					<td>신소재공학부</td>
					<td>120</td>
				</tr>
				<tr align="center">
					<td>기계공학부</td>
					<td>150</td>
				</tr>
				<tr align="center">
					<td>전자공학부</td>
					<td>100</td>
				</tr>
				<tr align="center">
					<td rowspan="2">소프트웨어융합대학</td>
					<td>소프트웨어학부</td>
					<td>100</td>
				</tr>
				<tr align="center">
					<td>인공지능학부</td>
					<td>100</td>
				</tr>
				<tr align="center">
					<td rowspan="2">과학기술대학</td>
					<td>식품영양학과</td>
					<td>40</td>
				</tr>
				<tr align="center">
					<td>산림환경시스템학과</td>
					<td>50</td>
				</tr>
				<tr align="center">
					<td>건축대학</td>
					<td>건축학부</td>
					<td>60</td>
				</tr>
				<tr align="center">
					<td rowspan="10">예체능</td>
					<td rowspan="3">조형대학</td>
					<td>시각디자인학과</td>
					<td>30</td>
				</tr>
				<tr align="center">
					<td>금속공예학과</td>
					<td>50</td>
				</tr>
				<tr align="center">
					<td>AI디자인학과</td>
					<td>50</td>
				</tr>
				<tr align="center">
					<td rowspan="5">예술대학</td>
					<td>성악전공학부</td>
					<td>20</td>
				</tr>
				<tr align="center">
					<td>피아노전공학부</td>
					<td>20</td>
				</tr>
				<tr align="center">
					<td>회화전공</td>
					<td>20</td>
				</tr>
				<tr align="center">
					<td>영화전공</td>
					<td>20</td>
				</tr>
				<tr align="center">
					<td>연극전공</td>
					<td>20</td>
				</tr>
				<tr align="center">
					<td rowspan="2">체육대학</td>
					<td>스포츠교육학과</td>
					<td>30</td>
				</tr>
				<tr align="center">
					<td>스포츠건강재활학과</td>
					<td>20</td>
				</tr>
				<tr height="40px"></tr>
			</table>
			
			<table width="80%" align="center" border="1">
				<tr>
					<th align="left" colspan="2">
						<h4>원서접수 안내</h4>
					</th>
				</tr>
				<tr align="left">
					<td>가. 접수기간 : 2023.09.11.(월) 10:00 ~ 09.15.(금) 18:00 (접수 기간 중 24시간 접수</td>
				</tr>
				<tr align="left">
					<td>나. 접수방법 : 인터넷 접수(별도 원서교부 및 방문접수 없음)</td>
				</tr>
				<tr>
					<td>다. 원서접수시 유의사항</td>
				</tr>
				<tr>
					<td>&nbsp;&nbsp;1)&nbsp;전형료 결제 후에는 지원 취소나 지원 사항(전형유형, 모집단위 등) 수정이 불가능하니, 전형료 결제 전에 반드시 지원 사항을 확인하여야 합니다.</td>
				</tr>
				<tr>
					<td>&nbsp;&nbsp;2)&nbsp;수험표는 정상적으로 접수가 완료된 경우에만 출력되므로 이를 반드시 확인하시기 바랍니다.</td>
				</tr>
				<tr height="20px"></tr>
				<tr>
					<td align="center"><input type="image" width="700px" src="resources/img/caution.png" alt="주의사항"></td>
				</tr>
				<tr height="20px"></tr>
			</table>
			<hr width="80%" color="gray">
			&nbsp;
			<table width="80%" align="center" border="1">
				<tr>
					<td colspan="4"><h4 align="left"><strong>합격자 발표</strong></h4></td>
				</tr>
				<tr align="center">
					<td colspan="4">&nbsp;&nbsp;가. 합격자 발표</td>
				</tr>
				<tr bgcolor="#2E8B57" align="center">
					<td colspan="2" width="35%">전형구분</td>
					<td width="12%">발표일시</td>
					<td width="12%">발표방법</td>
				</tr>
				<tr align="center">
					<td colspan="2">실기우수자 / 특기자 / 공무원위탁 / 군위탁</td>
					<td>2024.11.14.(화) 17:00 예정</td>
					<td rowspan="2">본교 입학안내 홈페이지</td>
				</tr>
				<tr align="center">
					<td colspan="2">교과성적우수자 / 국민프런티어 / 학교생활우수자 / 기회균형I / 기회균형II / 농어촌학생 / 취업자 / 특성화고 등을 졸업한 재직자</td>
					<td>2024.12.15.(금) 17:00 예정</td>
				</tr>
				<tr align="center">
					<td colspan="4">&nbsp;&nbsp;나. 합격자 등록기간 및 등록방법</td>
				</tr>
				<tr align="center" bgcolor="#2E8B57">
					<td width="40%" colspan="2">구분</td>
					<td width="60%" colspan="2">최초합격자</td>
				</tr>
				<tr align="center">
					<td rowspan="2" height="40px">문서등록</td>
					<td>등록기간</td>
					<td colspan="2">2024.12.18.(월) 10:00 ~ 12.21.(목) 16:00</td>
				</tr>
				<tr align="center">
					<td>등록방법</td>
					<td colspan="2">본교 입학안내 홈페이지에서 확인 및 등록</td>
				</tr>
				<tr align="center">
					<td rowspan="2" height="40px">등록금 완납</td>
					<td>등록기간</td>
					<td colspan="2">2025.02.07.(수) 10:00 ~ 02.13.(화) 16:00</td>
				</tr>
				<tr align="center">
					<td>등록방법</td>
					<td colspan="2">본교 입학안내 홈페이지에서 확인 및 납부</td>
				</tr>
				<tr height="20px"></tr>
				<tr>
					<td colspan="6" align="center">&nbsp;&nbsp;&nbsp;&nbsp;<input type="image" width="700px" src="resources/img/caution1.png" alt="주의사항1"></td>
				</tr>
			</table>
		</div>
		


<%@ include file="notlog_bottom.jsp"%>	