<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!doctype html>

<!-- login_top.jsp -->

<html data-bs-theme="auto">
<head>
	<script src="resources/js/color-modes.js"></script>

	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>이젠대학교 노원캠퍼스</title>
   
	<link rel="canonical" href="https://getbootstrap.com/docs/4.5.2/examples/carousel/">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	
	<!-- Favicons -->
	<link rel="icon" href="resources/img/favicons/house.svg" sizes="32x32" type="image/png">
	<link rel="icon" href="resources/img/favicons/house.svg" sizes="16x16" type="image/png">
	<meta name="theme-color" content="#712cf9">

	<script src="resources/js/jquery-3.7.0.js"></script>

	<style>
	.bd-placeholder-img {
		font-size: 1.125rem;
		text-anchor: middle;
		-webkit-user-select: none;
		-moz-user-select: none;
		user-select: none;
	}

	@media (min-width: 768px) {
		.bd-placeholder-img-lg {
			font-size: 3.5rem;
		}
	}

	.b-example-divider {
		width: 100%;
		height: 3rem;
		background-color: rgba(0, 0, 0, .1);
		border: solid rgba(0, 0, 0, .15);
		border-width: 1px 0;
		box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .15);
	}

	.b-example-vr {
		flex-shrink: 0;
		width: 1.5rem;
		height: 100vh;
	}

	.bi {
		vertical-align: -.125em;
		fill: currentColor;
	}

	.nav-scroller {
		position: relative;
		z-index: 2;
		height: 2.75rem;
		overflow-y: hidden;
	}

	.nav-scroller .nav {
		display: flex;
		flex-wrap: nowrap;
		padding-bottom: 1rem;
		margin-top: -1px;
		overflow-x: auto;
		text-align: center;
		white-space: nowrap;
		-webkit-overflow-scrolling: touch;
	}

	.btn-bd-primary {
		--bd-violet-bg: #712cf9;
		--bd-violet-rgb: 112.520718, 44.062154, 249.437846;
		
		--bs-btn-font-weight: 600;
		--bs-btn-color: var(--bs-white);
		--bs-btn-bg: var(--bd-violet-bg);
		--bs-btn-border-color: var(--bd-violet-bg);
		--bs-btn-hover-color: var(--bs-white);
		--bs-btn-hover-bg: #6528e0;
		--bs-btn-hover-border-color: #6528e0;
		--bs-btn-focus-shadow-rgb: var(--bd-violet-rgb);
		--bs-btn-active-color: var(--bs-btn-hover-color);
		--bs-btn-active-bg: #5a23c8;
		--bs-btn-active-border-color: #5a23c8;
	}
	
	.bd-mode-toggle {
		z-index: 1500;
	}
	
	.rounded-input {
		border-radius: 10px;
		padding: 5px;
	}
	
	.rounded-table {
		border-collapse: collapse;
		border-radius: 10px;
	}
		
	/*tab css*/
	.tab{float:left; width:500px; height:290px;}
	.tabnav{font-size:0; width:500px; border:1px solid #ddd;}
	.tabnav li{display: inline-block;  height:40px; text-align:center; border-right:1px solid #ddd;}
	.tabnav li a:before{content:""; position:absolute; left:0; top:0px; width:100%; height:3px; }
	.tabnav li a.active:before{background:#7ea21e;}
	.tabnav li a.active{border-bottom:1px solid #fff;}
	.tabnav li a{ position:relative; display:block; background: #f8f8f8; color: #000; padding:0 30px; line-height:40px; text-decoration:none; font-size:16px;}
	.tabnav li a:hover,
	.tabnav li a.active{background:#fff; color:#7ea21e; }
	.tabcontent{padding: 20px; height:200px; border:1px solid #ddd; border-top:none;}
	</style>
	
	<script type="text/javascript">
		function loginCheck(){
			if (f.id.value==""){
				alert("아이디를 입력해 주세요!!")
				f.id.focus()
				return
			}
			if (f.passwd.value==""){
				alert("비밀번호를 입력해 주세요!!")
				f.pass.focus()
				return
			}
			document.f.submit()
		}
		
		function openWindow(url, title) {
			var left = (window.screen.width - 1280) / 2;
			var top = (window.screen.height - 800) / 2;
			window.open(url, title, "width=1280, height=800, left="+left+", top="+top);
		}
		
		$(function(){
			$('.tabcontent > div').hide();
			$('.tabnav a').click(function () {
				$('.tabcontent > div').hide().filter(this.hash).fadeIn();
				$('.tabnav a').removeClass('active');
				$(this).addClass('active');
				return false;
			}).filter(':eq(0)').click();
		});
	</script>

    
	<!-- Custom styles for this template -->
	<link href="resources/css/carousel.css" rel="stylesheet">
</head>

<body>
  
<header data-bs-theme="dark">
	<nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
		<div class="container-fluid">
			<a class="navbar-brand"><img style="border-radius:5%" src="resources/img/ezenlogo.png" onclick="location.href='login_main.do'" width="70" height="40"></a>
			<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarCollapse">
				<ul class="navbar-nav me-auto mb-2 mb-md-0">
					<li class="nav-item">
						<a class="nav-link active" aria-current="page" href="notlog_main.do">
							<svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor" class="bi bi-house" viewBox="0 0 16 16">
								<path d="M8.707 1.5a1 1 0 0 0-1.414 0L.646 8.146a.5.5 0 0 0 .708.708L2 8.207V13.5A1.5 1.5 0 0 0 3.5 15h9a1.5 1.5 0 0 0 1.5-1.5V8.207l.646.647a.5.5 0 0 0 .708-.708L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293L8.707 1.5ZM13 7.207V13.5a.5.5 0 0 1-.5.5h-9a.5.5 0 0 1-.5-.5V7.207l5-5 5 5Z"/>
							</svg>
						</a>
					</li>
					
					<!-- 로그인 중일 때 -->
					<c:if test="${sessionScope.id != null}">
						<li class="nav-item">
							<a class="nav-link" href="library_main.do">도서관</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="freeB_list.do?page=1">자유게시판</a>
						</li>
					</c:if>
					
					<!-- 로그인 중이 아닐 때 -->
					<c:if test="${sessionScope.id == null}">
						<li class="nav-item">
							<a class="nav-link disabled">도서관</a>
						</li>
						<li class="nav-item">
							<a class="nav-link disabled">자유게시판</a>
						</li>
					</c:if>
				</ul>
			</div>
		</div>
	</nav>
</header>

<main>
	<div id="myCarousel" class="carousel slide mb-6" data-bs-ride="carousel" data-bs-theme="light">
		<div class="carousel-inner">
			<div class="carousel-item active" style="background-image:url(resources/img/ezen.png);">
				<svg class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false"></svg>
				<div class="container" style="float:right; vertical-align:center">
					<div class="carousel-caption text-end">
						<div class="row justify-content-end">
							<div class="col-lg-4 col-md-6">
							
								<c:if test="${sessionScope.id == null}">
									<form name="login_main" method="post" action="login_main_pro.do" id="login-form">
										<table class="rounded-table" style="width:300px; height:200px; background-color:#3D3D3D;">
											<tr><td height="15px"></td></tr>
											
											<tr>  
												<td><input type="text" class="rounded-input" name="id" placeholder="id" size="20"></td>
											</tr>
											<tr>
												<td><input type="password" class="rounded-input" name="pw" placeholder="Password" size="20"></td>
											</tr>
											<tr>
												<td colspan="2" align="center" style="white-space:nowrap;">
													<input type="radio" id="학생" name="type" value="학생">
													<label for="학생">학생</label>
													<input type="radio" id="교수" name="type" value="교수">
													<label for="교수">교수</label>
													<input type="radio" id="교직원" name="type" value="교직원">
													<label for="교직원">교직원</label>
												</td>
											</tr>
											<tr>
												<td colspan="2" align="center">
													<input type="submit" value="로그인" class="btn btn-secondary">
													<button class="btn btn-secondary" onclick="location.href='ezenUnivPwFind.do'; return false;">비밀번호 찾기</button>
												</td>	
											</tr>
											
											<tr><td height="15px"></td></tr>
										</table>
									</form>
								</c:if><!-- c:if로그인 폼 -->
								
								<c:if test="${sessionScope.id != null}">						
									<table class="rounded-table" style="width:300px; height:200px; background-color:#3D3D3D;">
										<tr><td height="15px"></td></tr>
										
										<tr>  
											<th><h4>환영합니다, ${sessionScope.id}님!</h4></th>
										</tr>
										<tr>
											<td align="center">마이메뉴</td>
										</tr>
										<tr>
											<td colspan="2" align="center">
												<c:if test="${sessionScope.type == '학생'}">
													<button class="btn btn-secondary" onclick="javascript:openWindow('stuMyPage.do', '마이페이지');">마이페이지</button>
												</c:if>
												<c:if test="${sessionScope.type == '교수'}">
													<button class="btn btn-secondary" onclick="javascript:openWindow('ProEditMyInfo.do', '마이페이지');">마이페이지</button>
												</c:if>
												<c:if test="${sessionScope.type == '교직원'}">
													<button class="btn btn-secondary" onclick="javascript:openWindow('StaffPage.do', '교직원메뉴');">마이페이지</button>
												</c:if>
												<button class="btn btn-secondary" onclick="location.href='library_main.do'">도서관</button>
												<br>
												<button class="btn btn-secondary" onclick="javascript:openWindow('class_apply_main.do', '수강신청');">수강신청</button>
												<button class="btn btn-secondary" onclick="location.href='freeB_list.do?page=1'">자유게시판</button>
												<br>
												<form name="logout" action="login_main.do" method="post">
													<input type="hidden" name="mode" value="logout"/>
													<input type="submit" class="btn btn-secondary" value="로그아웃"/>
												</form>
											</td>
										</tr>
									</table>
								</c:if><!-- c:if 로그인 이후 폼 -->
						
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>