<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var ="context"><%=request.getContextPath()%></c:set>
<!DOCTYPE html>
<html>
<head>
    <meta name="description" content="login.jsp">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="author" content="">

    <title>JEWELL 로그인</title>

    <link href="${context}/css/bootstrap.css" rel="stylesheet">
    <link href="${context}/css/plugins/metisMenu/metisMenu.min.css" rel="stylesheet">
    <link href="${context}/css/sb-admin-2.css" rel="stylesheet">
    <link href="${context}/font-awesome-4.4.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="${context}/css/user.css" rel="stylesheet">
    <link
    href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&family=Noto+Serif+KR:wght@200&display=swap"
    rel="stylesheet"
 />
    

    <!-- jQuery -->
    <script src="${context}/js/jquery-1.9.1.js"></script>

    <!-- Bootstrap Core JavaScript -->
<%--     <script src="${context}/js/bootstrap.bundle.js"></script> --%>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="${context}/js/plugins/metisMenu/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="${context}/js/sb-admin-2.js"></script>
    
    <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
    
	<script type="text/javascript">
		$(document).ready(function(){
			$("#pw").keydown(function (key){
				if(key.keyCode == 13){
					ajaxLoginCheck();
				}

			});
		});

		function ajaxLoginCheck(){
			var id = $("#id").val();
			var pw = $("#pw").val();
			
			var param = {};

			param["id"] = id;
			param["pw"] = pw;
			param["name"] = name;
	
			
			$.ajax({
				url:"${context}/work/user/ajaxLoginCheck.do",
				contentType:"application/json",
				dataType:"json",
				data:param,
				success:function(result){
					if(result['loginYn'] == 'success'){
						alert("로그인에 성공하였습니다.");
						$("#loginFrm").submit();
					}else{
						alert('로그인에 실패하셨습니다.');
						$("#id").val('');
						$("#pw").val('');
					}
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
	 <div class="login_header">
	       <div class="name">
	             <p class="comeText">로그인</p>
	        </div>
	  </div>
</div>

<!-- 	<div id="jumbotron" class="container">
		<div class="user-main">
			<h2><font color="black"><strong>로그인</strong></font></h2>
		</div> -->
		
<!-- 	</div> -->

<!-- 본문 -->	
    <div class="container">
        <div class="row">
            <div class="col-md-4 offset-md-4">
                <div class="login-panel"  style="margin-bottom: 150px;">

                    <form action="${context}/work/user/login.do" method="post" role="form" id="loginFrm">
                		<fieldset>
	                        <div class="form-group mb-4">
	                            <input class="form-control" placeholder="아이디" id="id" name="id" type="text" autofocus>
	                        </div>
	                        <div class="form-group mb-4">
	                            <input class="form-control" placeholder="비밀번호" id="pw" name="pw" type="password">
	                        </div>
	                        <!-- Change this to a button or input when using this as a form -->
	                        <div class="form-group d-grid gap-2 mt-4">
	                            <button type="button" class="btn btn-lg user-login-btn btn-block" onclick="ajaxLoginCheck();"><strong>Login</strong></button>
	                            
	                            
	                            <ul class="btn btn-lg btn-block user-kakao-btn">
						           <li onclick="kakaoLogin();">
						               <a href="javascript:void(0)">
						               		<button type="button" class="btn btn-lg btn-block kakao-btn" ><strong>카카오로그인</strong></button>
								           <!-- <img alt="카카오로그인" src="/userImg/kakao_login.png" style="width: 100%;"> -->
								       </a>
								    </li>
						        </ul>
							</div>
							
	                        <div class="form-group user-find">
	                            <span><a href="${context}/user/idFind.jsp">아이디 찾기</a>&nbsp;&nbsp;|&nbsp;&nbsp; <a href="pwFind.jsp">비밀번호 찾기</a></span> 
	                            <span>&nbsp;&nbsp;|&nbsp;&nbsp; <a href="${context}/work/user/createUser.do">회원가입</a></span><br>
	                        </div>
                    	</fieldset>
                    </form>
                </div>
            </div>
        </div>
    </div>
	<jsp:include page="../common/foot.jsp"></jsp:include>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script>
Kakao.init('66ca82d13bdbacc72649b8f16cf511ed'); //발급받은 키 중 javascript키를 사용해준다.
console.log(Kakao.isInitialized()); // sdk초기화여부판단
//카카오로그인
function kakaoLogin() {
    Kakao.Auth.login({
      success: function (response) {
        Kakao.API.request({
          url: '/v2/user/me',
          success: function (response) {
        	  console.log(response)
          },
          fail: function (error) {
            console.log(error)
          },
        })
      },
      fail: function (error) {
        console.log(error)
      },
    })
  }
</script>
</body>
</html>
