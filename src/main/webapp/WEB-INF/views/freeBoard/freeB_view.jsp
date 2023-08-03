<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<!-- freeB_view.jsp -->

<%@ include file="freeB_top.jsp" %>

<table class="table" style="font-size:20px; overflow:auto; width:1000px; min-height:1280px;">
	<tr style="height:10px;">
		<th colspan="5">
			<div style="display:flex; justify-content:space-between; width:400px; text-align:center;">
				<a href="freeB_list.do?page=1&mode=all">모든글</a>
				<a href="freeB_list.do?page=1&mode=best">개념글</a>
			</div>
		</th>
	</tr>
	
	<tr style="height:10px; background-color:#6c757d;">
		<th colspan="5">제목</th>
	</tr>
	
	<tr style="height:10px;">
		<td colspan="5">${vdto.subject}</td>
	</tr>
	
	<c:if test="${vdto.writer_id == sessionScope.id}">
		<tr style="height:10px;">
			<td colspan="5">
				<a href="freeB_edit.do?id=${vdto.writer_id}&code=${vdto.etc_board_code}">수정하기</a>
				|
				<a href="freeB_delete.do?id=${vdto.writer_id}&code=${vdto.etc_board_code}&image=${vdto.image}">삭제하기</a>
			</td>
		</tr>
	</c:if>
	
	<tr style="height:10px;">
		<td colspan="3">익명</td>
		<td>작성일: ${vdto.reg_date}</td>
		<td>조회수: ${vdto.readcount}</td>
	</tr>
	
	<tr>
		<td colspan="5" height="30%" align="center">
			<c:if test="${vdto.image != 'none'}">
				<img src="resources/freeB_img/${vdto.image}" style="max-height:400px; max-width:600px"><br>
			</c:if>
			<div style="width:780px; max-height:350px; text-align:left">${vdto.content}</div>
			<br>
			<img src="resources/img/favicons/thumbsup.png" width="25px" height="25px" onclick="location.href='freeB_thumbup.do?code=${vdto.etc_board_code}'">
			<h4>추천수:${vdto.thumb}</h4>
		</td>
	</tr>
	
	<c:set var="annon" value="1"/>
	<c:if test="${relist != null && relist.size() != 0}">
		<c:forEach var="rvdto" items="${relist}">
			<tr style="height:20px;">
				<td align="center" width="10" nowrap>익명${annon}</td>
				<td>${rvdto.content}</td>
				<td align="center" width="10">${rvdto.reg_date}</td>
				<td align="center" width="10">${rvdto.ip}</td>
				<td align="center" width="10" style="font-size:14px">
				<a href="freeB_reply_delete.do?code=${rvdto.etc_board_reply_code}&id=${rvdto.writer_id}&ref_group=${rvdto.ref_group}">삭제</a>
				</td>
			</tr>
			<c:set var="annon" value="${annon + 1}"/>
		</c:forEach>
	</c:if>
	
	<c:if test="${relist == null || relist.size() == 0}">
		<tr style="height:20px;">
			<td colspan="5">작성된 댓글이 없습니다</td>
		</tr>
	</c:if>
	
	<tr>
		<td colspan="5" style="border:none;"></td>
	</tr>
	
	<tr style="height:10px;">
		<th colspan="4">댓글 작성하기</th>
		<th>${sessionScope.id}</th>
	</tr>
	
	<form name="freeB_reply" action="freeB_reply_insert.do" method="post">
		<tr style="height:75px; border:none;">
			<td colspan="4" align="center"><textarea name="content" onkeyup="fn_checkByte(this, 3500)" style="width:875px; height:75px; font-size:16px;" cols="100%" required></textarea></td>
			<td align="center" width="75px">
				<input type="hidden" name="ref_group" value="${vdto.etc_board_code}"/>
				<input type="hidden" name="writer" value="${sessionScope.id}"/>
				<input type="submit" value="작성" style="width:75px; height:75px;"/>
			</td>
		</tr>
	</form>
	
	<tr style="height:10px; background-color:#6c757d;">
		<th width="70%" colspan="2">글 제목</th>
		<th>작성자</th>
		<th>조회수</th>
		<th>작성일</th>
	</tr>
	
	<c:forEach var="dto" items="${list}">
		<tr style="height:10px; white-space:nowrap;" align="center">
			<td colspan="2">
				<a href="freeB_view.do?code=${dto.etc_board_code}&page=${page}">${dto.subject} [${dto.ip}]</a>
				<c:if test="${dto.image != 'none'}">
					<img src="resources/img/favicons/imgch.png" width="20px" height="20px">
				</c:if>
			</td>
			<td>${dto.writer}</td>
			<td>${dto.readcount}</td>
			<td>${dto.reg_date}</td>
		</tr>
	</c:forEach>
	
	<tr>
		<td colspan="5" align="right" height="10">
			<form name="search_freeB" action="freeB_list.do" method="post">
				<select name="search">
					<option value="subject">글제목</option>
					<option value="writer">작성자</option>
				</select>
				<input type="text" name="searchString"/>
				<input type="submit" value="검색"/>
			</form>
		</td>
	</tr>
	
	<tr>
		<td colspan="5" height="10" align="center">
			<c:forEach begin="1" end="${pageCount}" var="i">
				<a href="freeB_list.do?page=${i}&mode=${mode}"><font size="3">[${i}]</font></a>	
			</c:forEach>
		</td>
	</tr>
	
	<tr>
		<td colspan="5" style="border:none;"></td>
	</tr>

</table>

<%@ include file="freeB_bottom.jsp" %>