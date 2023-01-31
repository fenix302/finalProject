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
    <title> JEWELL </title>
    <link href="${context}/css/bootstrap.css" rel="stylesheet">
    <link href="${context}/css/top.css" rel="stylesheet">
    
    <script src="${context}/js/jquery-1.9.1.js"></script>
    <link
    href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&family=Noto+Serif+KR:wght@200&display=swap"
    rel="stylesheet"
 />

</head>
<body>
    <div id="top">

        <div class="mybox sticky-top">
            <nav class="navbar navbar-expand-lg navbar-light container justify-content-between" id="navbar-example2">
        <!-- 로고 -->
                <a class="navbar-brand" href="#">
                    <img src="${context}/css/images/logo.png" alt="JEWELL">
                </a>
        <!-- 네비게이션 바 -->
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav">
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">About</a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="#">회사소개</a></li>
                                <li><a class="dropdown-item" href="#">오시는 길</a></li>
                                <li><a class="dropdown-item" href="#">FAQ</a></li>
                            </ul>
                        </li>
    
                        <li class="nav-item myitem">
                            <a class="nav-link" href="#">Announce</a>
                        </li>
    
    
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Shop</a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="#">귀걸이</a></li>
                                <li><a class="dropdown-item" href="#">목걸이</a></li>
                                <li><a class="dropdown-item" href="#">반지</a></li>
                                <li><a class="dropdown-item" href="#">팔찌</a></li>
                            </ul>
                        </li>
    
    
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Community</a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="#">자유게시판</a></li>
                                <li><a class="dropdown-item" href="#">상담신청게시판</a></li>
                                <li><a class="dropdown-item" href="#">후기</a></li>
                            </ul>
                        </li>
    
                        <li class="nav-item myitem">
                            <a class="nav-link" data-bs-toggle="modal" href="#exampleModalToggle" role="button">Login</a>
                        </li>
                    </ul>
                </div>
            </nav>
        </div>
        
    </div>
   

   
    <script src="${context}/js/bootstrap.bundle.js"></script>

  
</body>
</html>
