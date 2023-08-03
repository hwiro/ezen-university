<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- notlog_studentClub.jsp -->
<%@ include file="notlog_top.jsp" %>
<html>
	<head>
		<title>학교 동아리</title>
		
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
 								<li><p><a href="notlog_certificate_domestic.do" ><i class="bi bi-dot"></i>증명서 발급</a></p></li>
							</ul>
						</th>
					</tr>
				</table>
			</div>
				<table width="70%">
					<tr align="center">
						<td align="center" colspan="2">
							<h4>학생 동아리</h4>
						</td>
					</tr>
				</table>
				
			<h5 align="center">&nbsp;<strong>동아리연합회</strong></h5>
				<p align="center">&nbsp;동아리 연합회는 동아리인들의 자치기구이며, 동아리 생활을 하는 가운데 발생하는 다양한 요구를 수렴하며
						 좀 더 발전적인 방향으로 나아가기 위해서 동아리인들과 함께하는 열린 공간입니다.</p>
			<hr width="100%" color="black">
				<br>
				<div align="center">
					<hr class="bold-text" color="gray" width="17px">
				</div>
				
			<h4 align="center">공연예술</h4>
				&nbsp;
				<table class="table table-bordered"  border="1" align="center" width="80%">
					<thead class="table-light">
						<tr align="center">
							<td width="30%"><strong>동아리명</strong></td>
							<td><strong>설립연도</strong></td>
							<td width="30%"><strong>창립목적 및 활동내역</strong></td>
							<td><strong>위치</strong></td>
						</tr>
					</thead>
						<tr align="center">
							<td width="30%">청소년축제 동아리</td>
							<td  width="20%">2020.09.20</td>
							<td width="30%">대학 동아리 활성화</td>
							<td  width="20%">복지관 101호</td>
						</tr>
						<tr align="center">
							<td width="30%">이젠 그림마당</td>
							<td  width="20%">2020.07.20</td>
							<td width="30%">대학 동아리 활성화</td>
							<td  width="20%">복지관 102호</td>
						</tr>
						<tr align="center">
							<td width="30%">밴드 동아리</td>
							<td  width="20%">2020.07.20</td>
							<td width="30%">대학 동아리 활성화</td>
							<td  width="20%">복지관 103호</td>
						</tr>
						<tr align="center">
							<td width="30%">현상수배 영상제작 동아리</td>
							<td  width="20%">2020.05.20</td>
							<td width="30%">대학 동아리 활성화</td>
							<td  width="20%">복지관 104호</td>
						</tr>
						<tr align="center">
							<td width="30%">학생회동아리</td>
							<td  width="20%">2018.02.20</td>
							<td width="30%">대학 동아리 활성화</td>
							<td  width="20%">복지관 105호</td>
						</tr>
						<tr align="center">
							<td width="30%">춤추니까 청춘이다!</td>
							<td  width="20%">2019.02.20</td>
							<td width="30%">대학 동아리 활성화</td>
							<td  width="20%">복지관 106호</td>
						</tr>
					</table>
					&nbsp;
					
				<br>
				<div align="center">
					<hr class="bold-text" color="gray" width="17px">
				</div>
				
				<h4 align="center">교양봉사</h4>	
					<table class="table table-bordered"  border="1" align="center" width="100%">
						<thead class="table-light">
						<tr align="center">
							<td><strong>동아리명</strong></td>
							<td><strong>설립연도</strong></td>
							<td><strong>창립목적 및 활동내역</strong></td>
							<td><strong>위치</strong></td>
						</tr>
						</thead>
						<tr align="center">
							<td width="30%">소외아동 교육봉사단</td>
							<td  width="20%">2020.12.20</td>
							<td width="30%">대학 동아리 활성화</td>
							<td  width="20%">복지관 111호</td>
						</tr>
						<tr align="center">
							<td width="30%">또래상담자 동아리</td>
							<td  width="20%">2023.02.20</td>
							<td width="30%">대학 동아리 활성화</td>
							<td  width="20%">복지관 112호</td>
						</tr>
						<tr align="center">
							<td width="30%">너랑나랑우리랑</td>
							<td  width="20%">2022.02.20</td>
							<td width="30%">대학 동아리 활성화</td>
							<td  width="20%">복지관 113호</td>
						</tr>
						<tr align="center">
							<td width="30%">청소년독서동아리</td>
							<td  width="20%">2022.02.20</td>
							<td width="30%">대학 동아리 활성화</td>
							<td  width="20%">복지관 114호</td>
						</tr>
						<tr align="center">
							<td width="30%">봉사활동 동아리</td>
							<td  width="20%">2021.02.20</td>
							<td width="30%">대학 동아리 활성화</td>
							<td  width="20%">복지관 115호</td>
						</tr>
					</table>
				
						&nbsp;
				<br>
				<div align="center">
					<hr class="bold-text" color="gray" width="17px">
				</div>
				<h4 align="center">전시예술</h4>	
					<table class="table table-bordered"  border="1" align="center" width="100%">
						<tr align="center">
							<td><strong>동아리명</strong></td>
							<td><strong>설립연도</strong></td>
							<td><strong>창립목적 및 활동내역</strong></td>
							<td><strong>위치</strong></td>
						</tr>
						<tr align="center">
							<td width="30%">응답하라2020</td>
							<td  width="20%">2020.06.20</td>
							<td width="30%">대학 동아리 활성화</td>
							<td  width="20%">복지관 116호</td>
						</tr>
						<tr align="center">
							<td width="30%">이젠리틀텔레비전</td>
							<td  width="20%">2020.04.20</td>
							<td width="30%">대학 동아리 활성화</td>
							<td  width="20%">복지관 117호</td>
						</tr>
						<tr align="center">
							<td width="30%">완벽한 이젠</td>
							<td  width="20%">2020.03.20</td>
							<td width="30%">대학 동아리 활성화</td>
							<td  width="20%">복지관 118호</td>
						</tr>
						<tr align="center">
							<td width="30%">너의 이름은</td>
							<td  width="20%">2020.02.22</td>
							<td width="30%">대학 동아리 활성화</td>
							<td  width="20%">복지관 119호</td>
						</tr>
						<tr align="center">
							<td width="30%">열린만화장</td>
							<td  width="20%">2020.02.21</td>
							<td width="30%">대학 동아리 활성화</td>
							<td  width="20%">복지관 120호</td>
						</tr>
					</table>
				</div>
				
<%@ include file="notlog_bottom.jsp"%>	