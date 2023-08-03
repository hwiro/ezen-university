<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../admin_top.jsp" %>
<<script type="text/javascript">
	function check(){
		if (f.subject.value==""){
			alert("제목을 입력해 주세요!!")
			f.subject.focus()
			return false
		}
		if (f.content.value==""){
			alert("내용을 입력해 주세요!!")
			f.content.focus()
			return false
		}
		return true
	}
</script>
<script src = "http://code.jquery.com/jquery-latest.js">
    var cnt = 1;
    function fn_addFile(){
        $("#d_file").append("<br>" + "<input type='file' name='file" + cnt + "' />");
        cnt++;
    }
</script>
</head>
<body>
<div class="card">
            <div class="card-body">
              <h5 class="card-title" style="font-family: 'Orbit', sans-serif;">글쓰기</h5>
              <form name="f" action="admin_update_major_board.do" method="post" enctype="multipart/form-data" onsubmit="return check()">
              <input type="hidden" name="major_board_code" value="${getBoard.major_board_code }">
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
                  <a href="admin_majorBoard.do"><button type="button" class="btn btn-secondary">취소</button></a>
                </div>
              </form>
            </div>
          </div>
<%@ include file="../admin_bottom.jsp" %>