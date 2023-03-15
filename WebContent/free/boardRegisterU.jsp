<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var ="context"><%=request.getContextPath()%></c:set>
<!DOCTYPE html>
<html>
<head>
		<meta name="description" content="boardRegisterU.jsp">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>자유게시판 수정</title>
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
<!-- 	<script src="../js/bootstrap.bundle.js"></script> -->

    <script src="${context}/js/plugins/metisMenu/metisMenu.min.js"></script>

<%--     <script src="${context}/js/plugins/dataTables/jquery.dataTables.js"></script> --%>
    <script src="${context}/js/plugins/dataTables/datatables.js"></script>

    <script src="${context}/js/sb-admin-2.js"></script>
	<script type="text/javascript">

	$(document).ready(function(){
		fn_init();

		//U페이지 해당
		fn_setDetailInfo();
	});

	function fn_setDetailInfo(){
		$("#boardTitle").val('${dsBoard.BOARD_TITLE}');
		$("#boardNo").val('${dsBoard.BOARD_NO}');

		var boardContents = '${dsBoard.BOARD_CONTENTS}';

		boardContents = boardContents.replace(/<br ?\/?>/gi, "\n");

		$("#boardContents").val(boardContents);
	}

	function fn_save(){
		if(!fn_validation()){
			return;
		}else{
			var boardContents = String($("#boardContents").val());

			boardContents = boardContents.replace(/\n/gi, "<br/>");

			$("#boardContents").val(boardContents);

	 		$("#updateBoard").submit();
		}
	}

</script>
<style type="text/css">
</style>
</head>
<body>

<!-- 헤더 -->
<jsp:include page="../common/top.jsp"></jsp:include>

<!-- 페이지 헤더 -->
<div class="page_header">
	 <div class="faq_header">
	       <div class="name">
	             <p class="comeText">자유 게시판 수정/삭제</p>
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
						
					<form role="form" action="/work/free/updateBoard.do" method="post">	
					
<!-- 						Page 319 Criteria cri 처리 추가해줍니다. -->
<%-- 						<input type="hidden" id="pageNum" name="pageNum" value='<c:out value="${cri.pageNum}"/>'> --%>
<%-- 						<input type="hidden" id="amount" name="amount" value='<c:out value="${cri.amount}"/>'> --%>
<%-- 						<input type="hidden" name="keyword" value='<c:out value="${cri.keyword}"/>'> --%>
<%-- 						<input type="hidden" name="type" value='<c:out value="${cri.type}"/>'> --%>
						
						
						<div class="form-group">
							<label>번호</label> <input class="form-control" name="bno" value='<c:out value="${dsBoard.BNO}" />' readonly="readonly">
						</div>
						<div class="form-group">
							<label>제목</label> <input class="form-control" name="title" value='<c:out value="${dsBoard.TITLE}" />'>
						</div>
						<div class="form-group">
							<label>내용</label> 
							<textarea class="form-control" rows="3" name="content"><c:out value="${dsBoard.CONTENT}"/></textarea>
						</div>
						<div class="form-group">
							<label>작성자</label> <input class="form-control" name="writer" value='<c:out value="${dsBoard.WRITER}" />' readonly="readonly">
						</div>
						<div class="form-group">
							<label>등록일자</label> <input class="form-control" name="regdate" value='<fmt:formatDate pattern="yyyy/MM/dd" value="${dsBoard.REGDATE}" />' readonly="readonly">
						</div>

						<button id="buttons" type="submit" data-oper='modify' class="btn btn-dark" onclick="location.href=${context}/work/free/updateBoard.do?bno=${dsBoard.BNO}">수정</button>	
						<button id="buttons" type="submit" data-oper='remove' class="btn btn-danger">삭제</button>
						<button id="buttons" type="submit" data-oper='list' class="btn btn-secondary" onclick="location.href='/free/boardListR.jsp'">목록</button>
						
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
		var formObj = $("form");
		$('button').on("click", function (e) {
			e.preventDefault();
			var operation = $(this).data("oper");
			console.log(operation);
			
			if (operation === 'remove') {
				formObj.attr("action", "/work/free/deleteBoard.do");
				
				// 만약 사용자가 'list' 버튼을 클릭한다면
			} else if (operation === 'list') {
// 				move to list : 아래 두 줄 코딩
				self.location = "${context}/work/free/retrieveBoardList.do";
				return;
				
				// Page266 11.5.4 수정 페이지에서 링크 처리 소스 코딩 : 아래 두 줄
// 				formObj.attr("action", "/comm/boardListR").attr("method", "get");
				
				// <form> 태그에서 필요한 부분만 잠시 복사(clone)해서 보관해 두고,
// 				var pageNumTag = $("input[name='pageNum']").clone();
// 				var amountTag = $("input[name='amount']").clone();
// 				var keywordTag = $("input[name='keyword']").clone();
// 				var typeTag = $("input[name='type']").clone();
				
				// <form> 태그 내의 모든 내용은 지워버립니다(empty).
// 				formObj.empty();
				// 이후에 다시 필요한 태그들만 추가(append)해서 '/board/list'를 호출하는 형태로 구현합니다.
// 				formObj.append(pageNumTag);
// 				formObj.append(amountTag);
// 				formObj.append(keywordTag);
// 				formObj.append(typeTag);
				
			}
			formObj.submit();
		})
	})	
</script>	
<jsp:include page="../common/foot.jsp"></jsp:include>
</body>
</html>