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
<title>Insert title here</title>
<script src="${contextPath}/resources/js/lib/jquery-3.6.4.min.js"></script>
<script>
	
	$(document).ready(function() {
		// 와인 종류에 따른 썸네일 구분
		function getProductTypeClass(prodType) {
			var classValue = '';
			switch (prodType) {
				case '레드':
					classValue = 'red';
					break;
				case '화이트':
					classValue = 'white';
					break;
				case '로제':
				  	classValue = 'rose';
				  	break;
				case '스파클링':
				  	classValue = 'sparkling';
				  	break;
				default:
				  	classValue = '';
				  	break;
			}
		    return classValue;
		}
		// 상품 정보들 받아오는 Ajax
		$.ajax({
			url: "${contextPath}/product/list",
		    type: "GET",
		    dataType: "json",
		    success: function(data) {
		      	var productList = data;
		      	var html = '';
		      	productList.forEach(function(product, index) {
		        if (index % 3 === 0) {
		          	html += '<tr>';
		        }
		        html += '<td>';
		        html += '<img src="' + product.prodThumbnail + '" class="thumbnail ' + getProductTypeClass(product.prodType) + '" data-prodno="' + product.prodNo + '">';
		        html += '<br>';
		        html += '<span class="prodName" data-prodno="' + product.prodNo + '">' + product.prodName + '</span>';
		        html += '<span class="prodNameEng">' + product.prodNameEng + '</span>';
		        html += '<span class="prodContent">' + product.prodContent + '</span>';
		        html += '<br>';
		        html += '<span class="prodType ' + getProductTypeClass(product.prodType) + '">' + product.prodType + '</span>';
		        html += '<span class="prodNation ' + getProductTypeClass(product.prodType) + '">' + product.prodNation + '</span>';
		        html += '<br>';
		        html += '<br>';
		        html += '<span class="prodPrice">' + product.prodPrice + '원' + '</span>';
		        html += '</td>';
		        if (index % 3 === 2 || index === productList.length - 1) {
		          	html += '</tr>';
		        }
		      });
		      $('#productTableBody').html(html);
		      }
		});
		// 검색 함수
	    function performSearch() {
	        var searchQuery = $('#searchInput').val();
	     	// 검색어를 입력하지 않았을 때 경고창 띄우기
	        if (searchQuery === '') {
                alert('품명을 입력해주세요.'); 
                return;
            }
	        $.ajax({
	            url: "${contextPath}/product/search",
	            type: "GET",
	            dataType: "json",
	            data: {
	                query: searchQuery
	            },
	            success: function(data) {
	                var productList = data;
	                var html = '';
	                productList.forEach(function(product, index) {
	                	if (index % 3 === 0) {
	    		          	html += '<tr>';
	    		        }
	    		        html += '<td>';
	    		        html += '<img src="' + product.prodThumbnail + '" class="thumbnail ' + getProductTypeClass(product.prodType) + '" data-prodno="' + product.prodNo + '">';
	    		        html += '<br>';
	    		        html += '<span class="prodName" data-prodno="' + product.prodNo + '">' + product.prodName + '</span>';
	    		        html += '<span class="prodNameEng">' + product.prodNameEng + '</span>';
	    		        html += '<span class="prodContent">' + product.prodContent + '</span>';
	    		        html += '<br>';
	    		        html += '<span class="prodType ' + getProductTypeClass(product.prodType) + '">' + product.prodType + '</span>';
	    		        html += '<span class="prodNation ' + getProductTypeClass(product.prodType) + '">' + product.prodNation + '</span>';
	    		        html += '<br>';
	    		        html += '<br>';
	    		        html += '<span class="prodPrice">' + product.prodPrice + '원' + '</span>';
	    		        html += '</td>';
	    		        if (index % 3 === 2 || index === productList.length - 1) {
	    		          	html += '</tr>';
	    		        }
	                });
	                $('#productTableBody').html(html);
	            }
	        });
	    }
	 	// 돋보기 이미지 클릭 시 검색 결과 보여주는 함수
        $('.searchImg').click(function() {
            performSearch();
        });
	    // 썸네일 클릭 시 상품 상세 페이지로 이동
	    $(document).on('click', '.thumbnail', function() {
	        var prodNo = $(this).data('prodno');
	        window.location.href = "${contextPath}/product/detail?prodNo=" + prodNo;
	    });
	
	    // 품명 클릭 시 상품 상세 페이지로 이동
	    $(document).on('click', '.productName', function() {
	        var prodNo = $(this).data('prodno');
	        window.location.href = "${contextPath}/product/detail?prodNo=" + prodNo;
	    });
	});
	
</script>
<style>
	
	/* 와인나라 폰트 적용 */
	@font-face {
		font-family: 'NotoSansKR';
		src: url('../resources/font/Noto_Sans_KR/NotoSansKR-Regular.otf') format('opentype');
	}
	body {
		font-family: 'NotoSansKR', sans-serif;
	}
	
	/* 검색창 */
	.search {
	    display: flex;
	    justify-content: center;
	    align-items: center;
	    margin-top: 20px;
	    margin-bottom: 50px;
	}
	
	input {
	    width: 760px;
	    height: 20px;
	    border: 1px solid #bbb;
	    padding: 10px 12px;
	    font-size: 14px;
	    margin-right: 5px;
	}
	
	.searchImg {
	    width: 17px;
	    margin-left: -30px; /* 추가: 돋보기 이미지를 좌측으로 이동 */
	}
	
    /* 테이블 부모 요소에 대한 css(테이블 너비는 100px로 주면서 가운데 정렬 하기 위해서) */
    .table-container {
        display: flex;
        flex-direction: column;
        align-items: center;
        margin-top: 80px;
    }

    /* 테이블 css */
    table {
        width: 100%;
        max-width: 800px; /* Adjust the max-width as needed */
        border-collapse: collapse;
        margin-bottom: 20px;
    }
    
    /* 나머지 스타일은 동일하게 유지 */
    td {
        padding: 10px;
        text-align: center;
    }
    
    /* 썸네일 이미지 */
     .thumbnail {
        width: 250px;
        height: auto;
        cursor: pointer;
        display: block;
        margin: 0 auto;
        background-color: #DFD8E9;
    }
    
    /* 레드 와인 썸네일 */
	.red {
		background-color: #DFD8E9;
		width: 250px;
        height: auto;
        cursor: pointer;
        display: block;
        margin: 0 auto;
	}
	
	/* 화이트 와인 썸네일 */
	.white {
		background-color: #F5EBA6;
		width: 250px;
        height: 250px;
        cursor: pointer;
        display: block;
        margin: 0 auto;
	}
	
	/* 로제 와인 썸네일 */
	.rose {
		background-color: #E7C3CC;
		width: 250px;
        height: 250px;
        cursor: pointer;
        display: block;
        margin: 0 auto;
	}
	
	/* 스파클링 와인 썸네일 */
	.sparkling {
		background-color: #E2EBF7;
		width: 250px;
        height: 250px;
        cursor: pointer;
        display: block;
        margin: 0 auto;
	}

    /* 품명(1줄 이상 넘어갈 시 뒤에 ...로 생략) */
    .prodName {
        cursor: pointer;
        color: #333;
        font-weight: bold;
        display: -webkit-box;
		-webkit-line-clamp: 1; /* Maximum number of lines to show */
		-webkit-box-orient: vertical;
		overflow: hidden;
		text-overflow: ellipsis;
    }
    
    /* 영문품명(1줄 이상 넘어갈 시 뒤에 ...로 생략) */
	.prodNameEng {
		display: -webkit-box;
		-webkit-line-clamp: 1; /* Maximum number of lines to show */
		-webkit-box-orient: vertical;
		overflow: hidden;
		text-overflow: ellipsis;
	}

    /* 상품설명(2줄 이상 넘어갈 시 뒤에 ...로 생략) */
	.prodContent {
        font-size: 13px;
        color: #A2A2A2;
        display: -webkit-box;
        -webkit-line-clamp: 2; /* Maximum number of lines to show */
        -webkit-box-orient: vertical;
        overflow: hidden;
        text-overflow: ellipsis;
    }
	
	/* 와인종류와 원산지(가로로 이어붙이기) */
	/* 레드 와인 */
	.prodType.red,
	.prodNation.red {
	    background-color: #DFD8E9;
	    display: inline-block;
		border-radius: 5px;
		color: #000;
		padding: 5px;
		margin-right: 5px;
		width: 60px;
		height: 18px;
	}
	
	/* 화이트 와인 */
	.prodType.white,
	.prodNation.white {
	    background-color: #F5EBA6;
	    display: inline-block;
		border-radius: 5px;
		color: #000;
		padding: 5px;
		margin-right: 5px;
		width: 60px;
		height: 18px;
	}
	
	/* 로제 와인 */
	.prodType.rose,
	.prodNation.rose {
	    background-color: #E7C3CC;
	    display: inline-block;
		border-radius: 5px;
		color: #000;
		padding: 5px;
		margin-right: 5px;
		width: 60px;
		height: 18px;
	}
	
	/* 스파클링 와인 */
	.prodType.sparkling,
	.prodNation.sparkling {
	    background-color: #E2EBF7;
	    display: inline-block;
		border-radius: 5px;
		color: #000;
		padding: 5px;
		margin-right: 5px;
		width: 60px;
		height: 18px;
	}
	
	/* 가격 */
	.prodPrice {
		font-size: 18px;
		font-weight: bold;
	}

</style>
</head>
<body>

    <div class="table-container">
    	<div class="search">
		    <input type="text" id="searchInput" placeholder="오늘 마시고 싶은 와인을 검색해 보세요." />
		    <a href="javascript:void(0);">
		        <img class="searchImg" src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png" alt="Search" />
		    </a>
		</div>
        <table>
	        <thead>
	            <tr>
	                <th></th>
	                <th></th>
	                <th></th>
	                <th></th>
	                <th></th>
	                <th></th>
	                <th></th>
	            </tr>
	        </thead>
	        <tbody id="productTableBody">
	            <!-- 상품 목록이 동적으로 추가될 자리 -->
	        </tbody>
    	</table>
    </div>
    
</body>
</html>