<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 비회원 로그인 top -->
<html>
	<head>
		<title>비회원 로그인 top</title>
			<link rel="stylesheet" type="text/css" href="resources/main_css/ezenHome.css">
			<link rel="stylesheet" type="text/css" href="resources/css/bootstrap.css">
			<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
			<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css"> 
			<script src="https://code.jquery.com/jquery-latest.min.js"></script>
			<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
			<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
			<script type="text/javascript">
		        window.onload = function () {
		            var elm = ".box";
		            $(elm).each(function (index) {
		                // 개별적으로 Wheel 이벤트 적용
		                $(this).on("mousewheel DOMMouseScroll", function (e) {
		                    e.preventDefault();
		                    var delta = 0;
		                    if (!event) event = window.event;
		                    if (event.wheelDelta) {
		                        delta = event.wheelDelta / 120;
		                        if (window.opera) delta = -delta;
		                    } 
		                    else if (event.detail)
		                        delta = -event.detail / 3;
		                    var moveTop = $(window).scrollTop();
		                    var elmSelecter = $(elm).eq(index);
		                    // 마우스휠을 위에서 아래로
		                    if (delta < 0) {
		                        if ($(elmSelecter).next() != undefined) {
		                            try{
		                                moveTop = $(elmSelecter).next().offset().top;
		                            }catch(e){}
		                        }
		                    // 마우스휠을 아래에서 위로
		                    } else {
		                        if ($(elmSelecter).prev() != undefined) {
		                            try{
		                                moveTop = $(elmSelecter).prev().offset().top;
		                            }catch(e){}
		                        }
		                    }
		                     
		                    // 화면 이동 0.4초(400)
		                    $("html,body").stop().animate({
		                        scrollTop: moveTop + 'px'
		                    }, {
		                        duration: 400, complete: function () {
		                        }
		                    });
		                });
		            });
		        }
		    </script>
			
			<script>
				$(document).ready(function(){
					// 마우스오버 메뉴
					  $('.navi2 > li').mouseover(function(){
					    $(this).find('.subMenu2').stop().slideDown(300);
					  }).mouseout(function(){
					    $(this).find('.subMenu2').stop().slideUp(300);
					  });
				
					// 이미지슬라이드 페이드 인 페이드 아웃
					  $('.imgSlide a:gt(0)').hide();
				
					  setInterval(function(){
					    $('.imgSlide a:first-child').fadeOut()
					    .next('a').fadeIn()
					    .end().appendTo('.imgSlide');
					  }, 3000);
				
					  // ******  탭 메뉴 공지사항 갤러리  ****** //
					  $(function(){
					  $('.tabMenu>li>a').click(function(){
					      $(this).parent().addClass("active").siblings().removeClass("active");
					    // return false;
					   /* return false를 반드시 적기.
					      버블링(bubbling) 때믄. 버블링이란?
					      한 요소에 이벤트가 발생하면,
					      이 요소에 할당된 핸들러가 동작하고,
					      이어서 부모 요소의 핸들러가 동작합니다.
				
					      가장 최상단의 조상 요소를 만날 때까지
					      이 과정이 반복되면서 요소 각각에 할당된 핸들러가 동작합니다.
				
					      이벤트가 제일 깊은 곳에 있는 요소에서 시작해 부모 요소를 거슬러 올라가며 발생하는 모양이 마치 물속 거품(bubble)과 닮았기 때문입니다.
				
					      클릭 이벤트를 중단하고, 호출한 곳으로 되돌아 가라~라는 의미.
					      a를 클릭했을 때, 부모의 요소도 클릭한것 처럼 처리가 되기때문에
					     HTML을 클릭 이전 상태로 되돌리기 위해서
					   */
					    });
					  });
				
				
					// 레이어 팝업
					  $('.notice li:first').click(function(){
					    $('#modalWrap').addClass("active");
					  });
					  $('.btn').click(function(){
					    $('#modalWrap').removeClass("active");
					  });
				
				
					});
			</script>

			<script>
				function redirectToURL(url) {
					window.location.href = url;
				}
			</script>
			
			
<!-- css시작 -->		
		<style>
			.larger-icon {
				font-size: 24px;
				color:gray;
			  }
			
			.full-width-button {
			    display: block;
			    width: 100%;
			    text-align: center;
			    padding: 5px;
			    background-color: yellow;
			    border: none;
			    color: black;
			    font-weight: bold;
			  }
			.custom-table {
			    width: 80%;
			    border: 1px solid white;
			  }

			.borderless-button {
			    border: none;
			    background-color:#d1d1cd;
			  }

			.cell-spacing {
			    padding-left: 100px;
			  }

			.full-width-button {
			    display: block;
			    width: 100%;
			    text-align: center;
			    padding: 5px;
			    background-color: yellow;
			    border: none;
			    color: black;
			    font-weight: bold;
			  }
	
			.cell-button {
			    width: 100%;
			    height: 100%;
			    display: flex;
			    justify-content: center;
			    align-items: center;
			  }

			.hidden {
					display: none;
					}

			hr {
			  border: none;
			  height: 3px;
			  background-color: gray;
			}
			
			table {
			    border: 1px solid white; /* 테이블 테두리 색상을 흰색으로 설정 */
			  }

			.bold-text {
					font-weight: bold;
				}
			
			.ul > li  {
				color: white;
				font-size: 1.2rem;
				font-weight: bold;
				align-items: left;
			}
		</style>
		
	</head>
<body>
   <header id="header" class="header fixed-top d-flex">
	
	<div class="d-flex align-items-center justify-content-between">
	<a class="logo d-flex align-items-center" href="notlog_main.do"><img src="resources/img/ezenlogo4.png" alt="로고"></a>
	<ul class="navi2">
		<li><a href="#">대학소개</a>
			<ul class="subMenu2">
              <li><a href="notlog_vision.do">비전</a></li>
              <li><a href="notlog_campusGuide.do">캠퍼스 안내</a></li>
			</ul>
		</li>
       
        <li><a href="#">입학 소개</a>
			<ul class="subMenu2">
				<li><a href="notlog_earlyDecision.do">입학 안내</a></li>
			</ul>
		</li>
       
        <li><a href="#">학사 소개</a>
			<ul class="subMenu2">
				<li><a href="notlog_schoolCalender.do">학사일정</a></li>
				<li><a href="notlog_courseRegistration.do">수강신청 안내</a></li>
              	<li><a href="notlog_schoolScholarship.do">교내/교외장학</a></li>
              	<li><a href="notlog_graduationRequirement.do">졸업요건</a></li>
              	<li><a href="notlog_majorRelated.do">전공/교과</a></li>
              	<li><a href="notlog_hyuhak.do">휴학/복학</a></li>
            </ul>
        </li>
        
        <li><a href="#">공지</a>
			<ul class="subMenu2">
				<li><a href="notlog_eventBoardList.do?page=1">공모`행사공지</a></li>
              	<li><a href="notlog_scholarBoard.do?page=1">장학 공지</a></li>
              	<li><a href="notlog_specialLectureBoardList.do?page=1">특강 공지</a></li>
              	<li><a href="notlog_libraryBoardList.do?page=1">도서관공지</a></li>
            </ul>
        </li>
        
        <li><a href="#">Q&A게시판</a>
			<ul class="subMenu2">
				<li><a href="notlog_qnaBoard_list.do">자주 묻는 질문</a></li>
            </ul>
        </li>
        
        <li><a href="#">대학생활</a>
			<ul class="subMenu2">
				<li><a href="notlog_certificate_domestic.do">증명서 발급</a></li>
				<li><a href="notlog_studentClub.do">학생동아리</a></li>
			</ul>
		</li>
	</ul>
	</div>
	
</header>
<aside class="side-bar">
  <section class="side-bar__icon-box">
    <section class="side-bar__icon-1">
      <div></div>
      <div></div>
      <div></div>
    </section>
  </section>
  <ul>
    <li>
      <a href="studentList.do"><i class="fa-solid fa-cat"></i> 재학생</a>
      <ul>
        <li><a href="login_main.do">포털</a></li>
        <li><a href="login_main.do">휴학/복학</a></li>
        <li><a href="notlog_schoolScholarship.do">장학금</a></li>
        <li><a href="notlog_campusBus_seoul.do">통학버스</a></li>
        <li><a href="login_main.do">성적</a></li>
        <li><a href="login_main.do">커뮤니티</a></li>
      </ul>
    </li>
    <li>
      <a href="staffList.do">교직원</a>
      <ul>
        <li><a href="login_main.do">포털</a></li>
        <li><a href="login_main.do">도서관</a></li>
      </ul>
    </li>
    <li>
      <a href="preEzenList.do">예비이젠인</a>
      <ul>
        <li><a href="notlog_certificate_domestic.do">증명서 발급</a></li>
		<li><a href="notlog_earlyDecision.do">입학안내</a></li>
		<li><a href="notlog_campusBus_seoul.do">통학버스</a></li>
		<li><a href="notlog_campusGuide.do">찾아오시는길</a></li>
		<li><a href="notlog_campusGuide.do">캠퍼스안내</a></li>
      </ul>
    </li>
    <li>
      <a href="notlog_qnaBoard_list.do">고객센터</a>
      <ul>
        <li><a href="notlog_scholarBoard.do">공지사항</a></li>
		<li><a href="notlog_qnaBoard_list.do">자주묻는질문</a></li>
      </ul>
    </li>
  </ul>
</aside>


<main id="main" class="main">