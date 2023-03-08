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
<link href="${context}/css/footer.css" rel="stylesheet">

<title>푸터</title>
</head>
<body>
	<footer>
		<!-- contain_foot -->
		<div id="contain_foot">
		
			<!-- 아이콘 로고 / svg -->
			<div id="first_foot">
				<div>
					<div class="brand_logo">
						<a href="#"><img src="${context}/css/images/logo.png"
							alt=""></a>
					</div>
				</div>
				
				<div class="sns_logo">
					<!-- sns 로고 -->
					<div class="sns">
						<a href="#"><img src="${context}/css/images/044-instagram.svg"
							alt=""></a>
							
						<a href="#"><img src="${context}/css/images/095-twitter.svg"
							alt=""></a>							
							
						<a href="#"><img src="${context}/css/images/023-facebook.svg"
							alt=""></a>
					</div>
			</div>
			
			<!-- 내용 -->
			<div id="scnd_foot">
				<p class="company_foot">					
					<strong>Company</strong> : (주)천성(ChunSung Inc.) <br/>
					<strong>사업자등록번호</strong> :  111-11-11111 | <strong>대표자</strong> : 안주현 <br/>
					<strong>주소</strong> : 경기도 용인시 기흥구 서천로 201번길 14, 322호 <br/>
					<strong>Tel</strong> : 070 1234 1234 | <strong>Fax</strong> : 1234 123 1234 <br/>					
				</p>
				
				<p class="Center_foot">
				고객센터
				</p>
				<p class="Center_ann_foot">
					<strong>Tel</strong> : 070 1234 4321 <br/>
					<strong>월-금</strong> 9:00~18:00 <thin>(주말/공휴일 제외)</thin> <br/>
					<strong>점심시간</strong> 12:00-13:00
				</p>
			</div>
			
		</div>
		<!-- contain_foot 끝 -->
	</footer>
</body>
</html>