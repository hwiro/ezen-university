<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<!-- class_apply_mylist.jsp -->

<%@ include file="class_apply_top.jsp" %>
<div class="pagetitle">
	<h1>신청한 강의 목록</h1>
	<nav>
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="class_apply_main.do">home</a></li>
			<li class="breadcrumb-item active">신청한 강의 목록</li>
		</ol>
	</nav>
</div>
<!-- End Page Title -->
<div class="card">
	<section class="section">
		<div class="row">
			<div class="card-body">
				<h5 class="card-title">강의 목록</h5>
				<!-- Default Table -->
				<table class="table">
					<thead>
						<tr>
							<th scope="col">강의명</th>
							<th scope="col">강의코드</th>
							<th scope="col">지도교수</th>
							<th scope="col">이수학점</th>
							<th scope="col">학기</th>
							<th scope="col">강의구분</th>
							<th scope="col">신청취소</th>
						</tr>
					</thead>

					<tbody>
						<c:forEach var="cdto" items="${list}">
							<tr style="height:10px;">
								<td>${cdto.class_name}</td>
								<td>${cdto.class_code}</td>
								<td>${cdto.teacher_name}</td>
								<td>${cdto.class_credit}</td>
								<td>${cdto.semester}</td>
								<td>${cdto.course}</td>
								<td>
									<a href="class_apply_cancel.do?class_code=${cdto.class_code}">신청취소</a>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<!-- End Default Table Example -->
			</div>
		</div>
	</section>
</div>
<%@ include file="class_apply_bottom.jsp" %>