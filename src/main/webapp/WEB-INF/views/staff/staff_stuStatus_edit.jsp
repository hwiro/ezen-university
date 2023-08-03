<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- staff_stuStatus_edit.jsp -->
<%@ include file="staff_top.jsp" %>
<div class="pagetitle">
	<h1>${asdto.student_id} 학생정보 수정</h1>
	<nav>
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="StaffPage.do">마이페이지</a></li>
			<li class="breadcrumb-item active"><a href="Staff_stuStatus_list.do?page=1">학생 학적정보</a></li>
			<li class="breadcrumb-item active">학생 정보 수정</li>
		</ol>
	</nav>
</div>
<section class="section profile">
	<div class="row">
		<div class="col-xl-4">

			<div class="card">
				<div
					class="card-body profile-card pt-4 d-flex flex-column align-items-center">

					<h2>${asdto.name}</h2>
					<h3>${asdto.student_id}</h3>
				</div>
			</div>

		</div>

		<div class="col-xl-8">

			<div class="card">
				<div class="card-body pt-3">
					<!-- Bordered Tabs -->
					<ul class="nav nav-tabs nav-tabs-bordered" role="tablist">

						<li class="nav-item" role="presentation">
							<button class="nav-link active" data-bs-toggle="tab"
								data-bs-target="#profile-overview" aria-selected="true"
								role="tab">학생 정보</button>
						</li>
						
					</ul>
					<div class="tab-content pt-2">

						<div class="tab-pane fade show active profile-overview"
							id="profile-overview" role="tabpanel">
							<h5 class="card-title">Profile Details</h5>

							<div class="row">
								<div class="col-lg-3 col-md-4 label ">이름</div>
								<div class="col-lg-9 col-md-8">${asdto.name}</div>
							</div>

							<div class="row">
								<div class="col-lg-3 col-md-4 label">단과대학</div>
								<div class="col-lg-9 col-md-8">${asdto.college}</div>
							</div>

							<div class="row">
								<div class="col-lg-3 col-md-4 label">전공</div>
								<div class="col-lg-9 col-md-8">${asdto.dept}</div>
							</div>

							<div class="row">
								<div class="col-lg-3 col-md-4 label">학년</div>
								<div class="col-lg-9 col-md-8">${asdto.grade}</div>
							</div>

							<div class="row">
								<div class="col-lg-3 col-md-4 label">생년월일</div>
								<div class="col-lg-9 col-md-8">${asdto.birthdate}</div>
							</div>

							<div class="row">
								<div class="col-lg-3 col-md-4 label">전화번호</div>
								<div class="col-lg-9 col-md-8">${asdto.tel}</div>
							</div>

							<div class="row">
								<div class="col-lg-3 col-md-4 label">주소</div>
								<div class="col-lg-9 col-md-8">${asdto.address}</div>
							</div>
							
							<form name="f" action="Staff_stuStatus_editPro.do" method="post">
								<div class="row mb-3">
									<label for="address" class="col-lg-3 col-md-4 label">재학상태</label>
									<div class="col-md-4 col-lg-9">
										<select style="width:30%;" class="form-select" name="status" required>
											<option value="재학">재학</option>
											<option value="휴학">휴학</option>
											<option value="중퇴">중퇴</option>
										</select> 
										<input type="hidden" name="student_id" value="${asdto.student_id}"/>
										<input type="hidden" name="name" value="${asdto.name}"/>
									</div>
								</div>
	
								<div class="text-center">
									<button type="submit" class="btn btn-primary">확인</button>
								</div>
							</form>
						</div>
					</div>
					<!-- End Bordered Tabs -->

				</div>
			</div>

		</div>
	</div>
</section>
<%@ include file="staff_bottom.jsp" %>