<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- staff_stuScholar_view.jsp -->
<%@ include file="staff_top.jsp" %>
<div class="pagetitle">
	<h1>${student_id} 학생 장학정보</h1>
	<nav>
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="StaffPage.do">마이페이지</a></li>
			<li class="breadcrumb-item active"><a href="Staff_stuScholar_list.do?page=1">학생 장학정보</a></li>
			<li class="breadcrumb-item active">학생 장학정보 조회</li>
		</ol>
	</nav>
</div>
<!-- End Page Title -->
<div class="card">
	<section class="section">
		<div class="row">
			<div class="card-body">
				<h5 class="card-title">장학정보 조회</h5>
					<div align="right">
						<form name="f" action="Staff_stuScholar_insert.do?student_id=${student_id}" method="post">
							<button type="submit" class="btn btn-outline-primary mb-2">새 장학 정보 등록</button>
						</form>
					</div>
				<!-- Default Table -->
				<table class="table">
					<thead>
						<tr>
							<th scope="col">번호</th>
							<th scope="col">년도</th>
							<th scope="col">학기</th>
							<th scope="col">장학 구분명</th>
							<th scope="col">장학 지급 금액</th>
							<th scope="col">지급방법</th>
							<th scope="col">수정 | 삭제</th>
						</tr>
					</thead>

					<tbody>
						<c:if test="${scholarList != null || scholarList.size() != 0}">
							<c:forEach var="sldto" items="${scholarList}">
								<tr>
									<td>${sldto.num}</td>
									<td>${sldto.scholar_year}</td>
									<td>${sldto.semester}</td>
									<td>${sldto.scholar_name}</td>
									<td><fmt:formatNumber value="${sldto.price}"
											pattern="000,000" />원</td>
									<td>${sldto.get_method}</td>
									<td><a href="Staff_stuScholar_edit.do?num=${sldto.num}">수정</a>
										| <a
										href="Staff_stuScholar_delete.do?num=${sldto.num}&&student_id=${student_id}">삭제</a>
									</td>
								</tr>
							</c:forEach>
						</c:if>
						<c:if test="${scholarList == null || scholarList.size() == 0}">
							<tr>
								<td colspan="7"><h1 align="center">등록된 장학금이 없습니다</h1></td>
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
									href="Staff_stuStatus_list.do?page=${i}">${i}</a>
							</c:forEach>
						</ul>
					</nav>
				</div>
			</div>
		</div>
	</section>
</div>
<%@ include file="staff_bottom.jsp" %>