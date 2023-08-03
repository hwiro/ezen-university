<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- staff_info.jsp -->
<%@ include file="staff_top.jsp" %>
<div class="pagetitle">
	<h1>Profile</h1>
	<nav>
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="StaffPage.do">마이페이지</a></li>
			<li class="breadcrumb-item active">내 정보</li>
		</ol>
	</nav>
</div>
<!-- End Page Title -->
<section class="section profile">
	<div class="row">
		<div class="col-xl-4">

			<div class="card">
				<div
					class="card-body profile-card pt-4 d-flex flex-column align-items-center">

					<h2>${asdto.name}</h2>
					<h3>${asdto.authority_level}</h3>
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
								role="tab">내 정보</button>
						</li>

						<li class="nav-item" role="presentation">
							<button class="nav-link" data-bs-toggle="tab"
								data-bs-target="#profile-edit" aria-selected="false"
								tabindex="-1" role="tab">내 정보 수정</button>
						</li>

						<li class="nav-item" role="presentation">
							<button class="nav-link" data-bs-toggle="tab"
								data-bs-target="#profile-change-password" aria-selected="false"
								tabindex="-1" role="tab">비밀번호 변경</button>
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

							<div class="row">
								<div class="col-lg-3 col-md-4 label">이메일</div>
								<div class="col-lg-9 col-md-8">${asdto.email}</div>
							</div>

						</div>

						<div class="tab-pane fade profile-edit pt-3" id="profile-edit"
							role="tabpanel">

							<!-- Profile Edit Form -->
							<form name="f" action="Staff_EditInfoPro.do" method="post">

								<div class="row mb-3">
									<label for="name" class="col-md-4 col-lg-3 col-form-label">이름</label>
									<div class="col-md-8 col-lg-9">
										<input name="name" type="text" class="form-control"
											id="name" value="${asdto.name}" readOnly>
									</div>
								</div>

								<div class="row mb-3">
									<label for="birthdate" class="col-md-4 col-lg-3 col-form-label">생년월일</label>
									<div class="col-md-8 col-lg-9">
										<input name="birthdate" type="text" class="form-control"
											id="birthdate" value="${asdto.birthdate}" readOnly>
									</div>
								</div>

								<div class="row mb-3">
									<label for="tel" class="col-md-4 col-lg-3 col-form-label">전화번호</label>
									<div class="col-md-8 col-lg-9">
										<input name="tel" type="text" class="form-control" id="tel"
											value="${asdto.tel}">
									</div>
								</div>

								<div class="row mb-3">
									<label for="address" class="col-md-4 col-lg-3 col-form-label">주소</label>
									<div class="col-md-8 col-lg-9">
										<input name="address" type="text" class="form-control"
											id="address" value="${asdto.address}">
									</div>
								</div>

								<div class="row mb-3">
									<label for="email" class="col-md-4 col-lg-3 col-form-label">이메일</label>
									<div class="col-md-8 col-lg-9">
										<input name="email" type="text" class="form-control"
											id="email" value="${asdto.email}">
									</div>
								</div>

								<div class="text-center">
									<button type="submit" class="btn btn-primary">확인</button>
								</div>
							</form>
							<!-- End Profile Edit Form -->

						</div>

						<div class="tab-pane fade profile-edit pt-3" id="profile-change-password"
							role="tabpanel">
							<!-- Change Password Form -->
							<h5 class="card-title">주의사항</h5>
							<p class="small fst-bold">
							비밀번호 변경 후 변경된 비밀번호가 바로 반영됩니다.<br>
							교육부 개인정보보호 지침에 따라 비밀번호는 최소 9자리 이상으로 지정하여야 하며 <br>
							<font color="red"><b>영문자(대소문자 상관없이 영문자 1개이상), 숫자, 특수문자를 모두 포함</b></font>해야 합니다.
							</p>
							
							<form name="f" action="Staff_ChangePasswdPro.do" method="post">

								<div class="row mb-3">
									<label for="orig_passwd"
										class="col-md-4 col-lg-3 col-form-label">현재 비밀번호</label>
									<div class="col-md-8 col-lg-9">
										<input name="orig_passwd" type="password" class="form-control"
											id="orig_passwd">
									</div>
								</div>

								<div class="row mb-3">
									<label for="new_passwd"
										class="col-md-4 col-lg-3 col-form-label">새 비밀번호</label>
									<div class="col-md-8 col-lg-9">
										<input name="new_passwd" type="password" class="form-control"
											id="new_passwd">
									</div>
								</div>

								<div class="row mb-3">
									<label for="new_passwd_ch"
										class="col-md-4 col-lg-3 col-form-label">새 비밀번호 확인</label>
									<div class="col-md-8 col-lg-9">
										<input name="new_passwd_ch" type="password"
											class="form-control" id="new_passwd_ch">
									</div>
								</div>

								<div class="text-center">
									<button type="submit" class="btn btn-primary">확인</button>
								</div>
							</form>
							<!-- End Change Password Form -->

						</div>

					</div>
					<!-- End Bordered Tabs -->

				</div>
			</div>

		</div>
	</div>
</section>
<%@ include file="staff_bottom.jsp" %>