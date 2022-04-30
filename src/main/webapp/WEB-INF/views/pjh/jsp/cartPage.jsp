<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="header.jsp" %>

<%@ page import="study.spring.trspring.model.Goods"%>
<%@ page import="study.spring.trspring.model.Members"%>
<%@ page import="study.spring.trspring.model.Basket"%>
<!doctype html>
<html>

<head>
    <meta charset="UTF-8" />
   <title>Trending Official Page</title>
  	<style type="text/css">

    	* {
	    	margin:0;
	    	padding:0;
	    	text-decoration: none;
	    	list-style: none;
    	}
    	
    	 /** body 태그에 기본적으로 적용된 padding, margin을 off시킨다.*/
  	  body {
        padding: 0;
        margin: 0;
    	}

    /** 부모를 기준으로 크기를 갖기 때문에, body와 html에게도 크기 설정 */
	    html,
	    body {
	        width: 100%;
	        height: 100%;
	    }

    	.main_A {
    		min-height: 1100px;
    		width: 100%;
    		margin-top: 100px;
    		margin-bottom: 100px;
    		float: left;
    	}
		.title1 {
    		display: block;
			font-weight: bold;	 
			width: 1440px;
			margin: auto;
			line-height: 40px;
			height: 40px;
		}
		.title2 {
   			display:block;
   			height: 40px;
			width: 1440px;
			line-height: 40px;
			border-top: 1px solid #BDBDBD;
			border-bottom: 1px solid #BDBDBD;
			margin: auto;
			font-weight: bold;
   		}
   		/* 장바구니 목록 부분  */
   		.info { 
		   	height: 40px;
			width: 1440px;
			background-color: #eee;
			margin: auto;
		}
		
		.info li:nth-child(1) {
			display: block;
			width: 200px;
			height: 40px;
			line-height: 40px;
			float: left;
			text-align: center;
		}
		.info li:nth-child(2) {
			display: block;
			width: 500px;
			height: 40px;
			line-height: 40px;
			float: left;
			text-align: center;
		}
		.info li:nth-child(3),
		.info li:nth-child(4),
		.info li:nth-child(5) {
			display: block;
			float: left;
			width: 245px;
			height: 40px;
			line-height: 40px;
			text-align: center;
		}
		/* 장바구니 상품 부분  */
   		.infoA { 
		   	height: 100px;
			width: 1440px;
			margin: auto;
		}
		
		.infoA li:nth-child(1) {
			display: block;
			width: 200px;
			height: 100px;
			line-height: 100px;
			float: left;
			text-align: center;
		}
		.infoA li:nth-child(2) {
			display: block;
			width: 500px;
			height: 100px;
			line-height: 100px;
			border-right: 1px solid #eee;
			float: left;
			text-align: center;
		}
		.infoA ul {
			margin-top: 20px;
		}
		.cart_img {
			display:block;
			width: 80px;
			height: 80px;
			float: left;
		}
		.infoA li:nth-child(3),
		.infoA li:nth-child(4),
		.infoA li:nth-child(5) {
			display: block;
			float: left;
			width: 245px;
			height: 100px;
			line-height: 100px;
			text-align: center;
		}
		/* 상품가격부분  */
		.total {
			width: 100%;
			min-height: 250px;
			margin-bottom: 100px;
			margin-top: 200px;
		}
		.totalA {
			width: 1440px;
			height: 250px;
			margin: auto;
		}
		.total_left {
			width: 720px;
			height: 250px;
			float: left;
		}
		.textAA {
			width: 360px;
			height: 250px;
			float: left;
			background-color: #eee;
		}
		.priceAA {
			width: 360px;
			height: 250px;
			float: left;
		}
		.textAA li {
			width: 360px;
			height: 50px;
			text-align: center;
			line-height: 50px;
			font-size: 20px;
			font-weight: bold;
		}
		.priceAA li {
			width: 360px;
			height: 50px;
			text-align: center;
			line-height: 50px;
			font-size: 20px;
			font-weight: bold;
		}
		.total_right {
			width: 719px;
			height: 250px;
			float: left;
		}
    	.total_right div{
    		font-size: 30px;
    		font-weight: bold;
    		text-align: center;
    		line-height: 250px;
    	}
    	/* 주문하기 버튼  */
    	.ju_button {
    		width: 100%;
    		height: 100px;
    		margin-bottom: 100px;
    	}
    	.ju_buttonA {
    		width: 1440px;
    		height: 100px;
    		line-height: 100px;
    		margin: auto;
    		text-align: center;
    	}
		.ju_buttonA button {
			width: 300px;
			height: 70px;
			background-color: #eee;
			border: 1px solid #ccc;
		}
		
		.delete_cart button {
		width: 18px;
		height: 18px;
		background-color: #fff;
		border: 1px solid #ccc;
		}
    </style>
</head>


<body>
<div class="main_A"> 
	<form action="${pageContext.request.contextPath}/pjh/jsp/order.do" method="post" >
	<%
	Members keyC = (Members) session.getAttribute("key");
	session.setAttribute("key", keyC);
	%>
	    <div>
	    	<span class="title1">장바구니</span>
	   	</div>
		<div>
			<span class="title2">국내 배송 상품 </span>
		</div>
		<div class="info">
			<ul>
				<li><input type="checkbox" onclick="selectAll(this)" name="selectAll" value="전체"></li>
				<li>상품정보</li>
				<li>적립포인트</li>
				<li>가격</li>
				<li class="delete_cart">
					<button type="button" onclick="cart_yes_no('${key.m_id}');">X</button>
				</li>
			</ul>
		</div>
		<div class="infoA">
		<c:choose>
			<c:when test="${outputA == null || fn:length(outputA) == 0 }">
					<div>
						<div>장바구니가 비어있습니다.</div>
					</div>
			</c:when>
			<c:otherwise>
			<c:forEach var="item" items="${outputA}" varStatus="status">
						<c:url value="/pjh/jsp/cart_looking.do" var="viewUrl">
							<c:param name="id" value="${item.id}" />
							<c:param name="b_id" value="${item.b_id}" />
							<c:param name="b_g_id" value="${item.b_g_id}" />
						</c:url>
						<ul>
							<li>
								<input type="checkbox" value="${item.id}" name="check_one">
							</li>
							<li>
								<a href="${viewUrl}">
									<img src="${pageContext.request.contextPath}/views/tranding/img/${item.b_image}" class="cart_img">
									<div>${item.b_name}</div>
								</a>
							</li>
							<li>${item.b_point}</li>
							<li>${item.b_memprice}</li>
							<li class="delete_cart">
								<button type="button" onclick="cart_yes_noA(${item.id});">
								X
								</button>
							</li>
						</ul>
						</c:forEach>
					</c:otherwise>
				</c:choose>
		</div>
	<div class="total">
	<div class="totalA">
			<div class="total_left">
				<div class="textAA">
					<ul>
						<li>할인전총가격</li>
						<li>비회원할인가</li>
						<li>회원할인가</li>
						<li>총결제금액</li>
						<li>총적립포인트</li>
					</ul>
				</div>
				<div class="priceAA">
					<c:set var = "total_oriprice" value = "0" />
					<c:set var = "total_nomem_price" value = "0" />
					<c:set var = "total_mem_price" value = "0" />
					<c:set var = "total_kul" value = "0" />
					<c:set var = "total_point" value = "0" />
					<c:choose>
						<c:when test="${outputA == null || fn:length(outputA) == 0 }">
								<div>
									<div></div>
								</div>
						</c:when>
						<c:otherwise>
						<%
						
						%>
						<c:forEach var="item" items="${outputA}" varStatus="status">
							<c:set var= "total_oriprice" value="${total_oriprice + item.b_oriprice}"/>
							<c:set var= "total_nomem_price" value="${total_nomem_price + item.b_disprice}"/>
							<c:set var= "total_mem_price" value="${total_mem_price + item.b_discount}"/>
							<c:set var= "total_kul" value="${total_kul + item.b_memprice}"/>
							<c:set var= "total_point" value="${total_point + item.b_point}"/>
						</c:forEach>
						</c:otherwise>
					</c:choose>
					<ul>
						<li><c:out value="${total_oriprice}"/>&nbsp;원</li>
						<li><c:out value="${total_nomem_price}"/>&nbsp;원</li>
						<li><c:out value="${total_mem_price}"/>&nbsp;원</li>
						<li><c:out value="${total_kul}"/>&nbsp;원</li>
						<li><c:out value="${total_point}"/>&nbsp;B</li>
					</ul>
				</div>
			</div>
			<div class="total_right">
				<div>총 결제 예상 금액:&nbsp;<c:out value="${total_kul}"/>&nbsp;원</div>
			</div>
		</div>
		<div class="ju_button">
		<div class="ju_buttonA">
			<button type="submit">주문하기</button>
		</div>
	</div>
</div>
</form>
</div>
<script type="text/javascript">

function cart_yes_no(ABC){
	if(confirm("장바구니 목록 전체 삭제하겠습니까?")){
		
		var A = '${pageContext.request.contextPath}';
		
		location.href = A +'/pjh/jsp/cart_delete.do?m_id=' + ABC;
		
	}else {
		
		alert("취소되었습니다.");
		
	}
}
function cart_yes_noA(DEF){
	if(confirm("장바구니 목록을 삭제하겠습니까?")){
		
		var B = '${pageContext.request.contextPath}';
		
		location.href = B +'/pjh/jsp/cart_delete.do?id=' + DEF;
		
	}else {
		alert("취소되었습니다.");
	}
}

function selectAll(selectAll)  {
	  const checkboxes 
	     = document.querySelectorAll('input[type="checkbox"]');
	  
	  checkboxes.forEach((checkbox) => {
	    checkbox.checked = selectAll.checked
	  })
}

/* function itemSum(frm)
{
   var sum = 0;
   var count = frm.chkbox.length;
   for(var i=0; i < count; i++ ){
       if( frm.chkbox[i].checked == true ){
	    sum += parseInt(frm.chkbox[i].value);
       }
   } */

</script>
</body>
<%@ include file="footer.jsp"%>
</html>