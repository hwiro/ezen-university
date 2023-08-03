<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<!-- insertGrade.jsp -->
<%@ include file="top.jsp"%>
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
<!-- 				<h5 align="center" class="card-title">※ 학생명을 클릭하시면 성적 입력창으로 이동합니다 ※</h5> -->
				<form name="f" action="listStuInfoPro.do" method="post">
				<table class="table table-striped">
					<thead>
						<tr>
							<th scope="col">학번</th>
							<th scope="col">학생명</th>
							<th scope="col">학과</th>
							<th scope="col">학점</th>
						</tr>
					</thead>
					<tbody>
							<c:forEach var="dto2" items="${listStu2 }">
								<tr>
									<td>${dto2.student_id }</td>
									<td><a
										href="insertGradePro.do?student_id=${dto2.student_id}">${dto2.name }</a></td>
									<td>${dto2.dept }</td>
									<c:forEach var="grade" items="${grade}">
									<c:if test="${dto2.student_id eq grade.key }">
									<td>${grade.value }</td>
									</c:if>
									</c:forEach>
								</tr>
							</c:forEach>
						<tr>
							<td colspan="4" align="center"><a href="classCheck.do?class_code=${class_code }"><button type="button" class="btn btn-outline-primary">확인</button></a>
							</td>
						</tr>
					</tbody>
				</table>
				<font color="red">※ 학생명을 클릭하시면 성적 입력창으로 이동합니다 ※</font>
				</form>
			</div>
		</div>
	</div>
</section>
<%@ include file="bottom.jsp" %>