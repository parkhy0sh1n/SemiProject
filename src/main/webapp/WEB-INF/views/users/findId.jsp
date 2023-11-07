<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Index</title>
<script src="${contextPath}/resources/js/lib/jquery-3.6.4.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
<script src="${contextPath}/resources/js/lib/moment-with-locales.js"></script>
<script>

function fnFindId() {
    $('#btnFindId').on('click', function(){
         $.ajax({
          type: 'post',
          url: '${contextPath}/users/findId.do',
          contentType: 'application/json',  // 보내는 데이터가 JSON이라는 의미입니다. 
          data: JSON.stringify({            // 보내는 데이터의 파라미터 이름이 없기 때문에 컨트롤러에서 parameter를 받는 request.getParameter(), @RequestParam, 커맨드 객체 모두 사용할 수 없습니다.
            userName: $('#userName').val(),         // 컨트롤러에서는 @RequestBody와 객체 또는 Map을 통해서 받아야 합니다.
            userEmail: $('#userEmail').val()
          }),
          dataType: 'json',
          success: function(resData) {
             console.log(moment);
            if(resData.findUser != null) {
              let userId = resData.findUser.userId;
              id = userId;
              moment.locale('ko-KR');
              $('#findResult').html('회원님의 아이디는 ' + id + '입니다.<br>(가입일 : ' + moment(resData.findUser.joinedAt).format("YYYY년 MM월 DD일 a h시mm분ss초 입니다.") + ')');
            } else {
               $('#findResult').html('일치하는 회원이 없습니다. 입력 정보를 확인하세요.');
            }
          }
        });
      });
 }
   
   $(function(){
      fnFindId();
   });

</script>
<style>

       a {
	        color: gray; /* 원하는 색상으로 변경하세요 */
	    }

	.find_top {
	  display: flex;
	  flex-direction: column;
	  justify-content: center;
	  align-items: center;
	  width: 100%;
	  height: 200px;
	  background-color: #F2F2F2;
	  text-align: center;
	}

	.find_top > h1 {
	  margin-bottom: 20px;
	}

	.find_top > h4 {
	  margin-top: 20px; 
	}

	h5 {
	  display: flex;
	  flex-direction: column;
	  justify-content: center;
	  align-items: center;
	  color: #9F9F9F;
	  margin-top: 60px; 
	  margin-bottom: 60px;
	}
	
	.content-container {
	  display: flex;
	  justify-content: center;
	}
	
	#userName {
		width: 530px;
		height: 30px;
		margin-bottom: 10px;
		border: 1px solid #EEEEEE;
	}
	
	#userEmail {
		width: 530px;
		height: 30px;
		margin-bottom: 65px;
		border: 1px solid #EEEEEE;
	}
	
	#btnFindId {
		background-color: #A78B6D;
		border: 1px solid #A78B6D;
		color: #ffffff;
		width: 200px;
		height: 50px;
		cursor: pointer;
		margin-left: 165px;
		margin-bottom: 30px;
	}
	
	.bottom {
		margin-left: 160px;
	}

</style>
</head>
<body>

	<div class="find_top">
	  <h1>아이디 찾기</h1>
	</div>

  	<h5>아이디가 생각나지 않을 경우, 가입 당시 이름과 휴대폰 정보를 아래에 입력하시면 아이디 정보를 받으실 수 있습니다.</h5>
   <div class="content-container">
	<div class="inline">
      <div>
	      	<div>
	         <label for="userName">이름</label> 
	      	</div>
	      	<div>
	        <input type="text" name="userName" id="userName" placeholder="가입한 이름을 입력하세요.">
	      	</div>
      </div>
      <div>
	      <div>
	         <label for="userEmail">이메일</label> 
	      </div>
	      <div>
	         <input type="text" name="userEmail" id="userEmail" placeholder="이메일을 입력해주세요.">
	      </div>
      </div>
      <div>
         <input type="button" value="아이디찾기" id="btnFindId">
      </div>
      <div class="bottom">
         <a href="${contextPath}/users/login.form">로그인</a> | <a
            href="${contextPath}/users/findPw.page">비밀번호 찾기</a> | <a
            href="${contextPath}/users/agree.page">회원가입</a>
      </div>
	</div>

   </div>

   <div id="findResult"></div>


</body>
</html>