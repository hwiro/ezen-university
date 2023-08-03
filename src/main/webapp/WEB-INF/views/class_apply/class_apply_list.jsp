<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<!-- class_apply_list.jsp -->

<%@ include file="class_apply_top.jsp" %>

<script type="text/javascript">
	function dist() {
		document.apply_class.action = "class_apply_list.do";
		document.apply_class.submit();
	}
</script>
<div class="pagetitle">
	<h1>수강신청</h1>
	<nav>
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="class_apply_main.do">home</a></li>
			<li class="breadcrumb-item active">수강신청</li>
		</ol>
	</nav>
</div>
<!-- End Page Title -->
<form name="apply_class" action="class_apply_all_pro.do" method="post">
<div class="card">
	<section class="section">
		<div class="row">
			<div class="card-body">
				<h5 class="card-title">수강 가능한 강의목록</h5>
				<div style="display: flex;">
					<label class="col-form-label">강의별 보기</label>
					<select class="form-select mb-2" style ="width: 20%;"name="distribute">
						<option value="all" selected>전체보기</option>
						<c:forEach var="ddto" items="${dlist}">
							<option value="${ddto.dept_id}">${ddto.dept_name}</option>
						</c:forEach>
					</select>
					<button type="submit" class="btn btn-outline-primary mb-2" onclick="javascript:dist(); return false;">검색</button>
					<button class="btn btn-outline-primary mb-2" style="margin-left:auto;" onclick="javascript:apply()"">신청하기</button>
				</div>
				<!-- Default Table -->
				<table class="table">
					<thead>
						<tr>
							<th scope="col">선택</th>
							<th scope="col">학과</th>
							<th scope="col">학과코드</th>
							<th scope="col">강의명</th>
							<th scope="col">강의코드</th>
							<th scope="col">지도교수</th>
							<th scope="col">이수학점</th>
							<th scope="col">수업일</th>
							<th scope="col">전공</th>
							<th scope="col">시작시간(24시간 기준)</th>
						</tr>
					</thead>

					<tbody>
						<c:forEach var="cdto" items="${list}">
							<tr>
								<td><input type="checkbox" name="applyCheck" value="${cdto.class_code}" /></td>
								<td>${cdto.dept_name}</td>
								<td>${cdto.dept_id}</td>
								<td class="btn btn-link"
											data-bs-toggle="tooltip" data-bs-placement="right"
											data-bs-original-title="지도교수 : ${cdto.teacher_name}&#10;강의 요일 : ${cdto.onday}&#10;강의 시간 : ${cdto.ontime}&#10;강의실 : ${cdto.classroom} ">
									${cdto.class_name}
								</td>
								
								<%-- <td><a
									href="class_apply_detail.do?class_no=${cdto.class_code}">${cdto.class_name}</a></td> --%>
								<td>${cdto.class_code}</td>
								<td>${cdto.teacher_name}</td>
								<td>${cdto.class_credit}</td>
								<td>${cdto.onday}</td>
								<td>${cdto.course}</td>
								<td>${cdto.ontime}시</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<!-- End Default Table Example -->
				<div align="center">
					<nav aria-label="Page navigation example">
						<ul class="pagination justify-content-center">
							<c:forEach begin="1" end="${pageCount}" var="i">
								<li class="page-item"><a class="page-link"
									href="class_apply_list.do?page=${i}">${i}</a>
							</c:forEach>
						</ul>
					</nav>
				</div>
			</div>
		</div>
	</section>
</div>
</form>
<%@ include file="class_apply_bottom.jsp" %>