<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var ="context"><%=request.getContextPath()%></c:set>
<!DOCTYPE html>
<html>
<head>
<meta name="description" content="subpage.jsp">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="UTF-8">
<title>JEWELL SHOP ${dsProductList[0].PRODUCT_CATEGORY_CD_NM}</title>
<link href="${context}/css/subpage2.css" rel="stylesheet">

<link href="${context}/css/bootstrap.css" rel="stylesheet">
<%-- 	<link href="${context}/css/bootstrap-theme.css" rel="stylesheet"> --%>
<link href="${context}/css/plugins/metisMenu/metisMenu.min.css" rel="stylesheet">
<link href="${context}/css/plugins/social-buttons.css" rel="stylesheet">
<link href="${context}/font-awesome-4.4.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="//code.jquery.com/ui/1.11.3/themes/smoothness/jquery-ui.css" rel="stylesheet" >
<link href="${context}/css/plugins/datatables.css" rel="stylesheet">
<link href="${context}/css/process.css" rel="stylesheet">

<script src="${context}/js/jquery-1.9.1.js"></script>
<script src="${context}/js/jquery.form.js"></script>
<script src="${context}/js/plugins/metisMenu/metisMenu.min.js"></script>

<%-- 	<script src="${context}/js/plugins/dataTables/jquery.dataTables.js"></script> --%>
<script src="${context}/js/plugins/dataTables/datatables.js"></script>

<script src="//code.jquery.com/ui/1.11.3/jquery-ui.js"></script>
<script type="text/javascript">

	var existFolder = '';
	var imageFolder = '';
	var path = '';
	
</script>

</head>
<body>
<jsp:include page="../common/top.jsp"></jsp:include>

<main class="container">


  <div class="wrapper">
    <div class="new">
    <img src="/css/images/345.jpg" alt="상품사진">
    </div>

    <div class="exp">
        <h3>EARING</h3>
        <h5>제품설명</h5>
        <hr color="#666666">
        <div class="sell">
            <h4>판매가</h4>
            <h6>145,000원</h6>
        </div>
        <div class="made">
            <h4>제조사</h4>
            <h6>Jewell</h6>
        </div>
        <div class="brand">
            <h4>브랜드</h4>
            <h6>Jewell</h6>
        </div>
        <div class="point">
            <h4>적립금</h4>
            <h6>14,500 p</h6>
        </div>
            <!-- <button type="submit">"Add to Cart ------ 14,000원"</button> -->
            <hr color="#666666">
            <div class="ring1">
                <h4>링 종류</h4>
                <button type="submit" style="width: 344px; height: 28px; ">"silver"</button>
            </div>
            <div class="ring2">
                <h4>링 사이즈</h4>
                <button type="submit" style="width: 344px; height: 28px;">"17호"</button>
            </div>
            <hr color="#666666">
            <button type="submit"style="width: 223px; height: 50px;" class="btn1">"Add to Cart"</button>
            <button type="submit"style="width: 223px; height: 50px;" class="btn2">"Buy"</button>
        </div>


	<div>
	<div>
    	<h3 style="font-size: 26px; font-weight: 900; text-align: center;">${dsProductList[0].PRODUCT_CATEGORY_CD_NM}</h3>
 	</div>
    <div class="group">
	    <div class="li_1">
		<div class="box-wrap row  justify-content-start align-items-end">
		<h3 style="font-size: 23px; font-weight: 900;">HOT</h3>
<!--        <h4 style="font-size: 14px; font-weight: 100; text-align: right;">see more</h4> -->
			<c:forEach items="${dsProductList}" var="dsProductList" varStatus="dsProductIdx" begin="0" end="3">
			<div class="col-md-3" style="margin-bottom: 100px;">
				<img name="image1" src="${context}/binderImg/${dsProductList.PRODUCT_IMAGE}" class="img-thumbnail mb-3">
				<script type="text/javascript">
				 	var productCategoryCd1 = '${dsProductList.PRODUCT_CATEGORY_CD}';
					
					if(productCategoryCd1 == 'N'){
						imageFolder = "neckImg";
					}else if(productCategoryCd1 == 'R'){
						imageFolder = "ringImg";
					}else if(productCategoryCd1 == 'E'){
						imageFolder = "earImg";
					}else if(productCategoryCd1 == 'B'){
						imageFolder = "braceletImg";
					}
					path = $("img[name='image1']").eq('${dsProductIdx.index}').attr("src");

					existFolder = path.split("/")[1];
					$("img[name='image1']").eq('${dsProductIdx.index}').attr("src", path.replace(existFolder, imageFolder));
				</script>
				<div class="row">
					<div class="col-md-12">
						<h4><b>${dsProductList.PRODUCT_NAME}</b></font></h4>
			        </div>
			        <div class="col-md-12">
			        <button type="btn" style="width: 100%;"><a href="${context}/work/product/retrieveProduct.do?productCode=${dsProductList.PRODUCT_CODE}">"Add to Cart ------ ${dsProductList.PRODUCT_UNIT_PRICE}원"</a></button>
<%-- 			        	<h4 style="font-family: inherit;"><b>${dsProductList.PRODUCT_UNIT_PRICE}원</b></h4> --%>
			        </div>
<!-- 			        <div class="col-md-12"> -->
<%-- 				        <h4 style="font-family: inherit;"><font color="lightblack"><b>남은 수량 : ${dsProductList.PRODUCT_COUNT}</b></font></h4> --%>
<!-- 			        </div> -->
		        </div>
			</div>
			</c:forEach>
		</div>
		</div> 
	</div>
    
     
</main>

<jsp:include page="../common/foot.jsp"></jsp:include>
</body>
</html>