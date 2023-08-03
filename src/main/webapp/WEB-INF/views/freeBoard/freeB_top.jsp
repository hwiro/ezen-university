<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<!-- freeB_top.jsp -->

<html>
<head>
	<meta charset="UTF-8">
	<title>이젠대학교 대나무숲</title>
	
	<script src="resources/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
	<script src="resources/freeB_css/dist/js/scripts.js"></script>
	<script src="resources/js/jquery-3.7.0.js"></script>
	<!-- Google Fonts -->
	<link href="https://fonts.gstatic.com" rel="preconnect">
	<link
		href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
		rel="stylesheet">
	<!--   <link rel="stylesheet" href="resources/css/bootstrap.css"> -->
	<link href="resources/majorBoard_css/assets/vendor/bootstrap/css/bootstrap.css" rel="stylesheet">
	<link href="resources/majorBoard_css/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link href="resources/majorBoard_css/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
	<link href="resources/majorBoard_css/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
	<link href="resources/majorBoard_css/assets/vendor/quill/quill.snow.css" rel="stylesheet">
	<link href="resources/majorBoard_css/assets/vendor/quill/quill.bubble.css" rel="stylesheet">
	<link href="resources/majorBoard_css/assets/vendor/remixicon/remixicon.css" rel="stylesheet">
	<link href="resources/majorBoard_css/assets/vendor/simple-datatables/style.css" rel="stylesheet">
	<link href="resources/majorBoard_css/assets/css/style.css" rel="stylesheet">
	
	<style>
		.link-button {
		  display: inline-block;
		  padding: 10px 20px;
		  background-color: #eaeaea;
		  color: #333;
		  text-decoration: none;
		  border: none;
		  border-radius: 4px;
		  font-size: 16px;
		  cursor: pointer;
		}
		
		.link-button:hover {
		  background-color: #ccc;
		}
	</style>
</head>
<body class="sb-nav-fixed">	

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
		function openWindow(url, title) {
			var left = (window.screen.width - 1280) / 2;
			var top = (window.screen.height - 800) / 2;
			window.open(url, title, "width=1280, height=800, left="+left+", top="+top);
		}
	</script>
	
<header id="header" class="header fixed-top d-flex align-items-center">
	<div class="d-flex align-items-center justify-content-between">
		<a href="login_main.do" class="logo d-flex align-items-center"> <img
			src="resources/img/ezenlogo.png" alt> <span
			class="d-none d-lg-block"></span>
		</a> 
		<c:if test="${sessionScope.id != null}">
			<a class="bi link-button disabled">${sessionScope.id} 로그인 중...</a>
			&nbsp;&nbsp;&nbsp;
			<a class="bi link-button" href="login_main.do?mode=logout">로그아웃</a>
		</c:if>
		<c:if test="${sessionScope.id == null}">
			<a class="bi link-button" href="login_main.do">로그인 페이지로 이동</a>
		</c:if>
	</div>
</header>


<div class="co-lg-6" align="center">
	<div class="card">
		<div class="card-body">
	
			<table class="table table-striped" style="width:1300px;">				
				<tr class="table-primary">
					<th style="width:1000px; vertical-align:middle; text-align:center" onclick="location.href='freeB_list.do'"><br><br><br><br>
						<h1>이젠대학교 대나무숲</h1>
					</th>
					<td style="width:300px;" align="center">
						<br><br><br><br>
						<h4>주 관리자 : 김관리자</h4><br>
						<h4>보조 관리자 : 게시판관리자</h4><br>
						<h6>*과도한 어그로는 제재받을 수 있습니다</h6>
					</td>
				</tr>
				
				<tr>
					<td style="width:1000px; min-height:1280px;">
				
	