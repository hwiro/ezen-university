<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- notlog_qnaBoard_list.jsp -->
<%@ include file="notlog_top.jsp" %>

<style>
.button {
	padding: 5px;
}
</style>

<style>
    .td.fixed {
        position: sticky;
        right: 0;
        background-color: #ffffff; /* 배경색을 변경해 원하는 스타일을 적용할 수 있습니다. */
    }
    .table-striped{
    	width:80%;
    	align-items: center;
    	margin: 0 auto;
    }
</style>


<script type="text/javascript">
	function toggleContent(qna_code) {
		var content = document.getElementById(qna_code);
		if(content.style.display === "none") {
			content.style.display = "";
		}
		else {
			content.style.display = "none";
		}
	}
</script>
	<br><br><br><br>
	<h4 align="center" color="gray"><strong>자주묻는 질문&nbsp;<i class="bi bi-chat-square-heart"></i></strong></h4><br>
	<table class="table table-striped" border="1" width="80%">
		<thead>
			<tr>
				<th>제목</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${list.size() == 0 || list == null}">
			<tr>
				<td colspan="3">등록된 공지 글이 없습니다.</td>
			</tr>
			</c:if>
			<c:forEach var="dto" items="${list}">
				<tr>
					<td colspan="2">
						${dto.qna_title}
						&nbsp;&nbsp;&nbsp;
						<i class="bi bi-plus-square" onclick="toggleContent(${dto.qna_code})">더보기</i>
					</td>
				</tr>
				<tr id="${dto.qna_code}" style="display:none;">
					<td align="left">→</td>
					<td colspan="2" align="left">${dto.content}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<br><br><br>
	<div align="center">
		<form name="f" action="notlog_qnaBoard_list.do" method="post">
			<select name="search">
				<option value="qna_title">제목</opiton>
				<option value="content">내용</option>
			</select> 
			<input type="text" name="searchString"/> 
			<input type="hidden" name="mode" value="search"/>
			<input type="submit" value="찾기"/>
		</form>
	</div>

	<div align="center">
		<c:forEach var="i" begin="1" end="${pageCount}">
			<a href="notlog_qnaBoard_list.do?mode=${mode}&page=${i}">[${i}]</a>
		</c:forEach>
	</div>

<%@ include file="notlog_bottom.jsp"%>	