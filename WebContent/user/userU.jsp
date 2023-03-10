<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var ="context"><%=request.getContextPath()%></c:set>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="description" content="userU.jsp">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>JEWELL-정보수정</title>
   	<link href="${context}/css/bootstrap.css" rel="stylesheet">
	<link href="${context}/css/bootstrap-theme.css" rel="stylesheet">
	<link href="${context}/css/plugins/metisMenu/metisMenu.min.css" rel="stylesheet">
	<link href="${context}/css/plugins/social-buttons.css" rel="stylesheet">
	<link href="${context}/font-awesome-4.4.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	<link href="//code.jquery.com/ui/1.11.3/themes/smoothness/jquery-ui.css" rel="stylesheet" >
	<link href="${context}/css/plugins/dataTables.bootstrap.css" rel="stylesheet">
    <link href="${context}/css/process.css" rel="stylesheet">
    <link href="${context}/css/userC.css" rel="stylesheet">

	<script src="${context}/js/jquery-1.9.1.js"></script>
    <script src="//code.jquery.com/ui/1.11.3/jquery-ui.js"></script>
	<script src="${context}/js/jquery.form.js"></script>
    <script src="${context}/js/plugins/metisMenu/metisMenu.min.js"></script>

	<script src="${context}/js/plugins/dataTables/jquery.dataTables.js"></script>
    <script src="${context}/js/plugins/dataTables/dataTables.bootstrap.js"></script>

	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<%-- 	<script src="${context}/js/bootstrap.bundle.js"></script> --%>
	<script type="text/javascript">

	$(document).ready(function(){
		fn_init();

		$( "#birth" ).datepicker({
	    	dateFormat: 'yy-mm-dd',
	    	changeMonth: true,
	        changeYear: true,
	        yearRange: "1980:2015"
	    });

		//U페이지 해당
		fn_setDetailInfo();
	});

	// 행정안전부 도로명 주소 API 적용 시작!!!
	<%-- 주소검색 팝업을 호출합니다 --%>
	function fn_openAddressPopup() {
		var url = "/user/addressAPIPopup.jsp";
		var name = "AddressPopup";
		var option = "width=650, height=500, top=100, left=200, location=no"
		window.open(url, name, option);
	}
	<%-- 주소검색 팝업 호출 콜백 callback_openAddressPopup() 메서드 입니다  --%>
	function callback_openAddressPopup(aParam) {
		document.getElementById("zipNo").value = aParam["zipNo"];
		document.getElementById("mainAddress").value = aParam["roadAddr"];
	}
	
	
	
	function fn_setDetailInfo(){
		$("#id").val('${dsUser.id}');
		$("#pw").val('${dsUser.pw}');
		$("#email").val('${dsUser.email}');

		$("#name").val('${dsUser.name}');
		$("#birth").val('${dsUser.birth}');

		var phoneArr = '${dsUser.phoneNum}'.split("-");
		var postNumArr = '${dsUser.postNum}';
		var addressArr = '${dsUser.address}'.split("/");

		var userImage = '${dsUser.userImage}';
		userImage = userImage.replace(/"/gi, "");

		$("#phone1").val(phoneArr[0]);
		$("#phone2").val(phoneArr[1]);

		$("#phoneCd").val('${dsUser.phoneCd}');

		$("#zipNo").val(postNumArr);
		
		$("#mainAddress").val(addressArr[0]);
		$("#subAddress").val(addressArr[1]);
		
		$("#pic").attr("src", '${context}/userImg/' + userImage);
		$("#userImage").val(userImage);

	}

	function fn_save(){
		if(!fn_validation()) return;

		if(confirm("수정하시겠습니까?")){
			$("#phoneNum").val($("#phone1").val() + "-" + $("#phone2").val());
	 		$("#postNum").val($("#zipNo").val());
	 		$("#address").val($("#mainAddress").val() + "/" + $("#subAddress").val());

	 		$("#joinFrm").submit();
		}
	}

	function fn_upload(){
		$("#ajaxform").ajaxSubmit({
	        type: "POST",
	        dataType: 'text',
	        url: $("#ajaxform").attr("action"),
	        data: $("#ajaxform").serialize(),
	        success: function (data) {
	        	data2 = data.replace(/"/gi, "");
	        	var imageUrl = "${context}/userImg/" + data2;
	        	$("#pic").attr("src", imageUrl);
	        	$("#userImage").val(data2);
	        },
	        error: function (xhr, status, error) {
	            alert(error);
	        }
	    });
	}

</script>
</head>

<body>
	<!-- 헤더 -->
	<jsp:include page="../common/top.jsp"></jsp:include>
	
	
	<!-- 페이지 헤더 -->
	
	<div class="page_header">
		 <div class="userC_header">
		       <div class="name">
		             <p class="comeText">정보수정</p>
		        </div>
		  </div>
	</div>
		
<!-- 	<div id="jumbotron" class="container">
		<div class="user-main">
			<h1><font color="black"><strong>정보 수정</strong></font></h1>
		</div>
	</div> -->
	
<!-- 수정용 -->
	<div id="wrap">
         <div id="container">
         
				 <!-- 메인 -->
	            
	       <div id="main">
	            
				<form id="joinFrm" method="post" action="${context}/work/user/updateUser.do" role="form">
  				
  				<!-- 아이디 -->	            
	                <div class="q1 form-group">
	                	<label  for="id" class="control-label"><b id="naming">아이디</b></label>
	                    <div class="box">
	                        <input class="form-control" type="text" name="id" id="id" required="required" disabled="disabled" autofocus="autofocus" onkeyup="idCheck();"/>	    
	                    </div>
	                    <p id="message"></p>
	                </div>	                    
	                    
		        <!-- 비밀번호 -->
	                <div class="q1 form-group">	
						<label for="pw" class="control-label"><b id="naming">비밀번호</b></label>	            
	                    <div class="box">
	                        <input class="form-control" type="password" name="pw" id="pw" required="required" disabled="disabled"/>
	                    </div>
	                </div>
	                
	
	            <!-- 이메일 --> 
	                <div class="q1 form-group">
						<label for="email" class="control-label"><b id="naming">이메일</b></label>	                	
	                    <div class="box">
	                        <input class="form-control" type="email" name="email" id="email" required="required"/>
	                    </div>
	                </div>
	                	             
	                    
	                    	                                  
	           <!-- 이름 -->  
	                <div class="q1 form-group">	 
						<label for="name" class="control-label"><b id="naming">성명</b></label>	                
	                    <div class="box">
	                        <input class="form-control" type="text" id="name" name="name" autofocus="autofocus" required="required"/>
	                    </div>
	                </div>		    
	                            
	                    
	           <!-- 생년월일 -->
	                <div class="q1 form-group">
						<label for="birth" class="control-label"><b id="naming">생년월일</b></label>	                	 
	                    <div class="box">
	                        <input class="form-control" type="text" id="birth" name="birth" required="required" maxlength="10"/>
	                    </div>
	                </div>	             	                    
	                 
	
	           <!-- 전화번호 -->
	                <div class="q1 form-group">
						<label for="phoneCd" class="control-label"><b id="naming">연락처</b></label>	                
	                	<p id="nameTag"></p>
	                    <div class="box_tel">
	                        <select class="form-control" id="phoneCd" name="phoneCd">
								<c:forEach items="${dsCode1}" var="code1">
									<option value="${code1.commCd}">${code1.commCdNm}</option>
								</c:forEach	>                        
	                        </select>	                          
						</div>
	                        -
	                    <!-- 앞자리 -->
						<div class="box_tel">
							<label></label>
							<input class="form-control" type="text" id="phone1" maxlength="4" required="required" onkeydown="return fn_showKeyCode(event)"/>
						</div>	                        
	                  
	                        -
	                    <!-- 뒷자리 -->	                        
						<div class="box_tel">
							<label></label>
							<input class="form-control" type="text" id="phone2" maxlength="4" required="required" onkeydown="return fn_showKeyCode(event)"/>
						</div>		                        
						<input type="hidden" id="phoneNum" name="phoneNum">
	                </div>	
	                	             	
	         
	                <!-- 주소 -->  	
	                <div class="q1 form-group">	                
<!-- 	                	<div id="nameTag"></div> -->
												
	                    <!-- 우편번호 -->							                
	                    <div class="form-group box2">
							<label for="postnum1" class="control-label"><b id="naming">주소</b></label>              
		                    <p id="nameTag"></p>
		                    <div class="find_add">
		                        <input class="form-control" type="text" id="zipNo" placeholder="우편번호" disabled="disabled">
		                    </div>
		                    
		                    <!-- 우편번호 찾기 -->
		                    <div class="find_btn2">
		                    	<label class="control-label"><b></b></label>
		                    	<div class="find_btn2">
			                        <input type="button" class="btn user-post-btn find_btn" onclick="sample4_execDaumPostcode()" value="우편번호 찾기">
		                    	</div>	
			                    <input type="hidden" id="postNum" name="postNum"> 
		                    </div>
	                    </div>
	                    
	                    
	                    
	                    <!-- 도로명주소 -->
	                    <div class="form-group box2">
							<label for="postnum2" class="control-label add_label"></label>	                    
		                    <div>
		                       <input class="form-control" type="text" id="mainAddress" placeholder="도로명주소" disabled="disabled"/>
		                    </div>
		                       <!--  <input type="hidden" id="postNum" name="postNum"> -->
	                    </div>
	                    
	                    <!-- 상세 주소 -->	                    
	                    <div class="form-group box2">
	                    	<label for="address1" class="control-label col-md-3"></label>
		                    <div>
								<input class="form-control" type="text" id="subAddress" placeholder="상세주소"/>
		                    </div>
		                    <input type="hidden" id="address" name="address">
	                    </div>	                    	                    
	                    		
	                </div>
	                
	                <!-- 버튼 --> 	
	                <div class="q1 form-group">
	                	<label class="col-md-2"></label>           
	                	<div class="btn_box">
							<button type="button" class="btn user-back-btn" onclick="fn_back()"> <p class="btn_text"> 뒤로가기 </p> </button>
			                <button class="btn user-submit-btn " type="button" name="btnSubmit" id="btnSubmit" onclick="fn_save()"> <p class="btn_text"> 수정완료 </p> </button>
	                	</div>       
	                </div>				
	        

				</form>
        	 </div>
        </div>
            
    </div>
				
			

<!-- 푸터 -->
	<jsp:include page="../common/foot.jsp"></jsp:include>
</body>
</html>