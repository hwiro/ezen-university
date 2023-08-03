<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<!-- admin_top.jsp -->

<html>
<head>
	<meta charset="UTF-8">
	<title>이젠대학교 관리자 페이지</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<!-- Google Font: Source Sans Pro -->
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
	<!-- Font Awesome -->
	<link rel="stylesheet" href="resources/admin_css/plugins/fontawesome-free/css/all.min.css">
	<!-- Theme style -->
	<link rel="stylesheet" href="resources/admin_css/dist/css/adminlte.min.css">
</head>
<body class="hold-transition sidebar-mini layout-navbar-fixed">
	<script type="text/javascript">
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

<div class="wrapper">	
	<!-- Navbar -->
	<nav class="main-header navbar navbar-expand navbar-white navbar-light">
		<!-- Left navbar links -->
		<ul class="navbar-nav">
			<li class="nav-item">
				<a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
			</li>
			<li class="nav-item d-none d-sm-inline-block">
				<a href="admin_index.do" class="nav-link">Home</a>
			</li>
			<li class="nav-item d-none d-sm-inline-block">
				<a href="admin_logout.do" class="nav-link">Logout</a>
			</li>
		</ul>
	</nav>
	<!-- /.navbar -->
	
	<!-- Main Sidebar Container -->
	<aside class="main-sidebar sidebar-dark-primary elevation-4">
		<!-- Brand Logo -->
		<a href="admin_index.do" class="brand-link">
			<img src="resources/img/ezenlogo.png" alt="EzenAdminLogo" class="brand-image img-circle elevation-3"
				style="opacity: .8">
			<span class="brand-text font-weight-light">관리자페이지</span>
		</a>
	
		<!-- Sidebar -->
		<div class="sidebar">
			<!-- Sidebar user panel (optional) -->
			<div class="user-panel mt-3 pb-3 mb-3 d-flex">
				<div class="info">
					${sessionScope.id} 로그인 중...
				</div>
			</div>
		
			<!-- Sidebar Menu -->
			<nav class="mt-2">
				<ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu">
					<!-- DB관리메뉴 -->
					<li class="nav-item">
						<a href="#" class="nav-link active">
							<i class="nav-icon fas fa-tachometer-alt"></i>
							<p>
								DB관리메뉴
								<i class="right fas fa-angle-left"></i>
							</p>
						</a>
						<ul class="nav nav-treeview">
							<li class="nav-item">
								<a href="admin_book_list.do?page=1" class="nav-link">
									<i class="far fa-circle nav-icon"></i>
									<p>도서 관리</p>
								</a>
							</li>
							<li class="nav-item">
								<a href="admin_dept_list.do?page=1" class="nav-link">
									<i class="far fa-circle nav-icon"></i>
									<p>전공 관리</p>
								</a>
							</li>
							<li class="nav-item">
								<a href="admin_class_list.do?page=1" class="nav-link">
									<i class="far fa-circle nav-icon"></i>
									<p>강의 관리</p>
								</a>
							</li>
							<li class="nav-item">
								<a href="admin_acc_choose.do" class="nav-link">
									<i class="far fa-circle nav-icon"></i>
									<p>계정 관리</p>
								</a>
							</li>
						</ul>
					</li>
					
					<!-- 로그확인 -->
					<li class="nav-item">
						<a href="#" class="nav-link active">
							<i class="nav-icon fas fa-tachometer-alt"></i>
							<p>
								로그확인
								<i class="right fas fa-angle-left"></i>
							</p>
						</a>
						<ul class="nav nav-treeview">
							<li class="nav-item">
								<a href="admin_inlog_list.do?page=1" class="nav-link">
									<i class="far fa-circle nav-icon"></i>
									<p>접속 로그</p>
								</a>
							</li>
							<li class="nav-item">
								<a href="admin_editlog_list.do?page=1" class="nav-link">
									<i class="far fa-circle nav-icon"></i>
									<p>관리자 활동 내역</p>
								</a>
							</li>
						</ul>
					</li>
					
					<!-- 게시판 관리 메뉴 -->
					<li class="nav-item">
						<a href="#" class="nav-link active">
							<i class="nav-icon fas fa-tachometer-alt"></i>
							<p>
								게시판 관리 메뉴
								<i class="right fas fa-angle-left"></i>
							</p>
						</a>
						<ul class="nav nav-treeview">
							<li class="nav-item">
								<a href="admin_selectLecture.do" class="nav-link">
									<i class="far fa-circle nav-icon"></i>
									<p>학과 게시판 관리</p>
								</a>
							</li>
							<li class="nav-item">
								<a href="admin_infoBoard_list.do" class="nav-link">
									<i class="far fa-circle nav-icon"></i>
									<p>공지 게시판 관리</p>
								</a>
							</li>
							<li class="nav-item">
								<a href="admin_qnaBoard_list.do?mode=all&page=1" class="nav-link">
									<i class="far fa-circle nav-icon"></i>
									<p>Q&A 게시판 관리</p>
								</a>
							</li>
							<li class="nav-item">
								<a href="admin_freeB_list.do" class="nav-link">
									<i class="far fa-circle nav-icon"></i>
									<p>자유 게시판 관리</p>
								</a>
							</li>
						</ul>
					</li>
				</ul>
			</nav>
			<!-- /.sidebar-menu -->
		</div>
		<!-- /.sidebar -->
	</aside>
	
	<div class="content-wrapper px-4 py-2">