<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="study.spring.trspring.model.Admins"%>
<!doctype html>
<html>

<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
    <title>Tranding</title>
    <style type="text/css">
    	<%@ include file="../css/master_form.css" %>
    	<%@ include file="../css/master_main.css" %>
    	<%@ include file="../css/orderinfo.css" %>
    </style>
</head>

<body>
    <%@ include file="../admins/master_header_main_jumun.jsp" %>
    <%@ include file="../admins/master_members_sidebar_jumun.jsp" %>
    <!-- ================= 본문영역 시작 ================= -->
<%
	Admins keyAH = (Admins) session.getAttribute("keyA");
    session.setAttribute("keyA", keyAH);
%>
    <div class="Main_place">
        <!-- 이 안에서 내용 작업하시면 됩니다. -->
        <c:set var = "kv" value ="${kv}" />
		<div class="jumun_jumun_sangA_Z">
			<div class="jumun_jumun_sang_A_Z_Z">
				<div class="jumun_ju_sang_A">주문상세정보</div>
				<div class="jumun_ju_sang_B">
					<a href="${pageContext.request.contextPath}/pjh/members/jumun_list.do">주문내역</a>
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
				<div class="jumun_ju_sang_E">&nbsp;&nbsp;&nbsp;&nbsp;주문정보</div>
				<div class="jumun_ju_sang_G">
					<ul class="jumun_ju_sang_G_A">
						<li><strong>주문번호:</strong>${outputA.id}</li>
                        <li><strong>주문자:</strong>${outputA.o_orderpeople}</li>
                        <li><strong>받는사람:</strong>${outputA.o_getpeople}</li>
                        <li><strong>보내는사람:</strong>${outputA.o_sendpeople}</li>
                        <li><strong>주문자주소:</strong>${outputA.o_orderadress}</li>
                        <li><strong>받는사람주소:</strong>${outputA.o_getadress}</li>
                        <li><strong>보내는사람주소:</strong>${outputA.o_sendadress}</li>
                        <li><strong>주문자연락처:</strong>${outputA.o_phone}</li>
                        <li><strong>주문상태:</strong>${outputA.o_status}</li>
                        <li><strong>주문수량:</strong>${outputA.o_order_count}</li>
                        <li><strong>주문합계:</strong>${outputA.o_allprice}</li>
                        <li><strong>미수금:</strong>${outputA.o_not_money}</li>
                        <li><strong>운송장번호:</strong>${outputA.o_trans_number}</li>
                        <li><strong>택배회사:</strong>${outputA.o_delivery_comp}</li>
                        <li><strong>입금금액:</strong>${outputA.o_input_money}</li>
                        <li><strong>사용포인트:</strong>${outputA.o_point}</li>
                        <li><strong>주문취소여부:</strong>${outputA.o_cancle}</li>
                        <li><strong>주문취소금액:</strong>${outputA.o_cancle_money}</li>
                        <li><strong>배송완료일시:</strong>${outputA.o_enddate}</li>
                        <li><strong>수정일시:</strong>${outputA.o_editdate}</li>
                        <li><strong>주문자아이디:</strong>${outputA.o_m_id}</li>
                        <li><strong>주문날짜:</strong>${outputA.o_putdate}</li>
					</ul>
				</div>
			</div>
		</div>
		
        <!-- 이 안에서 내용 작업하시면 됩니다. -->
    </div>
    <!-- ================= 본문영역 끝 ================= -->
<script src="http://code.jQuery.com/jQuery-3.2.1.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
</script>
</body>

</html>