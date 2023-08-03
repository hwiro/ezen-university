<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="top.jsp"%>
<div class="pagetitle">
	<h1>장학정보</h1>
	<nav>
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="stuMyPage.do">마이페이지</a></li>
			<li class="breadcrumb-item active">장학 정보</li>
		</ol>
	</nav>
</div>
<div class="card">
	<section class="section">
		<div class="row">
			<div class="card-body">
				<h5 class="card-title">장학정보조회</h5>
				<!-- Default Table -->
				<table class="table">
					<thead>
						<tr>
							<th scope="col">년도</th>
							<th scope="col">학기</th>
							<th scope="col">장학구분명</th>
							<th scope="col">지급금액</th>
							<th scope="col">지급방법</th>
						</tr>
					</thead>

					<tbody>
						<c:if test="${scholarList != null || scholarList.size() != 0}">
							<c:forEach var="sldto" items="${scholarList}">
								<tr>
									<td>${sldto.scholar_year}</td>
									<td>${sldto.semester}</td>
									<td>${sldto.scholar_name}</td>
									<td><fmt:formatNumber value="${sldto.price}"
											pattern="000,000" />원</td>
									<td>${sldto.get_method}</td>
								</tr>
							</c:forEach>
						</c:if>
						<c:if test="${scholarList == null || scholarList.size() == 0}">
							<tr>
								<td colspan="5"><h1 align="center">등록된 장학금이 없습니다</h1></td>
							</tr>
						</c:if>
					</tbody>
				</table>
			</div>
		</div>
	</section>
</div>
<%@ include file="bottom.jsp"%>