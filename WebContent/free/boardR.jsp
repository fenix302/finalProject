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
	<title>자유 게시판</title>
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
    
        <script src="//code.jquery.com/ui/1.11.3/jquery-ui.js"></script>
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
			location.href = "${context}/work/free/deleteBoard.do?boardNo=" + boardNo;
		}
	}

	//글 수정
	function fn_update(){
		var boardNo = '${dsBoard.BOARD_NO}';

		location.href = "${context}/work/free/updateBoard.do?boardNo=" + boardNo;
	}

	//목록으로
	function fn_moveToBoard(){
		location.href = "${context}/work/free/retrieveBoardList.do";
	}
	
	
	/* 댓글 관련 스크립트 */
    
    function fn_save(){
		if($("#REPLY").val() == ''){
			alert("댓글을 입력하세요.");
			return false;
		}
		$("#createReply").submit();
	}

	function fn_remove(paramRno){
		var rno = paramRno;
		var bno = '${dsBoard.BNO}';
		
		if(confirm("정말 삭제하시겠습니까?")){
			location.href = "${context}/work/free/reply/deleteReply.do?RNO=" + rno + "&BNO=" + bno;
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
	             <p class="comeText">자유 게시판</p>
	        </div>
	  </div>
</div>

<div class="container" style="margin-top: 2%;">
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
					<c:if test="${sessionScope.id == dsBoard.WRITER || sessionScope.grade == 'A'}">
						<button id="buttons" data-oper='modify' class="btn btn-dark pull-right" onclick="location.href='/free/boardRegisterU.jsp'">수정</button>
					</c:if>	
					<button id="buttons" data-oper='list' class="btn btn-secondary pull-right" onclick="location.href='/free/boardListR.jsp'">목록</button>
					
					<form id="operForm" action="/free/boardRegisterU" method="get">
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
		<div class="row">
			<div class="col-md-12 toppad">
				<div class="panel panel-info">
					<div class="panel-heading">
						<h2 class="panel-title" style="margin-top: 5%;">댓글  ${dsReplyList[0].REPLY_COUNT}</h2>
					</div>
					<c:forEach items="${dsReplyList}" var="dsReplyList">
					<div class="panel-body">
						<div class="row">
							<div class="col-md-11">
								<table class="table table-user-information">
									<tbody>
										<tr>
											<td><b>작성자&nbsp; |&nbsp; ${dsReplyList.USER_ID}</b>&nbsp;&nbsp;<font size="1px;" color="gray" style="float: right;">${dsReplyList.REPLYDATE}</font>&nbsp;&nbsp;&nbsp;
											</td>
										</tr>
										<tr>
											<td>내용 &nbsp;&nbsp;&nbsp; |&nbsp; ${dsReplyList.REPLY}</td>
										</tr>
                 				   </tbody>
                  			  </table>
               			  </div>
						  <c:if test="${sessionScope.userCode == dsReplyList.USER_CODE || sessionScope.grade == 'A'}">
	   	                      <span class="col-md-1">
		                          <button id="buttons" class="btn btn-secondary reBtn pull-right" onclick="javascript:fn_remove('${dsReplyList.RNO}')">삭제</button>
		                  	  </span>
	                      </c:if>
             		 </div>
           		 </div>
			</c:forEach>
          </div>
        </div>
      </div>
      
    </div>
    
<div class="container">
		<div class="row" style="margin-top:40px; margin-bottom: 50px;">
<c:if test="${sessionScope.id != null}">    
			<div class="col-md-12">
		    	<div class="well well-sm">
		            <div class="row" >
		                <div class="col-md-12">
		                    <form id="createReply" accept-charset="UTF-8" action="${context}/work/free/reply/createReply.do" method="post">
		                        <textarea class="form-control animated" cols="50" id="REPLY" name="REPLY" placeholder="댓글을 입력하세요..." rows="5"></textarea>

		                        <div class="text-right">
		                            <a class="btn btn-danger btn-sm" href="#" id="close-review-box" style="display:none; margin-right: 10px;"></a>
		                            <button id="buttons" class="btn btn-secondary pull-right" onclick="return fn_save()">등록</button>
		                        </div>
		                        <input type="hidden" id="BNO" name="BNO" value="${dsBoard.BNO}">
		                    </form>
		                </div>
		            </div>
		        </div>
			</div>
</c:if>
		</div>
	</div>

	





<script type="text/javascript">
	$(document).ready(function () {
		var operForm = $("#operForm");
		
		$("button[data-oper='modify']").on("click", function (e) {
			operForm.attr("action", "${context}/work/free/updateBoard.do?bno=${dsBoard.BNO}").submit();
		});
		
		
		// [] 는 속성
		$("button[data-oper='list']").on("click", function (e) {
			// 사용자가 수정 버튼을 누르는 경우에는 bno 값을 같이 전달하고,
			// <form> 태그를 submit 시켜서 처리합니다.
			// 만일 사용자가 list로 이동하는 경우에는 아직 아무런 데이터도 필요하지 않으므로
			// <form> 태그 내의 bno 태그를 지우고 submit() 메서드를 통해서
			// 리스트 페이지로 이동합니다.
			operForm.find("#bno").remove();
			operForm.attr("action", "${context}/work/free/retrieveBoardList.do")
			operForm.submit();
		});
	});	
</script>	
<jsp:include page="../common/foot.jsp"></jsp:include>
</body>
</html>