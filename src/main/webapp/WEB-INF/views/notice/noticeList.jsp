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
	function performSearch() {
	    var keyword = document.getElementById('searchInput').value;
	    if (keyword.trim() !== '') {
	        window.location.href = "${contextPath}/notice/search.do?keyword=" + encodeURIComponent(keyword);
	    } else {
	        alert("검색어를 입력해주세요.");
	    }
	}
</script>
<style>

		a {
	        color: gray; 
	        text-decoration: none;
	    }

	.container {
		display: flex;
		justify-content: center;
		align-items: center;
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
	
	.search {
		list-style-type: none;
		margin: 0 auto;
		position: relative;
		width: 300px;
	}
	input {
		width: 270px;
		height: 20px;
		border: 1px solid #bbb;
		padding: 10px 12px;
		font-size: 14px;
	}
	img {
		position: absolute;
		width: 17px;
		top: 12px;
		right: 12px;
		margin: 0;
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
	
	#mainWrapper {
		width: 1000px;
		margin: 0 auto;
	}
	#mainWrapper > ul > li:first-child {
		text-align: center;
		font-size:14pt;
		vertical-align:middle;
		height: 40px;
		line-height: 30px;
	}
	
	#ulTable {
		margin-top: 30px;
	}
	#ulTable > li:first-child > ul > li {
		text-align:center;
		justify-content: center;
		color: black;
		display: flex;
		align-items: center;
		font-weight: bold;
		font-size: large;
		height: 80px;
		list-style-type: none;
		color: black;
	}
	#ulTable > li > ul {
		clear: both;
		color: #6E6E6E;
		text-align: center;
	  		
	}
	#ulTable > li > ul > li {
		float: left;
		font-size:10pt;
		align-items: center;
		width: 33%;
		height: 80px;
	}
	#ulTable > li > ul > li:first-child {
		display: flex;
		align-items: center;
		justify-content: center;
		width:15%;
		font-size: large;
	}
	#ulTable > li > ul > li:first-child + li {
		width:40%;
		font-size: large;
	}
	#ulTable > li > ul > li:first-child + li + li {
		width:45%; 
		display: flex;
		align-items: center;
		justify-content: center;
		font-size: large;
	}
	#ulTable > li > ul {
		border-top: 1px solid; /* 변경된 속성 */
	}
	
	.left {
		text-align : left;
		display: flex;
		align-items: center;
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
	
			<br>
	
			<div class="search">
			    <input type="text" id="searchInput" placeholder="검색어 입력해주세요.">
			    <a href="javascript:void(0);" onclick="performSearch()">
			        <img src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png" alt="Search">
			    </a>
			</div>
	   
			<div id="mainWrapper">
				<!-- 게시판 목록  -->
				<li>
					<ul id="ulTable">
						<li>
							<ul>
								<li>번호</li>
								<li>제목</li>
								<li>작성일</li>
							</ul>
						</li>
						<!-- 게시물이 출력될 영역 -->
						<c:if test="${not empty noticeList}">
							<c:forEach items="${noticeList}" var="notice">
								<li>
									<ul>
										<li>${notice.noticeNo}</li>
										<li class="left"><a href="${contextPath}/notice/detail.do?noticeNo=${notice.noticeNo}">${notice.noticeTitle}</a></li>
										<li>${notice.noticeCreatedAt}</li>
									</ul>
								</li>
							</c:forEach>
						</c:if>                                      
					</ul>
				</li>
				<p class="successMessage">${successMessage}</p>
       			 <p class="errorMessage">${errorMessage}</p>
			</div>
		</form>
	</div>
	
</body>
</html>