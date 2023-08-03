<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="top.jsp"%>
<div class="pagetitle">
	<h1>증명서발급</h1>
	<nav>
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="stuMyPage.do">마이페이지</a></li>
			<li class="breadcrumb-item active">증명서발급</li>
		</ol>
	</nav>
</div>
<div class="card">
	<section class="section">
		<div class="row">
			<div class="card-body">
				<h5 class="card-title">증명서 발급 안내</h5>
				<!-- Default Table -->
				<table class="table">
					<thead>
						<tr>
							<th scope="col">구분</th>
							<th scope="col">신청방법</th>
							<th scope="col">신청장소</th>
							<th scope="col">이용시간</th>
							<th scope="col">소요시간</th>
						</tr>
					</thead>

					<tbody>
						<tr>
							<td>어디서나 민원처리제<br> <font color="red">학부,대학원</font></td>
							<td>전국 구청 및 각동사무소의 전산망을 통하여<br> Fax로 증명서 신청후 발급
							</td>
							<td>각 구청, 동 사무소</td>
							<td>해당 사무소 업무시간</td>
							<td>약 1시간</td>
						</tr>
						<tr>
							<td>민원우편<br> <font color="red">학부,대학원</font></td>
							<td>민원우편신청서를 작성후 해당수수료와<br>발송용 봉투를 동봉하여 발송
							</td>
							<td>우체국</td>
							<td>해당 사무소 업무시간</td>
							<td>5~6일</td>
						</tr>
						<tr>
							<td>인터넷제증명신청서<br> <font color="red">학부,대학원</font></td>
							<td>프린터가 설치된 곳에는 어느곳에서나 <br>로그인 후 출력가능 - 증명서신청 -><br>인터넷출력증명서신청
								클릭
							</td>
							<td>마이페이지<br>-증명서 발급<br>-증명서 발급 신청
							</td>
							<td>24시간</td>
							<td>결제 후 즉시발급</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</section>
</div>
<div class="card">
	<section class="section">
		<div class="row">
			<div class="card-body">
				<h5 class="card-title">증명서 발급 신청</h5>
				<!-- Default Table -->
				<table class="table">
					<thead>
						<tr>
							<th scope="col">메뉴명</th>
							<th scope="col">프로그램 설명</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><a href="certifi_output.do">인터넷출력증명서신청</a></td>
							<td>인터넷으로 제증명발급 신청하여 언제 어디서든 출력/발급할 수 있는 시스템(FAX/E-MAIL포함)</td>
						</tr>
						<tr>
							<td><a href="certifi_post.do">인터넷_우편 증명서 신청</a></td>
							<td>인터넷으로 제증명발급 신청하여, 국내우편 및 해외우편으로 보내는 시스템</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</section>
</div>
<%@ include file="bottom.jsp"%>