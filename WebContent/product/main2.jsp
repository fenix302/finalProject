<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="context"><%=request.getContextPath()%></c:set>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="description" content="main.jsp">


<link rel="stylesheet" href="${context}/css/main2.css">
<script src="${context}/js/jquery-1.9.1.js"></script>

<!-- owl.carousel -->
<link rel="stylesheet" href="${context}/css/owl.carousel.min.css">
<script src="${context}/js/owl.carousel.min.js"></script>

<title>천성</title>
</head>


<%-- <c:set var="loginUrl">${context}/user/login.jsp</c:set>

<c:set var="earUrl1">${context}/work/product/retrieveProduct.do?productCode=E0026</c:set>
<c:set var="neckUrl1">${context}/work/product/retrieveProduct.do?productCode=N0016</c:set>
<c:set var="ringUrl1">${context}/work/product/retrieveProduct.do?productCode=R003</c:set>
<c:set var="braceletUrl1">${context}/work/product/retrieveProduct.do?productCode=B0035</c:set>
<c:set var="earUrl2">${context}/work/product/retrieveProduct.do?productCode=E0023</c:set>
<c:set var="neckUrl2">${context}/work/product/retrieveProduct.do?productCode=N0012</c:set>
<c:set var="ringUrl2">${context}/work/product/retrieveProduct.do?productCode=R001</c:set>
<c:set var="braceletUrl2">${context}/work/product/retrieveProduct.do?productCode=B0029</c:set>

<c:set var="productManageUrl">${context}/work/product/retrieveProductListForManage.do</c:set>
<c:set var="statisticsForProductUrl">${context}/work/sell/retrieveStatisticsForProduct.do</c:set>
<c:set var="statisticsForStockUrl">${context}/work/product/retrieveStatisticsForStock.do?productCategoryCd=R</c:set> --%>



<body>
	<jsp:include page="../common/top.jsp"></jsp:include>

	<c:if test="${sessionScope.grade != 'A'}">

		<!-- 전체 -->
		<div class="con_main">
			<!-- 배너 -->
			<div class="banner_main">
				<div class="owl-carousel">
					<div class="banner_img">
						<img src="/css/images/banner_01.jpg" alt="#">
					</div>
					<div class="banner_img">
						<img src="/css/images/banner_02.jpg" alt="#">
					</div>
					<div class="banner_img">
						<img src="/css/images/banner_03.jpg" alt="#">
					</div>
					<div class="banner_img">
						<img src="/css/images/banner_04.jpg" alt="#">
					</div>
				</div>

				<!-- 캐러셀 스크립트 -->
				<script>
					var owl = $('.owl-carousel');
					owl.owlCarousel({
						items : 1,
						loop : true,
						margin : 0,
						autoplay : true,
						autoplayTimeout : 3000,
						autoplayHoverPause : true
					});
				</script>
			</div>
			<!-- 배너 끝 -->
			
			<!-- 컨텐츠 1 시작 -->
			<div id="forU_main">
			</div>
			<!-- 컨텐츠1 끝 -->
			
			
			<!-- 컨텐츠 2 시작 -->
			<div id="announce_main">
				<div class="owl-carousel">
					<div class="ann_img">
						<img src="/css/images/announce_main01.png" alt="#">
					</div>
					<div class="ann_img">
						<img src="/css/images/announce_main02.png" alt="#">
					</div>
				</div>

				<!-- 캐러셀 스크립트 -->
				<script>
					var owl = $('.owl-carousel');
					owl.owlCarousel({
						items : 1,
						loop : true,
						margin : 0,
						autoplay : true,
						autoplayTimeout : 3000,
						autoplayHoverPause : true
					});
				</script>				
			</div>
			<!-- 컨텐츠 2 끝 -->
			
			
			<!-- 컨텐츠 3 - 리뷰 시작 -->
			<div id="review_main">
			</div>
			<!-- 컨텐츠 3 끝 -->			
						
		</div>
		<!-- 전체 끝 -->
	</c:if>







	<!--     관리자 페이지 입니다 -->
	<c:if test="${sessionScope.grade == 'A'}">
		<div class="container" style="margin-top: 10%; margin-bottom: 10%">
			<div class="row">
				<div class="col-md-3">
					<a href="${context}/work/notice/retrieveBoardList.do"
						class="btn btn-success" style="width: 100%; height: 250px;"
						role="button">
						<h1>
							<span class="glyphicon glyphicon-list-alt"
								style="font-size: 80px; margin-top: 5%;"></span> <br />공지사항
						</h1>
					</a>
				</div>
				<div class="col-md-3">
					<a href="${productManageUrl}" class="btn btn-primary"
						style="width: 100%; height: 250px;" role="button">
						<h1>
							<span class="glyphicon glyphicon-list-alt"
								style="font-size: 80px; margin-top: 5%;"></span> <br />재고관리
						</h1>
					</a>
				</div>
				<div class="col-md-3">
					<a href="${statisticsForProductUrl}" class="btn btn-danger"
						style="width: 100%; height: 250px;" role="button">
						<h1>
							<span class="glyphicon glyphicon-signal"
								style="font-size: 80px; margin-top: 5%;"></span> <br />매출통계
						</h1>
					</a>
				</div>
				<div class="col-md-3">
					<a href="${statisticsForStockUrl}" class="btn btn-info"
						style="width: 100%; height: 250px;" role="button">
						<h1>
							<span class="glyphicon glyphicon-eye-open"
								style="font-size: 80px; margin-top: 5%;"></span> <br />재고현황
						</h1>
					</a>
				</div>
			</div>
		</div>
	</c:if>
	<jsp:include page="../common/foot.jsp"></jsp:include>
</body>
</html>