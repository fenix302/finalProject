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
<link rel="icon" href="${context}/productimg/Icon_logo.png" />
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&family=Noto+Serif+KR:wght@200&display=swap"
	rel="stylesheet" />
<link rel="stylesheet" href="${context}/css/main.css">
<script src="${context}/js/jquery-1.9.1.js"></script>

<!-- owl.carousel -->
<link rel="stylesheet" href="${context}/css/owl.carousel.min.css">
<script src="${context}/js/owl.carousel.min.js"></script>

<!-- aos  -->
<link rel="stylesheet" href="https://unpkg.com/aos@2.3.1/dist/aos.css"> 
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script> 
    
    
<title>천성</title>

</head>


<!-- ---------------------------------------------------------------------------------------------- -->


<c:set var="loginUrl">${context}/user/login.jsp</c:set>

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
<c:set var="statisticsForStockUrl">${context}/work/product/retrieveStatisticsForStock.do?productCategoryCd=R</c:set>



<body>
	<!-- 헤더 -->
	<jsp:include page="../common/top.jsp"></jsp:include>
	

<!-- ---------------------------------------------------------------------------------------------- -->


	<c:if test="${sessionScope.grade != 'A'}">
		<!-- 전체 -->
		<div class="con_main">
			<!-- 배너 -->
			<div class="banner_main">
				<div class="owl-carousel">
					<div class="banner_img">
						<img src="${context}/css/images/banner_01.jpg" alt="#">
					</div>
					<div class="banner_img">
						<img src="${context}/css/images/banner_02.jpg" alt="#">
					</div>
					<div class="banner_img">
						<img src="${context}/css/images/banner_03.jpg" alt="#">
					</div>
					<div class="banner_img">
						<img src="${context}/css/images/banner_04.jpg" alt="#">
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
						autoplayHoverPause : true,
						dots:false
					});
				</script>
			</div>
			<!-- 배너 끝 -->
			
			
			<!-- 컨텐츠 1 시작 -->
			<div id="forU_main">
				<div class="forU_main">
					<p class="f3">For U!</p>
				</div>
				
				<div class="forU_main">
					<div data-aos="fade-right" class="forU_img">
						<a>
							<img alt="혜택1" src="/css/images/forU_1.jpg"/>
						</a>
					</div>
					<div data-aos="fade-right"  data-aos-delay="100" class="forU_img">
						<a>
							<img alt="혜택2" src="/css/images/forU_2.jpg"/>
						</a>
					</div>
					
					<div data-aos="fade-right"  data-aos-delay="200" class="forU_img">
						<a>
							<img alt="혜택3" src="/css/images/forU_3.jpg"/>
						</a>
					</div>
					
					<div data-aos="fade-right"  data-aos-delay="300" class="forU_img">
						<a>
							<img alt="혜택4" src="/css/images/forU_4.jpg"/>
						</a>
					</div>
					
					<!-- aos 스크립트 -->												
			        <script> 
			            AOS.init(); // 자바스크립트로 init()을 해야 동작한다.
			        </script>				
				</div>
			</div>
			<!-- 컨텐츠1 끝 -->
			
			
			<!-- 컨텐츠 2 시작 -->
			<div id="announce_main">
				<div class="owl-carousel">
					<!-- 2-1 -->
					<div class="ann_img ann_img_first">
						<div class="ann_word">
							<div class="ann_positon">
								<p class="f4"> 카페, 천성은?</p>	
								<p class="f5"> 카페 천성은 어떤 브랜드고, <br/>
									어떤 브랜드인지 궁금하신 가요?
								</p>
								<p class="f6"><a href="localhost:3000/AboutUs"> 자세히 알아보기 ▶ </a></p>													
							</div>
						</div>							
					</div>
					
					<!-- 2-2 -->
					<div class="ann_img ann_img_snd">
						<div class="ann_word">
							<div class="ann_positon">
								<p class="f4"> 지금, 천성에서는?</p>	
								<p class="f5"> 다른 사람들의 이야기가 궁금하신가요? <br/>
									함께 이야기를 나누어보세요.
								</p>
								<p class="f6"><a href="${context}/work/free/retrieveBoardList.do"> 자세히 알아보기 ▶ </a></p>													
							</div>					
						</div>
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
						autoplayTimeout : 4000,
						autoplayHoverPause : true,
						dots:false
					});
				</script>				
			</div>
			<!-- 컨텐츠 2 끝 -->
			
			
			<!-- 컨텐츠 3 - 리뷰 시작 -->
			<div id="review_main">
				<div class="review_fro">
					<p class="f3">REVIEW</p>
					<p class="f7"> 누적 후기 1.2만개 | 평균 별점 ★★★★★  4.9</p>
				</div>
				
				<!-- 이미지 -->
				<div class="review_img">
				</div>
				
				<!-- 버튼 -->
				<div  class="btn_box_main">
					<a>
						<button class="btn_main">
							<p class="f8">리뷰 더보기</p>
						</button>
					</a>
				</div>				
			</div>
			<!-- 컨텐츠 3 끝 -->			
						
		</div>
		<!-- 전체 끝 -->
	</c:if>



<!-- ---------------------------------------------------------------------------------------------- -->



	<!--     관리자 페이지 입니다 -->
	<c:if test="${sessionScope.grade == 'A'}">
		<div class="container" style="margin-top: 10%; margin-bottom: 10%">
			<div class="row">
				<div class="col-md-3">
					<a href="${context}/work/regular/retrieveBoardList.do"
						class="btn btn-success" style="width: 100%; height: 250px;"
						role="button">
						<h1>
							<span class="glyphicon glyphicon-list-alt"
								style="font-size: 80px; margin-top: 5%;"></span> <br />정기 구매 고객 관리
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
	
	
<!-- ---------------------------------------------------------------------------------------------- -->

	<!-- 푸터 -->
	<jsp:include page="../common/foot.jsp"></jsp:include>
</body>
</html>