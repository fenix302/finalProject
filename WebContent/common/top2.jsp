<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var ="context"><%=request.getContextPath()%></c:set>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> 천성 </title>
    <link href="${context}/css/top2.css" rel="stylesheet">
    
    <!-- 폰트어썸  -->
	<script src="https://kit.fontawesome.com/3442ebfa65.js" crossorigin="anonymous"></script>
    <link rel="preconnect" href="https://fonts.gstatic.com">
    
    <!-- js -->
    <script src="${context}/js/common2.js"></script>
 	
 	
</head>

<%-- <c:set var="homeUrl">${context}/work/product/goMain.do</c:set>
<c:set var="loginUrl">${context}/user/login.jsp</c:set>

<c:set var="neckUrl">${context}/work/product/retrieveProductList.do?category=N</c:set>
<c:set var="ringUrl">${context}/work/product/retrieveProductList.do?category=R</c:set>
<c:set var="braceletUrl">${context}/work/product/retrieveProductList.do?category=B</c:set>
<c:set var="earUrl">${context}/work/product/retrieveProductList.do?category=E</c:set> --%>




<body>
    <div id="top">
		<div class="nav_nav">
		    <nav class="navbar">
		      <div class="navbar__logo">
		        <a href="#"><img alt="logo" src="/css/images/logo.png"> </a>
		      </div>
		      
		      <ul class="navbar__menu">
		        <li><a href="">Home</a></li>
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
    

  
</body>
</html>
