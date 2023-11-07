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

	function fnBack(){
		location.href = '${contextPath}/users/index.page';
	}
	
	
			/* 
				생년월일 정규식 기존꺼
				
				// 엔터 쳤을때 form 안 타는 코드 : onSubmit="return false;"
				
				if(!(e.key >= 0 && e.key <= 9) && e.keyCode != 8){
					alert('예시 : 19901220 이 양식에 맞게 작성해주세요.');
					$('#userBirth').val('');
				}
			*/

			
	//전역 변수 (각종 검사 통과 유무를 저장하는 변수)
	var verifyId = false;
	var verifyPw = false;
	var verifyRePw = false;
	var verifyName = false;
	var verifyMobile = false;
	var verifyEmail = false;
	var verifyBirth = false;		
			
			
			
			
	// 생년월일 검사
	function fnBirth(){
		
		$('#userBirth').on('keyup', function(){
			
			// 입력한 생년월일
			let Birth = $(this).val();
			
			// 정규식
			let regBirth = /^[0-9]{7,8}$/;
			
			// 정규식 검사
		    verifyBirth = regBirth.test(Birth);
		    if(verifyBirth){
		  	    $('#msgBirth').text('');
		    } else {
		  	    $('#msgBirth').text('예시 : 19901220 이 양식에 맞게 작성해주세요.');			  
		    }
			
		});
	}
	

	
	// 함수 정의
	  
	  // 1. 아이디 검사(정규식 + 중복)
	  function fnCheckId(){
		  
		  $('#userId').on('keyup', function(){
			  
			  // 입력한 아이디
			  let id = $(this).val();
			  
			  // 정규식 (5~20자, 소문자+숫자+하이픈(-)+밑줄(_) 사용 가능, 첫 글자는 소문자+숫자 사용 가능)
			  let regId = /^[a-z0-9]{5,20}$/;
			  
			  // 정규식 검사
			  verifyId = regId.test(id);
			  if(verifyId == false){
				  $('#msgId').text('5~20자의 영문 혹은 영문+숫자 조합, 첫 글자는 영문 사용 가능');
				  return;  // 여기서 함수 실행을 종료한다. (이후에 나오는 ajax(중복 체크) 실행을 막기 위해서)
			  }else{
				  $('#msgId').text('');
			  }
			  
			  // 아이디 중복 체크 ajax (수정해야함)
			  $.ajax({
				  type: 'get',
				  url: '${contextPath}/users/verifyId.do',
				  data: 'userId=' + id,
				  dataType: 'json',
				  success: function(resData){  // resData = {"enableId": true} 또는 {"enableId": false}
					  verifyId = resData.enableId;
				    if(verifyId){
						  $('#msgId').text('사용 가능한 아이디입니다.');
					  } else {
						  $('#msgId').text('이미 사용 중인 아이디입니다.');
					  }
				  }
			  })
			  
		  })
		  
	  }
	  
	  // 2. 비밀번호 검사 (정규식)
	  function fnCheckPw(){
		  
		  $('#userPw').on('keyup', function(){
			
			  // 입력한 비밀번호
			  let pw = $(this).val();
			  
			  // 길이(4~20자) 및 정규식(소문자+대문자+숫자+특수문자 사용 가능, 3개 이상 조합)
			  let pwLength = pw.length;
			  let validCount = /[a-z]/.test(pw)         //   소문자를 가지고 있으면 true(1), 없으면 false(0)
					             + /[A-Z]/.test(pw)         //   대문자를 가지고 있으면 true(1), 없으면 false(0)
			                 + /[0-9]/.test(pw)         //     숫자를 가지고 있으면 true(1), 없으면 false(0)
			                 + /[^a-zA-Z0-9]/.test(pw); // 특수문자를 가지고 있으면 true(1), 없으면 false(0)
			  verifyPw = (pwLength >= 4) && (pwLength <= 20) && (validCount >= 3);
			  if(verifyPw){
				  $('#msgPw').text('사용 가능한 비밀번호입니다.');
			  } else {
				  $('#msgPw').text('4~20자, 소문자+대문자+숫자+특수문자 사용 가능, 3개 이상 조합');
			  }
		  
		  })
		  
	  }
	  
	  // 3. 비밀번호 확인
	  function fnCheckPwAgain(){
	    
	    $('#userRePw').on('keyup', function(){
	      
	    	// 입력된 비밀번호
	    	let pw = $('#userPw').val();
	    	
	      // 재입력한 비밀번호
	      let rePw = $(this).val();
	      
	      // 비밀번호와 재입력한 비밀번호 검사
	      verifyRePw = (rePw != '') && (rePw == pw);
	      if(verifyRePw){
	        $('#msgRePw').text('');
	      } else {
	        $('#msgRePw').text('비밀번호 입력을 확인하세요.');
	      }
	      
	    })
	    
	  }
	  
	  // 4. 이름
	  function fnCheckName(){
		  
		  $('#userName').on('keyup', function(){
			  verifyName = $(this).val() != '';
		  })
		  
	  }
	  
	  // 5. 휴대전화
	  function fnCheckMobile(){
		  
		  $('#userTel').on('keyup', function(){
			  
			  // 입력한 휴대전화
			  let mobile = $(this).val();
			  
			  // 정규식
			  let regMobile = /^010[0-9]{7,8}$/;
			  
			  // 정규식 검사
			  verifyMobile = regMobile.test(mobile);
			  if(verifyMobile){
				  $('#msgTel').text('');
			  } else {
				  $('#msgTel').text('휴대전화 입력을 확인하세요.');			  
			  }
			  
		  })
		  
	  }
	  
	  
	  
	  // 6. 이메일 검사 및 인증코드 전송
	  function fnCheckEmail(){
		  
		  $('#btnGetCode').on('click', function(){
			  
			  // 입력한 이메일
			  let email = $('#userEmail').val();
			  
			  new Promise(function(resolve, reject){
				  
				  // 정규식
				  let regEmail = /^[a-zA-Z0-9-_]+@[a-zA-Z0-9]{2,}(\.[a-zA-Z]{2,6}){1,2}$/;
				  //
				  //                  gt_min     @ naver         (.com)
				  //                                             (.co)(.kr)
				  
				  // 정규식 검사
				  verifyEmail = regEmail.test(email);
				  if(verifyEmail == false){
					  reject(1);  // catch 메소드에 정의된 function을 호출한다. 인수로 1을 전달한다.
					  return;
				  }
				  
				  // 이메일 중복 체크
				  $.ajax({
					  type: 'get',
					  url: '${contextPath}/users/verifyEmail.do',
					  data: 'userEmail=' + email,
					  dataType: 'json',
					  success: function(resData){  // resData = {"enableEmail": true} 또는 {"enableEmail": false}
						  if(resData.enableEmail){
	    				  resolve();  // then 메소드에 정의된 function을 호출한다.
						  } else {
							  reject(2);  // catch 메소드에 정의된 function을 호출한다. 인수로 2을 전달한다.
						  }
					  }
					})
				  
			  }).then(function(){
				  
				  // 이메일로 인증번호를 보내는 ajax
				  $.ajax({
					  type: 'get',
					  url: '${contextPath}/users/sendAuthCode.do',
					  data: 'userEmail=' + email,
					  dataType: 'json',
					  success: function(resData){  // resData = {"authCode": "6T43G9"}  사용자에게 전송한 인증코드를 의미
						  
						  alert(email + "으로 인증코드를 전송했습니다.");
						  
						  // 메일로 받은 인증코드 입력 후 인증하기 버튼을 클릭한 경우
						  $('#btnVerifyCode').on('click', function(){
							  
							  verifyEmail = (resData.authCode == $('#authCode').val());  // 사용자에게 전송한 인증코드 == 사용자가 입력한 인증코드값
							  if(verifyEmail) {
								  alert('인증되었습니다.');
							  } else {
								  alert('인증에 실패했습니다. 인증번호를 확인해주세요.');
							  }
							  
						  })
						  
					  },
					  error: function(jqXHR){
						  alert('인증번호가 발송되지 않았습니다.');
						  verifyEmail = false;
					  }
				  })
				  
			  }).catch(function(number){
				  
				  let msg = '';
				  switch(number){
				  case 1:
					  msg = '이메일 형식이 올바르지 않습니다.';  // 정규식 실패
					  break;
				  case 2:
					  msg = '이미 사용 중인 이메일입니다.';      // 이메일 중복 체크 실패
					  break;
				  }
				  $('#msgEmail').text(msg);
				  verifyEmail = false;
				  
			  })
			  
		  })
		  
	  }
	  /*
	  new Promise(function(resolve, reject){
		  
		  reject(1);  // 정규식 실패
		  
		  $.ajax({
			  success: function(){
				  resolve();   // 이메일 중복 체크 통과
				  reject(2);   // 이메일 중복 체크 실패
			  }
		  })
		  
	  }).then(function(){   // resolve() 함수 호출할 때 처리되는 함수(ajax 처리 success 했을 때)
		  // 인증코드전송
		  $.ajax({
			  
		  })
	  }).catch(function(number){  // reject() 함수 호출할 때 처리되는 함수(ajax 처리 error 했을 때)
		  // number == 1인 경우 정규식 실패 메시지
		  // number == 2인 경우 이메일 중복 체크 실패 메시지
	  })
	  */
	  
		
	  // 8. submit (회원가입)
	  function fnJoin(){
	
		  $('#frmJoin').on('submit', function(event){
			  
		  if(verifyId == false){
			  alert('아이디를 확인하세요.');
			  event.preventDefault();
			  return;
		  } else if(verifyPw == false || verifyRePw == false){
	          alert('비밀번호를 확인하세요.');
	          event.preventDefault();
	          return;
	      } else if(verifyName == false){
	          alert('이름을 확인하세요.');
	          event.preventDefault();
	          return;
	      } else if(verifyMobile == false){
	          alert('휴대전화번호를 확인하세요.');
	          event.preventDefault();
	          return;
	      } else if(verifyBirth == false){
	          alert('생년월일을 확인하세요.');
	          event.preventDefault();
	          return;
	      } else if(verifyEmail == false){
	          alert('가입을 위해서 이메일 인증이 필요합니다.');
	          event.preventDefault();
	          return;
	      }
			  
		})
		  
	  }
	  
	  
	  
	  // 함수 호출
	  $(function(){
		  fnBirth();
		  fnCheckId();
		  fnCheckPw();
		  fnCheckPwAgain();
		  fnCheckName();
		  fnCheckMobile();
		  fnCheckEmail();
		  fnJoin();
	  })
	

</script>

<style>
		.label:hover {
            cursor: pointer;
        }
        ul {
            text-align: center;
            margin-right: 45px;
        }
        li { 
            display: inline-block;
        }
        
        .join_top {
	  display: flex;
	  flex-direction: column;
	  justify-content: center;
	  align-items: center;
	  width: 100%;
	  height: 200px;
	  background-color: #F2F2F2;
	  text-align: center;
	  	  margin-bottom: 50px;
	}
	
	.join_top > h1 {
	  margin-bottom: 20px;
	}
	
	.join_top > h4 {
	  margin-top: 20px; 
	}
	
	.info {
	  display: flex;
	  flex-direction: column;
	  justify-content: center;
	  align-items: center;
	  color: #9F9F9F;
	  font-size: 13px;
	  margin-bottom: 50px;
     border-bottom: 1px solid #EEEEEE;
	  
	}
	
	#frmJoin {
	  display: flex;
	  flex-direction: column;
	  justify-content: center;
	  margin: 0 auto;
	}
	
	.inline {
	  display: flex;
	  flex-direction: column;
	  justify-content: center;
	  margin: 0 auto;
	}
	
	.bottom_button {
	  display: flex;
	  justify-content: center;
	  align-items: center;
	  margin: 0 auto;
	  margin-top: 50px;
	}
	
	input {
    border: 1px solid #EEEEEE;
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
	
</style>

</head>
<body>

	<div class="join_top">
	  <h1>회원가입</h1>
		<h4>2. 회원정보 입력</h4>
	</div>
    <form id="frmJoin" method="post" action="${contextPath}/users/join.do">
	    <div class="info">
	        <p>정보통신만 이용 촉진 및 정보보호 등에 관한 법률 및 청소년 보호법의 규정에 의하여 19세 미만의 청소년은 이용할 수 없습니다.</p>
	    </div>
	    	<!-- agree.jsp에서 전달된 location, event 속성 -->
		    <input type="hidden" name="location" value="${location}">
		    <input type="hidden" name="event" value="${event}">
	    
	    	<div class="inline">
	        <div>
	            <label class="label" for="userName">이름*</label>
	        </div>
	        <div>
	            <input type="text" id="userName" name="userName" placeholder="이름을 입력해주세요." style="width:600px; height:30px;">
	        </div>
	        <br>
	        <div>
	            <label class="label" for="userBirth">생년월일*</label>
	        </div>
	        <div>
	            <input type="text" id="userBirth" name="userBirth" placeholder="생년월일을 입력해주세요. (ex yyyymmdd)" maxLength="8" style="width:600px; height:30px;">
	        	<span id="msgBirth"></span>
	        </div>
	        <br>
	        <div>
	        	성별*
	        </div>
	        <div>
		        <input type="radio" name="userGender" id="none" value="NO" checked="checked">
		        <label for="none">선택 안함</label>
		        <input type="radio" name="userGender" id="male" value="M">
		        <label for="male">남자</label>
		        <input type="radio" name="userGender" id="female" value="F">
		        <label for="female">여자</label>
		    </div>
		    <br>
	        <div>
	            <label class="label" for="userTel">휴대폰번호*</label>
	        </div>
	        <div>
	            <input type="text" id="userTel" name="userTel" placeholder="'-'제외한 숫자만 입력해주세요." style="width:600px; height:30px;">
	        	<span id="msgTel"></span>
	        </div>
	        <br>
	        <div>
	            <label class="label" for="userId">아이디* 5~20자의 영문 혹은 영문+숫자 조합</label>
	        </div>
	        <div>
	            <input type="text" id="userId" name="userId" placeholder="5~20자의 영문 혹은 영문+숫자 조합" style="width:600px; height:30px;">
	        	<span id="msgId"></span>
	        </div>
	        <br>
	        <div>
	            <label class="label" for="userPw">비밀번호* 4~20자, 대,소문자+숫자+특수문자 3개 이상 조합</label>
	        </div>
	        <div>
	            <input type="password" id="userPw" name="userPw" placeholder="4~20자, 대,소문자+숫자+특수문자 3개 이상 조합" style="width:600px; height:30px;">
	        	<span id="msgPw"></span>
	        </div>
	        <br>
	        <div>
	            <label class="label" for="userRePw">비밀번호 확인*</label>
	        </div>
	        <div>
	            <input type="password" id="userRePw" placeholder="비밀번호를 한번 더 입력해주세요." style="width:600px; height:30px;">
	        	<span id="msgRePw"></span>
	        </div>
	        <br>
	        <div>
	            <label class="label" for="userEmail">이메일*</label>
	        </div>
	        <div>
	            <input type="text" name="userEmail" id="userEmail" placeholder="이메일을 입력해주세요." style="width:495px; height:30px;">
	            <input type="button" value="인증번호받기" id="btnGetCode" style="width:100px; height:30px;">
	            <span id="msgEmail"></span><br>
	            <input type="text" id="authCode" placeholder="인증코드 입력" style="width:495px; height:30px;">
	            <input type="button" value="인증하기" id="btnVerifyCode" style="width:100px; height:30px;">
	        </div>
	        <br>
	        <div>
	            <label class="label" for="postcode">주소*</label>
	        </div>
	        <div>
	            <input type="text" onclick="execDaumPostcode()" name="userPost" id="postcode" placeholder="우편번호" readonly="readonly" style="width:495px; height:25px;"> 
	            <input type="button" onclick="execDaumPostcode()" value="우편번호 찾기" style="width:100px; height:30px;"><br>
	            <input type="text" name="userRoadAddress" id="roadAddress" placeholder="도로명주소" style="width:600px; height:25px;">
	            <div>
		            <input type="text" name="userJibunAddress" id="jibunAddress" placeholder="지번주소" style="width:600px; height:25px;">
		            <span id="guide" style="color:#999;display:none"></span>
	            </div>
	            <div>
		            <input type="text" name="userDetailAddress" id="detailAddress" placeholder="상세주소" style="width: 295px; height:25px;">
		            <input type="text" name="userExtraAddress" id="extraAddress" placeholder="참고항목" style="width:295px; height:25px;">
	            </div>
	            
	            <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	            <script>
	                //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
	                function execDaumPostcode() {
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
	                            document.getElementById('postcode').value = data.zonecode;
	                            document.getElementById("roadAddress").value = roadAddr;
	                            document.getElementById("jibunAddress").value = data.jibunAddress;
	                            
	                            // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
	                            if(roadAddr !== ''){
	                                document.getElementById("extraAddress").value = extraRoadAddr;
	                            } else {
	                                document.getElementById("extraAddress").value = '';
	                            }
	            
	                            var guideTextBox = document.getElementById("guide");
	                            // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
	                            if(data.autoRoadAddress) {
	                                var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
	                                guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
	                                guideTextBox.style.display = 'block';
	            
	                            } else if(data.autoJibunAddress) {
	                                var expJibunAddr = data.autoJibunAddress;
	                                guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
	                                guideTextBox.style.display = 'block';
	                            } else {
	                                guideTextBox.innerHTML = '';
	                                guideTextBox.style.display = 'none';
	                            }
	                        }
	                    }).open();
	                }
	            </script>
	        </div>
		</div>
	        <br>
			<div class="bottom_button">
		        <button id="ok">회원가입</button>
		        <input type="button" value="취소하기" id="btnCancel" onclick="fnBack()">
		    </div>
    </form>
	
</body>
</html>