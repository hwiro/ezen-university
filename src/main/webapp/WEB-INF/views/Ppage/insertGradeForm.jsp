<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<!-- insertGradForm.jsp -->
<%@ include file="top.jsp" %>
<div class="pagetitle">
	<h1>성적 관리</h1>
	<nav>
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="login_main.do">홈</a>
			</li>
			<li class="breadcrumb-item">
				<a href="#">마이페이지</a>
			</li>
			<li class="breadcrumb-item active"><a href="insertGrade.do">성적 입력</a>
			</li>
		</ol>
	</nav>
</div>
<section class="section">
	<div class="row">
		<div class="card">
			<div class="card-body">
				<h5 class="card-title">성적 입력</h5>
				<form name="f" action="saveGrade.do" method="post">
					<input type="hidden" name="student_id" value="${student_id }">
					<div class="row mb-3">
						<label for="name" class="col-sm-2 col-form-label">학생명</label>
						<div class="col-sm-10">
							<input type="text" class="form-control-plaintext" id="name" name="name" value="${student_name}">
						</div>
					</div>
					<div class="row mb-3">
						<label for="attendance" class="col-sm-2 col-form-label">출결 점수</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="attendance" name="attendance" 
							placeholder="2자리 이하의 숫자만 입력 가능합니다." maxlength="2">
						</div>
					</div>
					<div class="row mb-3">
						<label for="homework" class="col-sm-2 col-form-label">과제 점수</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="homework" name="homework"
							placeholder="2자리 이하의 숫자만 입력 가능합니다." maxlength="2">
						</div>
					</div>
					<div class="row mb-3">
						<label for="midterm" class="col-sm-2 col-form-label">중간고사 점수</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="midterm" name="midterm"
							placeholder="2자리 이하의 숫자만 입력 가능합니다." maxlength="2">
						</div>
					</div>
					<div class="row mb-3">
						<label for="finals" class="col-sm-2 col-form-label">기말고사 점수</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="finals" name="finals"
							placeholder="2자리 이하의 숫자만 입력 가능합니다." maxlength="2">
						</div>
					</div>
					<div align="center">
						<button type="submit" class="btn btn-primary">저장</button>
						<a href="insertGrade.do"><button type="button" class="btn btn-primary">뒤로가기</button></a>
					</div>
				</form>
			</div>
		</div>
	</div>
</section>
<%@ include file="bottom.jsp" %>