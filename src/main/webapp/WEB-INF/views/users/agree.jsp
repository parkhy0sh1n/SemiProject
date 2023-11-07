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
<script src="${contextPath}/resources/js/lib/jquery-3.6.4.min.js"></script>
<script>

  // 취소하면 이전 페이지로 돌아간다.
  function fnCancel(){
	$('#btnCancel').on('click', function(){
    	history.back();
	})
  }
  
  // 모두 동의
  function fnCheckAll(){
	  $('#checkAll').on('click', function(){
		  if($('#checkAll').is(":checked")){
			  $('.checkOne').prop("checked", true);
		  }else{
			  $('.checkOne').prop("checked", false);
		  }
	  });
  }
  
  // 개별 선택
  function fnCheckOne(){
	  $('.checkOne').on('click', function(){
		  var total = $('.checkOne').length;
		  var checked = $('.checkOne:checked').length;
			
		  if(total != checked){
			  $('#checkAll').prop("checked", false);
		  }else {
			  $('#checkAll').prop("checked", true); 
		  }
	  })
  }
  
  // 가입 페이지로 이동하기(frmAgree의 submit)
  function fnFrmAgreeSubmit(){
	  $('#frmAgree').on('submit', function(event){
		  if($('#adult').is(':checked') == false || $('#service').is(':checked') == false || $('#privacy').is(':checked') == false){
			  alert('필수 약관에 동의해야만 가입할 수 있습니다.');
			  event.preventDefault();
			  return;
		  }
	  })
  }
  
  // 함수 호출
  $(function(){
	  fnCancel();
	  fnCheckAll();
	  fnCheckOne();
  	  fnFrmAgreeSubmit();  
  })
  
</script>
<style>
.agree_top {
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  width: 100%;
  height: 200px;
  background-color: #F2F2F2;
  text-align: center;
}

.agree_top > h1 {
  margin-bottom: 20px;
}

.agree_top > h4 {
  margin-top: 20px; 
}

h5 {
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  color: #9F9F9F;
}

#frmAgree {
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  margin: 0 auto;
}

.checkbox-container {
	width: 600px;
	margin-bottom: 10px;
}

.checkbox-container.check-all-container {
  display: flex;
  align-items: center;
  margin-top: 20px;
  margin-bottom: 20px;
  border-bottom: 1px solid #EEEEEE;
}

.checkbox-container.check-all-container input[type="checkbox"] {
  display: none;
  margin-top: 20px;
}

.checkbox-container.check-all-container .checkbox-label {
  margin-left: 10px;
  margin-top: 20px;
  margin-bottom: 20px;
}

.required-text {
	margin-bottom: 20px;
  display: inline-block;
  margin: 0;
  color: red;
  
}

.agreement-text {
margin-bottom: 20px;
  display: inline-block;
  margin: 0;
  margin-right: 320px;
}

.select-text {
  width: 600px;
  margin: 20px 0;
  border-bottom: 1px solid #EEEEEE;
}

.checkbox-container input[type="checkbox"] {
  display: none;
}

.checkbox-container .checkbox-label {
  position: relative;
  padding-left: 25px;
  cursor: pointer;
  margin-bottom: 10px;
}

.checkbox-container .checkbox-label:before {
  content: "";
  display: inline-block;
  width: 18px;
  height: 18px;
  border: 1px solid #ccc;
  border-radius: 3px;
  position: absolute;
  left: 0;
  top: 1px;
}

.checkbox-container input[type="checkbox"]:checked + .checkbox-label:before {
  background-color: #007bff;
  border-color: #007bff;
}

.checkbox-container .checkbox-label:after {
  content: "";
  position: absolute;
  display: none;
}

.checkbox-container input[type="checkbox"]:checked + .checkbox-label:after {
  display: block;
}

.checkbox-container .checkbox-label:after {
  left: 6px;
  top: 3px;
  width: 5px;
  height: 9px;
  border: solid #fff;
  border-width: 0 2px 2px 0;
  transform: rotate(45deg);
}

.checkbox-container textarea {
  width: 100%;
  /* Add any additional styling as needed */
}

	#btnCancel {
		border: 1px solid #D3C5B6;
		background-color: #ffffff;
		color: #A78B6D;
		width: 200px;
		height: 50px;
		cursor: pointer;
	}
	#ok {
		background-color: #A78B6D;
		border: 1px solid #A78B6D;
		color: #ffffff;
		width: 200px;
		height: 50px;
		cursor: pointer;
	}
	
	textarea {
  border: 1px solid #9F9F9F; /* Set the border color to red */
}

</style>
</head>
<body>

	<div class="agree_top">
	  <h1>회원가입</h1>
		<h4>1. 이용약관 동의</h4>
	</div>

  <div>
  
    <h5>와인나라 이용을 위한 약관에 동의해 주세요.</h5>
    
    <form id="frmAgree" action="${contextPath}/users/agree.do">
	    
		<div class="checkbox-container check-all-container">
		  <input type="checkbox" id="checkAll">
		  <div>
		     <p class="required-text">(필수)</p>
			  <p class="agreement-text">홈페이지 이용약관</p>
			</div>
		  <label for="checkAll" class="checkbox-label">모두 동의하기</label>
		</div>
	      
	      <div class="checkbox-container">
	        <input type="checkbox" id="adult" class="checkOne">
	        <label for="adult" class="checkbox-label" style="color: #5D5D5D">만 19세 이상 성인</label>
	        <div>
	          <textarea>19세 미만은 동의할 수 없습니다 ...</textarea>
	        </div>
	      </div>
	      
	      <div class="checkbox-container">
	        <input type="checkbox" id="service" class="checkOne">
	        <label for="service" class="checkbox-label" style="color: #5D5D5D">이용약관 동의</label>
	        <div>
	          <textarea>본 약관은 ...</textarea>
	        </div>
	      </div>
	      
	      <div class="checkbox-container">
	        <input type="checkbox" id="privacy" class="checkOne">
	        <label for="privacy" class="checkbox-label" style="color: #5D5D5D">개인정보수집 동의</label>
	        <div>
	          <textarea>개인정보보호법에 따라 ...</textarea>
	        </div>
	      </div>
	      
	       <div class="select-text">
		     <p>(선택)마케팅 활용 동의/철회</p>
			</div>
			
	      <div class="checkbox-container">
	        <!--  
	        	1. 체크한 경우     : 파라미터 location이 on값을 가지고 전달된다.
	        	2. 체크 안 한 경우 : 파라미터 location이 전달되지 않는다.
	        -->
	        <input type="checkbox" id="location" name="location" class="checkOne">
	        <label for="location" class="checkbox-label" style="color: #5D5D5D">위치정보수집 동의</label>
	        <div>
	          <textarea>위치정보 ...</textarea>
	        </div>
	      </div>
	      
	      <div class="checkbox-container">
	     	<!--  
	        	1. 체크한 경우 	   : 파라미터 event이 on값을 가지고 전달된다.
	        	2. 체크 안 한 경우 : 파라미터 event이 전달되지 않는다.
	        -->
	        <input type="checkbox" id="event" name="event" class="checkOne">
	        <label for="event" class="checkbox-label" style="color: #5D5D5D">이벤트 동의</label>
	        <div>
	          <textarea>이벤트 ...</textarea>
	        </div>
	      </div>
	      
	      <hr>
	      
	      <div>
	        <input type="button" value="취소" id="btnCancel">
	        <button id="ok">확인</button>
	      </div>
    
    </form>
    
  </div>
  
</body>
</html>