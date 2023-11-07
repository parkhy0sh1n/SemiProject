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
<title>admin.prodList</title>
<script src="${contextPath}/resources/js/lib/jquery-3.6.4.min.js"></script>
<link rel="stylesheet" href="${contextPath}/resources/css/header.css"/>
<script>
	$(function(){
	    $('.elwine').on('click', function(){
	      location.href='${contextPath}/admin/detailProd.page?prodNo=' + $(this).siblings('#wineNo').text();
	    });
	  })
	
	$(function(){
	  $('#text').hide();
	  $('.elwine').on('mouseover', function(){
	    $('#text').show();
	  })
	})
	
	function fnAdd(){
		location.href= '${contextPath}/admin/addProd.page';
	}
	
	$(function(){
		
	   if('${addResult}' != '') {
		      if('${addResult}' == '1') {
		        alert('상품 추가가 완료되었습니다.');
		      } else {
		        alert('상품 추가가 실패되었습니다.');
		        history.back();	        
		      }
		 }
	   
	})
	
	$(function(){
	    $('#recordPerPage').on('change', function(){
	      location.href = '${contextPath}/admin/record.do?recordPerPage=' + $(this).val();
	    })
	    
	    let recordPerPage = '${sessionScope.recordPerPage}' == '' ? '10' : '${sessionScope.recordPerPage}';
	    $('#recordPerPage').val(recordPerPage);
	    
	    $('.title').on('click', function(){
	    	 location.href='${contextPath}/admin/prodList.page?column=' + $(this).data('column') + '&order=' + $(this).data('order') + '&page=${page}';
	    })
	 })
</script>
<style>
@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);
@import url('https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css');

* {
   margin: 0;
   padding: 0;
   box-sizing: border-box;
   font-family: 'Noto Sans KR', sans-serif;
}

.hd_logo {
	display: flex;
	justify-content: center;
}

.mmain {
   margin: 0 auto;
   display: flex;
}

.hd_gnb {
	display: flex;
	flex-direction: row;
	justify-content: space-between;
	text-align: center;
	margin-bottom: 20px;
}
 
.hd_gnb ul {
	margin: 0 auto;  
	list-style: none;
	display: flex;
}

.hd_gnb li {
	margin: 0 auto;  
	width: 180px;
	padding: 30px;
	text-align: middle;
    border-radius: 20px;
}

.hd_gnb li:hover {
	background-image: url('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSpb73M9PMQfKI_dkzM9DREE5WAsS3genS9zg&usqp=CAU');
	opacity: 0.5;
	background-size: 50%;
	background-position: center;
	background-repeat: no-repeat;	
}

.hd_loginbox {	
	background-color: #e4dff0;
	border-radius: 20px;
	width: 700px;
	height: 60px;
	text-align: center;
	padding: 10px;
	margin-left: 500px;
}

.hd_loginbox a {
	 padding: 5px;
}
 
.hd_gnb ul a {
	text-decoration-line: none;
	color: black;
	font-size: 20px;
	font-weight: 400;
}

.main_left {
   margin-right: 20px;
   margin: 80px;
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
 
.main_left ul :hover {
   background-color: #e7e7fd;
}
 
 .main_left a {
   text-decoration: none;
   color: black;
 }
 
.tableWine {
  width: 1300px;
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
   background-color: #fcfde7;
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

#tfoott {
  height: 10px;
}

.main_right {
    padding-left: 30px;
    padding-top: 30px;
    padding-right: 120px;
    border: 2px solid gray;
    width: 1100px;
    border-radius: 7px;
}

#left_prod {
  text-decoration: none;
  color: black;
}

#addProd {
  margin-left: 800px;
  font-size: 23px;
  width: 150px;
  font-weight: 530;
}

#searchArea {
  display: inline;
  margin-top: 30px;
  width: 340px;
  height: 50px;
  line-height: 30px;
  text-align: center;
  border-radius: 7px;
  padding-right: 20px;
 }
 
 #prodN {
 font-size: 20px;
 }
 
 #pn {
 font-size: 30px;
 letter-spacing: 20px;
 padding-left: 390px;
 }
</style>
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
	       <li><a href="#" onclick="location.href='introduce.jsp'">Introduce us</a></li>
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
	
 <div class="mmain">
    <div class="main_left">
      <ul>
        <li><a href="${contextPath}/admin/userList.page">회원관리</a></li>
        <li><a href="${contextPath}/admin/prodList.page">상품관리</a></li>
        <li><a href="${contextPath}/admin/orderList.page">주문관리</a></li>
        <li><a href="${contextPath}/admin/noticeList.page">게시판관리</a></li>
      </ul>
    </div>
 
    <div class="main_right">
    <h1>상품관리 <i class="fa-solid fa-cart-shopping fa-bounce"></i></h1>
      
      <br>
      
      <span>정렬개수 :&nbsp;</span>
      <select id="recordPerPage">
        <option value="10">10개</option>
        <option value="20">20개</option>
        <option value="30">30개</option>
      </select>
       
      <div id="searchArea">
        <form action="${contextPath}/admin/searchProd.do" >
          <span style="font-size: 20px;">품명검색 &nbsp;</span>
          <input type="text" name="prodN" id="prodN" placeholder="&nbsp;&nbsp;검색어를 입력하세요.">
          <button style="font-size: 20px;"><i class="fa-sharp fa-solid fa-magnifying-glass fa-fade" style="color: #20252c;"></i>&nbsp;검색&nbsp;</button>
          <input type="button" value="상품 등록" onclick="fnAdd()" id="addProd">
        </form>
      </div>
     
      <div id="pn">${pagination}</div>
      <div class="tableWine">
       <table border="1" id="tableWineAll">
        <thead>
          <tr id="tb_column">
            <td>No</td>
            <td><span class="title" data-column="PROD_NO" data-order="${order}">품번</span></td>
            <td><span class="title" data-column="PROD_THUMBNAIL" data-order="${order}">IMG</span></td>
            <td><span class="title" data-column="PROD_NAME" data-order="${order}">품명(KR)</span></td>
            <td><span class="title" data-column="PROD_NAME_ENG" data-order="${order}">품명(EN)</span></td>
            <td><span class="title" data-column="PROD_TYPE" data-order="${order}">종류</span></td>
            <td><span class="title" data-column="PROD_NATION" data-order="${order}">원산지</span></td>
            <td><span class="title" data-column="PROD_BODY" data-order="${order}">바디감</span></td>
            <td><span class="title" data-column="PROD_ALCOHOL" data-order="${order}">도수</span></td>
            <td><span class="title" data-column="PROD_DATE" data-order="${order}">출시일자</span></td>
            <td><span class="title" data-column="PROD_STOCK" data-order="${order}">재고</span></td>
           </tr>
        </thead>
        <tbody>
        <c:forEach items="${wineList}" var="wine" varStatus="vs">
        <c:choose>
            <c:when test="${wine.prodType eq '레드'}">
              <c:set var="color" value="#DFD8E9" />
            </c:when>
            <c:when test="${wine.prodType eq '로제'}">
              <c:set var="color" value="#E7C3CC" />
            </c:when>
            <c:when test="${wine.prodType eq '스파클링'}">
              <c:set var="color" value="#E2EBF7" />
            </c:when>
            <c:otherwise>
              <c:set var="color" value="#F5EBA6" />
            </c:otherwise>
        </c:choose>

          <tr class="tb_el">
            <td style="font-size: 18px; font-weight: 500;">${beginNo - vs.index}</td>
            <td class="elwine" id="wineNo">${wine.prodNo}</td>
            <td class="elwine" style="background:${color}"><img src="${wine.prodThumbnail}" width="90px"></td>
            <td class="elwine">${wine.prodName}</td>
            <td class="elwine">${wine.prodNameEng}</td>
            <td class="elwine">${wine.prodType}</td>
            <td class="elwine">${wine.prodNation}</td>
            <td class="elwine">${wine.prodBody}</td>
            <td class="elwine">${wine.prodAlcohol}</td>
            <td class="elwine">${wine.prodDate}</td>
            <td class="elwine">${wine.prodStock}</td>
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
	
	

</body>
</html>