<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- library_noticeView.jsp -->
<%@ include file="library_top.jsp" %>
<br><br>
<main>
	<div align="center">
		<table class="table">
			<thead>
			<tr>
				<th>제목</th>
				<td colspan="5">${lbdto.info_title}</td>
			</tr>
			</thead>
			<tr>
				<th>작성자</th>
				<td>${lbdto.writer}</td>
				<th>작성일</th>
				<td>${lbdto.reg_date}</td>
				<th>조회수</th>
				<td>${lbdto.readcount}</td>
			</tr>
			<tr>
				<th>첨부파일</th>
				<td colspan="5">
					<c:forEach var="fdto" items="${filelist}">
						<a href="library_infoBoard_download.do?info_code=${lbdto.info_code}&name=${fdto.save_name}&type=${type}">${fdto.original_name}</a>
					</c:forEach>
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td colspan="5">
					<c:if test="${lbdto.image != 'none'}">
						<img src="resources/infoBoard_img/${lbdto.image}" style="max-height:300px; max-width:400px"><br>
					</c:if>
					${lbdto.content}
				</td>
			</tr>
		</table>
	</div>
</main>
<%@ include file="library_bottom.jsp" %>