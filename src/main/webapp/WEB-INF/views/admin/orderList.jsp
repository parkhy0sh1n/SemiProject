<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<jsp:include page="../header.jsp">
  <jsp:param value="admin_orderList" name="title"/>
</jsp:include>

<style>
@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);
@import url('https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css');

* {
   margin: 0;
   padding: 0;
   box-sizing: border-box;
   font-family: 'Noto Sans KR', sans-serif;
}

.logo {
   display: flex;
   justify-content: center;
}

.main {
   margin: 0 auto;
   display: flex;
}

.gnb {
   display: flex;
   flex-direction: row;
   justify-content: space-between;
   text-align: center;
 }
 
.gnb ul {
   margin: 0 auto;  
   list-style: none;
   display: flex;
}

.gnb li {
   margin: 0 auto;  
   width: 170px;
   padding: 30px;
   text-align: middle;
 }

.main_left {
   margin-right: 20px;
   margin: 15px;
}

.main_left ul {
   margin: 0 auto;  
   list-style: none;
   text-align: center;
}

.main_left li {
   margin: 0 auto;  
   width: 140px;
   padding: 30px;
 }
 
 .main_left a {
   text-decoration: none;
   color: black;
 }
 
.tableNotice {
  width: 1200px;
}

table {
   text-align: center;
   margin-top: 30px;
   margin-bottom: 50px;
   padding: 30px;
}

td {
  padding: 10px;
  height: 10px;
  font-size: 13px;
}

.tb_el:hover {
   background-color: #d3e3d3;
   cursor:pointer;
}

tr {
   padding: 5px;
}

#tb_column {
   font-size: 15px;
   font-weight: 500;
   color: white;
   background-color: #8e7583;
}

.main_right {
    padding-left: 30px;
    padding-top: 30px;
    padding-right: 120px;
    border: 2px solid gray;
    width: 1200px;
    border-radius: 7px;
}

#searchWineP {
    height: 20px;
    margin-top: 10px;
}

#test {
    background-image: url('../resources/images/bossbaby.png');
    background-size: 150px;
    background-repeat: no-repeat;
}

#left_prod {
  text-decoration: none;
  color: black;
}

#addNotice {
  display: block;
  margin-left: 900px;
  font-size: 23px;
  width: 150px;
  font-weight: 530;
}
</style>
</head>
<body>

  
  <div class="main">
  
    <div class="main_left">
    <ul>
      <li><a href="${contextPath}/admin/userList.page">회원관리</a></li>
      <li><a href="${contextPath}/admin/prodList.page">상품관리</a></li>
      <li><a href="${contextPath}/admin/orderList.page">주문관리</a></li>
      <li><a href="${contextPath}/admin/noticeList.page">게시판관리</a></li>
    </ul>
    
    </div>
    
    <div class="main_right">
   
    <h1>공지사항 관리 <i class="fa-regular fa-clipboard fa-bounce"></i></h1>
      <br>
 	  <div id="searchOrder">
        <form action="${contextPath}/admin/searchOrder.do" >
          <span style="font-size: 20px;">주문조회 &nbsp;</span>
          <input type="text" name="prodN" id="prodN" placeholder="&nbsp;&nbsp;검색어를 입력하세요.">
          <button style="font-size: 40px;"><i class="fa-sharp fa-solid fa-magnifying-glass fa-fade" style="color: #20252c;"></i>&nbsp;검색&nbsp;</button>

        </form>
      </div>
     
      <div class="tableOrder">
       <table border="1" id="tableOrderAll">
        <thead>
          <tr id="tb_column">
            <td><span class="title" data-column="ORDER_NO">주문번호</span></td>
            <td><span class="title" data-column="ORDER_DATE">주문일자</span></td>
            <td><span class="title" data-column="USER_NO">회원번호</span></td>
            <td><span class="title" data-column="RECEIVER_NAME">수령자명</span></td>
            <td><span class="title" data-column="RECEIVER_TEL">수령자연락처</span></td>
            <td><span class="title" data-column="ORDER_AMOUNT">주문금액</span></td>
          </tr>
        </thead>
        <tbody>
        <c:forEach items="${orderList}" var="order">
          <tr class="tb_el">
            <td class="elOrder">${order.orderNo}</td>
            <td class="elOrder">${order.orderDate}</td>
            <td class="elOrder">${order.userNo}</td>
            <td class="elOrder">${order.receiverName}</td>
            <td class="elOrder">${order.receiverTel}</td>
            <td class="elOrder">${order.orderAmount}</td>
          </tr>
        </c:forEach>
        </tbody>
       </table>
      </div>
    
    </div>
  </div>
  
</body>
</html>