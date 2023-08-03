<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../top.jsp" %>
<!DOCTYPE html>
<!-- updateBoard.jsp -->
<div class="card">
            <div class="card-body">
              <h5 class="card-title" style="font-family: 'Orbit', sans-serif;">글쓰기</h5>
              <!-- Floating Labels Form -->
              <form name="f" action="update_qna_board.do" method="post" enctype="multipart/form-data" onsubmit="return check()">
              <input type="hidden" name="major_qna_board_code" value="${getBoard.major_qna_board_code }">
                <div class="col-md-12">
                  <div class="form-floating">
                    <input type="text" class="form-control" id="floatingSubject" name="subject" placeholder="Your Name" 
                     value="${getBoard.subject }" onkeyup="fn_checkByte(this, 50)" style="font-family: 'Orbit', sans-serif;">
                    <label for="floatingSubject">제목</label>
                  </div>
                </div>
                <br>
                <div class="col-12">
                  <div class="form-floating">
                    <textarea class="form-control" placeholder="내용" name="content" id="floatingTextarea" style="height: 300px;" onkeyup="fn_checkByte(this, 4000)" style="font-family: 'Orbit', sans-serif;">${getBoard.content }</textarea>
                    <label for="floatingTextarea" style="font-family: 'Orbit', sans-serif;">내용</label>
                  </div>
                </div>
                <br>
                <div class="col-md-12">
                  <div class="form-floating">
                  	<input class="form-control" type="file" name="original_name" id="floatingFile" multiple>
                    <label for="floatingFile">파일첨부</label>
                  </div>
                </div>
                <br>
                <div class="col-md-12">
                  <div class="form-floating">
                  	<input class="form-control" type="file" name="image" id="floatingImage" onkeyup="fn_checkByte(this, 60)">
                  	<input type="hidden" name="image2" value="${getBoard.image}"/>
                    <label for="floatingImage" style="font-family: 'Orbit', sans-serif;">사진 첨부</label>
                  </div>
                </div>
                <br><br>
                <div class="text-center">
                  <button type="submit" class="btn btn-primary">수정</button>
                  <a href="qnaBoard.do"><button type="button" class="btn btn-secondary">취소</button></a>
                </div>
              </form>
              <!-- End floating Labels Form -->
            </div>
          </div>
<!-- <div align="center"> -->
<!-- 	<form name="f" action="update_qna_board.do" method="post" enctype="multipart/form-data" onsubmit="return check()"> -->
<%-- 		<input type="hidden" name="major_qna_board_code" value="${getBoard.major_qna_board_code }" /> --%>
<!-- 		<table border="1" width="40%"> -->
<!-- 			<tr bgcolor="yellow"> -->
<!-- 				<td align="center" colspan="2">글 수 정</td> -->
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<th bgcolor="yellow" width="20%">이 름</th> -->
<%-- 				<td><input type="text" name="writer" value="${getBoard.writer }" readOnly></td> --%>
				
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<th bgcolor="yellow" width="20%">제 목</th> -->
<%-- 				<td><input type="text" name="subject" value="${getBoard.subject }" onkeyup="fn_checkByte(this, 50)"></td> --%>
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<th bgcolor="yellow" width="20%">내 용</th> -->
<%-- 				<td><textarea name="content" rows="11" cols="50" onkeyup="fn_checkByte(this, 4000)">${getBoard.content }</textarea></td> --%>
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<th bgcolor="yellow" width="20%">이미지</th> -->
<!-- 				<td><input type="file" name="image"><br><img -->
<%-- 				src="${path}/${getBoard.image}" width="100" height="100"> --%>
<%-- 				<input type="hidden" name="image2" value="${getBoard.image}"/></td> --%>
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<th bgcolor="yellow" width="20%">파일</th> -->
<!-- 				<td><input type="file" name="original_name" multiple="multiple"></td> -->
<!-- 			</tr> -->
<!-- 			<tr bgcolor="yellow"> -->
<!-- 				<td align="center" colspan="2"> -->
<!-- 					<input type="submit" value="글수정"> -->
<!-- 					<input type="reset" value="다시작성"> -->
<!-- 					<input type="button" value="목록보기" onclick="window.location='list_board.do'"> -->
<!-- 				</td> -->
<!-- 			</tr> -->
<!-- 		</table> -->
<!-- 	</form> -->
<!-- </div> -->
<%@ include file="../bottom.jsp" %>