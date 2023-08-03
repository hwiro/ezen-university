<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="top.jsp"%>
<div class="pagetitle">
	<h1>강의 정보</h1>
	<nav>
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="stuMyPage.do">마이페이지</a></li>
			<li class="breadcrumb-item active">강의 정보</li>
		</ol>
	</nav>
</div>
<!-- End Page Title -->
<div class="card">
	<section class="section">
		<div class="row">
			<div class="card-body">
				<h5 class="card-title">현재학기 : ${semester}</h5>

				<!-- Default Table -->
				<table class="table">
					<thead>
						<tr>
							<th scope="col">이수영역</th>
							<th scope="col">강의명</th>
							<th scope="col">담당교수</th>
							<th scope="col">학점</th>
						</tr>
					</thead>

					<tbody>
						<c:if
							test="${semListMyClass != null || semListMyClass.size() != 0}">
							<c:forEach var="mcdto" items="${semListMyClass}">
								<tr>
									<td>${mcdto.course}</td>
									<td><a href="stuClassCheck.do?student_id=${mcdto.student_id}&class_name=${mcdto.class_name}">${mcdto.class_name}</a></td>
									<td>${mcdto.teacher_name}</td>
									<td>${mcdto.class_credit}</td>
								</tr>
							</c:forEach>
						</c:if>

						<c:if
							test="${semListMyClass == null || semListMyClass.size() == 0}">
							<tr>
								<td colspan="4"><h1 align="center">등록된 강의가 없습니다.</h1></td>
							</tr>
						</c:if>
					</tbody>
				</table>
				<!-- End Default Table Example -->
			</div>
		</div>
	</section>
</div>
<%@ include file="bottom.jsp"%>