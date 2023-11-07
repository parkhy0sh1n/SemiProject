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
         <span>정렬개수 :&nbsp;</span>
         <select id="recordPerPage">
           <option value="10">10개</option>
           <option value="20">20개</option>
           <option value="30">30개</option>
         </select>
      <input type="button" value="공지등록" onclick="fnAdd()" id="addNotice">
      <div class="tableNotice">
       <table border="1" id="tableNoticeAll">
        <thead>
          <tr id="tb_column">
            <td><span class="title" data-column="N.NOTICE_NO">공지번호</span></td>
            <td><span class="title" data-column="N.NOTICE_IMG">이미지</span></td>
            <td><span class="title" data-column="N.NOTICE_TITLE">제목</span></td>
            <td><span class="title" data-column="N.NOTICE_CONTENT">내용</span></td>
            <td><span class="title" data-column="N.NOTICE_CREATED_AT">작성일자</span></td>
          </tr>
        </thead>
        <tbody>
        <c:forEach items="${noticeList}" var="notice" varStatus="vs">
        <c:choose>
           <c:when test="${notice.noticeImg eq null}">
              <c:set var="image" value="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ56P7IgqjC5C1W7JuLUjXiRuaGmNMB_8enWA&usqp=CAU" />
           </c:when>
           <c:when test="${notice.noticeImg ne null}">
              <c:set var="image" value="${notice.noticeImg}" />
           </c:when>
        </c:choose>
          <tr class="tb_el">
            <td class="elNotice" id="noticeNo" style="font-size: 18px; font-weight: 500;">${notice.noticeNo}</td>
            <td class="elNotice"><img src="${image}" width="80px" height="80px"></td>
            <td class="elNotice" style="width:250px; font-size: 14px; font-weight: 700;">${notice.noticeTitle}</td>
            <td class="elNotice" style="width:450px;">${notice.noticeContent}</td>
            <td class="elNotice">${notice.noticeCreatedAt}</td>
          </tr>
        </c:forEach>
        </tbody>
       </table>
      </div>
    
    </div>
  </div>
  
  <div class="footer">
  
  </div>
  
</body>
</html>