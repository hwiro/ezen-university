<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- lecture.jsp -->
<%@ include file="top.jsp"%>
<div class="pagetitle">
	<h1>강의 목록</h1>
	<nav>
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="login_main.do">홈</a></li>
			<li class="breadcrumb-item"><a href="#">마이페이지</a></li>
			<li class="breadcrumb-item active"><a href="lecture.do">강의
					목록</a></li>
		</ol>
	</nav>
</div>
<br>
<br>
<section class="section">
	<div class="row">
		<div class="card">
			<div class="card-body">
				<form name="f" action="classCheck.do" method="post">
					<input type="hidden" name="class_name" value="${dto.class_name }">
					<h5 class="card-title" align="center"
						style="font: bold 1.5em/1em 고딕;">내 강의 목록</h5>
					<div class="row mb-3">
						<!--                   <label class="col-sm-2 col-form-label mb-3">과목명 선택</label> -->
						<div align="center">
							<select name="lecture" class="form-select mb-3"
								aria-label="Default select example">
								<c:forEach var="dto" items="${list}">
									<option align="center" value="${dto.class_name }">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${dto.class_name }</option>
								</c:forEach>
							</select>
						</div>
						<div align="center">
							<button type="submit" class="btn btn-outline-primary">조회</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</section>
<%@ include file="bottom.jsp"%>