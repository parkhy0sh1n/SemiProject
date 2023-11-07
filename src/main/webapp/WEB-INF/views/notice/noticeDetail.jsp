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
	function fnList(){
		location.href = '${contextPath}/notice/list.do';
	}
</script>
<style>

	hr {
		border: 1px solid #E9E9E9;
	}
	
	.container {
		display: flex;
		flex-direction: column;
		justify-content: center;
		align-items: center;
	}
	
	.button-container {
		margin-top: 20px;
	}
	.button-container input[type="button"] {
		padding: 10px 20px;
		background-color: #A78B6D;
		color: white;
		border: none;
		border-radius: 4px;
		font-size: 15px;
		cursor: pointer;
		width: 160px;
		height: 45px
	}
	.button-container input[type="button"]:hover {
		background-color: #875F45;
	}
	
	.notice_top {
		display: table;
		table-layout: fixed;
		width: 100%;
		height: 200px;
		background-color: #F2F2F2;
		text-align: center;	
	}
	.notice_top > h1 {
		display: table-cell;
		vertical-align: middle;
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
	
	.title {
		margin-top: 80px;
		font-height: bolder;
		font-size: 28px;
		margin-bottom: 30px;
	}
	.content {
		margin-top: 30px;
		color: #555555;
		margin-bottom: 80px;
	}
	
</style>
</head>
<body>

	<div class="notice_top">
		<h1>공지사항</h1>
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
			<div id="detail_screen">
				<div class="title">${notice.noticeTitle}</div>
				<hr>
				<div class="content">${notice.noticeContent}</div>
			</div>
		</form>
		<div class="button-container">
			<input type="button" value="목록" onclick="fnList()">
		</div>
	</div>
	
</body>
</html>