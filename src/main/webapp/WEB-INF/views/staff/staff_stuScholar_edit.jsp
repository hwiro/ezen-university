<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- staff_stuScholar_edit.jsp -->
<%@ include file="staff_top.jsp" %>
<div class="pagetitle">
	<h1>${ssdto.student_id} 학생 장학정보 수정</h1>
	<nav>
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="StaffPage.do">마이페이지</a></li>
			<li class="breadcrumb-item active"><a
				href="Staff_stuScholar_list.do?page=1">학생 장학정보</a></li>
			<li class="breadcrumb-item active"><a
				href="Staff_stuScholar_view.do?student_id=${ssdto.student_id}">학생 장학정보
					조회</a></li>
			<li class="breadcrumb-item active">학생 장학정보 수정</li>
		</ol>
	</nav>
</div>
<section class="section profile">
	<div class="col-xl-8">

		<div class="card">
			<div class="card-body">

				<div class="tab-pane fade show active profile-overview"
					id="profile-overview" role="tabpanel">
					<h5 class="card-title">장학 정보 수정</h5>

					<!-- Profile Edit Form -->
					<form name="f"
						action="Staff_stuScholar_editPro.do?num=${num}"
						method="post">
						
						<input type="hidden" name="student_id" value="${ssdto.student_id}"/>
		
						<div class="row mb-3">
							<label for="scholar_year" class="col-lg-3 col-md-4 label">년도</label>
							<div class="col-md-8 col-lg-9">
								<input name="scholar_year" type="text" class="form-control"
									id="scholar_year" value="${ssdto.scholar_year}">
							</div>
						</div>

						<div class="row mb-3">
							<label for="semester" class="col-lg-3 col-md-4 label">학기</label>
							<div class="col-md-8 col-lg-9">
								<input name="semester" type="text" class="form-control"
									id="semester" value="${ssdto.semester}">
							</div>
						</div>

						<div class="row mb-3">
							<label for="scholar_name" class="col-lg-3 col-md-4 label">장학구분명</label>
							<div class="col-md-8 col-lg-9">
								<input name="scholar_name" type="text" class="form-control"
									id="scholar_name" value="${ssdto.scholar_name}">
							</div>
						</div>

						<div class="row mb-3">
							<label for="price" class="col-lg-3 col-md-4 label">지급금액</label>
							<div class="col-md-8 col-lg-9">
								<input name="price" type="text" class="form-control" id="price"
									value="${ssdto.price}">
							</div>
						</div>

						<div class="row mb-3">
							<label for="get_method" class="col-lg-3 col-md-4 label">지급방법</label>
							<div class="col-md-8 col-lg-9">
								<input name="get_method" type="text" class="form-control"
									id="get_method" value="${ssdto.get_method}">
							</div>
						</div>

						<div class="text-center">
							<button type="submit" class="btn btn-primary">확인</button>
						</div>
					</form>
					<!-- End Profile Edit Form -->
				</div>
			</div>
		</div>
	</div>
</section>
<%@ include file="staff_bottom.jsp" %>