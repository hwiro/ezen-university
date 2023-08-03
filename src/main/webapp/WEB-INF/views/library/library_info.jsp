<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- library_info.jsp -->
<%@ include file="library_top.jsp" %>
<br><br>
<main>
<div class="row">
	<div class="col-2">
		<nav id="navbar-example3"
			class="h-100 flex-column align-items-stretch pe-4 border-end">
			<nav class="nav nav-pills flex-column">
				<a class="nav-link" href="#item-1">인사말</a> <a class="nav-link"
					href="#item-2">사명과 비전</a>
			</nav>
		</nav>
	</div>

	<div class="col-9">
		<div data-bs-spy="scroll" data-bs-target="#navbar-example3"
			data-bs-smooth-scroll="true" class="scrollspy-example-2" tabindex="0">
			<div id="item-1">
				<p>
					<table class="table">
						<thead>
							<tr>
								<th>인사말</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>이젠 도서관에 오신 것을 환영합니다!<br>
									<br> 창조적 지식문화 강국을 선도하는 도서관으로서 역할을 충실히 수행하겠습니다.<br>
									<br> 이젠도서관은 지식 정보 자원의 보고로서, 국내,국외에서 발행된 출판물과 각종 지식 정보를 망라적으로
										수집 · 보존하고 이를 체계적으로 정리하여 학생들에게 제공하고 있습니다.<br>
									<br> 또한 변화하는 시대에 맞춰 종이 매체에서 온라인 자료에 이르기까지 풍부한 장서를 구축하고 있으며,
										다양한 학생들의 수요에 맞춰 누구나 손쉽게 자료를 이용할 수 있도록 지식문화유산 이용 서비스의 고도화 실현을 위해
										노력하고 있습니다.<br>
									<br> 21세기 지식 정보화 시대를 맞아 도서관은 학생 누구나 유용한 지식 정보를 편리하게 이용할 수 있는
										핵심기관으로서 더 많은 변화를 요구받고 있습니다.<br>
									<br> 이젠도서관은 '지식 정보가 국가 발전의 중요한 자원'이라는 신념을 가지고 개개인의 창의성으로 이루어
										낸 지적 성취가 오늘날의 첨단지식 정보와 어우러져 '살아 있는 정보'로 활용되도록 더욱더 노력하겠습니다.<br>
									<br> 아울러 한국도서관의 국제적 위상을 높이고 국내외 도서관과의 지속적인 지원 · 협력을 확대하여
										명실상부한 세계적 수준의 도서관으로 거듭나겠습니다.<br>
									<br> 여러분의 많은 관심과 지원을 부탁드립니다.<br>
									<br>
								</td>
							</tr>
						</tbody>
					</table>
				</p>
			</div>
			<div id="item-2">
				<table class="table">
					<thead>
						<tr>
							<th>사명과 비전</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>사명<br>
							<br> 이젠도서관은 대한민국의 지식문화유산을 전승하고<br> 국민의 지적인 삶을 풍요롭게 하며
								국가 및 사회의 문화발전에 이바지한다.<br>
							<br> 비전<br>
							<br> 학생의 지적 성취를 돕는 국가대표도서관
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
</main>
<%@ include file="library_bottom.jsp" %>