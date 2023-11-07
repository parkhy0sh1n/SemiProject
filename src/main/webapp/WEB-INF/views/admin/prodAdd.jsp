<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<jsp:include page="../header.jsp">
  <jsp:param value="admin_prodAdd" name="title"/>
</jsp:include>
<script>

function fnList(){
		location.href='${contextPath}/admin/prodList.page';
}

</script>
<style>
@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);

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

table {
   text-align: center;
   padding: 20px;
   width: auto;
}

#tableAdd {
  width: 800px;
  margin-top: 20px;
  margin-bottom: 20px;
  padding: 30px;
  padding-left: 40px;
  padding-right: 50px;
}

td {
  padding: 10px;
  font-size: 13px;
}

.tb_el:hover {
   background-color: #D064D0;
   cursor:pointer;
}

tr {
   padding: 5px;
}

.tb_row input {
  height: 28px;
  margin-top: 3px;
  margin-bottom: 3px;
  width: 250px;
}

select {
  height: 28px;
  margin-top: 3px;
  margin-bottom: 3px;
  width: 250px;
  text-align: center;
}

.main_right {
  padding-left: 70px;
  padding-top: 30px;
  padding-right: 160px;
  margin-right: 70px;
  border: 2px solid gray;
  border-radius: 7px;
  width: 1150px;
}

.row_left {
  width: 120px;
  background-color: #8f7e8e;
  color: white;
  font-size: 15px;
  font-weight: 500;
}

.row_right {
  width: 400px;

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

.row_right {
  text-align: left;
  padding-left: 40px;
}

input {
  text-align: center;
}

option {
  width: 100px;
}

#wNo {
  background-color: #dcdcdc;
}

#goback {
  font-size: 20px;
  font-weight: 450px;
  font-style: italic;
}

.btnDiv {
  padding-left: 600px;
}

#add_title {
  padding-left: 260px;
  font-size: 30px;
  font-weight: 500;
  text-align: center;
  margin-bottom: 15px;
}

#add_title p {
  padding: 3px;
  border: 3px solid gray;
  border-radius: 10px;
  width: 230px;
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
    
      <div id="add_title"><p>&nbsp; 상품 등록 &nbsp;</p></div>
      <div class="tableWine">
        <form id="frm" action="${contextPath}/admin/addProd.do" method="post">
          <button>등록하기</button>
          <table border="1" id="tableAdd">
              <tbody>
                <tr class="tb_row">
                  <td class="row_left">품명(KR)</td>
                  <td class="row_right"><input type="text" name="wName"></td>
                </tr>
                <tr class="tb_row">
                  <td class="row_left">품명(EN)</td>
                  <td class="row_right"><input type="text" name="wNameEng"></td>
                </tr>
                <tr class="tb_row">
                  <td class="row_left">제품이미지</td>
                  <td class="row_right"><input type="text" name="wThumb" placeholder="이미지 주소를 입력해주세요."></td>
                </tr>
                <tr class="tb_row">
                  <td class="row_left">가격</td>
                  <td class="row_right"><input type="text" name="wPrice"></td>
                </tr>
                <tr class="tb_row">
                  <td class="row_left">상세설명</td>
                  <td class="row_right"><input type="text" name="wContent"></td>
                </tr>
                <tr class="tb_row">
                  <td class="row_left">내용이미지</td>
                  <td class="row_right"><input type="text" name="wImg" placeholder="이미지 주소를 입력해주세요."></td>
                </tr>
                <tr class="tb_row">
                  <td class="row_left">종류</td>
                  <td class="row_right">
                    <select name="wType">
                        <option value="RED">RED</option>
                        <option value="ROSE">ROSE</option>
                        <option value="WHITE">WHITE</option>
                        <option value="SPARKLING">SPARKLING</option>
                    </select>
                  </td>
                </tr>
                <tr class="tb_row">
                  <td class="row_left">원산지</td>
                  <td class="row_right"><input type="text" name="wNation"></td>
                </tr>
                <tr class="tb_row">
                  <td class="row_left">바디감</td>
                  <td class="row_right">
                    <select name="wBody">
                      <option value="무거움">무거움</option>
                      <option value="중간">중간</option>
                      <option value="가벼움">가벼움</option>
                    </select>
                  </td>
                </tr>
                <tr class="tb_row">
                   <td class="row_left">도수</td>
                   <td class="row_right">
                    <select name="wAlcohol">
                      <option value="높음">높음</option>
                      <option value="중간">중간</option>
                      <option value="낮음">낮음</option>
                    </select>
                   </td>
                </tr>
                <tr class="tb_row">
                   <td class="row_left">출시일자</td>
                   <td class="row_right"><input type="text" name="wDate" placeholder="YYYY-MM-DD 형식으로 입력해주세요."></td>
                </tr>
                <tr class="tb_row">
                   <td class="row_left">수량</td>
                   <td class="row_right"><input type="number" name="wStock"></td>
                </tr>
            </tbody>
          </table>
        </form>
      </div>
    </div>
  </div>
  
  <div class="footer">
  
  </div>
  
</body>
</html>