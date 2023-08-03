<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<!-- Favicons -->
	<link href="resources/img/favicons/house.svg" rel="icon">	
	<!-- Google Fonts -->
	<link href="https://fonts.gstatic.com" rel="preconnect">
	<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
	<link rel="stylesheet" href="resources/css/bootstrap.css">
	<link href="resources/majorBoard_css/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link href="resources/majorBoard_css/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
	<link href="resources/majorBoard_css/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
	<link href="resources/majorBoard_css/assets/vendor/quill/quill.snow.css" rel="stylesheet">
	<link href="resources/majorBoard_css/assets/vendor/quill/quill.bubble.css" rel="stylesheet">
	<link href="resources/majorBoard_css/assets/vendor/remixicon/remixicon.css" rel="stylesheet">
	<link href="resources/majorBoard_css/assets/vendor/simple-datatables/style.css" rel="stylesheet">
	<link href="resources/majorBoard_css/assets/css/style.css" rel="stylesheet">
	<title>마이페이지</title>
</head>
<body>
	<script type="text/javascript">
	function openWindow(url,title) {
		var left = (window.screen.width - 1280) / 2;
		var top = (window.screen.height - 800) / 2;
		window.open(url, title, "width=1280, height=800, left="+left+", top="+top);
	}
	function fn_checkByte(obj, max) {
		const maxByte = max; //최대 바이트 설정
		const text_val = obj.value; //입력한 문자
		const text_len = text_val.length; //입력한 문자수
		    
		let totalByte=0;
		for(let i=0; i<text_len; i++){
			const each_char = text_val.charAt(i);
			const uni_char = escape(each_char); //유니코드 형식으로 변환
			if(uni_char.length>4){
				// 한글 : 2Byte
				totalByte += 2;
			}
			else{
				// 영문,숫자,특수문자 : 1Byte
				totalByte += 1;
			}
		}
		    
		if(totalByte>maxByte){
			alert("최대 "+maxByte+"Byte까지만 입력가능합니다.");
		}
	}
	</script>
	<header id="header" class="header fixed-top d-flex align-items-center">
		<div class="d-flex align-items-center justify-content-between">
	      <a href="stuMyPage.do" class="logo d-flex align-items-center">
	        <span class="d-none d-lg-block">마이페이지</span>
	      </a>
	      <i class="bi bi-list toggle-sidebar-btn"></i>
	    </div>
	    
		<nav class="header-nav ms-auto">
			<ul class="d-flex align-items-center">
			
				<li class="nav-item dropdown"><a class="nav-link nav-icon"
					href="#" data-bs-toggle="dropdown"> <i class="bi bi-bell"></i>
						<span class="badge bg-primary badge-number">${sessionScope.userNotice.size()}</span>
				</a>
				<!-- End Notification Icon -->

					<ul
						class="dropdown-menu dropdown-menu-end dropdown-menu-arrow notifications">
						<li class="dropdown-header">${sessionScope.userNotice.size()}개의 새로운 알림 <a
							href="stuNoticeRemoveAll.do"><span class="badge rounded-pill bg-primary p-2 ms-2">모두 지우기</span></a>
						</li>
						<li>
							<hr class="dropdown-divider">
						</li>

						<c:if test="${sessionScope.userNotice.size() != null || sessionScope.userNotice != null}">
							<c:forEach var="userNotice" items="${sessionScope.userNotice}" end="3">
								<li class="notification-item">
									<div>
										<h4>알림</h4>
										<p><a href="stuNoticeMoveTo.do?url=${userNotice.url}">${userNotice.notice}</a></p>
									</div>
								</li>
		
								<li>
									<hr class="dropdown-divider">
								</li>
							</c:forEach>
						</c:if>
						
						<c:if test="${sessionScope.userNotice.size() > 4}">
							<li class="notification-item">
									<div align="center">
										<p>${sessionScope.userNotice.size() - 4}개의 추가 알림이 있습니다.</p>
									</div>
								</li>
						</c:if>
					</ul>
					<!-- End Notification Dropdown Items -->
				</li>
				<!-- End Notification Nav -->
			</ul>
		</nav>
	</header>
	<aside id="sidebar" class="sidebar">

		<ul class="sidebar-nav" id="sidebar-nav">

			<li class="nav-heading">Pages</li>

			<li class="nav-item"><a class="nav-link collapsed"
				href="stuMyPage.do"> <i class="bi bi-person"></i> <span>내
						정보</span>
			</a></li>

			<li class="nav-item"><a class="nav-link collapsed"
				href="stuCourseInfo.do"> <i class="bi bi-card-list"></i> <span>강의
						정보</span>
			</a></li>

			<li class="nav-item"><a class="nav-link collapsed"
				href="recordInfo.do"> <i class="bi bi-card-list"></i> <span>성적
						정보</span>
			</a></li>

			<li class="nav-item"><a class="nav-link collapsed"
				href="scholarInfo.do"> <i class="bi bi-card-list"></i> <span>장학
						정보</span>
			</a></li>

			<li class="nav-item"><a class="nav-link collapsed"
				href="certifiInfo.do"> <i class="bi bi-envelope"></i> <span>증명서
						발급</span>
			</a></li>

		</ul>

	</aside>
	<main id="main" class="main">