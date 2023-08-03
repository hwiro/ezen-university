<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>

	<link href="resources/img/favicons/house.svg" rel="icon">

  <link href="resources/majorBoard_css/assets/vendor/bootstrap/css/bootstrap.css" rel="stylesheet">
  <link href="resources/majorBoard_css/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="resources/majorBoard_css/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="resources/majorBoard_css/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="resources/majorBoard_css/assets/vendor/quill/quill.snow.css" rel="stylesheet">
  <link href="resources/majorBoard_css/assets/vendor/quill/quill.bubble.css" rel="stylesheet">
  <link href="resources/majorBoard_css/assets/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="resources/majorBoard_css/assets/vendor/simple-datatables/style.css" rel="stylesheet">
  <link href="resources/majorBoard_css/assets/css/style.css" rel="stylesheet">
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
              <script>
                document.addEventListener("DOMContentLoaded", () => {
                  echarts.init(document.querySelector("#trafficChart")).setOption({
                    tooltip: {
                      trigger: 'item'
                    },
                    legend: {
                      top: '5%',
                      left: 'center'
                    },
                    series: [{
                      name: 'Access From',
                      type: 'pie',
                      radius: ['40%', '70%'],
                      avoidLabelOverlap: false,
                      label: {
                        show: false,
                        position: 'center'
                      },
                      emphasis: {
                        label: {
                          show: true,
                          fontSize: '18',
                          fontWeight: 'bold'
                        }
                      },
                      labelLine: {
                        show: false
                      },
                      data: [{
                          value: 1048,
                          name: 'Search Engine'
                        },
                        {
                          value: 735,
                          name: 'Direct'
                        },
                        {
                          value: 580,
                          name: 'Email'
                        },
                        {
                          value: 484,
                          name: 'Union Ads'
                        },
                        {
                          value: 300,
                          name: 'Video Ads'
                        }
                      ]
                    }]
                  });
                });
              </script>
<meta charset="UTF-8">
<title>마이페이지</title>
</head>
<body>
<header id="header" class="header fixed-top d-flex align-items-center">
	<div class="d-flex align-items-center justify-content-between">
		<a href="login_main.do" class="logo d-flex align-items-center">
			<img src="resources/img/ezenlogo.png" alt>
			<span class="d-none d-lg-block">EZEN</span>
		</a>
		<i class="bi bi-list toggle-sidebar-btn"></i>
	</div>
	
</header>
<aside id="sidebar" class="sidebar">
	<ul class="sidebar-nav" id="sidebar-nav">
		<li class="nav-item">
            <c:if test="${sessionScope.type eq '교수' }">
			<a class="nav-link collapsed" href="classCheck.do">
				<i class="bi bi-grid"></i>
				<span>마이 페이지</span>
			</a>
            </c:if>
         </li> 
			<li class="nav-item">
			<a class="nav-link"
				data-bs-target="#components-nav collapsed" data-bs-toggle="collapse" href="#" aria-expended="false">
					<i class="bi bi-menu-button-wide"></i>
					<span>게시판</span> 
					<i class="bi bi-chevron-down ms-auto"></i>
			</a>
				<ul id="components-nav" class="nav-content collapse show"
					data-bs-parent="#sidebar-nav">
					<li><a href="noticeBoard.do"> 
					<i class="bi bi-circle">
					</i>
							<span>공지 게시판</span>
					</a></li>
					<li><a href="majorBoard.do"> <i class="bi bi-circle"></i>
							<span>강의 게시판</span>
					</a></li>
					<li><a href="qnaBoard.do"> <i class="bi bi-circle"></i> 
							<span>질문 게시판</span>
					</a></li>
				</ul>
			</li>
		</ul>
</aside>
<main id="main" class="main">