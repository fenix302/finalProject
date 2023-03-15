<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var ="context"><%=request.getContextPath()%></c:set>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="description" content="cartListR.jsp">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>장바구니</title>

	<link href="${context}/css/bootstrap.css" rel="stylesheet">
<%-- 	<link href="${context}/css/bootstrap-theme.css" rel="stylesheet"> --%>
	<link href="${context}/css/plugins/metisMenu/metisMenu.min.css" rel="stylesheet">
	<link href="${context}/css/plugins/datatables.css" rel="stylesheet">

    <link href="${context}/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="${context}/font-awesome-4.4.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    
    <link href="${context}/css/buy.css" rel="stylesheet">
    
	<script src="${context}/js/jquery-1.9.1.js"></script>
<!-- 	<script src="../js/bootstrap.bundle.js"></script> -->

    <script src="${context}/js/plugins/metisMenu/metisMenu.min.js"></script>

<%--     <script src="${context}/js/plugins/dataTables/jquery.dataTables.js"></script> --%>
    <script src="${context}/js/plugins/dataTables/datatables.js"></script>

    <script src="${context}/js/sb-admin-2.js"></script>

    <script>
	var existFolder = '';
	var imageFolder = '';
	var path = '';

    $(document).ready(function() {
        $('#dataTables-example').dataTable();

    });

    function fn_buy(paramProductCode, paramCartPrice, paramCartCount){
    	if(confirm("구매하시겠습니까?")){
    		location.href = "${context}/work/sell/createSell.do?productCode=" + paramProductCode + "&sellPrice=" + paramCartPrice + "&sellCount=" + paramCartCount;
    	}
    }

    function fn_delete(paramCartCode, paramProductCode, paramSellCount){
    	if(confirm("정말로 삭제하시겠습니까?")){
	    	location.href = "${context}/work/cart/deleteCart.do?cartCode=" + paramCartCode + "&productCode=" + paramProductCode + "&productCount=" + paramSellCount;
    	}
    }

    </script>
</head>
<body>
	<!-- 헤더 -->
	<jsp:include page="/common/top.jsp"></jsp:include>
	
	
	<!-- 페이지 헤더 -->
	<div class="page_header">
		 <div class="cartList_header">
		       <div class="name">
		             <p class="comeText">장바구니</p>
		        </div>
		  </div>
	</div>
	
	
	<div class="container">
		<div class="buy-main">
<!-- 			<h1><font color="black"><strong>장바구니</strong>&nbsp;<span class="glyphicon glyphicon-shopping-cart"></span></font></h1> -->
			<h4><font color="black"><strong>${sessionScope.id}님의 장바구니입니다.</strong></font></h4>
		</div>

		<div class="row" style="margin-bottom: 10%;">
			<div class="col-md-12">
			    <div class="panel panel-default">
			        <!-- /.panel-heading -->
			        <div class="panel-body">
			            <div class="table-responsive">
			                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
			                    <thead>
			                        <tr>
			                        	<th style="text-align: center; vertical-align: middle; width: 10px;" class="responseC">No</th>
			                            <th style="text-align: center; vertical-align: middle; width: 20px;" class="responseC">상품이미지</th>
			                            <th style="text-align: center; vertical-align: middle; width: 50px;">상품이름</th>
			                            <th style="text-align: center; vertical-align: middle; width: 20px;" class="responseC">상품단가</th>
			                            <th style="text-align: center; vertical-align: middle; width: 40px;">상품수량</th>
			                            <th style="text-align: center; vertical-align: middle; width: 30px;">결제금액</th>
			                            <th style="text-align: center; vertical-align: middle; width: 30px;">구매 / 삭제</th>
			                        </tr>
			                    </thead>
			                    <tbody>
			                    	<c:forEach items="${dsCartList}" var="dsCartList" varStatus="cartIdx">
			                         <tr>
			                         	<td style="text-align: center; vertical-align: middle;" class="responseC">${cartIdx.count}</td>
			                            <td style="text-align: center; vertical-align: middle;" class="responseC">
										<a href="${context}/work/product/retrieveProduct.do?productCode=${dsCartList.PRODUCT_CODE}">
											<img name="image" width="110px" height="110px" src="${context}/coffeeImg/${dsCartList.PRODUCT_IMAGE}" class="img-thumbnail">
										</a>
											<script type="text/javascript">
											 	var productCategoryCd = '${dsCartList.PRODUCT_CATEGORY_CD}';

											 	if(productCategoryCd == 'C'){
													imageFolder = "coffeeImg";
												}else if(productCategoryCd == 'G'){
													imageFolder = "goodsImg";
												}else if(productCategoryCd == 'P'){
													imageFolder = "presentImg";
												}else if(productCategoryCd == 'R'){
													imageFolder = "regularImg";
												}
												path = $("img[name='image']").eq('${cartIdx.index}').attr("src");

												existFolder = path.split("/")[1];
												$("img[name='image']").eq('${cartIdx.index}').attr("src", path.replace(existFolder, imageFolder));
											</script>
			                            </td>
			                            <td style="text-align: center; vertical-align: middle;">${dsCartList.PRODUCT_NAME}</td>
			                            <td style="text-align: center; vertical-align: middle;" class="responseC">${dsCartList.PRODUCT_UNIT_PRICE}원</td>
			                            <td style="text-align: center; vertical-align: middle;">${dsCartList.CART_COUNT}</td>
			                            <td style="text-align: center; vertical-align: middle;">${dsCartList.CART_PRICE}원</td>
			                            <td style="text-align: center; vertical-align: middle;">
			                            	<button type="button" class="btn buy-buy-btn" onclick="fn_buy('${dsCartList.PRODUCT_CODE}', '${dsCartList.CART_PRICE}', '${dsCartList.CART_COUNT}')">구매</button>
			                            	<button type="button" class="btn buy-remove-btn" onclick="fn_delete('${dsCartList.CART_CODE}', '${dsCartList.PRODUCT_CODE}', '${dsCartList.CART_COUNT}')">삭제</button>
			                            </td>
			                         </tr>
			                        </c:forEach>
			                    </tbody>
			                </table>
			            </div>
			            <!-- /.table-responsive -->
			        </div>
			        <!-- /.panel-body -->
			    </div>
			    <!-- /.panel -->
			</div>
			<!-- /.col-lg-12 -->
		</div>
	</div>
<jsp:include page="../common/foot.jsp"></jsp:include>
</body>
</html>