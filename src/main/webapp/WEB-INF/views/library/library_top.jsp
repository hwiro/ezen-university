<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- library_top.jsp -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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

<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>이젠도서관</title>
	<script src="https://code.jquery.com/jquery-latest.min.js"></script>
	<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
	<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css"/>
	<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
	<link rel="stylesheet" type="text/css" href="resources/library_css/library.css">
	<link rel="stylesheet" type="text/css" href="resources/css/bootstrap.css">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">	
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">	
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">	
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
<script>
$(document).ready(function(){
	// 마우스오버 메뉴
	  $('.navi > li').mouseover(function(){
	    $(this).find('.subMenu').stop().slideDown(300);
	  }).mouseout(function(){
	    $(this).find('.subMenu').stop().slideUp(300);
	  });

	// 이미지슬라이드 위 아래
	var imgs = 2;
	var now = 0;

	start();

	function start(){
	  $(".imgSlide>a").eq(0).siblings().animate({marginTop:"-400px"});

	  setInterval(function(){
	    now = now==imgs ? 0 : now+=1;
	    $(".imgSlide>a").eq(now-1).animate({marginTop:"-400px"});
	    $(".imgSlide>a").eq(now).animate({marginTop:"0"});
	  },5000);
	}


	// 레이어 팝업
	  $('.notice li:first').click(function(){
	    $('#modalWrap').addClass("active");
	  });
	  $('.btn').click(function(){
	    $('#modalWrap').removeClass("active");
	  });

	});
	
	$(function(){
    // 이미지 슬라이드 컨트롤를 사용하기 위해서는 carousel를 실행해야한다.
    $('#carousel-example-generic').carousel({
      // 슬리아딩 자동 순환 지연 시간
      // false면 자동 순환하지 않는다.
      interval: 3000,
      // hover를 설정하면 마우스를 가져대면 자동 순환이 멈춘다.
      pause: "hover",
      // 순환 설정, true면 1 -> 2가면 다시 1로 돌아가서 반복
      wrap: true,
      // 키보드 이벤트 설정 여부(?)
      keyboard : true
	  });
	});	
</script>
	<!-- header 메뉴 -->
	<header>
		<div class="headerWrap">
			<a class="logo" href="library_main.do"> 
				<img src="resources/img/ezenlogo.png" alt="로고">
			</a>
			<ul class="navi">
				<li><a href="login_main.do">EZEN 포털</a></li>
				<li><a href="library_info.do">도서관 소개</a></li>
				<li><a href="library_bookList.do?page=1">도서목록</a></li>
				<li><a href="library_rentList.do">My Library</a></li>
				<li><a href="library_notice.do?page=1">공지사항</a></li>
			</ul>
		</div>
	</header>