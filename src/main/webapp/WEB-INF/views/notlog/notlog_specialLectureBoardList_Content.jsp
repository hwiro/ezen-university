<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- notlog_specialLectureBoardList_Content.jsp -->
<%@ include file="notlog_top.jsp" %>
	
	<style>
	    table {
	        border: 1px solid #2968ab; /* 테두리의 두께와 색상을 설정합니다. */
	    }
	    
	    .table-bordered{
			width:80%;
			align-items: center;
			margin: 0 auto;
		}
	</style>
<br><br><br><br><br><br>
	<table border="1" class="table table-bordered">
		<tr>
			<th width="15%">제목</th>
			<td colspan="3">${dto.info_title}</td>
			<th width="10%">첨부파일</th>
			<td>
				<c:if test="${file == null}">
        			첨부파일 없음
        		</c:if>
        		<c:if test="${file != null}">
					<a href="notlog_infoBoard_download.do?info_code=${dto.info_code}&type=${dto.type}&name=${file.save_name}">${file.original_name}</a>
				</c:if>
			</td>
		</tr>
		<tr>
			<th>작성일</th>
			<td align="center" width="20%">${dto.reg_date}</td>
			<th width="10%">담당자</th>
			<td align="center" width="20%">${dto.writer}</td>
			<th width="10%">조회수</th>
			<td align="center" width="20%">${dto.readcount}</td>
		</tr>   
		<tr>
			<td colspan="6" height="50">${dto.content}</td>
		</tr>
		<tr>
			<td colspan="6" align="center"><img src="resources/infoBoard_img/${dto.image}" width="1200px" height="500px"></td>
		</tr>		
	</table>
       
	<br>
        
     <div align="center">
        <table border="1" width="150" height="40">
        	<tr align="center">
        		<td>
        			<a href="notlog_specialLectureBoardList.do?page=1">목록</a>
       			</td>
       		</tr>
       	</table>
	</div>



<%@ include file="notlog_bottom.jsp"%>