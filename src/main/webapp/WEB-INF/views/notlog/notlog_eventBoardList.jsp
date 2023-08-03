<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- notlog_eventBoardList.jsp -->
<%@ include file="notlog_top.jsp" %>

	<style>
	    .table-hover{
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
		<div align="center">
			<h1>공지&nbsp;<img src="resources/img/lowerButton.png" alt="내리기 버튼" onmouseover="showTableOfContents('toc17')" onmouseout="setTimeout(function() { hideTableOfContents('') }, 5000)"></h1>
			<h2>공모`행사공지</h2>
		</div>
		<div id="toc17" class="toc hidden" align="center" >
	 	 	<table align="center">
	 	 		<tr>
 					<th>
 						<ul>
 							<li><p><a href="notlog_libraryBoardList.do?page=1" ><i class="bi bi-dot"></i>도서공지</a></p></li>
 							<li><p><a href="notlog_specialLectureBoardList.do?page=1" ><i class="bi bi-dot"></i>특강공지</a></p></li>
 							<li><p><a href="notlog_scholarBoard.do?page=1" ><i class="bi bi-dot"></i>장학공지</a></p></li>
						</ul>
					</th>
				</tr>
			</table>
		</div>	
			<div align="center">
				<i class="bi bi-justify-right"></i>&nbsp;총  <span style="color: orange">${totalPosts3}</span>개의 게시물이 있습니다.
			</div>
				<hr color="black">
				
				<table class="table table-hover" border="1" width="80%">
				<tr>
				<c:if test="${event_listBoard != null || event_listBoard.size() != 0}">
					<c:forEach var="ldto" items="${event_listBoard}">
						<tr align="center">
							<td width="200px" height="130px"><a href="notlog_eventBoardList_Content.do?info_code=${ldto.info_code}"><input type="image" width="200px" height="130px" src="resources/infoBoard_img/${ldto.image}" alt="교내행사" class="image-button"></a></td>
							<td height="30px" ><a href="notlog_eventBoardList_Content.do?info_code=${ldto.info_code}">공지_&nbsp;&nbsp;${ldto.info_title}</a></td>
						</tr>
						
					</c:forEach>
				</c:if>
				
				<c:if test="${event_listBoard == null || event_listBoard.size() == 0}">
					<tr>
            			<td><h1 align="center">등록된 행사공지가 없습니다</h1></td>
         			</tr>			
				</c:if>
				</tr>
				<tr>
					<td align="center" colspan="2">
			 			<c:forEach begin="1" end="${pageCount}" var="i">
        					 <a href="notlog_eventBoardList.do?page=${i}"><font size="3">[${i}]</font></a>   
      					</c:forEach>
					</td>
				</tr>
			</table>			

<%@ include file="notlog_bottom.jsp"%>