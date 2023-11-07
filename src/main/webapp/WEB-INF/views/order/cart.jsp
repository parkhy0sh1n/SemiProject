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
 <link rel="stylesheet" href="${contextPath}/resources/css/cart.css"/>
 <script>
 	
 	/* 상품 목록으로 이동하기 */
 	function moveToItemList() {
 		location.href="${contextPath}/order/prodList.page";
 	}
 	
	 /* 회원가입 페이지로 이동하기 */
	function moveToJoin() {
		location.href="${contextPath}/users/agree.page";
	}
	
 	/* 로그인 페이지로 이동하기 */
 	function moveToLogin() {
 		location.href="${contextPath}/users/login.form";
 	}

 	
	/* 총 결제금액 구하기 (체크된 상품만) */
 	function totalAmount() {
 	
 		var length = $('.checkOne:checked').length;
 		var totalAmount = 0;

 		for(let i=0; i<length; i++) {
 			var target = $('.checkOne:checked')[i];
 		    var quantity = parseInt($(target).closest('tr').find('.quantity').text());
 		    var price = parseInt($(target).closest('tr').find('.price').text());
 		    totalAmount += quantity * price;
 		
 		}
 		$('.totalAmount').text(totalAmount + "원");
		 		
 	}
	
	/* 수량 변경 시 DB 업데이트 */
	function fnUpdateCart(quantity, prodNo) {
		$.ajax({
			type: 'get',
			url: '${contextPath}/cart/updateCartQuantity.do',
			data: 'quantity=' + quantity + '&prodNo=' + prodNo,
		})
	}
	
	/* 상품 번호를 저장할 배열 */
	var prodNoArr = [];
	
 	function getCheckedProd() {
 		
 		/* 선택된 상품의 상품 번호를 배열에 저장 */
		 var length = $('.checkOne:checked').length;
		 
		 for(let i=0; i<length; i++) {
			 var prodNo = $('.checkOne:checked')[i];
			 prodNoArr.push($(prodNo).val());
		 }
		 
 	}
 
	$(function() {
		 totalAmount();
		 
		 /* 장바구니 상품 수량 변경 버튼 */
		 $('.downQuantity').on('click', function() {
			 var quantity = parseInt($(this).next().text());
			 var prodNo = $(this).val();
			 if(quantity == 1) {
				 alert('최소 주문 수량은 1개입니다.');
				 
			 } else if(quantity > 0) {
				 quantity--;
				 $(this).next().text(quantity);
				 
				 var price = $(this).closest('tr').find('.price').text();
				 var amount = price * quantity;
				 
				 $(this).closest('tr').find('.amount').text(amount);
				 totalAmount();
				 fnUpdateCart(quantity, prodNo);
			 }
		 })
		 
		 $('.upQuantity').on('click', function() {
			 var quantity = parseInt($(this).prev().text());
			 var prodNo = $(this).val();
			 
			 if(quantity > 0) {
				 quantity++;
				 $(this).prev().text(quantity);
				 
 				var price = $(this).closest('tr').find('.price').text();
				 var amount = price * quantity;
				 
				 $(this).closest('tr').find('.amount').text(amount);
				 
				 totalAmount();
				 
				 fnUpdateCart(quantity, prodNo);
			 }
		 })
		 
		 
		 
		 /* 장바구니 상품 체크박스 */
		 $('#selectAll').on('click', function() {
			 
			 $('.checkOne').prop('checked', $('#selectAll').prop('checked'));
			 totalAmount();
		 })
		 
		 $('.checkOne').on('click', function() {
			var checked = $('.checkOne:checked').length;
			var length = $('.checkOne').length;
			  
		  	$('#selectAll').prop('checked', (checked == length));
		  	totalAmount();
		 });
		 
		 
		 
		 /* 선택된 상품 삭제 */
		 $('#delete').on('click', function() {
			
			 if(confirm('선택한 상품을 삭제하시겠습니까?')) {
				 
			 	getCheckedProd();	
				location.href='${contextPath}/cart/deleteCart.do?prodNoArr='+prodNoArr;
			 }

		 })
		/* 상품이 삭제되면 알림창 생성(삭제 이벤트 안에 넣으면 동작이 안되서 밖으로 꺼냄) */		
		if(parseInt(${deleteResult}) > 0) {
			alert('${deleteResult}개 상품이 삭제되었습니다.');
		}
			 
		/* 장바구니가 비었을 때 주문페이지 이동 막기*/
		$('#frmOrderAll').on('submit',function(event) {
			var cartLegnth = '${cartList.size()}';
			if(cartLegnth == '0') {
				alert('주문할 상품을 선택해주세요.');
				event.preventDefault();
			}
		}) 
		 
		 /* 선택된 상품 주문 */
		 $('#frmOrderSelect').on('submit', function(event) {

			 prodNoArr = [];		// 뒤로가기하고 다시 주문할 경우 중첩되어 초기화 필요
			 getCheckedProd();		// 체크된 상품 번호 배열에 담기
			 if(prodNoArr.length == 0) {
				 alert('주문할 상품을 선택해주세요.');
				 event.preventDefault();
			 }else {
				 $('#selectedItems').val(prodNoArr);
			 }
				
		 })
	 })
 </script>
</head>
 <body>
    <div class="cartTitle">
      <h1>장바구니</h1>
      <div>
        <ul>
          <li>
            <div class="cartTitleIcon">
              <i class="fa-solid fa-cart-arrow-down fa-2xl cart"></i>
            </div>
            <div>
              <span class="cart"> 장바구니</span>
            </div>
          </li>
          <li>
            <i class="fa-solid fa-caret-right fa-2xl arrow"></i>
          </li>
          <li>
            <div class="cartTitleIcon">
              <i class="fa-solid fa-credit-card fa-2xl"></i>
            </div>
            <div>
              <span>주문결제</span>
            </div>
          </li>
          <li>
            <i class="fa-solid fa-caret-right fa-2xl arrow"></i>
          </li>
          <li>
            <div class="cartTitleIcon">
              <i class="fa-regular fa-circle-check fa-2xl"></i>
            </div>
            <div>
              <span>주문완료</span>
            </div>
          </li>
        </ul>
      </div>
    </div>

    <div class="cartBody">
      <div class="cartLogin">
        <div>
          비회원구매 시 쿠폰 이용 등 회원에게만 제공되는 혜택을 받으실 수
          없습니다.
          <br />
          회원가입 및 로그인하시고 구매 혜택을 받아가세요.
        </div>
        <div class="cartLoginBtn">
          <input type="button" value="회원가입" onclick="location.href='${contextPath}/users/agree.page'"/>
          <input type="button" value="로그인" onclick="moveToLogin()"/>
        </div>
      </div>

      <div class="cartList">
        <div class="listTop">
          <div>
            <label for="selectAll">
            <input type="checkbox" class="selectAll" id="selectAll" checked="checked" />
              전체선택
            </label>
          </div>
          <div class="selectDelete">
            <input type="button" value="선택삭제" id="delete"/>
          </div>
        </div>
        <hr />
	        <table>
	        	<tbody>
	        		<c:if test="${empty cartList}">
	        			<tr>
	        				<td colspan="5">
	        					<div>장바구니가 비었습니다.</div>
	        				</td>
	        			</tr>
	        		</c:if>
	        		<c:if test="${not empty cartList}">
					<c:forEach items="${cartList}" var="c">
						<tr>
							<td>
								<label for="${c.prodNo}">
									<input type="checkbox" id="${c.prodNo}" class="checkOne" value="${c.prodNo}" checked="on">
									<img src="${c.prodThumbnail}" class="cartImg" width="100" height="100" />
								</label>
							</td>
							<td>
								<a href="${contextPath}/product/detail?prodNo=${c.prodNo}">${c.prodName}</a>
							</td>
							<td>
								<div class="quantityWrap">
									<button type="button" class="downQuantity quantity" value="${c.prodNo}">
										<i class="fa-solid fa-minus"></i>
									</button>
									<span class="quantity">${c.quantity}</span>
									<button type="button" class="upQuantity quantity" value="${c.prodNo}">
										<i class="fa-solid fa-plus"></i>
									</button>
								</div>
							</td>
							<td>
								<div class="priceWrap">
									<div>상품 금액</div>
									<div class="price">${c.prodPrice}</div>
								</div>
							</td>
							<td>
								<div class="amountWrap">
									<div>결제 금액</div>
									<div class="amount">${c.quantity * c.prodPrice}</div>
								</div>
							</td>
						</tr>
					</c:forEach>	
					</c:if>
	        	</tbody>
	        </table>
      </div>
      <div class="totalPrice">
        <span>총 결제금액 &nbsp; </span>
        <span class="totalAmount"></span>
 		
      </div>
      <div class="btnShopping">
        <button type="button" onclick="moveToItemList()">계속 쇼핑하기</button>
        <form id="frmOrderSelect" method='post' action="${contextPath}/order/orderSelect.do">
        	<input type="hidden" id="selectedItems" name="selectedItems">
        	<input type="hidden" name="userNo" value="${userNo}">
        	<button>선택상품 주문</button>
        </form>
        <form id="frmOrderAll" method='post' action="${contextPath}/order/orderAll.do">
        	<input type="hidden" name="userNo" value="${userNo}">
        	<button>전체상품 주문</button>
        </form>
      </div>
    </div>
  </body>
</html>