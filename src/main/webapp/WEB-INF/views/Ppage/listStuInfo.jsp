<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!-- listStuInfo.jsp -->
<%@ include file="top.jsp" %>
<div class="pagetitle">
	<h1>수강생 정보</h1>
	<nav>
		<ol class="breadcrumb">
			<li class="breadcrumb-item">
				<a href="login_main.do">홈</a>
			</li>
			<li class="breadcrumb-item">
				<a href="#">마이페이지</a>
			</li>
			<li class="breadcrumb-item">
				<a href="listStuInfo.do">수강생 정보</a>
			</li>
		</ol>
	</nav>
</div>
<section class="section">
	<div class="row">
		<div class="card">
			<div class="card-body">
				<form name="f" action="listStuInfoPro.do" method="post">
				<table class="table table-striped">
					<thead>
						<tr>
							<th scope="col">학번</th>
							<th scope="col">학생명</th>
							<th scope="col">학과</th>
							<th scope="col">전화번호</th>
							<th scope="col">주소</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach var="dto" items="${listStu}">
						<tr>
							<td>${dto.student_id }</td>
							<td>${dto.name }</td>
							<td>${dto.dept }</td>
							<td>${dto.tel }</td>
							<td>${dto.address }</td>
						</tr>
					</c:forEach>
						<tr>
							<td colspan="5" align="center"><a href="classCheck.do?class_code=${class_code }"><button type="button" class="btn btn-outline-primary">확인</button></a>
							</td>
						</tr>
					</tbody>
				</table>
				</form>
			</div>
		</div>
	</div>
</section>
<%@ include file="bottom.jsp" %>