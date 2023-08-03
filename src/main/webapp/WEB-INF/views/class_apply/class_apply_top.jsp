<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<!-- class_apply_top.jsp -->

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
  <style>
  .tooltip-inner{white-space: pre-wrap;}
  </style>
	<title>이젠대학교 수강신청</title>
	<script type="text/javascript">
		function apply() {
			if(confirm("선택한 강의를 신청하시겠습니까?")) {
				document.apply_class.submit();
			}
			else {
				alert("선택한 강의가 없습니다");
			}
		}
	</script>
	
</head>
<body>
	<header id="header" class="header fixed-top d-flex align-items-center">
		<div class="d-flex align-items-center justify-content-between">
	      <a href="class_apply_main.do" class="logo d-flex align-items-center">
	        <img src="" alt="">
	        <span class="d-none d-lg-block">수강신청</span>
	      </a>
	      <i class="bi bi-list toggle-sidebar-btn"></i>
	    </div>
	</header>
	<aside id="sidebar" class="sidebar">

		<ul class="sidebar-nav" id="sidebar-nav">

			<li class="nav-heading">Pages</li>

			<li class="nav-item"><a class="nav-link collapsed"
				href="class_apply_list.do"> <i class="bi bi-person"></i> <span>수강신청</span>
			</a></li>

			<li class="nav-item"><a class="nav-link collapsed"
				href="class_apply_mylist.do"> <i class="bi bi-card-list"></i> <span>신청한
						강의 목록</span>
			</a></li>

			<li class="nav-item"><a class="nav-link collapsed"
				href="class_apply_schedule.do"> <i class="bi bi-card-list"></i>
					<span>강의 시간표</span>
			</a></li>
			
		</ul>
			<div style="display:flex;">
				<form name="searchDeptId" action="class_apply_search_id.do" method="post">
					강의코드 검색 <input type="text" class="form-control" width="40%" placeholder="강의코드를 입력하세요." name="searchString" /> 
					<button type="submit" class="btn btn-outline-primary">검색</button>
				</form>
			</div>

	</aside>	
<main id="main" class="main">