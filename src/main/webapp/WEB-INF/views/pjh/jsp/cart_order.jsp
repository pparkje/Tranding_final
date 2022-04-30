<%@page import="java.text.NumberFormat"%>
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
 
    </style>
</head>

<body>
<%
	request.setCharacterEncoding("UTF-8");
    Members key_X = (Members) session.getAttribute("key");
    session.setAttribute("key", key_X);
%>
   <div class="main wrap"> 
   <form action="${pageContext.request.contextPath}/pjh/jsp/cart_orderfin.do" method="post">
   <input type="hidden" name="members_id" value="${outputB.id}">
   
   <c:set var= "m_name" 	value="${outputB.m_name}"/>
   <c:set var= "m_phone" 	value="${outputB.m_phone}"/>
   <c:set var= "m_address" 	value="${outputB.m_address}"/>
    <h1><span class="title1">주문 / 결제</span></h1>
    <div class="box1">
    	<div class="inbox1">
		    <h2 class="besong_jungbo">배송정보*</h2>
		    <ul class="left_text_adress">
		    	<li>이름</li>
				<li>연락처</li>
				<li>주소</li>
		    </ul>
		    <ul class="right_text_adress">
		    	<li class="right_text_adressA">
		    		<input type="text" name="m_name"  value="" class="text_right_adress" id="m_name_A">
		    	</li>
				<li class="right_text_adressA">
					<input type="text" name="m_phone" value="" class="text_right_adress" id="m_phone_A">
				</li>
				<li class="right_text_adressB">
					<input type="text" name="m_address"  value="" class="text_right_adressA" id="m_address_A">
					<a href="#">주소검색</a>
				</li>
		    </ul>
		    <br/>
		    <h2 class="jumun_jungbo">주문자 정보*</h2>
			<a class="b2" style="cursor:pointer" onclick="same_jungbo();">주문자와 같음</a>
			<div class="Rtext">
				<ul class="left_text_line">
					<li>이름</li>
					<li>연락처</li>
					<li>주소</li>
				</ul>
			</div>
			<div class="Ltext">
				<ul class="right_text_line">
					<li><input type="text"  value="${outputB.m_name}" readonly="readonly" id="ABC_A" name="m_name_ori"></li>
					<li><input type="text"  value="${outputB.m_phone}" readonly="readonly" id="ABC_B" name="m_phone_ori"></li>
					<li><input type="text"  value="${outputB.m_address}" readonly="readonly" id="ABC_C" name="m_address_ori"></li>
				</ul>
			</div>
		</div>
	</div>
	
	<div class="box2">
	<div class="inbox2">
		<h2>배송 상품</h2>
		<c:choose>
		        <c:when test="${outputA == null}">
					<div>
						<div>조회결과가 없습니다. 관리자에게 문의 바랍니다.</div>
					</div>
				</c:when>
				<c:otherwise>
				<c:set var="item" value="${outputA}" />
  				<input type="hidden" name="b_g_id" value="${item.id}" />
  				<input type="hidden" name="b_id" value="${outputB.m_id}" />
			    	<span class="line"></span>
			    	<br/>
			    		<div class="pSpace">
			    		<img alt="상품이미지" src="${pageContext.request.contextPath}/views/tranding/img/${item.g_image_a}">
			    		<ul>
			    		<li>${item.g_brand}</li>
			    		<li>${item.g_name}</li>
			    		<li>단품: 1개 </li>
			    		<li>${item.g_count_memprice_price}</li>
			    		</ul>
			    		</div>	
			    	<br/>
			    	<span class="blackLine"></span>
			    	<br/>
    		</c:otherwise>
	   	</c:choose>
    	<c:set var = "total_oriprice" value = "0" />
		<c:set var = "total_nomem_price" value = "0" />
		<c:set var = "total_mem_price" value = "0" />
		<c:set var = "total_kul" value = "0" />
		<c:set var = "total_point" value = "0" />
    	<c:choose>
			<c:when test="${outputA == null}">
				<div>
					<div></div>
				</div>
			</c:when>
			<c:otherwise>
					<c:set var= "total_oriprice" value="${total_oriprice + item.g_count_oriprice}"/>
					<c:set var= "total_nomem_price" value="${total_nomem_price + item.g_count_price}"/>
					<c:set var= "total_mem_price" value="${total_mem_price + item.g_count_memprice}"/>
					<c:set var= "total_kul" value="${total_kul + item.g_count_memprice_price}"/>
					<c:set var= "total_point" value="${total_point + item.g_point}"/>
					<c:set var= "total_kul_fin" value="${total_kul + outputC.a_add_money}"/>
			</c:otherwise>
		</c:choose>
		
    	
    	<c:set var="jeju" value="${outputB.m_address}"/>
    	<c:choose>
	    	<c:when test="${ !(fn:contains(jeju, '제주'))  }">
	    	<span class="txt1"> 상품 <c:out value="${total_kul}"/>&nbsp;원 + 배송비 0원</span>
	    	</c:when>
	    	
	    	<c:otherwise>
	    	<input type="hidden" name="delivery" value="${outputC.a_add_money}" />
	    	<span class="txt1"> 상품 <c:out value="${total_kul}"/>&nbsp;원 + 배송비 ${outputC.a_add_money}원</span>
	    	</c:otherwise>
    	</c:choose>
    	
    	<br/>
    	
    	<span class="txt2">합계 <c:out value="${total_kul}"/>&nbsp;원</span>
    	
    </div>
  </div>  
    
    <div class="box3">
       	<div class="inbox3">
        <h2>결제수단*</h2>
    	
    	<br/>
    	<span class="line" style="margin-top: -20px;"></span>
    	<br/>
    	
    	<input type="radio" name="pay_info" value="무통장입금" />&nbsp;무통장입금
   		<br/>
    	<input type="radio" name="pay_info" value="신용카드, 에스크로 계좌이체, 삼성페이" />&nbsp;신용카드, 에스크로 계좌이체, 삼성페이
    	<br/>
    	<input type="radio" name="pay_info" value="네이버페이"/>&nbsp;네이버페이
  		
    	</div>
    </div>
    
    
    <div class="box5">
    	<div class="box5_A">
    		<div class="kul_je_A">결제 금액</div>
	    	<div class="inbox5">
	    		<ul>
	    			<li>총 상품 금액</li>
	    			<li>배송비</li>
	    			<li>총 상품 할인금액</li>
	    			<li>D머니 적립</li>
	    			<li>총 결제 예상 금액</li>
	    		</ul>
	    	</div>
	    	<div class="inbox6">
		    	<ul>
		    		<li><c:out value="${total_kul}"/>&nbsp;원</li>
		    		
		    		<c:choose>
			    		<c:when test="${ !(fn:contains(jeju, '제주'))  }">
			    			<li>0 원</li>
			    		</c:when>
			    		<c:otherwise>
			    			<li>${outputC.a_add_money} 원</li>
			    		</c:otherwise>
			    	</c:choose>
		    		<li><c:out value="${total_mem_price}"/>&nbsp;원</li>
		    		<li><c:out value="${total_point}"/>&nbsp;D</li>
		    		<c:choose>
			    		<c:when test="${ !(fn:contains(jeju, '제주'))  }">
			    			<li><c:out value="${total_kul}"/>&nbsp;원</li>
			    		</c:when>
			    		<c:otherwise>
			    			<li><c:out value="${total_kul_fin}"/>&nbsp;원</li>
			    		</c:otherwise>
			    	</c:choose>
		    		
		    	</ul>
	    	</div>
    	</div>
	</div>	
	<input type="hidden" name="total_mem_price" value="${total_mem_price}" />
	<input type="hidden" name="total_point" value="${total_point}" />
	<c:choose>
	<c:when test="${ !(fn:contains(jeju, '제주'))  }">
		<input type="hidden" name="total_kul" value="${total_kul}" />
	</c:when>
	<c:otherwise>
		<input type="hidden" name="total_kul" value="${total_kul_fin}" />
	</c:otherwise>
	</c:choose>
	<div class="btn_fin_A">
		<a href="#"><button type="submit" class="Orderfin">주문 완료하기</button></a>
	</div>
	
</form>
</div>
<script type="text/javascript">

function same_jungbo(){
	var m_nameA = document.getElementById("ABC_A").value;
	var m_phoneA = document.getElementById("ABC_B").value;
	var m_addressA = document.getElementById("ABC_C").value;
	
	document.getElementById("m_name_A").innerText = m_nameA;
	document.getElementById("m_phone_A").innerText = m_phoneA;
	document.getElementById("m_address_A").innerText = m_addressA;
	
	document.getElementById("m_name_A").value = m_nameA;
	document.getElementById("m_phone_A").value = m_phoneA;
	document.getElementById("m_address_A").value = m_addressA;
	
}


</script>
</body>
<%@ include file="footer.jsp"%>
</html>