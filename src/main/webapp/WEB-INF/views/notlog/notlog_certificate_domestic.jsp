<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--notlog_certificate_domestic.jsp  -->
<%@ include file="notlog_top.jsp" %>
<html>
	<head>
		<title>증명서 발급</title>
		
		<style>
	   	 .table-bordered{
		    	width:80%;
		    	align-items: center;
		    	margin: 0 auto;
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
				<h1>대학소개&nbsp; <img src="resources/img/lowerButton.png" alt="내리기 버튼" onmouseover="showTableOfContents('toc8')" onmouseout="setTimeout(function() { hideTableOfContents('') }, 5000)"></h1>
		
				<div id="toc8" class="toc hidden" >
	 	 			<table>
	 	 			<tr>
 						<th>
 							<ul>
 								<li><p><a href="notlog_studentClub.do" ><i class="bi bi-dot"></i>학생 동아리</a></p></li>
							</ul>
						</th>
					</tr>
				</table>
			</div>
		</div>
			<table class="table table-bordered" width="80%" border="1" >
				<tr align="center" bgcolor="#E1F5FE">
						<td align="center" colspan="4" bgcolor="#E1F5FE" >
							<h3>증명서 발급</h3>
						</td>
					</tr>
				<tr align="center">
					<td> <form action="notlog_certificate_domestic.do" method="post">
      					 	<button type="submit" class="full-width-button" style="background-color: #81b4cc;">국내우편 발급신청</button>
      					 </form></td>
				
					<td><form action="notlog_certificate_internet.do" method="post">
      				 			<button type="submit" class="full-width-button" style="background-color: white;">인터넷 신청</button>
      						 </form></td>
					<td><form action="notlog_certificate_visit.do" method="post">
      				 			<button type="submit" class="full-width-button" style="background-color: white;">방문 신청</button>
      						 </form></td>
					<td><form action="notlog_certificate_fax.do" method="post">
      						 	<button type="submit" class="full-width-button" style="background-color: white;">FAX,민원우편신청</button>
      						 </form></td>
				</tr>
			</table>
			
			<h4 align="center"><strong>신청안내</strong></h4>
				<div align="center">
					<hr class="bold-text" color="gray" width="17px">
				</div>
				<p align="center"><strong>증명서발급절차</strong></p>
				<p align="center">
				종합서비스센터 E-mail service@ezen.ac.kr 로 우편 발급 신청 접수 후 안내받은 증명서 수수료와 우편료를 아래의 계좌번호로 송금해 주시기 바랍니다.
				</p>
				<div align="center">
					<hr class="bold-text" color="gray" width="17px">
				</div>
				<p align="center"><strong>제 증명서 수수료</strong></p>
				
			<table class="table table-bordered" width="80%" border="1">	
				<tr bgcolor="#D3D3D3" height="30">
					<td align="center">구분</td>
					<td align="center">국문</td>
					<td align="center">영문</td>
				</tr>
				<tr>
					<td align="center">재학생 및 휴학생</td>
					<td align="center">500원</td>
					<td align="center">1000원</td>
				</tr>
				<tr>
					<td align="center">졸업생 및 제적생</td>
					<td align="center">1000원</td>
					<td align="center">1000원</td>
				</tr>
			</table>
				
			<hr align="center" color="black" width="10px">
			<p align="center"><strong>우편료(빠른등기)</strong></p>
			<table class="table table-bordered" width="80%" border="1">	
				<tr>
					<td align="center" bgcolor="#D3D3D3" height="30">수량</td>
					<td align="center">1~2매</td>
					<td align="center">3~6매</td>
					<td align="center">7~13매</td>
					<td align="center">14~21매</td>
					<td align="center">22~29매</td>
				</tr>
				<tr>
					<td align="center" bgcolor="#D3D3D3" height="30">우편료</td>
					<td align="center">3500원</td>
					<td align="center">3600원</td>
					<td align="center">3700원</td>
					<td align="center">3800원</td>
					<td align="center">3900원</td>
				</tr>
			</table>
			&nbsp;
			<table class="table table-bordered" width="80%">	
				<tr>
					<td><strong><input type="image" width="35px" src="resources/img/certificate.png" alt="증명서 발급 이미지" class="image-button">&nbsp;안내사항</strong></td>	
				</tr>
				<tr>
					<td>&nbsp;- 메일 발송 시 본인 성명, 영문 증명서 신청 시 영문 성명, 출신 학과, 학번, 생년월일, 필요한 증명서 종류 및 매수, 봉인(sealing) 필요한지 확인 여부, 받으시는 곳 주소, 연락처 기재해 주시기 바랍니다.</td>
				</tr>
				<tr>	
					<td>&nbsp;- 메일로 답변 확인 후 해당 계좌번호로 송금해 주시기 바랍니다.</td>
				</tr>
				<tr>
					<td>&nbsp;- 신청 후 3일 이내 입금하지 않으면 자동 취소됩니다.</td>
				</tr>
			</table>
			&nbsp;
<%@ include file="notlog_bottom.jsp"%>	