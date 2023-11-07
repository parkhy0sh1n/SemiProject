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
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="stylesheet" href="${contextPath}/resources/css/order.css"/>
<script>
// 본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
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

		/* 최종 결제금액 구하는 함수 */
		var payPrice = 0;
		function getPayPrice() {
			var itemLength = $('.amount').length;
			for(let i=0; i<itemLength; i++) {
				var target = $('.amount')[i];
				payPrice += parseInt($(target).text());
			}
		}
		
		/* 신용카드 결제 */
		var IMP = window.IMP;
		IMP.init("imp51052215"); 
		
	 	function requestPay(bUid, pName, bAmount, email, bName, bTel, bAddr, bPostCode) {
		    IMP.request_pay({
		      pg: "kcp",
		      pay_method: "card",
		      merchant_uid: bUid,   // 주문번호
		      name: pName,
		      amount: bAmount,     // 숫자 타입
		      buyer_email: email,
		      buyer_name: bName,
		      buyer_tel: bTel,
		      buyer_addr: bAddr,
		      buyer_postcode: bPostCode
		    }, function (rsp) { // callback
		      //rsp.imp_uid 값으로 결제 단건조회 API를 호출하여 결제결과를 판단합니다.
		      
		    });
		  }
		
		$(function(){
			
			/* 결제페이지에 주문한 유저의 정보 삽입 */
			$('#userName').val('${orderUser.userName}');
			$('#userEmail').val('${orderUser.userEmail}');
			$('#userTel').val('${orderUser.userTel}');
			
			/* 주문자와 동일을 누르면 유저의 정보가 수령자 정보로 들어감 */
			$('#sameUserInfo').on('click',function() {
				$('#receiverName').val('${orderUser.userName}');
				$('#receiverTel').val('${orderUser.userTel}');
			})
			
			/* 최종 결제 금액 text 삽입 */
			getPayPrice();
			
			$('#payPrice').val(payPrice);
			
			/* 결제 버튼 동작 */
			$('#btnPay').on('click', function(event) {
				console.log($('#receiverName').val());
				console.log($('#receiverTel').val());
				console.log($('#postCode').val());
				if($('#receiverName').val() == null || $('#receiverTel').val() == null || $('#postcode').val() == null) {
					alert('배송 정보를 입력해주세요.');
					return;
				}else {
					if(confirm('작성하신 정보로 주문하시겠습니까?')) {
						$.ajax({
							type: 'post',
							url: '${contextPath}/order/insertOrder.do',
							data: $('#frmPay').serialize(),
							dataType: 'json',
							success: function(r) {
								//uid, name, amount, email, bName, bTel, bAddr,bPostCode
								console.log(r.order.orderDate + r.order.orderNo);
								console.log('${cartList[0].prodName}');
								console.log(r.order.orderAmount);
								console.log('${orderUser.userEmail}');
								console.log(r.order.receiverName);
								console.log(r.order.receiverTel);
								console.log(r.order.receiverAddress);
								console.log(r.order.postCode);
								requestPay(
										r.order.orderDate + r.order.orderNo
									  , '${cartList[0].prodName} 외'
									  , r.order.orderAmount
									  , '${orderUser.userEmail}'
									  , r.order.receiverName
									  , r.order.receiverTel
									  , r.order.receiverAddress
									  , r.order.postCode
								);
								
							},
							error: function(jqXHR) {
								alert('결제에 실패했습니다.');
							}
						})
						
	 				}else{
						event.preventDefault();
						return;
	 				}
				
				}
			})
			
			
		})
			/* 
				결제 버튼 시나리오
				1. 주문테이블에 주문번호와 유저번호, 주문일자 insert
				2. 결제 진행하는지 묻는 confirm 실행
					확인 : 1번에 insert한 행의 수령자 정보와 결제 정보 update
					취소 : 1번에 insert한 행 삭제 (함수 종료)
				3. 확인 후 update된 정보를 DTO로 가져와서 model로 저장
				4. 저장된 정보를 결제 함수에 삽입
			*/
			
</script>

</head>
<body>
	<div class="orderPage">
	<table class="orderList">
		<tbody>
			<c:if test="${cartList ne null }">
				<c:forEach items="${cartList}" var="c">
					<tr>
						<td>
							<img src="${c.prodThumbnail}" class="cartImg" width="100" height="100" />
						</td>
						<td>
							${c.prodName}
						</td>
						<td>
							<div>구매 수량</div>
							<div class="quantity">${c.quantity}</div>
						</td>
						<td>
							<div>
								<div>상품 금액</div>
								<div class="price">${c.prodPrice}</div>
							</div>
						</td>
						<td>
							<div>
								<div>결제 금액</div>
								<div class="amount">${c.quantity * c.prodPrice}</div>
							</div>
						</td>
					</tr>
				</c:forEach>	
			</c:if>
			<c:if test="${cartList eq null }">
				<tr>
					<td>
						<img src="${product.prodThumbnail}" class="cartImg" width="100" height="100" />
					</td>
					<td>
						${product.prodName}
					</td>
					<td>
						<div>구매 수량</div>
						<div class="quantity">${quantity}</div>
					</td>
					<td>
						<div>
							<div>상품 금액</div>
							<div class="price">${product.prodPrice}</div>
						</div>
					</td>
					<td>
						<div>
							<div>결제 금액</div>
							<div class="amount">${quantity * product.prodPrice}</div>
						</div>
					</td>
				</tr>
			</c:if>
		</tbody>
	</table>
	<form id="frmPay" method="post" action="${contextPath}/order/insertOrder.do">
		<div>
			<div>
				<div>
					<h3>주문자 정보</h3>
					<div>
						<div>이름	</div>
						<div>
							<input id="userName" readonly>
						</div>
					</div>
					<div>
						<div>이메일</div>
						<div>
							<input id="userEmail" readonly>
						</div>
					</div>
					<div>
						<div>연락처</div>
						<div>
							<input id="userTel" readonly>
						</div>
					</div>
				</div>
				<div>
					<div>
						<h3>배송 정보</h3>
						<div>
							<label for="sameUserInfo">
								<input type="checkbox" id="sameUserInfo">
								주문자와 동일
							</label>
						</div>
					</div>
					<div>
						<div>수령자명</div>
						<div>
							<input id="receiverName" name="receiverName" placeholder="이름을 입력해주세요.">
						</div>
						<div>연락처</div>
						<div>
							<input id="receiverTel" name="receiverTel" placeholder="'-'제외한 숫자만 입력해주세요.">
						</div>
					</div>
					<div>
						<div>배송 장소</div>
						<div>
						    <input type="text" onclick="execDaumPostcode()" name="postCode" id="postcode" placeholder="우편번호" readonly="readonly">
					        <input type="button" onclick="execDaumPostcode()" value="우편번호 찾기"><br>
					        <input type="text" name="receiverAddress" id="roadAddress" placeholder="도로명주소">
					        <input type="text" name="receiverJibunAddress" id="jibunAddress" placeholder="지번주소"><br>
					        <span id="guide" style="color:#999;display:none"></span>
					        <input type="text" name="receiverDetailAddress" id="detailAddress" placeholder="상세주소">
					        <input type="text" name="userExtraAddress" id="extraAddress" placeholder="참고항목" style="width:200px; height:25px;">
						</div>
					</div>
					<div>
						<div>요청사항</div>
						<textarea name="orderRequest" cols="70" rows="10" placeholder="내용을 입력해주세요."></textarea>
					</div>
				</div>
			</div>
			<div>
				<h3>결제 정보</h3>
				<div>
					<div>최종결제금액</div>
					<input id="payPrice" name="orderAmount" readonly>원
				</div>
				
			</div>
		</div>
		<input type="hidden" name="userNo" value="${orderUser.userNo}">
		<button type="button" id="btnPay">결제하기</button>
	</form>
	</div>
</body>
</html>