<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="header.jsp" %>
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
Members keyF = (Members) session.getAttribute("key");
session.setAttribute("key", keyF);
%>
<c:set var = "kv" value ="${kv}" />
<div class="jumun_jumun_sang">
	<div class="jumun_jumun_sang_A">
		<div class="jumun_ju_sang_A">주문상세정보</div>
		<div class="jumun_ju_sang_B">
			<a href="${pageContext.request.contextPath}/pjh/jsp/orderList.do">주문내역</a>
		</div>
		<div class="jumun_ju_sang_C">
			<ul class="jumun_ju_sang_C_A">
				<li>상품정보</li>
				<li>상품금액</li>
				<li>문의</li>
			</ul>
		</div>
		
		<c:forEach var="i" begin="0" end="${count-1}" step="1" varStatus="status" >
		<c:url value="/pjh/jsp/looking_look.do" var="look">
			<c:param name="id" value="${outputB[status.index].id}" />
		</c:url>
		<div class="jumun_ju_sang_D">
			<ul class="jumun_ju_sang_D_A">
				<li class="jumun_ju_sang_D_A_A">
					<a class="jumun_ju_sang_D_A_A_A" href="${look}">
						<img src="${pageContext.request.contextPath}/views/tranding/img/${outputB[status.index].g_image_a}">
						<div class="jumun_brand_juk_sang">
							<ul class="jumun_brand_juk_sang_A">
								<li><strong>브랜드:</strong> ${outputB[status.index].g_brand}</li>
								<li><strong>상품명:</strong> ${outputB[status.index].g_name}</li>
							</ul>
						</div>
					</a>
				</li>
				<li class="jumun_ju_sang_D_A_B">
					<div><strong>가격:</strong> ${outputB[status.index].g_count_memprice_price}</div>
					<div><strong>수량:</strong> <c:out value="${kv[outputB[status.index].id]}" />개</div>
				</li>
				<li class="jumun_ju_sang_D_A_C">
					<div><strong>고객센터:</strong> 1234-5678</div>
				</li>
			</ul>
		</div>
		</c:forEach>
		
		<div class="jumun_ju_sang_E">&nbsp;&nbsp;&nbsp;&nbsp;결제정보</div>
		<div class="jumun_ju_sang_F">
			<ul class="jumun_ju_sang_F_A">
				<li><strong>결제방법:</strong> ${outputC.p_pay}</li>
				<li><strong>주문상태:</strong> ${outputA.o_status}</li>
				<li><strong>결제계좌은행:</strong> ${outputC.p_bank}</li>
				<li><strong>결제계좌번호:</strong> ${outputC.p_num}</li>
				<li><strong>주문총금액:</strong> ${outputA.o_allprice}</li>
				<li><strong>결제금액:</strong> ${outputC.p_all_money}</li>
				<li><strong>결제일:</strong> ${outputC.p_inputdate}</li>
			</ul>
		</div>
	</div>
</div>
</body>
<%@ include file="footer.jsp"%>
</html>