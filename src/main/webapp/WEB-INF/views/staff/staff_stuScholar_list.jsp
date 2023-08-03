<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- staff_stuScholar_list.jsp -->
<%@ include file="staff_top.jsp" %>
<div class="pagetitle">
	<h1>학생 장학정보</h1>
	<nav>
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="StaffPage.do">마이페이지</a></li>
			<li class="breadcrumb-item active">학생 장학정보</li>
		</ol>
	</nav>
</div>
<!-- End Page Title -->
<div class="card">
	<section class="section">
		<div class="row">
			<div class="card-body">
				<h5 class="card-title">장학정보 조회</h5>
				<div style="display: flex; justify-content: space-between;">
					<form style="display: flex;" name="f" action="Staff_stuScholar_findId.do" method="post">
						<input style="width: 70%;" class="form-control mb-2" type="text" name="searchString" value="학번을 입력하세요." onfocus="this.value=''">
						<button type="submit" class="btn btn-outline-primary mb-2">검색</button>
					</form>
					<form name="f" action="Staff_stuScholar_list.do?page=1" method="post">
						<button type="submit" class="btn btn-outline-primary mb-2">전체보기</button>
					</form>
				</div>
				<!-- Default Table -->
				<table class="table">
					<thead>
						<tr>
							<th scope="col">학번</th>
							<th scope="col">이름</th>
							<th scope="col">입학일</th>
							<th scope="col">조회하기</th>
						</tr>
					</thead>

					<tbody>
						<c:if test="${listStudent != null || listStudent.size() != 0}">
							<c:forEach var="asdto" items="${listStudent}">
								<tr>
									<td>${asdto.student_id}</td>
									<td>${asdto.name}</td>
									<td>${asdto.indate}</td>
									<td><a
										href="Staff_stuScholar_view.do?student_id=${asdto.student_id}">조회하기</a></td>
								</tr>
							</c:forEach>
						</c:if>

						<c:if test="${listStudent == null || listStudent.size() == 0}">
							<tr>
								<td colspan="5">등록된 학생정보가 없습니다</td>
							</tr>
						</c:if>
					</tbody>
				</table>
				<!-- End Default Table Example -->
				<div align="center">
					<nav aria-label="Page navigation example">
						<ul class="pagination justify-content-center">
							<c:forEach begin="1" end="${pageCount}" var="i">
								<li class="page-item"><a class="page-link"
									href="Staff_stuScholar_list.do?page=${i}">${i}</a>
							</c:forEach>
						</ul>
					</nav>
				</div>
			</div>
		</div>
	</section>
</div>
<%@ include file="staff_bottom.jsp" %>