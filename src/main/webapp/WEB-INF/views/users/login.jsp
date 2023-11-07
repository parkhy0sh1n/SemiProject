<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	@import url("https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css");


	     body {
        display: flex;
        justify-content: center;
        align-items: center;
        min-height: 100vh;
    }
    
       a {
	        color: gray; /* 원하는 색상으로 변경하세요 */
	    }

     #window {
        width: 500px;
        height: 650px;
        border: 1px solid black;
        overflow: auto; /* 스크롤이 필요한 경우 스크롤바 표시 */
        display: flex;
        flex-direction: column;
        align-items: center;
    }
        #joinService{
            display: flex;
        }
        .joinServiceTitle {
            margin: auto;
            font-size: 30px;
            margin-top: 20px;
        }
        .backicon{
            margin-top: 40px;
            color: black;
        }
        #hr1{
            margin-top: 30px;
            margin-bottom: 20px;
        }
        
	.wrap1 > ul {
		list-style-type: none;
		display: flex;
		justify-content: center;
		width: 1000px;
		margin: 0 auto;
		font-size: large;
		margin-right: 30px;
	}
	.wrap1 > ul > li {
		width: 200px;
		height: 50px;
		text-align: center;
		line-height: 50px;
	}
	.wrap1 > ul > li > a {
		display: block;
		width: 100%;
		height: 100%;
		text-decoration-line: none;
		color: gray;
		font-weight: bold;
	}
	.wrap1 > ul > li > a:hover {
		border-bottom: 3px solid #A78B6D;
		color: #A78B6D;
	}
        #hr2{
            margin-top: 20px;
        }
        h2{
            display: flex;
            flex-basis: 100%;
            align-items: center;
            font-size: 18px;
            margin: 8px 0px;
        }
        h2::before{
            content: "";
            flex-grow: 1;
            margin: 0px 16px;
            background: rgba(0, 0, 0, 0.35);
            height: 2px;
            font-size: 0px;
            line-height: 0px;
        }
        h2::after{
            content: "";
            flex-grow: 1;
            margin: 0px 16px;
            background: rgba(0, 0, 0, 0.35);
            height: 2px;
            font-size: 0px;
            line-height: 0px;
        }
        ul {
            text-align: center;
            margin-right: 45px;
        }
        li { 
            display: inline-block;
        }
        #naver_logo {
            background-image: url(${contextPath}/resources/images/naver.png);
            
        }
        #kakao_logo {
            background-image: url(${contextPath}/resources/images/ico_kakao.png);
        }
        #kakao_logo:hover {
        	cursor: pointer;
        }
        #google_logo {
            background-image: url(${contextPath}/resources/images/ico_google.png);
        }
        .web_logo {
            width: 50px;
            height: 50px;
            border-radius: 50%;
        }
        #userId {
			margin-bottom: 10px;
        }
        #userPw {
			margin-bottom: 10px;
        }
        
        form {
        	margin-left: 690px;
        }
        
    #frmLogin {
        margin-left: auto;
        margin-right: 0;
    }
    
	.checkbox-container {
	        display: flex;
	        align-items: center;
	        font-size: 13px;
	    }
	    
	.info {
        display: inline-block;
		color: red;   
		 font-size: 13px;    
    }
	
	    .checkbox-container input[type="checkbox"] {
	        margin-right: 5px;
	    }
	
	    .checkbox-container label {
	        width: 100px;
	    }
	    
	.findUser {
        display: flex;
        justify-content: center;
       	font-size: 11px;
    }
    
    #btnLogin {
		background-color: #A78B6D;
		border: 1px solid #A78B6D;
		color: #ffffff;
		width: 500px;
		height: 50px;
		cursor: pointer;
		margin-bottom: 30px;
	}
	
	#gi, #sin {
	padding: 10px;
		background-color: #ffffff;
		border-bottom: 1px solid #d3d3d3;
		cursor: pointer;
		width: 700px;
		height: 70px;
		font-size: 18px;
		font-weight: bold;
	}
	
	#back {
		margin-right: 400px;
	}
    

</style>
<script src="${contextPath}/resources/js/lib/jquery-3.6.4.min.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script>
    window.Kakao.init('6a3b4fdff05200a458ae2c6fed8282da'); //발급받은 키 중 javascript키를 사용해준다.
    function kakaoLogin() {
        window.Kakao.Auth.login({
            scope: 'profile_image, profile_nickname, account_email', //동의항목 페이지에 있는 개인정보 보호 테이블의 활성화된 ID값을 넣습니다.
            success: function(response) {
                window.Kakao.API.request({ // 사용자 정보 가져오기 
                    url: '/v2/user/me',
                    success: (res) => {
                       var id = res.id;
                       var nickname = res.kakao_account.profile.nickname;
                        var email = res.kakao_account.email;
                        
                        console.log(id, nickname, email);
                        
                        sessionStorage.setItem("user_info", id);
                        sessionStorage.setItem("user_nick", nickname);
                        sessionStorage.setItem("user_email", email);
                        sessionStorage.setItem("kinds", "kakao");
                        console.log(res);
                        
                    }
                });
                
                //window.location.href='' //로그인 시키고, 메인페이지넣어주세요! 
            },
            fail: function(error) {
                console.log(error);
            }
        });
    }
    
    function goToHeader() {
        location.href = "${contextPath}/main";
    }
    
    
</script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js" integrity="sha512-3j3VU6WC5rPQB4Ld1jnLV7Kd5xr+cq9avvhwqzbH/taCRNURoeEpoPBK9pDyeukwSxwRPJ8fDgvYXd6SkaZ2TA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</head>
<body>
	  <div id="window">
	    <div id="back" onclick="goToHeader()"><i class="fa-solid fa-arrow-left fa-2xl backicon"></i></div>
		<div id="joinService">
		    <div class="joinServiceTitle"><strong>회원서비스</strong></div>
		</div>
		
		<hr id="hr1">
		
		    <div class="wrap1">
			    <ul>
			      <li><a>기존회원</a></li>
			      <li><a href="${contextPath}/users/agree.page">신규회원가입</a></li>
			    </ul>
			</div>
		<hr id="hr2">
		
		<div><h2>소셜아이디로 로그인</h2></div>
		
	    <div>
	        <ul>
	            <li><div class="web_logo" id="kakao_logo" onclick="kakaoLogin();"></div></li>
	        </ul>
	    </div>
	
	    <div>
	        <form id="frmLogin" method="post" action="${contextPath}/users/login.do">
	        
	        	<!-- 로그인 이후에 이동할 주소 -->
	      		<input type="hidden" name="url" value="${url}">
	        
	            <div id="id_input">
	                <input type="text" id="userId" name="userId" placeholder="아이디를 입력하세요" style="width:380px; height:30px;">
	            </div>
	            <div id="pw_input">
	                <input type="password" id="userPw" name="userPw" placeholder="비밀번호를 입력하세요" style="width:380px; height:30px;">
	            </div>
				<div class="checkbox-container">
				    <input type="checkbox" id="chkRememberId">
				    <label for="chkRememberId">아이디 저장</label>
				    <input type="checkbox" name="chkAutologin" id="chkAutologin">
				    <label for="chkAutologin">자동 로그인</label>
				     <p class="info">※공공장소에서는 꺼주세요.</p>
				</div>
	            <div>
	                <button id="btnLogin" style="width:380px; height:45px;">로그인</button>
	            </div>
	        </form>
	        
			<div class="findUser">
			    <a href="${contextPath}/users/findId.page">아이디 찾기</a>
			    <span class="spacer">&nbsp&nbsp&nbsp&nbspㅣ&nbsp&nbsp&nbsp&nbsp</span> 
			    <a href="${contextPath}/users/findPw.page">비밀번호 찾기</a>
			</div>
	        
	    </div>
	</div>
</body>
</html>