<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">

<!-- admin_qnaBoard.jsp -->

<%@ include file="../admin_top.jsp" %>

<style>
.button {
	border-radius: 5px;
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

<a href="admin_qnaBoard_list.do?mode=all&page=1">글 목 록</a>
<table class="table table-striped">
	<thead>
		<tr>
			<td align="right" colspan="3"><a href="admin_qnaBoard_insert.do">글쓰기</a></td>
		</tr>
		<tr>
			<th width="60" align="center">번호</th>
			<th>제목</th>
			<th width="100" align="center">수정|삭제</th>
		</tr>
	</thead>
	
	<tbody>
		<c:if test="${list.size() == 0 || list == null}">
			<tr>
				<td colspan="3">등록된 글이 없습니다.</td>
			</tr>
		</c:if>
		
		<c:forEach var="dto" items="${list}">
			<tr>
				<td align="center">${dto.qna_code}</td>
				<td>
					${dto.qna_title}
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<i class="bi bi-plus-square" onclick="toggleContent(${dto.qna_code})">더보기</i>
				</td>
				<td align="center">
					<a href="admin_qnaBoard_edit.do?code=${dto.qna_code}">수정</a>
					|
					<a href="admin_qnaBoard_delete.do?code=${dto.qna_code}">삭제</a>
				</td>
			</tr>
			
			<tr id="${dto.qna_code}" style="display:none;">
				<td align="center">→</td>
				<td colspan="2">${dto.content}</td>
			</tr>
		</c:forEach>
	</tbody>
</table>

<div align="right">
	<form name="f" action="admin_qnaBoard_list.do" method="post">
		<select name="search" style="border-radius:5px;">
			<option value="qna_title">제목</option>
			<option value="content">내용</option>
		</select> 
		<input type="text" name="searchString" style="border-radius:5px;"/> 
		<input type="hidden" name="mode" value="search"/>
		<input type="submit" value="검색" style="border-radius:5px;"/>
	</form>
</div>

<div align="center">
	<c:forEach var="i" begin="1" end="${pageCount}">
		[<a href="admin_qnaBoard_list.do?mode=${mode}&page=${i}">${i}</a>]
	</c:forEach>
</div>
	
<%@ include file="../admin_bottom.jsp" %>