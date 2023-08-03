<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- notlog_certificate_visit.jsp  -->
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
			
			<table class="table table-bordered" width="80%">
				<tr align="center" bgcolor="#E1F5FE">
					<td align="center" colspan="4" bgcolor="#E1F5FE" >
						<h3>증명서 발급</h3>
					</td>
				</tr>
				<tr align="center">
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
							<button type="submit" class="full-width-button" style="background-color: #81b4cc;">방문 신청</button>
						</form>
					</td>
					<td>
						<form action="notlog_certificate_fax.do" method="post">
							<button type="submit" class="full-width-button" style="background-color: white;">FAX,민원우편신청</button>
						</form>
					</td>
				</tr>
			</table>
	
			<h4 align="center"><strong>신청안내</strong></h4>
			<div align="center">
				<hr class="bold-text" color="gray" width="17px">
			</div>
			<p align="center"><strong>방문신청 안내</strong></p>
			<table class="table table-bordered" border="0" width="80%">
				<tr align="center" bgcolor="#E1F5FE">
					<td colspan="2">구분</td>
					<td>자동증명발급기</td>
					<td>종합서비스센터</td>
				</tr>
				<tr align="center">
					<td colspan="2">대상</td>
					<td>대학 79학번부터 대학원 전원</td>
					<td>대학 전원,대학원 전원</td>
				</tr>
				<tr align="center">
					<td rowspan="3" valign="middle">수수료</td>
					<td>구분</td>
					<td>국문</td>
					<td>영문</td>
				</tr>
				<tr align="center">
					<td>재학생 및 휴학생</td>
					<td>500원</td>
					<td>1000원</td>
				</tr>
				<tr align="center">
					<td>졸업생 및 제적생</td>
					<td>1000원</td>
					<td>1000원</td>
				</tr>
				<tr align="center">
					<td colspan="2">이용시간</td>
					<td>24시간 연중 무휴</td>
					<td>09:30 ~ 17:00 (방학기간은 16:00까지)</td>
				</tr>
				<tr align="center">
					<td colspan="2">방문위치</td>
					<td>본부관 1층 종합서비스센터</td>
					<td>본부관 1층 종합서비스센터</td>
				</tr>
			</table>	
			&nbsp;
				


<%@ include file="notlog_bottom.jsp"%>	