<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<%@ include file="top.jsp"%>
<div class="pagetitle">
	<h1>강의 상세</h1>
	<nav>
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="stuMyPage.do">마이페이지</a></li>
			<li class="breadcrumb-item"><a href="stuCourseInfo.do">강의 정보</a></li>
			<li class="breadcrumb-item active">강의 상세</li>
		</ol>
	</nav>
</div>
<section class="section">
	<div class="row">
		<div class="card">
			<div class="card-body">
				<!-- 				<div class="tab-content pt-2"> -->
				<!-- 				<br> -->
				<!-- 					<div class="row"> -->
				<!-- 						<div class="col-lg-3 col-md-4 label"><b>강의시간</b></div> -->
				<%-- 						<div class="col-lg-9 col-md-8">${getClass.onday }요일</div> --%>
				<!-- 					</div> -->
				<!-- 					<div class="row"> -->
				<!-- 						<div class="col-lg-3 col-md-4 label"><b>강의실</b></div> -->
				<%-- 						<div class="col-lg-9 col-md-8">${getClass.classroom }</div> --%>
				<!-- 					</div> -->
				<!-- 					<br><br> -->
				<!-- 					<div class="row"> -->
				<%-- 						<div class="col-lg-3 col-md-4 label"><a href="listStuInfo.do?class_code=${getClass.class_code }">학생정보</a></div> --%>
				<!-- 					</div> -->
				<!-- 					<div class="row"> -->
				<!-- 						<div class="col-lg-3 col-md-4 label"><a href="insertGrade.do">성적입력</a></div> -->
				<!-- 					</div> -->
				<!-- 					<div class="row"> -->
				<%-- 						<div class="col-lg-3 col-md-4 label"><a href="noticeBoard.do?class_code=${getClass.class_code }">게시판으로 가기</a></div> --%>
				<!-- 					</div> -->
				<!-- 				</div> -->
				<table align="center">
					<tr>
						<th>강의명</th>
						<td>${getClass.class_name}</td>
					</tr>
					<tr>
						<th>담당 교수</th>
						<td>${getClass.teacher_name}</td>
					</tr>
					<tr>
						<th>이수 학점</th>
						<td>${getClass.class_credit}</td>
					</tr>
					<tr>
						<th>강의요일</th>
						<td>${getClass.onday}</td>
					</tr>
					<tr>
						<th>강의시간(24시간 기준)</th>
						<td>${getClass.ontime}</td>
					</tr>
					<tr>
						<th>강의실</th>
						<td>${getClass.classroom}</td>
					</tr>
					<tr>
						<th><a href="noticeBoard.do">게시판으로 가기</a></th>
					</tr>
					<tr>
						<td align="center">
						<button type="button"class="btn btn-primary" onclick="location.href='stuCourseInfo.do'">뒤로가기</button></td>
				</table>
			</div>
		</div>
	</div>
</section>
<%@ include file="bottom.jsp" %>