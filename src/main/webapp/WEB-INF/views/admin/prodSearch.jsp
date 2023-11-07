<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<jsp:include page="../header.jsp">
  <jsp:param value="admin_prodSearch" name="title"/>
</jsp:include>

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
      location.href = '${contextPath}/admin/change/record.do?recordPerPage=' + $(this).val();
    })
    
    let recordPerPage = '${sessionScope.recordPerPage}' == '' ? '10' : '${sessionScope.recordPerPage}';
    $('#recordPerPage').val(recordPerPage);
    
    $('.title').on('click', function(){
    	 location.href='${contextPath}/admin/pagination.do?column=' + $(this).data('column') + '&order=' + $(this).data('order') + '&page=${page}';
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
 
.tableWine {
  padding-left: 30px;
  width: 1250px;
}

table {
   width: 1000px;
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
    padding-left: 40px;
    padding-top: 30px;
    padding-right: 120px;
    border: 2px solid gray;
    width: 1300px;
    border-radius: 7px;
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

#addProd {
  margin-left: 750px;
  font-size: 23px;
  width: 150px;
  font-weight: 530;
}

#searchArea {
display: inline;
  margin-top: 30px;
  width: 370px;
  height: 50px;
  line-height: 30px;
  text-align: center;
  border-radius: 7px;
 }
 
 #searchmsg {
 margin-left: 100px;
 font-size: 35px;
 font-weight: 500; 
 
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
    <h1>상품관리 <i class="fa-solid fa-cart-shopping fa-bounce"></i></h1>
      <br>
      <span>정렬개수 :&nbsp;</span>
      <select id="recordPerPage">
        <option value="10">10개</option>
        <option value="20">20개</option>
        <option value="30">30개</option>
      </select>
       
      <div id="searchArea">
        <form action="${contextPath}/admin/searchProd.do">
          <span style="font-size: 20px;">품명검색 &nbsp;</span>
          <input type="text" name="prodN" placeholder="&nbsp;&nbsp;${prodN}" id="prodN" style="font-size: 20px;">
          <button style="font-size: 20px"><i class="fa-sharp fa-solid fa-magnifying-glass fa-fade" style="color: #20252c;"></i>&nbsp;검색&nbsp;</button>
          <input type="button" value="상품 등록" onclick="fnAdd()" id="addProd">
        </form>
      </div>
     
      <div class="search_txt">
        <div id="search_wrap">
          <span id="searchmsg">" ${prodN} "</span><span>으로 검색하신 결과입니다.</span>
        </div>
      </div>
      
      <div class="tableWine">
         <table border="1" id="tableWineAll">
          <thead>
            <tr id="tb_column">
              <td>순번</td>
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
          <c:forEach items="${productList}" var="wine" varStatus="vs">
          <c:choose>
              <c:when test="${wine.prodType eq 'RED'}">
                <c:set var="color" value="#eedcdc" />
              </c:when>
              <c:when test="${wine.prodType eq 'ROSE'}">
                <c:set var="color" value="#fdddf4" />
              </c:when>
              <c:when test="${wine.prodType eq 'SPARKLING'}">
                <c:set var="color" value="#ddf2fd" />
              </c:when>
              <c:otherwise>
                <c:set var="color" value="#fdf7dd" />
              </c:otherwise>
          </c:choose>
    
            <tr class="tb_el">
              <td style="font-size: 18px; font-weight: 500;">${vs.index + 1}</td>
              <td class="elwine" id="wineNo"">${wine.prodNo}</td>
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
          <tfoot>
             <tr>
               <td colspan="11">${pagination}</td>
             </tr>
          </tfoot>
         </table>
        </div>
    
    </div>
  </div>
  
  <div class="footer">
  
  </div>
  
</body>
</html>