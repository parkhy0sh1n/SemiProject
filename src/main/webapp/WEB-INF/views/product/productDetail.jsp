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

	$(document).ready(function() {
		// 기본값으로 상세보기 탭 선택
		openTab('detail');
		addToCart();
	});
	
	// 수량 감소 함수
	function decreaseQuantity() {
		// 수량 요소 가져오기
		const quantityElement = $("#quantity");
		let quantity = parseInt(quantityElement.text());
		// 수량이 1보다 큰 경우에만 감소시킴
		if (quantity > 1) {
			quantityElement.text(--quantity);
		}
	}
	// 수량 증가 함수
	function increaseQuantity() {
		// 수량 요소 가져오기
		const quantityElement = document.getElementById("quantity");
		let quantity = parseInt(quantityElement.innerText);
		// 수량 증가
		quantity++;
		quantityElement.innerText = quantity;
	}
	
	// 탭 열고 닫기
	function openTab(tabName) {
		$('.tabs button').removeClass('active');
		$('#' + tabName + 'Btn').addClass('active');
		$('.tab-content').hide();
		$('#' + tabName).show();
	}
	
	function addToCart() {
		
	// 상품 별점 값 (예: 4점)
	var ratingValue = 4;
	// 별점 요소를 선택하고 클래스를 추가합니다.
	var ratingElement = $('.rating');
	ratingElement.addClass('rating-' + ratingValue);
	
	// 장바구니 버튼 클릭 시 동작
	$('#addToCartButton').on('click', function() {
		
		// 수량 요소 가져오기
		const quantityElement = $("#quantity");
		// 수량 값 가져오기
		const quantity = parseInt(quantityElement.text());
		// 상품 번호 가져오기
		const prodNoElement = $("#prodNo");
		const prodNo = prodNoElement.val();
		// 전송할 데이터 생성
		const data = {
			prodNo: prodNo,
			quantity: quantity
		};
		
		 $.ajax({
			type: 'post',
			url: '${contextPath}/cart/addCart.do',
			data: 'quantity=' + quantity + '&prodNo=' + prodNo,
			dataType: 'json',
			success: function(resData){
				if(confirm(resData.msg)) {
					location.href = '${contextPath}/cart/getCartList.do';
				}
			}
		})
	});
	
	}
	$(function() {
		
	 	/* 바로 구매 버튼 파라미터 작업 */
		
		// 수량 요소 가져오기
		const quantityElement = $("#quantity");
		// 수량 값 가져오기
		const quantity = parseInt(quantityElement.text());
		$("#getQuantity").val(quantity);
		// 상품 번호 가져오기
		const prodNoElement = $("#prodNo");
		const prodNo = prodNoElement.val();
		$("#getProdNo").val(prodNo);
		
	    
	})
</script>
<style>

	/* 와인나라 폰트 적용 */
	@font-face {
		font-family: 'NotoSansKR';
		src: url('../resources/font/Noto_Sans_KR/NotoSansKR-Regular.otf') format('opentype');
	}
	body {
		font-family: 'NotoSansKR', sans-serif;
	}
	
	/* 상품 정보들을 감싸는 컨테이너 */
	.container {
		display: flex;
		justify-content: center;
		align-items: center;
		margin-top: 80px;
		width: 100%;
		height: 100vh;
	}
	.left-section {
		flex: 1;
		display: flex;
		justify-content: flex-start;
		align-items: center;
		margin-left: 160px;
	}
	
	.right-section {
		flex: 1;
		display: flex;
		justify-content: flex-end;
		align-items: flex-start;
		margin-right: 160px;
	}
	
	/* 썸네일 */
	/* 와인 종류에 따른 배경색 설정 */
	[data-prodtype="레드"] {
	    background-color: #DFD8E9;
	}
	
	[data-prodtype="화이트"] {
	    background-color: #F5EBA6;
	}
	
	[data-prodtype="로제"] {
	    background-color: #E7C3CC;
	}
	
	[data-prodtype="스파클링"] {
	    background-color: #E2EBF7;
	}
	
	/* 상품 정보들 */
	.product-info {
		margin-left: 108px;
		margin-bottom: 40px;
	}
	
	/* 품명 */
	.product-info h2 {
		font-size: 28px;
		font-weight: bold;
		margin-bottom: 10px;
	}
	
	/* 영문품명 */
	.product-info h3 {
		font-size: 15px;
		color: #5B5B5B;
		margin-bottom: 5px;
	}
	
	/* 상품정보 여백 조절 */
	h2, h3 {
		margin: 0;
	}
	
	/* 상품설명 */
	.prodContent {
		font-size: 13px;
		color: #A2A2A2;
		margin-bottom: 10px;
		width: 450px;
	}
	
	/* 와인종류와 원산지(가로로 이어붙이기) */
	.prodType,
	.prodNation {
		display: inline-block;
		background-color: #DFD8E9;
		border-radius: 5px;
		color: #000;
		padding: 3px 5px;
		margin-right: 5px;
	}
	
	/* 가격(상품 가격 아래쪽 여백 조정) */
	.prodPrice {
		font-size: 28px;
		font-weight: bold;
		margin-bottom: 10px;
	}
	
	/* 수량 조절 버튼과 상위 요소들 사이의 위쪽 간격 조정 */
	.quantity-control {
		display: flex;
		align-items: center;
		margin-top: 5px; 
	}
	.quantity-control button {
		padding: 3px 10px;
		margin-left: 5px;
		border: 1px solid #D3C5B6;
		background-color: #ffffff;
		cursor: pointer;
	}
	
	
	/* 장바구니 버튼과 바로구매 버튼 */
	#addToCartButton {
		border: 1px solid #D3C5B6;
		background-color: #ffffff;
		color: #A78B6D;
		width: 200px;
		height: 50px;
		cursor: pointer;
	}
	#buyNowButton {
		background-color: #A78B6D;
		border: 1px solid #A78B6D;
		color: #ffffff;
		width: 200px;
		height: 50px;
		cursor: pointer;
	}
	
	/* '바디','도수'와 넘어올 데이터들을 구분 */
	.bold-text {
		font-weight: 900;
	}
	.small-text {
		font-size: smaller;
		font-weight: 100;
	}

	/* 하단 탭(선택된 탭은 검은색 border, 선택되지 않은 탭은 회색 border로 설정하여 구분) */
    .tabs {
		margin-top: 20px;
		display: flex;
		justify-content: center;
		align-items: center;
		width: 100%;
	}
	.tabs button {
		padding: 10px;
		background-color: #ffffff;
		border: 1px solid #d3d3d3;
		cursor: pointer;
		width: 540px;
		height: 70px;
		font-size: 18px;
		font-weight: bold;
	}
	.tabs button:focus {
	    outline: none;
	}
	.tabs button.active {
	    background-color: #ffffff;
	    border: 1px solid #000000;
	}
	.tabs button:not(.active) {
	    border: 1px solid #d3d3d3;
	}
    .tab-content {
		display: none;
		text-align: center; 
    }
    
    /* 라뷰 */
    #reviewList {
		display: flex;
		flex-direction: column;
		flex-wrap: wrap;
		list-style: none;
		padding: 0;
	 	margin-left: 165px;
	}
	#reviewList li {
		width: 1080px;
		padding: 10px;
		box-sizing: border-box;
		border: 1px solid #ccc;
		border-radius: 5px;
		margin-bottom: 20px;
		background-color: #f9f9f9;
		align-items: flex-start;
		display: flex;
		flex-direction: column;
	}
	#reviewList li p {
		margin: 0;
	}
	#reviewList li p:first-child {
		font-weight: bold;
		font-size: 16px;
		margin-bottom: 5px;
	}
	#reviewList li p:nth-child(1) {
		font-size: 12px;
		margin-right: 10px;
	}
	#reviewList li p:nth-child(2) {
		color: #777;
		font-size: 12px;
		margin-right: 10px;
	}
	#reviewList li p:nth-child(3) {
		margin-top: 10px;
	}
    
    /* 리뷰 별점 */
    .rating {
		display: flex;
	}
  	.rating span {
		color: gold;
		font-size: 20px;
  	}
  	.rating span::selection {
    	background: none;
  	}

</style>
</head>
<body>

	<div class="container">
		<div class="left-section">
	    <img class="prodThumbnail" src="${product.prodThumbnail}" data-prodtype="${product.prodType}">
	</div>
		<div class="right-section">
			<div class="product-info">
				<h2>${product.prodName}</h2>
				<h3>${product.prodNameEng}</h3>
				<p class="prodContent">${product.prodContent}</p>
				<p class="prodType">${product.prodType}</p>
				<p class="prodNation">${product.prodNation}</p>
				<p class="prodPrice">${product.prodPrice}원</p>
				<!-- 수량 조절 버튼 -->
				<div class="quantity-control">
					<button onclick="decreaseQuantity()">-</button>
					<p>&nbsp<span id="quantity">1</span></p>
					<button onclick="increaseQuantity()">+</button>
				</div>
	      		<br>
				<!-- 장바구니 버튼 -->
				<form method="post" action="${contextPath}/order/orderDirect.do">
					<input type="hidden" id="prodNo" name="prodNo" value="${product.prodNo}">
					<input type="button" id="addToCartButton" value="장바구니">
					<input type="hidden" id="getQuantity" name="quantity">
					<button id="buyNowButton">바로구매</button>
				</form>	
				<br>
				<br>
				<p><span class="bold-text">바디</span> <span class="small-text">${product.prodBody}</span></p>  
				<p><span class="bold-text">도수</span> <span class="small-text">${product.prodAlcohol}</span></p>
			</div>
		</div>
	</div>
    <div class="tabs">
	    <button onclick="openTab('detail')" id="detailBtn">PRODUCT</button>
	    <button onclick="openTab('review')" id="reviewBtn">REVIEW</button>
	</div>
    <!-- PRODUCT(상세설명)탭 -->
    <div id="detail" class="tab-content">
        <img src="${product.prodImg}">
    </div>
	<!-- REVIEW(리뷰)탭 -->
	<div id="review" class="tab-content">
		<c:if test="${not empty reviewList}">
			<c:forEach items="${reviewList}" var="review">
			    <ul id="reviewList">
					<li>
						<div class="rating">
							<span class="star">${review.reviewGrade >= 1 ? '★' : '☆'}</span>
							<span class="star">${review.reviewGrade >= 2 ? '★' : '☆'}</span>
							<span class="star">${review.reviewGrade >= 3 ? '★' : '☆'}</span>
							<span class="star">${review.reviewGrade >= 4 ? '★' : '☆'}</span>
							<span class="star">${review.reviewGrade >= 5 ? '★' : '☆'}</span>
						</div>
						<div style="display: flex; justify-content: space-between; align-items: center;">
							<p style="margin-right: 10px;">${review.userDTO.userId}</p>
							<p style="font-size: 12px;">${review.reviewCreatedAt}</p>
						</div>
			      		<p>${review.reviewContent}</p>
			    	</li>
			  	</ul>
			</c:forEach>
		</c:if>     
	</div>
    
</body>
</html>