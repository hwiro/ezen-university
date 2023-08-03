<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<!-- freeB_insert.jsp -->

<%@ include file="freeB_top.jsp" %>

<form name="freeBinsert" action="freeB_insert_pro.do" method="post" enctype="multipart/form-data">
	<table width="100%" height="1280" style="font-size:20px;" class="table">
		<tr style="height:10px;">
			<th colspan="2"><a href="freeB_list.do?page=1&mode=all">모든글</a></th>
			<th colspan="2"><a href="freeB_list.do?page=1&mode=best">개념글</a></th>
		</tr>
		
		<tr style="height:10px;">
			<th colspan="4">새 글 작성</th>
		</tr>
		
		<tr style="height:20px;">
			<th width="20%">글 제목</th>
			<td width="30%"><input type="text" name="subject" style="height:30px;" onkeyup="fn_checkByte(this, 50)" style="height:20px; width:240px; font-size:20px;" required/></td>
			<th width="20%">작성자</th>
			<td width="30%">
				<input type="text" name="writer" value="${writer}" style="height:30px; width:240px; font-size:20px;" readOnly/>
				<input type="hidden" name="writer_id" value="${sessionScope.id}"/>
			</td>
		</tr>
		
		<tr style="height:10px;">
			<th width="20%">이미지</th>
			<td colspan="3"><input type="file" name="image"/></td>
		</tr>
		
		<tr>
			<td colspan="4" height="30%" align="center">
				<textarea name="content" onkeyup="fn_checkByte(this, 3500)" style="font-size:16px; height:375px; width:780px; over-flow:auto"></textarea>
			</td>
		</tr>
		
		<tr style="height:10px;">
			<td colspan="4" align="right">
				<input type="submit" value="작성완료" style="font-size:22px;"/>
			</td>
		</tr>
		
		<tr>
			<td colspan="4" style="border:none;" align="center"><img src="resources/freeB_img/commercial3.png"/></td>
		</tr>
	
	</table>
</form>

<%@ include file="freeB_bottom.jsp" %>