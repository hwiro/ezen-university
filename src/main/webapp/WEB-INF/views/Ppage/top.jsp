<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<!-- top.jsp -->
<html>
<head>
<!-- Favicons -->
<link href="resources/img/favicons/house.svg" rel="icon">

<!-- Google Fonts -->
<link href="https://fonts.gstatic.com" rel="preconnect">
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">
<!--   <link rel="stylesheet" href="resources/css/bootstrap.css"> -->
<link
	href="resources/majorBoard_css/assets/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="resources/majorBoard_css/assets/vendor/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">
<link
	href="resources/majorBoard_css/assets/vendor/boxicons/css/boxicons.min.css"
	rel="stylesheet">
<link href="resources/majorBoard_css/assets/vendor/quill/quill.snow.css"
	rel="stylesheet">
<link
	href="resources/majorBoard_css/assets/vendor/quill/quill.bubble.css"
	rel="stylesheet">
<link
	href="resources/majorBoard_css/assets/vendor/remixicon/remixicon.css"
	rel="stylesheet">
<link
	href="resources/majorBoard_css/assets/vendor/simple-datatables/style.css"
	rel="stylesheet">
<link href="resources/majorBoard_css/assets/css/style.css"
	rel="stylesheet">

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
<meta charset="UTF-8">
<title>마이페이지</title>
</head>
<body>
	<header id="header" class="header fixed-top d-flex align-items-center">
		<div class="d-flex align-items-center justify-content-between">
			<a href="login_main.do" class="logo d-flex align-items-center"> <img
				src="resources/img/ezenlogo.png" alt> <span
				class="d-none d-lg-block">EZEN</span>
			</a> <i class="bi bi-list toggle-sidebar-btn"></i>
		</div>
	</header>
	<aside id="sidebar" class="sidebar">
		<ul class="sidebar-nav" id="sidebar-nav">
			<li class="nav-item"><a class="nav-link collapsed" href="ProEditMyInfo.do">
					<i class="bi bi-person"></i> <span>내 정보 변경</span>
			</a></li>
			<li class="nav-item"><a class="nav-link collapsed"
				href="lecture.do"> <i class="bi bi-grid"></i> <span>강의 목록</span>
			</a></li>
			<li class="nav-item"><a class="nav-link collapsed"
				href="openLecture.do"> <i class="bi bi-journal-text"></i> <span>강의
						개설 신청</span>
			</a></li>
		</ul>
	</aside>
	<main id="main" class="main">