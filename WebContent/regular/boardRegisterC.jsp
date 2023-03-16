<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var ="context"><%=request.getContextPath()%></c:set>
<!DOCTYPE html>
<html>
<head>
	<meta name="description" content="boardRegisterC.jsp">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>공지사항 새 글 쓰기</title>
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
		fn_init();

	});

	function fn_save(){
		if(!fn_validation()){
			return;
		}else{
// 			var boardContents = String($("#boardContents").val());

// 			boardContents = boardContents.replace(/\n/gi, "<br/>");

// 			$("#boardContents").val(boardContents);

	 		$("#createBoard").submit();
		}
	}

</script>
<style type="text/css">
</style>
</head>
<body>
<jsp:include page="../common/top.jsp"></jsp:include>

<!-- 페이지 헤더 -->

	<div class="container" style="margin-top: 2%; margin-bottom: 10%;">
		<div class="page_header">
			<h1 class="comeText">새 글 쓰기</h1>
	</div>
	
	
			<form id="createBoard" method="post" action="/work/notice/createBoard.do" role="form">
				<div class="form-horizontal">
					<div class="form-group">
						<label for="boardTitle" class="control-label col-md-1"><b>제목</b></label>
						<div class="col-md-11">
							<input class="form-control" type="text" name="title" id="title" required="required" maxlength="50" autofocus="autofocus" placeholder="제목을 입력해주세요"/>
						</div>
					</div>
					
					<div class="form-group">
						<label for="boardWriter" class="control-label col-md-1"><b>작성자</b></label>
						<div class="col-md-11">
							<input class="form-control" type="text" name="writer" id="writer" required="required" maxlength="50" disabled="disabled" value="관리자"/>
						</div>
					</div>
		
					<div class="form-group">
						<label for="boardContents" class="control-label col-md-1"><b>내용</b></label>
						<div class="col-md-11">
							<textarea class="form-control" name="content" id="content" cols="10" rows="15" required="required" placeholder="내용을 입력해주세요"></textarea>
					</div>				
				</div>
				
				<div class="form-group">
					<div class="col-md-4">
						<button type="button" class="btn resetBtn" onclick="fn_back()">취소</button>
						<button class="btn regBtn" type="button" name="btnSubmit" id="btnSubmit" onclick="fn_save()">등록하기</button>
					</div>
				</div>
				
			</div>
		</form>
	</div>
	
	<jsp:include page="../common/foot.jsp"></jsp:include>
</body>
</html>