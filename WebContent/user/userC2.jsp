<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var ="context"><%=request.getContextPath()%></c:set>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="description" content="userC.jsp">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>회원가입</title>
   	<link href="${context}/css/bootstrap.css" rel="stylesheet">
	<link href="${context}/css/bootstrap-theme.css" rel="stylesheet">
	<link href="${context}/css/plugins/metisMenu/metisMenu.min.css" rel="stylesheet">
	<link href="${context}/css/plugins/social-buttons.css" rel="stylesheet">
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

	var imageFolder;

	$(document).ready(function(){
// 		$('#dataTables-example').dataTable();
		fn_init();

		imageFolder = "userImg";

		$( "#birth" ).datepicker({
	    	dateFormat: 'yy-mm-dd',
	    	changeMonth: true,
	        changeYear: true,
	        yearRange: "1980:2015"
	    });
	});
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postNum1').value = data.zonecode;
                document.getElementById("postNum2").value = roadAddr;
                document.getElementById("postNum3").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("address1").value = extraRoadAddr;
                } else {
                    document.getElementById("address1").value = '';
                }
            }
    	}).open();
    }	

	function fn_save(){
		if(!fn_validation()) return;
		if($("#flag").val() == "false"){
			alert("이미 사용중인 ID입니다");
			$("id").focus();
			return;
		}


		$("#phoneNum").val($("#phone1").val() + "-" + $("#phone2").val());
 		$("#postNum").val($("#postNum1").val());
 		$("#address").val($("#postNum2").val() + "/" + $("#postNum3").val() + "/" + $("#address1").val());

 		$("#joinFrm").submit();
	}

	function idCheck(){
		var id = $("#id").val();
		var access = $("#message");
		$.ajax({
			url:"${context}/work/user/idCheck.do?id=" + id,
			success:function(result){
				result2 = result.replace(/"/gi, "");
				var splResult = result2.split("@");
				access.html(splResult[0]);
				$("#flag").val(splResult[1]);
			}
		});
	}

// 	function fn_upload(){
// 		$("#ajaxform").ajaxSubmit({
// 	        type: "POST",
// 	        dataType: 'text',
// 	        url: $("#ajaxform").attr("action"),
// 	        data: $("#ajaxform").serialize(),
// 	        success: function (data) {
// 	        	data2 = data.replace(/"/gi, "");
// 	        	var imageUrl = "${context}/userImg/" + data2;
// 	        	$("#pic").attr("src", imageUrl);
// 	        	$("#userImage").val(data2);
// 	        },
// 	        error: function (xhr, status, error) {
// 	            alert(error);
// 	        }
// 	    });
// 	}

</script>
</head>
<body>

	<!-- 헤더 -->
	<jsp:include page="../common/top.jsp"></jsp:include>
	
	
	<!-- 페이지 헤더 -->
	
	<div class="page_header">
		 <div class="userC_header">
		       <div class="name">
		             <p class="comeText">회원가입</p>
		        </div>
		  </div>
	</div>
	
	
<!-- 수정용 -->
	<div id="wrap">
         <div id="container">
         
				 <!-- 메인 -->
	            
	       <div id="main">
	            
		       <form id="joinFrm" method="post" action="${context}/work/user/createUser.do" role="form" >
  				<!-- 아이디 -->	            
	                <div class="q1 form-group">
	                	<label  for="id" class="control-label"><b id="naming">아이디</b></label>
	                    <div class="box">
	                        <input class="form-control" type="text" name="id" id="id" required="required" autofocus="autofocus" autocomplete="off" placeholder="8~16자리로 입력하세요." onkeyup="idCheck();"/>	    
	                    </div>
	                    <p id="message"></p>
	                </div>	                    
	                    
		        <!-- 비밀번호 -->
	                <div class="q1 form-group">	
						<label for="pw" class="control-label"><b id="naming">비밀번호</b></label>	            
	                    <div class="box">
	                        <input class="form-control" type="password" name="pw" id="pw" required="required" placeholder="8자리 이상 입력해주세요."/>
	                    </div>
	                </div>
	                
	
	            <!-- 이메일 --> 
	                <div class="q1 form-group">
						<label for="email" class="control-label"><b id="naming">이메일</b></label>	                	
	                    <div class="box">
	                        <input class="form-control" type="email" name="email" id="email" required="required" autocomplete="on" placeholder="이메일을 입력해주세요."/>
	                    </div>
	                </div>
	                	             
	                    
	                    	                                  
	           <!-- 이름 -->  
	                <div class="q1 form-group">	 
						<label for="name" class="control-label"><b id="naming">성명</b></label>	                
	                    <div class="box">
	                        <input class="form-control" type="text" id="name" name="name" autofocus="autofocus" required="required" autocomplete="off"/>
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
							<input class="form-control" type="text" id="phone1" maxlength="4" required="required" onkeydown="return fn_showKeyCode(event)"  placeholder="3-4자리"/>
						</div>	                        
	                  
	                        -
	                    <!-- 뒷자리 -->	                        
						<div class="box_tel">
							<label></label>
							<input class="form-control" type="text" id="phone2" maxlength="4" required="required" onkeydown="return fn_showKeyCode(event)"  placeholder="4자리"/>
						</div>		                        
						<input type="hidden" id="phoneNum" name="phoneNum">
	                </div>	
	                	             	
	         <label></label> 
	         
	                <!-- 주소 -->  	
	                <div class="q1 form-group">	                
<!-- 	                	<div id="nameTag"></div> -->
												
	                    <!-- 우편번호 -->							                
	                    <div class="form-group box2">
							<label for="postnum1" class="control-label"><b id="naming">주소</b></label>              
		                    <p id="nameTag"></p>
		                    <div class="find_add">
		                        <input class="form-control" type="text" id="postNum1" placeholder="우편번호" disabled="disabled">
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
		                       <input class="form-control" type="text" id="postNum2" placeholder="도로명주소" disabled="disabled"/>
		                    </div>
		                       <!--  <input type="hidden" id="postNum" name="postNum"> -->
	                    </div>
	                    
	                    <!-- 지번주소 -->	                    
	                    <div class="form-group box2">
	                   		<label for="postnum3" class="control-label add_label"></label>
		                    <div>
		                       <input class="form-control" type="text" id="postNum3" placeholder="지번주소" disabled="disabled"/>
		                    </div>
	                    </div>

	                    <!-- 상세 주소 -->	                    
	                    <div class="form-group box2">
	                    	<label for="address1" class="control-label col-md-3"></label>
		                    <div>
								<input class="form-control" type="text" id="address1" placeholder="상세주소"/>
		                    </div>
		                    <input type="hidden" id="address" name="address">
	                    </div>	                    	                    
	                    		
	                </div>
	                
	                <!-- 버튼 --> 	
	                <div class="q1 form-group">           
	                	<div class="btn_box">
							<button type="button" class="btn user-back-btn" onclick="fn_back()"> <p class="btn_text"> 뒤로가기 </p> </button>
			                <button class="btn user-submit-btn " type="button" name="btnSubmit" id="btnSubmit" onclick="fn_save()"> <p class="btn_text"> 가입하기 </p> </button>
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