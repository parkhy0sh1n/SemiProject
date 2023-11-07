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
<title>Header</title>
<script src="${contextPath}/resources/js/lib/jquery-3.6.4.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="${contextPath}/resources/css/header.css" />
</head>
<body>

  <div class="header">
    <div class="logo">
      <a href="${contextPath}/admin/prodList.page">
        <img src="${contextPath}/resources/images/logo.jpg" width="200px">
      </a>
    </div>
    <div class="gnb">
      <ul>
        <li><a href="${contextPath}/product/list">Wine</a></li>
        <li><a href="${contextPath}/notice/list.do">Board</a></li>
        <li><a href="#" onclick="location.href='introduce.jsp'">Introduce us</a></li>
        <li><a href="${contextPath}/cart/getCartList.do">Cart</a></li>
      </ul>
    </div>
  </div>