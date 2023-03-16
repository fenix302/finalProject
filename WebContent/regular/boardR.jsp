<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var ="context"><%=request.getContextPath()%></c:set>
<!DOCTYPE html>
<html>
<head>
		<meta name="description" content="boardR.jsp">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>공지사항 게시물</title>
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
			location.href = "${context}/work/notice/deleteBoard.do?boardNo=" + boardNo;
		}
	}

	//글 수정
	function fn_update(){
		var boardNo = '${dsBoard.BOARD_NO}';

		location.href = "${context}/work/notice/updateBoard.do?boardNo=" + boardNo;
	}

	//목록으로
	function fn_moveToBoard(){
		location.href = "${context}/work/notice/retrieveBoardList.do";
	}
</script>
<style type="text/css">
li{
	cursor: default !important;
}
</style>
</head>
<body>
<jsp:include page="../common/top.jsp"></jsp:include>
<div class="container" style="margin-top: 2%; margin-bottom: 10%;">
    <div class="row">
        <div class="page_header">
            <h1 class="comeText">공지사항</h1>
        </div>
        <!-- /.col-lg-12 -->
    </div>
    <!-- /.row -->
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-body">
					
					<div class="form-group">
						<label>글 번호</label> <input class="form-control" name="bno" value='<c:out value="${dsBoard.BNO}" />' readonly="readonly">
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
						<c:if test="${sessionScope.id != null && sessionScope.grade == 'A'}">
							<button data-oper='modify' class="btn modifyBtn" onclick="location.href='/notice/boardRegisterU.jsp'">수정</button>	
						</c:if>
							<button data-oper='list' class="btn listBtn" onclick="location.href='/notice/boardListR.jsp'">목록</button>
					<form id="operForm" action="/notice/boardRegisterU" method="get">
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
<script type="text/javascript">
	$(document).ready(function () {
		var operForm = $("#operForm");
		
		$("button[data-oper='modify']").on("click", function (e) {
			operForm.attr("action", "${context}/work/notice/updateBoard.do?bno=${dsBoard.BNO}").submit();
		});
		
		
		// [] 는 속성
		$("button[data-oper='list']").on("click", function (e) {
			// 사용자가 수정 버튼을 누르는 경우에는 bno 값을 같이 전달하고,
			// <form> 태그를 submit 시켜서 처리합니다.
			// 만일 사용자가 list로 이동하는 경우에는 아직 아무런 데이터도 필요하지 않으므로
			// <form> 태그 내의 bno 태그를 지우고 submit() 메서드를 통해서
			// 리스트 페이지로 이동합니다.
			operForm.find("#bno").remove();
			operForm.attr("action", "${context}/work/notice/retrieveBoardList.do")
			operForm.submit();
		});
	});	
</script>	
<jsp:include page="../common/foot.jsp"></jsp:include>
</body>
</html>