<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="context"><%=request.getContextPath()%></c:set>

<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    
    <!-- css -->
    <link href="${context}/css/top2.css" rel="stylesheet">
    
    <!-- google font api -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    
    <!-- 폰트어썸 -->
    <script src="https://kit.fontawesome.com/88016ce1ce.js"  crossorigin="anonymous"></script>

    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    
    <script src="${context}/js/jquery-1.9.1.js"></script>
    <script src="${context}/js/common2.js" defer></script>
    
    
    <title>New Bar</title>
    
 <!-- ------------------------------------------------------------------ -->
 
 
  </head>
  <body>
     <div id="top">
		<div class="nav_nav">
		    <nav class="navbar">
		      <!-- 로고 -->
		      <div class="navbar__logo">
		        <a href="#">
		        	<img alt="logo" src="/css/images/logo.png"> 
		        </a>
		      </div>
		      
		      
		      <!-- 메뉴 -->
		      <ul class="navbar__menu">
		        <li class="mainmenu_nav">Home
		        	<ul class="submenu_nav">
		        		<li class="sublist"><a>회사소개</a></li>
		        		<li class="sublist"><a>회사소개</a></li>
		        	</ul>
		        </li>
		        <li><a href="">Gallery</a></li>
		        <li><a href="">Weddings</a></li>
		        <li><a href="">FAQ</a></li>
		        <li><a href="">Bookings</a></li>
		      </ul>
		
		
		      <a href="#" class="navbar__toggleBtn">
		          <i class="fas fa-bars"></i>
		      </a>
   		 	</nav>
   		 </div>
    </div>
    
    <script type="text/javascript">
    
    	/* 바 토글 */
	    const toggleBtn = document.querySelector(".navbar__toggleBtn");
	    const menu = document.querySelector(".navbar__menu");
	    const icons = document.querySelector(".navbar__icons");
	
	    toggleBtn.addEventListener("click", () => {
	      menu.classList.toggle("active");
	      icons.classList.toggle("active");
	    });
	    
	    
	    /* 네비게이션 토글 */
	    $('nav>.navbar__menu>.mainmenu_nav').click(function() {
	        if ( $(this).hasClass('active') ) {
	            $(this).find(' > .submenu_nav').stop().slideUp(300);
	            $(this).removeClass('active');
	        }
	        else {
	            $(this).find(' > .submenu_nav').stop().slideDown(300);
	            $(this).addClass('active');
	        }
	    });
    </script>
 </html>