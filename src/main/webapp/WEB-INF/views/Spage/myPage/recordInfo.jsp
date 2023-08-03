<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="top.jsp"%>
<div class="pagetitle">
	<h1>성적정보</h1>
	<nav>
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="stuMyPage.do">마이페이지</a></li>
			<li class="breadcrumb-item active">성적 정보</li>
		</ol>
	</nav>
</div>
<!-- End Page Title -->
<div class="card">
	<section class="section">
		<div class="row">
			<div class="card-body">
				<h5 class="card-title">대학 : ${accStudent.college} 	전공 :
					${accStudent.dept} 	학번 : ${accStudent.student_id} 	이름 :
					${accStudent.name}</h5>	
				<!-- Default Table -->
				<table class="table">
					<thead>
						<tr>
							<th scope="col">이수영역</th>
							<th scope="col">년도학기</th>
							<th scope="col">교과목명</th>
							<th scope="col">학점/성적</th>
						</tr>
					</thead>

					<tbody>
						<c:if test="${listMyClass != null || listMyClass.size() != 0}">
							<c:forEach var="mcdto" items="${listMyClass}">
								<tr>
									<td>${mcdto.course}</td>
									<td>${mcdto.semester}</td>
									<td>${mcdto.class_name}</td>
									<c:forEach var="grade" items="${grade}">
										<c:if test="${mcdto.class_name eq grade.key}">
											<td>${mcdto.class_credit}/${grade.value}</td>
										</c:if>
									</c:forEach>
								</tr>
							</c:forEach>
						</c:if>
						<c:if test="${listMyClass == null || listMyClass.size() == 0}">
							<tr>
								<td colspan="4"><h1 align="center">등록된 성적이 없습니다.</h1></td>
							</tr>
						</c:if>
					</tbody>
				</table>
			</div>
		</div>
	</section>
</div>
<%@ include file="bottom.jsp"%>