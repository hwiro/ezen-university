<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<!-- freeB_list.jsp -->

<%@ include file="freeB_top.jsp" %>

<table class="table" width="100%" border="1" style="font-size:20px; height:1280px; table-layout:fixed;">
	<tr style="height:10px; width:800px;">
		<th colspan="4" style="height:10px;">
			<div style="display:flex; justify-content:space-between; width:400px; text-align:center;">
				<a href="freeB_list.do?page=1&mode=all">모든글</a>
				<a href="freeB_list.do?page=1&mode=best">개념글</a>
			</div>
		</th>
	</tr>
	
	<tr style="height:10px;">
		<th width="90%" colspan="3" style="border-right:none; border-collapse: collapse;"></th>
		<th style="border-left:none; border-collapse: collapse;"><a href="freeB_insert.do">글 작성</a></th>
	</tr>
	
	<thead style="background-color:#6c757d;">
		<tr style="height:10px; background-color:#6c757d; text-align:center;">
			<th width="70%" style="height:10px;">글 제목</th>
			<th>작성자</th>
			<th>조회수</th>
			<th width="100">작성일</th>
		</tr>
	</thead>
	
	<tbody style="table-layout:fixed;">
		<c:forEach var="dto" items="${list}">
			<tr style="height:10px;" align="center">
				<td style="overflow:hidden; width:400px; height:10px;">
					<c:if test="${dto.thumb >= 10}">
						<img src="resources/img/favicons/thumbsup.png" width="20px" height="20px">
					</c:if>
					<a href="freeB_view.do?code=${dto.etc_board_code}&page=${page}">${dto.subject} [${dto.ip}]</a>
					<c:if test="${dto.image != 'none'}">
						<img src="resources/img/favicons/imgch.png" width="20px" height="20px">
					</c:if>
				</td>
				<c:choose>
				<c:when test="${dto.writer eq '관리자'}">
					<td style="overflow:hidden; white-space:nowrap;">${dto.writer }</td>
				</c:when>
				<c:otherwise>
				<td style="overflow:hidden; white-space:nowrap;">익명</td>
				</c:otherwise>
				</c:choose>
				<td style="overflow:hidden;">${dto.readcount}</td>
				<td style="overflow:hidden;">${dto.reg_date}</td>
			</tr>
		</c:forEach>
	</tbody>
	
	<tr style="height:10px;">
		<td colspan="4" align="right" style="height:10px;">
			<form name="search_freeB" action="freeB_list.do" method="post">
				<select name="search">
					<option value="subject">글제목</option>
					<option value="writer">작성자</option>
				</select>
				<input type="text" name="searchString"/>
				<input type="hidden" name="mode" value="search"/>
				<input type="submit" value="검색"/>
			</form>
		</td>
	</tr>
	
	<tr style="height:10px;">
		<td colspan="4" height="10" align="center" style="height:10px;">
			<c:forEach begin="1" end="${pageCount}" var="i">
				<a href="freeB_list.do?page=${i}&mode=${mode}"><font size="3">[${i}]</font></a>	
			</c:forEach>
		</td>
	</tr>
	
	<c:if test="${list.size() != 20}">
		<tr>
			<td colspan="4" style="border:none; height:${blank}px;"></td>
		</tr>
	</c:if>
	
	<c:if test="${list.size() == 20}">
		<tr>
			<td colspan="4" style="border:none;"></td>
		</tr>
	</c:if>

</table>

<%@ include file="freeB_bottom.jsp" %>