<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<!-- classCheck.jsp -->
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
<section class="section">
	<div class="row">
		<div class="card">
			<div class="card-body">
				<table align="center">
					<tr>
						<th>강의시간</th>
						<td>${getClass.onday }</td>
					</tr>
					<tr>
						<th>강의실</th>
						<td>${getClass.classroom }</td>
					</tr>
					<tr>
						<th><a href="listStuInfo.do?class_code=${getClass.class_code }">학생정보</a></th>
					</tr>
					<tr>
						<th><a href="insertGrade.do">성적입력</a></th>
					</tr>
					<tr>
						<th><a href="noticeBoard.do?class_code=${getClass.class_code }">게시판으로
								가기</a></th>
					</tr>
					<tr>
						<td align="center">
						<button type="button"class="btn btn-primary" onclick="location.href='lecture.do'">뒤로가기</button></td>
				</table>
			</div>
		</div>
	</div>
</section>


<%@ include file="bottom.jsp"%>