<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- notlog_certificate_internet.jsp -->
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
							<button type="submit" class="full-width-button" style="background-color: #81b4cc;">인터넷 신청</button>
						</form>
					</td>
					<td>
						<form action="notlog_certificate_visit.do" method="post">
							<button type="submit" class="full-width-button" style="background-color: white;">방문 신청</button>
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
				&nbsp;
			<p align="center">	
				인터넷 증명 발급 신청 배너(Banner)를 클릭하시면 인터넷을 통해 언제 어디서든지 직접 제 증명서를 출력할 수 있습니다
			</p>		
			<p align="center">	
				수수료 결제는 신용카드 또는 핸드폰 결제가 가능합니다.
			</p>	
				
			<div align="center">
				<hr class="bold-text" color="gray" width="17px">
			</div>
			<p align="center"><strong>발급증명서 종류</strong></p>
				
				<table class="table table-bordered" width="80%">
					<tr align="center" bgcolor="#E1F5FE">
						<td  width="40%" colspan="2" height=30px>구 분</td>
						<td width="20%" height=30px >국/영문</td>
						<td  width="40%" height=30px>발급증명서 종류</td>
					</tr>
					<tr align="center">
						<td rowspan="4" bgcolor="#D3D3D3" valign="middle" align="center">학부</td>
						<td rowspan="2" align="center" valign="middle">재학/제적</td>
						<td>국문</td>
						<td>성적, 재학, 휴학, 수료, 제적,졸업예정</td>
					</tr>
					<tr>
						<td align="center">영문</td>
						<td>성적, 재학, 휴학, 수료, 제적,졸업예정</td>
					</tr>
					<tr>
						<td rowspan="2" align="center" valign="middle">졸업</td>
						<td align="center">국문</td>
						<td>성적, 졸업</td>
					</tr>
					<tr>
						<td align="center">영문</td>
						<td>성적, 졸업</td>
					</tr>
				
					<tr>
						<td align="center" rowspan="4" bgcolor="#D3D3D3" valign="middle">대학원(석,박사)</td>
						<td align="center" rowspan="2" valign="middle">재학/제적</td>
						<td align="center">국문</td>
						<td>성적, 재학, 휴학, 수료, 재적, 학위수여예정</td>
					</tr>
					<tr>
						<td align="center">영문</td>
						<td>성적, 재학, 휴학, 수료, 재적, 학위수여예정</td>
					</tr>
					<tr>
						<td rowspan="2" align="center" valign="middle">졸업</td>
						<td align="center">성적, 수료, 학위수여</td>
						<td>성적, 수료, 학위수여</td>
					</tr>
					<tr>
						<td align="center">영문</td>
						<td>성적, 수료, 학위수여</td>
					</tr>
					
					<tr>
						<td rowspan="4" align="center" bgcolor="#D3D3D3" valign="middle">교직원</td>
						<td rowspan="2" align="center" valign="middle">교원</td>
						<td align="center">국문</td>
						<td>재직증명서, 강의경력증명서</td>
					</tr>
					<tr>
						<td align="center">영문</td>
						<td>재직증명서, 강의경력증명서</td>
					</tr>
					<tr>
						<td rowspan="2" align="center" valign="middle">직원</td>
						<td align="center">재직증명서</td>
						<td>재직증명서</td>
					</tr>
					<tr>
						<td align="center">영문</td>
						<td>재직증명서</td>
					</tr>
				</table>

				<div align="center">
					<hr class="bold-text" color="gray" width="17px">
				</div>
				<p align="center"><strong>발급수수료(증명서수수료 + 대행수수료)</strong></p>
				<table class="table table-bordered"  width="80%">
					<tr>
						<td rowspan="2" bgcolor="#E1F5FE" height=60px align="center" valign="middle">구분</td>
						<td colspan="2" bgcolor="#E1F5FE" height=30px align="center">증명서수수료(학교)</td>
						<td colspan="2" bgcolor="#E1F5FE" height=30px align="center">대행수수료(인터넷 대행기관)</td>
					</tr>
			
					<tr align="center">
						<td>국문1매</td>
						<td>영문1매</td>
						<td>1매</td>
						<td>1매이상</td>
					</tr>
					<tr align="center">
						<td height=30px align="center" bgcolor="#D3D3D3">재학생/휴학생</td>
						<td>500원</td>
						<td>1000원</td>
						<td>1000원</td>
						<td rowspan="2" valign="middle">1매 추가할 때 마다 수수료500원 추가 부담</td>
					</tr>
					<tr align="center">
						<td height=30px align="center" bgcolor="#D3D3D3">졸업생/제적생</td>
						<td>1000원</td>
						<td>1000원</td>
						<td>1000원</td>
					</tr>
				</table>
					&nbsp;

<%@ include file="notlog_bottom.jsp"%>	