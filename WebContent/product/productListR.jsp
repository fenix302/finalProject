<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var ="context"><%=request.getContextPath()%></c:set>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="description" content="productListR.jsp">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>HS VOTE</title>

	<link href="${context}/css/bootstrap.min.css" rel="stylesheet">
	<link href="${context}/css/bootstrap-theme.css" rel="stylesheet">
	<link href="${context}/css/plugins/metisMenu/metisMenu.min.css" rel="stylesheet">
	<link href="${context}/css/plugins/dataTables.bootstrap.css" rel="stylesheet">

    <link href="${context}/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="${context}/font-awesome-4.4.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	<script src="${context}/js/jquery-1.9.1.js"></script>
	<script src="${context}/js/bootstrap.min.js"></script>

    <script src="${context}/js/plugins/metisMenu/metisMenu.min.js"></script>

    <script src="${context}/js/plugins/dataTables/jquery.dataTables.js"></script>
    <script src="${context}/js/plugins/dataTables/dataTables.bootstrap.js"></script>

    <script src="${context}/js/sb-admin-2.js"></script>

    <script>

	var existFolder = '';
	var imageFolder = '';
	var path = '';

    $(document).ready(function() {
        $('#dataTables-example').dataTable();
    });


    </script>
</head>
<body>
<jsp:include page="../common/top.jsp"></jsp:include>
	<br><br><br>
	<div class="container">
		<div class="page-header">
			<h1>${dsProductList[0].PRODUCT_CATEGORY_CD_NM}</h1>
		</div>
		<div class="jumbotron">
			<div class="row">
				<c:forEach items="${dsProductList}" var="dsProductList" varStatus="dsProductIdx">
					<div class="col-md-6">
						<a href="${context}/work/product/retrieveProduct.do?productCode=${dsProductList.PRODUCT_CODE}"><img name="image" src="${context}/coffeeImg/${dsProductList.PRODUCT_IMAGE}" class="img-thumbnail"></a>
						<script type="text/javascript">
						 	var productCategoryCd = '${dsProductList.PRODUCT_CATEGORY_CD}';

							if(productCategoryCd == 'C'){
								imageFolder = "coffeeImg";
							}else if(productCategoryCd == 'G'){
								imageFolder = "goodsImg";
							}else if(productCategoryCd == 'P'){
								imageFolder = "presentImg";
							}else if(productCategoryCd == 'R'){
								imageFolder = "regularImg";
							}
							path = $("img[name='image']").eq('${dsProductIdx.index}').attr("src");

							existFolder = path.split("/")[1];
							$("img[name='image']").eq('${dsProductIdx.index}').attr("src", path.replace(existFolder, imageFolder));
						</script>
						<div class="row" style="background-color: white; margin-left: 0.01%; width: 93%; height:130px; border:1px solid lightgray;">
							<div class="col-md-12">
								<h4><font color="red"><b>${dsProductList.PRODUCT_NAME}</b></font></h4>
					        </div>
					        <div class="col-md-12">
					        	<h4 style="font-family: inherit;"><b>${dsProductList.PRODUCT_UNIT_PRICE}원</b></h4>
					        </div>
					        <div class="col-md-12">
						        <h4 style="font-family: inherit;"><font color="lightblack"><b>남은 수량 : ${dsProductList.PRODUCT_COUNT}</b></font></h4>
					        </div>
				        </div>
				        <c:if test="${dsProductIdx.index % 2 == 1}">
							&nbsp;
						</c:if>
					</div>
				</c:forEach>
				</div>
		</div>
	</div>
	<jsp:include page="../common/foot.jsp"></jsp:include>
</body>
</html>