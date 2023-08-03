<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 졸업요건 -->
<%@ include file="notlog_top.jsp" %>
<html>
<head>
	<title>졸업요건</title>

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
	<div align="center">
		<h1>학사소개  <img src="resources/img/lowerButton.png" alt="내리기 버튼" onmouseover="showTableOfContents('toc11')" onmouseout="setTimeout(function() { hideTableOfContents('') }, 5000)"></h1>
		<h2>졸업요건</h2>
	</div>
	<div id="toc11" class="toc hidden"  align="center">
		<table>
	 		 <tr>
 				<th>
 					<ul>
 						<li><p><a href="notlog_schoolCalender.do" ><i class="bi bi-dot"></i>학사일정</a></p></li>
 						<li><p><a href="notlog_courseRegistration.do"><i class="bi bi-dot"></i>수강신청 안내</a></p></li>
 						<li><p><a href="notlog_schoolScholarship.do" ><i class="bi bi-dot"></i>교내/교외장학금</a></p></li>
 						<li><p><a href="notlog_majorRelated.do" ><i class="bi bi-dot"></i>전공/교과</a></p></li>
 						<li><p><a href="notlog_hyuhak.do"><i class="bi bi-dot"></i>휴/복학</a></p></li>
					</ul>
				</th>
			</tr>
		</table>
	</div>
	
		<table width="80%" border="1">
			<tr>
				<td>
					<hr class="bold-text" color="gray" align="left" width="17px">
					<h4 align="left">졸업요건</h4>
				</td>
			</tr>
			<tr>
				<td>
					<p>-8학기(건축대학 건축설계전공은 10학기) 이상 등록한 재학생<p>
					<p>-제1전공 이수 요건 충족</p>
					<p>-전학년 성적 평점평균 2.0 이상</p>
					<p>-필수과목 및 이수지정과목을 포함하여 이수구분별 최저이수학점 이상 취득</p>
					<p>-졸업논문 심사 합격</p>
					<p>-졸업인증제 기준 충족(2011학년도 신입생부터 적용)</p>
					<p>-공학교육인증 심화프로그램 요건 충족(공학교육인증 심화프로그램 소속자)</p>
				</td>
				<td>
					<input type="image" width="700" height="500" src="resources/img/graduation.png" alt="졸업요건이미지" class="image-button"  >
				</td>
		</tr>
		<tr height="100"></tr>
	</table>
</div>
</body>
</html>


<%@ include file="notlog_bottom.jsp"%>