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
    <%@ include file="../admins/master_header_main_email.jsp" %>
    <%@ include file="../admins/master_members_sidebar.jsp" %>
    <!-- ================= 본문영역 시작 ================= -->
 <%
	request.setCharacterEncoding("UTF-8");
	Admins keyAF = (Admins) session.getAttribute("keyA");
    session.setAttribute("keyA", keyAF);
%>
    <div class="Main_place">
        <!-- 이 안에서 내용 작업하시면 됩니다. -->
     <div class="sujung_emailA">
        	<div class="sujung_user_email">
        		<form action="${pageContext.request.contextPath}/pjh/members/email_list_update_ok.do" method="post">
        		<input type="hidden" value="${output.id}" name="id" />
        		<div class="sujung_topA">이메일 내역 확인 및 수정</div>
	        	<div class="sujung_idA">
	        		<div>아이디</div>
	        		<div class="sujung_idA_A">
	        			<input type="text" id="all_or_mid" class="all_or_mid" name="all_or_mid"  value="${output.e_men}"/>
	        		</div>
	        	</div>
	        	<div class="sujung_email_address">
	        		<div>이메일 주소</div>
	        		<div class="sujung_email_address_A">
	        			<input type="text" id="email" class="email" name="email"  value="${outputA}"/>
	        		</div>
	        	</div>
	        	<div class="sujung_subject">
	        		<div>제목</div>
	        		<div class="sujung_subject_A">
	        			<input type="text" id="subject" class="subject" name="subject" value="${output.e_sub}" />
	        		</div>
	        	</div>
	        	<div class="sujung_content">
	        		<div>내용</div>
	        		<div class="sujung_content_A">
	        			<input type="text" id="cont" class="cont" name="cont"  value="${output.e_cont}" />
	        		</div>
	        	</div>
	        	<div class="sujung_subject">
	        		<div>비밀번호 인증키</div>
	        		<div class="sujung_subject_A">
	        			<input type="text" id="key_value" class="key_value" name="key_value"  value="${output.e_passcode}" />
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