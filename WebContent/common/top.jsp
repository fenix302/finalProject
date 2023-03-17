<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="context"><%=request.getContextPath()%></c:set>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>카페 천성</title>
<link href="${context}/css/bootstrap.css" rel="stylesheet">
<link href="${context}/css/top.css" rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&family=Noto+Serif+KR:wght@200&display=swap"
	rel="stylesheet" />

<script src="${context}/js/common.js"></script>
<script src="${context}/js/bootstrap.bundle.js"></script>


<style type="text/css">
li {
	cursor: pointer;
}

a {
	text-decoration: none !important;
}
</style>
</head>

<c:set var="homeUrl">${context}/work/product/goMain.do</c:set>
<c:set var="loginUrl">${context}/user/login.jsp</c:set>

<c:set var="coffeeUrl">${context}/work/product/retrieveProductList.do?category=C</c:set>
<c:set var="goodsUrl">${context}/work/product/retrieveProductList.do?category=G</c:set>
<c:set var="presentUrl">${context}/work/product/retrieveProductList.do?category=P</c:set>
<c:set var="regularUrl">${context}/work/product/retrieveProductList2.do?category=R</c:set>




<body>
	<div id="top">

		<div class="mybox sticky-top">
			<nav
				class="navbar navbar-expand-lg navbar-light container justify-content-between"
				id="navbar-example2">
				<!-- 로고 -->
				<ul class="navbar-brand">
					<li><a href="${homeUrl}"><img
							src="${context}/css/images/logo.png" alt="JEWELL"></a></li>
				</ul>
				<!-- 네비게이션 바 -->
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav">
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" role="button"
							data-bs-toggle="dropdown" aria-expanded="false">About</a>
							<ul class="dropdown-menu">
								<li><a class="dropdown-item"
									href="http://localhost:3000/AboutUs">회사소개</a></li>
								<li><a class="dropdown-item"
									href="http://localhost:3000/location">오시는 길</a></li>
								<li><a class="dropdown-item"
									href="http://localhost:3000/Promote">홍보영상</a></li>
								<li><a class="dropdown-item" 
									href="http://localhost:3000/faq">FAQ</a></li>
							</ul></li>

						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" role="button"
							data-bs-toggle="dropdown" aria-expanded="false">Shop</a>
							<ul class="dropdown-menu">
								<li><a class="dropdown-item"
									onclick="javascript:fn_isLogin('${sessionScope.userCode}','${loginUrl}','${coffeeUrl}')">원액</a></li>
								<li><a class="dropdown-item"
									onclick="javascript:fn_isLogin('${sessionScope.userCode}','${loginUrl}','${goodsUrl}')">굿즈</a></li>
								<li><a class="dropdown-item"
									onclick="javascript:fn_isLogin('${sessionScope.userCode}','${loginUrl}','${presentUrl}')">선물용</a></li>
								<li><a class="dropdown-item"
									onclick="javascript:fn_isLogin('${sessionScope.userCode}','${loginUrl}','${regularUrl}')">정기구매</a></li>
							</ul></li>



						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" role="button"
							data-bs-toggle="dropdown" aria-expanded="false">Community</a>
							<ul class="dropdown-menu">
								<li><a class="dropdown-item"
									href="${context}/work/notice/retrieveBoardList.do">공지사항</a></li>
								<li><a class="dropdown-item"
									href="${context}/work/free/retrieveBoardList.do">자유게시판</a></li>
								<li><a class="dropdown-item"
									href="${context}/work/comm/retrieveBoardList.do">커뮤니티</a></li>
								<li><a class="dropdown-item"
									href="${context}/work/consulting/retrieveBoardList.do">상담신청게시판</a></li>
							</ul></li>

						<li class="nav-item dropdown" style="margin-right: 0px;"><c:if
								test="${sessionScope.id == null}">
								<p style="display: none;"></p>
							</c:if> <c:if
								test="${sessionScope.id != null && sessionScope.grade != 'A'}">
								<a href="#" class="nav-link dropdown-toggle" role="button"
									data-bs-toggle="dropdown" aria-expanded="false">My Page</a>
							</c:if> <c:if
								test="${sessionScope.id != null && sessionScope.grade == 'A'}">
								<a href="#" class="nav-link dropdown-toggle" role="button"
									data-bs-toggle="dropdown" aria-expanded="false">Admin</a>
							</c:if>
							<ul class="dropdown-menu">
								<li><c:if
										test="${sessionScope.id != null && sessionScope.grade != 'A'}">
										<a class="dropdown-item"
											href="${context}/work/cart/retrieveCartList.do">장바구니</a>
									</c:if> <c:if
										test="${sessionScope.id != null && sessionScope.grade == 'A'}">
										<a class="dropdown-item"
											href="${context}/work/product/retrieveProductListForManage.do">재고관리</a>
									</c:if></li>
								<li><c:if
										test="${sessionScope.id != null && sessionScope.grade != 'A'}">
										<a class="dropdown-item"
											href="${context}/work/sell/retrieveBuyList.do">구매내역</a>
									</c:if> <c:if
										test="${sessionScope.id != null && sessionScope.grade == 'A'}">
										<a class="dropdown-item"
											href="${context}/work/sell/retrieveStatisticsForProduct.do">매출통계</a>
									</c:if></li>
								<li><c:if
										test="${sessionScope.id != null && sessionScope.grade != 'A'}">
										<a class="dropdown-item"
											href="${context}/work/user/updateUser.do">정보수정</a>
									</c:if> <c:if
										test="${sessionScope.id != null && sessionScope.grade == 'A'}">
										<a class="dropdown-item"
											href="${context}/work/product/retrieveStatisticsForStock.do?productCategoryCd=P">재고현황</a>
									</c:if></li>
							</ul></li>


						<c:if test="${sessionScope.id == null}">
							<li class="nav-item myitem">
								<a href="${context}/work/user/createUser.do" class="nav-link">회원가입</a>
							</li>
						</c:if>
						<c:if test="${sessionScope.id == null}">
							<li class="nav-item myitem">
								<a href="${loginUrl}" class="nav-link">LOGIN</a>
							</li>
						</c:if> 
						<c:if test="${sessionScope.id != null}">
							<li class="nav-item myitem" style="text-align: center;">
								<label for="logOut">${sessionScope.name}님 환영합니다.</label>
								<a href="${context}/work/user/logout.do" class="nav-link" id="logOut">LOGOUT</a>
							</li>
						</c:if>
					</ul>
				</div>
			</nav>
		</div>

	</div>






</body>
</html>
