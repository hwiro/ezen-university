<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- notlog_certificate_fax.jsp -->
<%@ include file="notlog_top.jsp" %>
<html>
	<head>
	
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
	
		<title>증명서 발급</title>
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
				<table class="table table-bordered" width="80%">
					<tr align="center" bgcolor="#E1F5FE">
						<td align="center" colspan="4" bgcolor="#E1F5FE" >
							<h3>증명서 발급</h3>
						</td>
					</tr>
					<tr align="center" border="1">
						<td> 
							<form action="notlog_certificate_domestic.do" method="post">
								<button type="submit" class="full-width-button" style="background-color: white;">국내우편 발급신청</button>
							</form>
						</td>
						<td>
							<form action="notlog_certificate_internet.do" method="post">
								<button type="submit" class="full-width-button" style="background-color: white;">인터넷 신청</button>
							</form>
						</td>
						<td>
							<form action="notlog_certificate_visit.do" method="post">
								<button type="submit" class="full-width-button" style="background-color: white;">방문 신청</button>
							</form>
						</td>
						<td>
							<form action="notlog_certificate_fax.do" method="post">
								<button type="submit" class="full-width-button" style="background-color: #81b4cc;">FAX,민원우편신청</button>
							</form>
						</td>
					</tr>
				</table>
				
			<h4 align="center"><strong>신청안내</strong></h4>
				<div align="center">
					<hr class="bold-text" color="gray" width="17px">
				</div>
			<p align="center"><strong>FAX 민원우편신청</strong></p>
				
			<table class="table table-bordered" width="80%" border="1">
				<tr align="center">
					<td width="30%" bgcolor="#E1F5FE">발급 대상</td>
					<td width="70%">졸업, 성적, 재학, 휴학 - 국문 및 영문</td>
				</tr>
				<tr align="center">
					<td width="30%" bgcolor="#E1F5FE">신청 장소</td>
					<td width="70%">전국 모든 읍·면 동사무소</td>
				</tr>
				<tr align="center">
					<td width="30%" bgcolor="#E1F5FE">이용시간</td>
					<td width="70%">읍·면 동사무소 업무시간</td>
				</tr>
				<tr align="center">
					<td width="30%" bgcolor="#E1F5FE">신청방법</td>
					<td width="70%">읍·면 동사무소를 방문하여 FAX 민원 신청서를 작성 후 신청</td>
				</tr>
				<tr align="center">
					<td width="30%" bgcolor="#E1F5FE">증명수수료</td>
					<td width="70%">1건당 1,000원 + 민원수수료</td>
				</tr>
				<tr align="center">
					<td width="30%" bgcolor="#E1F5FE">기타 문의사항</td>
					<td width="70%">02-123-1235 (종합서비스센터)</td>
				</tr>
			</table>
				
			<div align="center">
				<hr class="bold-text" color="gray" width="17px">
			</div>
			<p align="center"><strong>민원우편신청</strong></p>
			<table class="table table-bordered" width="80%" border="1">
				<tr align="center">
					<td width="30%" bgcolor="#E1F5FE">대상</td>
					<td width="70%">대학 및 대학원</td>
				</tr>
				<tr align="center">
					<td width="30%" bgcolor="#E1F5FE">장소</td>
					<td width="70%">전국 모든 우체국</td>
				</tr>
				<tr align="center">
					<td width="30%" bgcolor="#E1F5FE">이용시간</td>
					<td width="70%">우체국 업무시간</td>
				</tr>
				<tr align="center">
					<td width="30%" bgcolor="#E1F5FE">신청방법</td>
					<td width="70%">우체국을 방문하여 민원우편 신청</td>
				</tr>
				<tr align="center">
					<td width="30%" bgcolor="#E1F5FE">주소</td>
					<td width="70%">(우) 01234 서울특별시 노원구 유령로 777 이젠대학교 종합서비스센터</td>
				</tr>
			</table>
		&nbsp;
<%@ include file="notlog_bottom.jsp"%>	