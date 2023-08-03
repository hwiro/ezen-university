<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<!-- staff_top.jsp -->

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
	<title>이젠대학교 교직원 페이지</title>
</head>
<body>
	<header id="header" class="header fixed-top d-flex align-items-center">
		<div class="d-flex align-items-center justify-content-between">
	      <a href="StaffPage.do" class="logo d-flex align-items-center">
	        <img src="" alt="">
	        <span class="d-none d-lg-block">마이페이지</span>
	      </a>
	      <i class="bi bi-list toggle-sidebar-btn"></i>
	    </div>
	</header>
		<aside id="sidebar" class="sidebar">

    <ul class="sidebar-nav" id="sidebar-nav">

      <li class="nav-heading">Pages</li>

      <li class="nav-item">
        <a class="nav-link collapsed" href="StaffPage.do">
          <i class="bi bi-person"></i>
          <span>내 정보</span>
        </a>
      </li>

      <li class="nav-item">
        <a class="nav-link collapsed" href="Staff_stuStatus_list.do?page=1">
          <i class="bi bi-card-list"></i>
          <span>학생 학적 정보</span>
        </a>
      </li>

      <li class="nav-item">
        <a class="nav-link collapsed" href="Staff_stuScholar_list.do?page=1">
          <i class="bi bi-card-list"></i>
          <span>학생 장학 정보</span>
        </a>
      </li>
      
    </ul>

  </aside>	
<main id="main" class="main">