<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="${contextPath}/resources/js/lib/jquery-3.6.4.min.js"></script>
<script>
</script>
<style>

	hr {
		border: 1px solid #E9E9E9;
		width: 620px;
	}
	
	.container {
		display: flex;
		flex-direction: column;
		justify-content: center;
		align-items: center;
	}
	
	tbody tr:hover {
		background-color: beige;
		cursor: pointer;      
	}

	.qna_top {
		display:table;
		table-layout:fixed;
		width:100%;
		height:200px;
		background-color: #F2F2F2;
		text-align:center;	
	}
	.qna_top > h1 {
		display:table-cell;
		vertical-align:middle;
	}
	
	.info {
        list-style-type: none;
        display: flex;
        justify-content: center;
        margin: 0 auto;
		position: relative;
		width: 400px;
		height: 50px;
		color: gray;
	}

	.wrap1 > ul {
		border-bottom: 1px solid gray;
		list-style-type: none;
		display: flex;
		justify-content: center;
		width: 1000px;
		margin: 0 auto;
		font-size: large;
	}
	.wrap1 > ul > li {
		width: 500px;
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

	body {
		line-height: 2em;        
		font-family: "맑은 고딕";
	}
	
	ul, li { 
		list-style: none;
		text-align: center;
		padding: 0;
		margin: 0;
	}

	.form-group {
		margin-bottom: 20px;
		color: #555555;
		text-align: center;
	}
	.form-group label {
		display: block;
		font-weight: bold;
		margin-bottom: 5px;
		margin-left: 190px;
		text-align: left;
	}
	.form-group input[type="text"],
	.form-group input[type="email"],
	.form-group input[type="tel"],
	.form-group textarea {
		width: 600px;
		padding: 10px;
		border: 1px solid #ccc;
		border-radius: 4px;
		margin: 0 auto;
	}
	.form-group select {
		width: 620px;
		padding: 10px;
		border: 1px solid #ccc;
		border-radius: 4px;
		margin: 0 auto;
		appearance: none; /* Remove default arrow icon in Chrome/Safari */
		-moz-appearance: none; /* Remove default arrow icon in Firefox */
		-webkit-appearance: none; /* Remove default arrow icon in Chrome/Safari (for older versions) */
		background-image: url('data:image/svg+xml;charset=UTF-8,<svg xmlns="http://www.w3.org/2000/svg" width="12" height="6" viewBox="0 0 12 6"><path fill="%23333333" d="M0 0h12L6 6z"/></svg>'); /* Custom arrow icon */
		background-repeat: no-repeat;
		background-position: right 10px center;
		background-size: 12px 6px;
	}

	.qa {
		padding: 10px 20px;
		background-color: #A78B6D;
		color: white;
		border: none;
		border-radius: 4px;
		font-size: 15px;
		cursor: pointer;
		width: 160px;
		height: 45px;
		margin: 0 auto;
	}
	.qa:hover {
		background-color: #875F45;
	}
	
</style>
</head>
<body>

	<div class="qna_top">
		<h1>1:1문의</h1>
	</div>
	
	<br>
	<br>
	<br>
	
	<div class="container">
		<form>
			<div class="wrap1">
				<ul>
					<li><a href="${contextPath}/notice/list.do">공지사항</a></li>
					<li><a href="${contextPath}/notice/qna.do">1:1문의</a></li>
				</ul>
			</div>
	
			<br>
	
			<div class="info">
				<h4>와인나라 이용 중에 생긴 불편한 점이나 문의사항을 보내주세요.</h4>
			</div>
	
			<br>
			<br>
	
			<hr>
			<div class="form-group">
				<label for="name">이름</label>
				<input type="text" id="name" name="name" placeholder="이름을 입력해주세요." required>
			</div>
			<div class="form-group">
				<label for="tell">연락처</label>
				<input type="email" id="tell" name="tell" placeholder="'-'를 제외한 숫자만 입력해주세요." required>
			</div>
			<div class="form-group">
				<label for="gubun">구분</label>
				<select>
				<option value="0" selected>상품관련</option>
				<option value="1">주문/결제관련</option>
				<option value="2">반품/환불관련</option>
				<option value="3">건강정보관련</option>
				<option value="4">기타관련</option>
				<option value="5">상품문의</option>
				<option value="6">회원정보관리</option>
				<option value="7">배송</option>
				<option value="7">영수증/증빙서류</option>
				</select>
			</div>
			<div class="form-group">
				<label for="title">제목</label>
				<input type="text" id="title" name="title" placeholder="제목을 입력해주세요." required>
			</div>
			
			<div class="form-group">
				<label for="request">문의내용</label>
				<textarea cols="75" rows="10" placeholder="문의내용을 입력해주세요."></textarea>
			</div>
	
			<div class="form-group">
				<button type="submit" class="qa">문의하기</button>
			</div>
		</form>
	</div>
			
</body>
</html>