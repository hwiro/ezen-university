<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<!-- class_apply_schedule.jsp -->

<%@ include file="class_apply_top.jsp" %>

<c:set var="onday" value="일,월,화,수,목,금,토"/>
<c:set var="ontime" value="7,8,9,10,11,12,13,14,15,16,17,18"/>
<div class="pagetitle">
	<h1>강의 시간표</h1>
	<nav>
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="class_apply_main.do">home</a></li>
			<li class="breadcrumb-item active">강의 시간표</li>
		</ol>
	</nav>
</div>
<!-- End Page Title -->
<div class="card">
	<section class="section">
		<div class="row">
			<div class="card-body">
				<h5 class="card-title">시간표</h5>
				<!-- Default Table -->
				<table class="table table-bordered">
					<thead>
						<tr align="center">
							<th scope="col" width="12.5%">시간</th>
							<th scope="col" width="12.5%">일</th>
							<th scope="col" width="12.5%">월</th>
							<th scope="col" width="12.5%">화</th>
							<th scope="col" width="12.5%">수</th>
							<th scope="col" width="12.5%">목</th>
							<th scope="col" width="12.5%">금</th>
							<th scope="col" width="12.5%">토</th>
						</tr>
					</thead>

					<tbody>
						<c:forTokens var="ontime" items="${ontime}" delims=",">
							<tr align="center">
								<th>${ontime}</th>
								<c:forEach var="onday" items="${onday}">
									<td style="word-wrap:break-word; white-space:normal;">
										<c:forEach var="dto" items="${list}">
											<c:if test="${dto.onday.contains(onday) && dto.ontime < ontime+1 && dto.ontime >= ontime}">${dto.class_name}</c:if>
										</c:forEach>
									</td>
								</c:forEach>
							</tr>
						</c:forTokens>
					</tbody>
				</table>
				<!-- End Default Table Example -->
			</div>
		</div>
	</section>
</div>
<%@ include file="class_apply_bottom.jsp" %>