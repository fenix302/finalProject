<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var ="context"><%=request.getContextPath()%></c:set>
<!DOCTYPE html>
<html>
<head>
		<meta name="description" content="boardR.jsp">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>커뮤니티</title>
	<link href="${context}/css/bootstrap.css" rel="stylesheet">
<%-- 	<link href="${context}/css/bootstrap-theme.css" rel="stylesheet"> --%>
	<link href="${context}/css/plugins/metisMenu/metisMenu.min.css" rel="stylesheet">
	<link href="${context}/css/plugins/datatables.css" rel="stylesheet">
    <link href="${context}/css/sb-admin-2.css" rel="stylesheet">
    
    <link href="${context}/css/comm.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="${context}/font-awesome-4.4.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    
    <link href="${context}/css/buy.css" rel="stylesheet">
    
	<script src="${context}/js/jquery-1.9.1.js"></script>
		<script src="${context}/js/jquery.form.js"></script>
<!-- 	<script src="../js/bootstrap.bundle.js"></script> -->

    <script src="${context}/js/plugins/metisMenu/metisMenu.min.js"></script>

<%--     <script src="${context}/js/plugins/dataTables/jquery.dataTables.js"></script> --%>
    <script src="${context}/js/plugins/dataTables/datatables.js"></script>

    <script src="${context}/js/sb-admin-2.js"></script>
	<script type="text/javascript">
	$(document).ready(function(){
	});

	function fn_save(){
		$("#createReply").submit();
	}

	function fn_createRating(paramBoardNo){
		location.href = "${context}/work/board/updateBoardRating.do?boardNo=" + paramBoardNo;
	}

	//글 삭제
	function fn_delete(){
		var boardNo = '${dsBoard.BOARD_NO}';

		if(confirm("정말 글을 삭제하시겠습니까?")){
			location.href = "${context}/work/comm/deleteBoard.do?boardNo=" + boardNo;
		}
	}

	//글 수정
	function fn_update(){
		var boardNo = '${dsBoard.BOARD_NO}';

		location.href = "${context}/work/comm/updateBoard.do?boardNo=" + boardNo;
	}

	//목록으로
	function fn_moveToBoard(){
		location.href = "${context}/work/comm/retrieveBoardList.do";
	}
	
	
	/* 댓글 관련 스크립트 */

    (function(e){var t,o={className:"autosizejs",append:"",callback:!1,resizeDelay:10},i='<textarea tabindex="-1" style="position:absolute; top:-999px; left:0; right:auto; bottom:auto; border:0; padding: 0; -moz-box-sizing:content-box; -webkit-box-sizing:content-box; box-sizing:content-box; word-wrap:break-word; height:0 !important; min-height:0 !important; overflow:hidden; transition:none; -webkit-transition:none; -moz-transition:none;"/>',n=["fontFamily","fontSize","fontWeight","fontStyle","letterSpacing","textTransform","wordSpacing","textIndent"],s=e(i).data("autosize",!0)[0];s.style.lineHeight="99px","99px"===e(s).css("lineHeight")&&n.push("lineHeight"),s.style.lineHeight="",e.fn.autosize=function(i){return this.length?(i=e.extend({},o,i||{}),s.parentNode!==document.body&&e(document.body).append(s),this.each(function(){function o(){var t,o;"getComputedStyle"in window?(t=window.getComputedStyle(u,null),o=u.getBoundingClientRect().width,e.each(["paddingLeft","paddingRight","borderLeftWidth","borderRightWidth"],function(e,i){o-=parseInt(t[i],10)}),s.style.width=o+"px"):s.style.width=Math.max(p.width(),0)+"px"}function a(){var a={};if(t=u,s.className=i.className,d=parseInt(p.css("maxHeight"),10),e.each(n,function(e,t){a[t]=p.css(t)}),e(s).css(a),o(),window.chrome){var r=u.style.width;u.style.width="0px",u.offsetWidth,u.style.width=r}}function r(){var e,n;t!==u?a():o(),s.value=u.value+i.append,s.style.overflowY=u.style.overflowY,n=parseInt(u.style.height,10),s.scrollTop=0,s.scrollTop=9e4,e=s.scrollTop,d&&e>d?(u.style.overflowY="scroll",e=d):(u.style.overflowY="hidden",c>e&&(e=c)),e+=w,n!==e&&(u.style.height=e+"px",f&&i.callback.call(u,u))}function l(){clearTimeout(h),h=setTimeout(function(){var e=p.width();e!==g&&(g=e,r())},parseInt(i.resizeDelay,10))}var d,c,h,u=this,p=e(u),w=0,f=e.isFunction(i.callback),z={height:u.style.height,overflow:u.style.overflow,overflowY:u.style.overflowY,wordWrap:u.style.wordWrap,resize:u.style.resize},g=p.width();p.data("autosize")||(p.data("autosize",!0),("border-box"===p.css("box-sizing")||"border-box"===p.css("-moz-box-sizing")||"border-box"===p.css("-webkit-box-sizing"))&&(w=p.outerHeight()-p.height()),c=Math.max(parseInt(p.css("minHeight"),10)-w||0,p.height()),p.css({overflow:"hidden",overflowY:"hidden",wordWrap:"break-word",resize:"none"===p.css("resize")||"vertical"===p.css("resize")?"none":"horizontal"}),"onpropertychange"in u?"oninput"in u?p.on("input.autosize keyup.autosize",r):p.on("propertychange.autosize",function(){"value"===event.propertyName&&r()}):p.on("input.autosize",r),i.resizeDelay!==!1&&e(window).on("resize.autosize",l),p.on("autosize.resize",r),p.on("autosize.resizeIncludeStyle",function(){t=null,r()}),p.on("autosize.destroy",function(){t=null,clearTimeout(h),e(window).off("resize",l),p.off("autosize").off(".autosize").css(z).removeData("autosize")}),r())})):this}})(window.jQuery||window.$);

    $('#new-review').autosize({append: "\n"});

    var reviewBox = $('#post-review-box');
    var newReview = $('#new-review');
    var openReviewBtn = $('#open-review-box');
    var closeReviewBtn = $('#close-review-box');
    var ratingsField = $('#ratings-hidden');

    openReviewBtn.click(function(e)
    {
      reviewBox.slideDown(400, function()
        {
          $('#new-review').trigger('autosize.resize');
          newReview.focus();
        });
      openReviewBtn.fadeOut(100);
      closeReviewBtn.show();
    });

    closeReviewBtn.click(function(e)
    {
      e.preventDefault();
      reviewBox.slideUp(300, function()
        {
          newReview.focus();
          openReviewBtn.fadeIn(200);
        });
      closeReviewBtn.hide();

    });
    
    function fn_save(){
		if($("#userReply").val() == ''){
			alert("댓글을 입력하세요.");
			return false;
		}
		$("#createReply").submit();
	}

	function fn_remove(paramUserReplyNo){
		var userReplyNo = paramUserReplyNo;
		var productCode = '${dsProduct.PRODUCT_CODE}';

		if(confirm("정말 삭제하시겠습니까?")){
			location.href = "${context}/work/reply/deleteReply.do?userReplyNo=" + userReplyNo + "&productCode=" + productCode;
		}
	}
	
</script>
<style type="text/css">
li{
	cursor: default !important;
}
</style>
</head>
<body>

<!-- 헤더 -->
<jsp:include page="../common/top.jsp"></jsp:include>

<!-- 페이지 헤더 -->
<div class="page_header">
	 <div class="faq_header">
	       <div class="name">
	             <p class="comeText">커뮤니티</p>
	        </div>
	  </div>
</div>

<div class="container" style="margin-top: 2%; margin-bottom: 10%;">
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header"></h1>
        </div>
        <!-- /.col-lg-12 -->
    </div>
    <!-- /.row -->
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                </div>
                <!-- /.panel-heading -->
                <div class="panel-body">
					
					<div class="form-group">
						<label>번호</label> <input class="form-control" name="bno" value='<c:out value="${dsBoard.BNO}" />' readonly="readonly">
					</div>
					<div class="form-group">
						<label>제목</label> <input class="form-control" name="title" value='<c:out value="${dsBoard.TITLE}" />' readonly="readonly">
					</div>
					<div class="form-group">
						<label>내용</label> 
						<textarea class="form-control" rows="3" name="content" readonly="readonly"><c:out value="${dsBoard.CONTENT}"/>
						</textarea>
					</div>
					<div class="form-group">
						<label>작성자</label> <input class="form-control" name="writer" value='<c:out value="${dsBoard.WRITER}" />' readonly="readonly">
					</div>
					<c:if test="${sessionScope.id == dsBoard.WRITER}">
						<button id="buttons" data-oper='modify' class="btn btn-dark" onclick="location.href='/comm/boardRegisterU.jsp'">수정</button>
					</c:if>	
					<button id="buttons" data-oper='list' class="btn btn-secondary" onclick="location.href='/comm/boardListR.jsp'">목록</button>
					
					<form id="operForm" action="/comm/boardRegisterU" method="get">
						<input type="hidden" name="bno" value='<c:out value="${dsBoard.BNO}"/>'>
<%-- 						<input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum}"/>'> --%>
<%-- 						<input type="hidden" name="amount" value='<c:out value="${cri.amount}"/>'> --%>
<%-- 						<input type="hidden" name="keyword" value='<c:out value="${cri.keyword}"/>'> --%>
<%-- 						<input type="hidden" name="type" value='<c:out value="${cri.type}"/>'> --%>
					</form>			
                </div>
                <!-- end /.panel-body -->
            </div>
            <!-- end /.panel -->
        </div>
        <!-- /.col-lg-6 -->
    </div>
    <!-- /.row -->
</div>

<!-- 댓글 시작  -->
<div class="container">
		<div class="row" style="margin-top:40px; margin-bottom: 50px;">
			<div class="col-md-12">
		    	<div class="well well-sm">
		            <div class="text-right">
		                <a class="btn btn-danger btn-lg" href="#reviews-anchor" id="open-review-box"><b>댓글입력</b></a>
		            </div>

		            <div class="row" id="post-review-box" style="display:none;">
		                <div class="col-md-12">
		                    <form id="createReply" accept-charset="UTF-8" action="${context}/work/comm/reply/createReply.do" method="post">
		                        <textarea class="form-control animated" cols="50" id="userReply" name="userReply" placeholder="댓글을 입력하세요..." rows="5"></textarea>

		                        <div class="text-right">
		                            <a class="btn btn-danger btn-sm" href="#" id="close-review-box" style="display:none; margin-right: 10px;">
		                            <span class="glyphicon glyphicon-remove"></span>Cancel</a>
		                            <button class="btn btn-success btn-lg" onclick="return fn_save()">Save</button>
		                        </div>
		                    </form>
		                </div>
		            </div>
		        </div>
			</div>
		</div>
	</div>
	

	
<div class="container">
		<div class="row">
			<div class="col-md-12 toppad">
				<div class="panel panel-info">
					<div class="panel-heading">
						<h1 class="panel-title">댓글  ${dsReplyList[0].REPLY_COUNT}</h1>
					</div>
					<c:forEach items="${dsReplyList}" var="dsReplyList">
					<div class="panel-body">
						<div class="row">
							<div class="col-md-9">
								<table class="table table-user-information">
									<tbody>
										<tr>
											<td><b>${dsReplyList.USER_ID}</b>&nbsp;&nbsp;<font size="1px;" color="gray">${dsReplyList.REPLY_DATE}</font>&nbsp;&nbsp;&nbsp;
											</td>
										</tr>
										<tr>
											<td>${dsReplyList.USER_REPLY}</td>
										</tr>
                 				   </tbody>
                  			  </table>
               			  </div>
             		 </div>
           		 </div>
				<div class="panel-footer">
					<c:if test="${sessionScope.userCode == dsReplyList.USER_CODE}">
	                    <span class="pull-right">
	                        <a data-original-title="Remove this user" data-toggle="tooltip" type="button" class="btn btn-sm btn-danger" onclick="javascript:fn_remove('${dsReplyList.USER_REPLY_NO}')"><i class="glyphicon glyphicon-remove"></i></a>
                  	  </span>
                    </c:if>
                    <br><br>
                </div>
			</c:forEach>
          </div>
        </div>
      </div>
      <button class="btn btn-success btn-lg" style="float: right;" onclick="fn_back()">뒤로가기</button>
    </div>




<script type="text/javascript">
	$(document).ready(function () {
		var operForm = $("#operForm");
		
		$("button[data-oper='modify']").on("click", function (e) {
			operForm.attr("action", "${context}/work/comm/updateBoard.do?bno=${dsBoard.BNO}").submit();
		});
		
		
		// [] 는 속성
		$("button[data-oper='list']").on("click", function (e) {
			// 사용자가 수정 버튼을 누르는 경우에는 bno 값을 같이 전달하고,
			// <form> 태그를 submit 시켜서 처리합니다.
			// 만일 사용자가 list로 이동하는 경우에는 아직 아무런 데이터도 필요하지 않으므로
			// <form> 태그 내의 bno 태그를 지우고 submit() 메서드를 통해서
			// 리스트 페이지로 이동합니다.
			operForm.find("#bno").remove();
			operForm.attr("action", "${context}/work/comm/retrieveBoardList.do")
			operForm.submit();
		});
	});	
</script>	
<jsp:include page="../common/foot.jsp"></jsp:include>
</body>
</html>