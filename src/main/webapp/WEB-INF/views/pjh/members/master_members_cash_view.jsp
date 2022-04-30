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
    	<%@ include file="../../tranding/css/gokek_sujung_email.css" %>
    </style>
</head>

<body>
    <%@ include file="../admins/master_header_main_cash.jsp" %>
    <%@ include file="../admins/master_members_sidebar_jumun.jsp" %>
    <!-- ================= 본문영역 시작 ================= -->
 <%
	request.setCharacterEncoding("UTF-8");
	Admins keyAC = (Admins) session.getAttribute("keyA");
    session.setAttribute("keyA", keyAC);
%>
    <div class="Main_place">
        <!-- 이 안에서 내용 작업하시면 됩니다. -->
     <div class="sujung_emailA">
        	<div class="sujung_user_email">
        		<form action="${pageContext.request.contextPath}/pjh/members/master_cash_edit_ok.do" method="post">
        		<input type="hidden" value="${output.id}" name="id" />
        		<input type="hidden" value="${output.p_m_id}" name="p_m_id" />
        		<input type="hidden" value="${output.p_g_id}" name="p_g_id" />
        		<div class="sujung_topA">결제 확인 및 수정</div>
	        	<div class="sujung_idA">
	        		<div>계좌번호</div>
	        		<div class="sujung_idA_A">
	        			<input type="text" id="p_num" class="p_num" name="p_num"  value="${output.p_num}"/>
	        		</div>
	        	</div>
	        	<div class="sujung_email_address">
	        		<div>입금확인일시</div>
	        		<div class="sujung_email_address_A">
	        			<input type="date" id="p_inputdate" class="p_inputdate" name="p_inputdate"  value="${output.p_inputdate}"/>
	        		</div>
	        	</div>
	        	<div class="sujung_idA">
	        		<div>사용포인트</div>
	        		<div class="sujung_idA_A">
	        			<input type="number" id="p_point_a" class="p_point_a" name="p_point_a" value="${output.p_point_a}" />
	        		</div>
	        	</div>
	        	<div class="sujung_idA">
	        		<div>결제취소/환불액</div>
	        		<div class="sujung_idA_A">
	        			<input type="number" id="p_cancle_money" class="p_cancle_money" name="p_cancle_money"  value="${output.p_cancle_money}" />
	        		</div>
	        	</div>
	        	<div class="sujung_idA">
	        		<div>배송비</div>
	        		<div class="sujung_idA_A">
	        			<input type="number" id="p_smoney" class="p_smoney" name="p_smoney" value="${output.p_smoney}" />
	        		</div>
	        	</div>
	        	<div class="sujung_subject">
	        		<div>결제메모</div>
	        		<div class="sujung_subject_A">
	        			<input type="text" id="p_memo" class="p_memo" name="p_memo"  value="${output.p_memo}" />
	        		</div>
	        	</div><div class="sujung_idA">
	        		<div>결제은행</div>
	        		<div class="sujung_idA_A">
	        			<input type="text" id="p_bank"  class="p_bank" name="p_bank"  value="${output.p_bank}" />
	        		</div>
	        	</div>
	        	<div class="sujung_subject">
	        		<div>결제수단</div>
	        		<div class="sujung_subject_A">
	        			<input type="text" id="p_pay" class="p_pay" name="p_pay"  value="${output.p_pay}" />
	        		</div>
	        	</div>
	        	<div class="sujung_idA">
	        		<div>입금자</div>
	        		<div class="sujung_idA_A">
	        			<input type="text" id="p_pay_name" class="p_pay_name" name="p_pay_name" value="${output.p_pay_name}" />
	        		</div>
	        	</div>
	        	<div class="sujung_idA">
	        		<div>총입금액</div>
	        		<div class="sujung_idA_A">
	        			<input type="number" id="p_all_money" class="p_all_money" name="p_all_money"  value="${output.p_all_money}" />
	        		</div>
	        	</div>
	        	<div class="sujung_idA">
	        		<div>결제여부</div>
	        		<div class="sujung_idA_A">
	        			<input type="text" id="p_pay_yes" class="p_pay_yes" name="p_pay_yes" value="${output.p_pay_yes}" />
	        		</div>
	        	</div>
	        	<div class="sujung_idA">
	        		<div>환불여부</div>
	        		<div class="sujung_idA_A">
	        			<input type="text" id="p_cancle" class="p_cancle" name="p_cancle"  value="${output.p_cancle}" />
	        		</div>
	        	</div>
	        	<div class="sujung_idA">
	        		<div>주문번호</div>
	        		<div class="sujung_idA_A">
	        			<input type="number" id="p_o_id" class="p_o_id" name="p_o_id"  value="${output.p_o_id}" />
	        		</div>
	        	</div>
	        	<div class="sujung_clearA">
	        		<button type="submit">완료</button>
	        	</div>
	        	</form>
        	</div>
        </div>
        <!-- 이 안에서 내용 작업하시면 됩니다. -->
    </div>
    <!-- ================= 본문영역 끝 ================= -->
<script src="http://code.jQuery.com/jQuery-3.2.1.min.js"></script>
<script>
    
</script>
</body>

</html>