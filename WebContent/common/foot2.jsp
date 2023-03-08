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
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&family=Noto+Serif+KR:wght@200&display=swap"
	rel="stylesheet" />

<title>푸터</title>
</head>
<body>
	<footer>
		<div id="con">
			<div class="first">
				<p id="h1">JEWELL</p>
				<p id="h4">
					대표자 | 홍길동 <br> 전화 | 02-488-4888 <br> 주소 | 04202 서울특별시 마포구
					마포대로24길 16 (아현동) 114-401<br> 사업자등록번호 | 197-88-88888 <br>
					통신판매업신고 | 제2021-서울마포-1933호<br>
				</p>
			</div>
			<div class="seceond">
				<div class="sns_logo">
					<div class="sns">
						<a href="#"><img src="${context}/css/images/044-instagram.svg"
							alt=""></a>
					</div>
					<div class="sns">
						<a href="#"><img src="${context}/css/images/095-twitter.svg"
							alt=""></a>
					</div>
					<div class="sns">
						<a href="#"><img src="${context}/css/images/023-facebook.svg"
							alt=""></a>
					</div>
				</div>
			</div>
			<div class="third">

				<script>
					(function() {
						var w = window;
						if (w.ChannelIO) {
							return w.console
									.error("ChannelIO script included twice.")
						}
						var ch = function() {
							ch.c(arguments)
						};
						ch.q = [];
						ch.c = function(args) {
							ch.q.push(args)
						};
						w.ChannelIO = ch;
						function l() {
							if (w.ChannelIOInitialized) {
								return
							}
							w.ChannelIOInitialized = true;
							var s = document.createElement("script");
							s.type = "text/javascript";
							s.async = true;
							s.src = "https://cdn.channel.io/plugin/ch-plugin-web.js";
							var x = document.getElementsByTagName("script")[0];
							if (x.parentNode) {
								x.parentNode.insertBefore(s, x)
							}
						}
						if (document.readyState === "complete") {
							l()
						} else {
							w.addEventListener("DOMContentLoaded", l);
							w.addEventListener("load", l)
						}
					})();

					ChannelIO('boot', {
						"pluginKey" : "8f4afa83-3deb-4e02-830a-50da323e0d3b"
					});
				</script>

			</div>
		</div>
	</footer>
</body>
</html>