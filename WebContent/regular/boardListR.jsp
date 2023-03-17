<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var ="context"><%=request.getContextPath()%></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="boardListR.jsp">
<title>정기 구매 고객 관리</title>


	<link href="${context}/css/bootstrap.css" rel="stylesheet">
<%-- 	<link href="${context}/css/bootstrap-theme.css" rel="stylesheet"> --%>
	<link href="${context}/css/plugins/metisMenu/metisMenu.min.css" rel="stylesheet">
	<link href="${context}/css/plugins/datatables.css" rel="stylesheet">

    <link href="${context}/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="${context}/font-awesome-4.4.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    
    <link href="${context}/css/notice.css" rel="stylesheet">
    
	<script src="${context}/js/jquery-1.9.1.js"></script>
<!-- 	<script src="../js/bootstrap.bundle.js"></script> -->

    <script src="${context}/js/plugins/metisMenu/metisMenu.min.js"></script>

<%--     <script src="${context}/js/plugins/dataTables/jquery.dataTables.js"></script> --%>
    <script src="${context}/js/plugins/dataTables/datatables.js"></script>

    <script src="${context}/js/sb-admin-2.js"></script>
</head>
<body>
<!-- 헤더 -->
<jsp:include page="../common/top.jsp"></jsp:include>

<!-- 페이지 헤더 -->
	<div class="page_header">
		 <div class="login_header">
		       <div class="name">
		             <p class="comeText">정기 구매 고객 관리</p>
		        </div>
		  </div>
	</div>


<!-- 본문 -->
	<div class="container" style="margin-top: 2%; margin-bottom: 10%;">
		
		
		<!-- /.row -->
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading">
					</div>
					<!-- /.panel-heading -->
					<div class="panel-body">
						<table width="100%"
							class="table table-striped table-bordered table-hover">
							<thead>
								<tr>
									<th>주문 일자</th>
									<th>상품 이름</th>
									<th>주문 고객</th>
								</tr>
							</thead>
		
								<tbody>
			                    	<c:forEach items="${dsPaymentList}" var="dsPaymentList" varStatus="courseIdx">
			                         <tr>
			                         	<td><a class="move" href="${dsPaymentList.per_num}"><fmt:formatDate pattern="yyyy-MM-dd" value="${dsPaymentList.per_time}" /></a></td>
			  							<td><a class="move" href="${dsPaymentList.per_num}">${dsPaymentList.name}</a></td>
			  							<td><a class="move" href="${dsPaymentList.per_num}">${dsPaymentList.buyer_name}</a></td>
			                         </tr>
				                    </c:forEach>
			                    </tbody>
						</table>
		<!-- 			table 태그의 끝 	-->
		
						<div class="row">
							<div class="col-lg-12">
								<form id="searchForm" action="/work/regular/retrieveBoardList.do" method="get">
		<!-- 						select 태그의 내부는 삼항 연산자를 이용해서 해당 조건으로 검색되었다면  			-->
		<!-- 						'selected'라는 문자열을 출력하게 해서 화면에서 선택된 항목으로 보이도록 처리합니다.  	-->
									<select name="type">
											<option value="T" <c:out value="${pageMaker.cri.type eq 'T' ? 'selected': ''}"/>>상품 이름</option>
											<option value="C" <c:out value="${pageMaker.cri.type eq 'C' ? 'selected': ''}"/>>주문 고객</option>
									</select>
									<input type="text" name="keyword" value='<c:out value="${pageMaker.cri.keyword}"/>'/>
									<input type="hidden" name="pageNum" value='<c:out value="${pageMaker.cri.pageNum}"/>'/>
									<input type="hidden" name="amount" value='<c:out value="${pageMaker.cri.amount}"/>'/>
									<button class="btn searchBtn">검색</button>
								</form>					
							</div>
						</div>
		
		
		<!-- 			tables.html 소스에서 가져오고, 컨트롤 + 쉬프트 + F 로 정렬 처리		 -->
						<div class="Page pull-right">
							<ul class="pagination">
								<c:if test="${pageMaker.prev}">
									<li class="page-item previous"><a href="${pageMaker.startPage-1}">Prev</a></li>
								</c:if>
								<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
									<li class="page-item ${pageMaker.cri.pageNum == num ? "active":""} "><a href="${num}">${num}</a></li>
								</c:forEach>
								<c:if test="${pageMaker.next}">
									<li class="page-item next"><a href="${pageMaker.endPage +1}">Next</a></li>
								</c:if>
							</ul>
						</div>
		<!-- 			end Pagination -->
						
		
					</div>
					<!-- end /.panel-body -->
				</div>
				<!-- end /.panel -->
			</div>
			<!-- /.col-lg-6 -->
		</div>
		<!-- /.row -->
</div>
		<form id="actionForm" action="/work/regular/retrieveBoardList.do" method="get">
<%-- 			<input type="hidden" name="bno" value='<c:out value="${dsBoardList.BNO}"/>'> --%>
			<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
			<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
			<input type="hidden" name="type" value='<c:out value="${pageMaker.cri.type}"/>'>
			<input type="hidden" name="keyword" value='<c:out value="${pageMaker.cri.keyword}"/>'>
		</form>
		
		<script type="text/javascript">
			$(document).ready(
					function() {
						
						var actionForm = $("#actionForm");
						$(".page-item a").on("click", function (e) {
							e.preventDefault();
							console.log('click');
							actionForm.find("input[name='pageNum']").val($(this).attr("href"));
							actionForm.submit();
						});
						
						// 게시물의 제목을 클릭하면 <form> 태그에 추가로 bno 값을 전송하기 위해서 
						// <input> 태그를 만들어 추가하고, 
						// <form> 태그의 action은 '/board/get'으로 변경한다. 
						$(".move").on("click", function (e) {
							e.preventDefault();
							actionForm.append("<input type='hidden' name='per_num' value='"+ $(this).attr("href")+"'>");
							actionForm.attr("action","/work/regular/retrieveBoard.do");
							actionForm.submit();
						});
						
						var searchForm = $("#searchForm");
						
						$("#searchForm button").on("click", function (e) {
							// 브라우저에서 검색 버튼을 클릭하면 form 태그의 전송은 막고,
							// 페이지 번호는 1이 되도록 처리합니다.
							searchForm.find("input[name='pageNum']").val("1");
							e.preventDefault();
							
							searchForm.submit();
						});
						
						
					});
		</script>
		
		<jsp:include page="../common/foot.jsp"></jsp:include>
		
</body>
</html>