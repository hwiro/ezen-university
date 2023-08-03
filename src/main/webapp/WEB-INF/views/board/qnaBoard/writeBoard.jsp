<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- writeBoard.jsp -->
<%@ include file="../top.jsp"%>

<script type="text/javascript">
	function check() {
		if (f.subject.value == "") {
			alert("제목을 입력해 주세요!!")
			f.subject.focus()
			return false
		}
		if (f.content.value == "") {
			alert("내용을 입력해 주세요!!")
			f.content.focus()
			return false
		}
		return true
	}
</script>
<div class="card">
            <div class="card-body">
              <h5 class="card-title" style="font-family: 'Orbit', sans-serif;">글쓰기</h5>
              <!-- Floating Labels Form -->
              <form name="f" action="write_qna_board.do" method="post" enctype="multipart/form-data" onsubmit="return check()">
			  	<input type="hidden" name="major_qna_board_code" value="${major_qna_board_code}"/>
				<input type="hidden" name="re_group" value="${re_group}"/>
				<input type="hidden" name="re_step" value="${re_step}"/>
				<input type="hidden" name="re_level" value="${re_level}"/>
			<div class="form-check form-check-inline mt-3">
				<input class="form-check-input" type="checkbox" name="secret" id="secret"> 
				<label class="form-check-label">비밀글 설정</label>
			</div>
			<div class="col-md-12">
                  <div class="form-floating">
                    <input type="text" class="form-control" id="floatingSubject" name="subject" placeholder="Your Name" onkeyup="fn_checkByte(this, 50)" style="font-family: 'Orbit', sans-serif;">
                    <label for="floatingSubject">제목</label>
                  </div>
                </div>
                <br>
                <div class="col-12">
                  <div class="form-floating">
                    <textarea class="form-control" placeholder="내용" name="content" id="floatingTextarea" style="height: 200px;" onkeyup="fn_checkByte(this, 4000)" style="font-family: 'Orbit', sans-serif;"></textarea>
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
                    <label for="floatingImage" style="font-family: 'Orbit', sans-serif;">사진 첨부</label>
                  </div>
                </div>
                <br><br>
                <div class="text-center">
                  <button type="submit" class="btn btn-primary">글쓰기</button>
                  <a href="qnaBoard.do"><button type="button" class="btn btn-secondary">뒤로가기</button></a>
                </div>
              </form><!-- End floating Labels Form -->

            </div>
          </div>
<%@ include file="../bottom.jsp"%>