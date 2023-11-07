<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="dt" value="<%=System.currentTimeMillis()%>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${param.title eq null ? 'Header' : param.title}</title>
<script src="${contextPath}/resources/js/lib/jquery-3.6.4.min.js"></script>
<style>
.hd_wrap {
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	text-align: center;
}

.hd_logo {
	margin-bottom: 20px;
}

.hd_loginbox {
	margin-bottom: 20px;
	max-width: 100%;
	position: relative;
	margin-right: 470px;
}

.hd_loginbox > c\\:if {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	width: 100%;
	display: flex;
	flex-direction: column;
	align-items: center;
}

.hd_gnb {
	margin-top: auto;
}

ul {
	list-style: none;
	padding: 0;
	margin: 0;
}

.hd_gnb ul li {
	display: inline-block;
	margin-right: 10px;
}

ul li a {
	text-decoration: none;
	color: black;
}

ul li a:hover {
	color: blue;
}
</style>
<link rel="stylesheet" href="${contextPath}/resources/css/header.css?dt=${dt}" />
</head>
<body>

	<div class="hd_wrap">
		<div class="hd_logo">
			<a href="${contextPath}/main">
				<img src="${contextPath}/resources/images/logo.gif" width="300px">
			</a>
		</div>
		<div class="hd_loginbox">
			<c:if test="${sessionScope.loginId == null}">
				<div class="hd_ifnull" style="font-weight: 300;">
					포도밭 회원이 되시면 더욱 편리하게 이용하실 수 있습니다.
				</div>
				<div>
					<a href="${contextPath}/users/agree.page">회원가입</a>
					<a href="${contextPath}/users/login.form">로그인 하러가기</a>
				</div>
			</c:if>
			<c:if test="${sessionScope.loginId != null && sessionScope.loginId != 'admin'}">
				<div class="hd_ifNotnull">
					<a href="#" style="color: black; font-size: 12px; font-weight: 400;">${sessionScope.loginId}</a>님! 반갑습니다 💜
				</div>
				<div>
					<a href="${contextPath}/users/logout.do">로그아웃</a>
					<a href="javascript:fnLeave()">회원탈퇴</a>
				</div>
			</c:if>
			<c:if test="${sessionScope.loginId == 'admin'}">
				<div class="hd_ifAdmin" style="font-weight: 500;">
					관리자 화면입니다.
				</div>
				<div>
					<a href="${contextPath}/users/logout.do">로그아웃</a>
					<a href="${contextPath}/admin/prodList.page">Admin</a>
				</div>
			</c:if>
		</div>
		<div class="hd_gnb">
			<ul>
				<li><a href="${contextPath}/product/listPage.do">Wine</a></li>
				<li><a href="${contextPath}/notice/list.do">Board</a></li>
				<li><a href="#" onclick="alert('준비 중입니다. 잠시만 기다려주세용~~~ -우민-')">Introduce us</a></li>
				<li><a href="${contextPath}/cart/getCartList.do">Cart</a></li>
			</ul>
		</div>
	</div>
	
	<script>
		function fnLeave(){
			if(confirm('동일한 아이디로 재가입이 불가능합니다. 회원 탈퇴하시겠습니까?')){
				location.href = '${contextPath}/users/leave.do';
			}
		}
	</script>

	
	

