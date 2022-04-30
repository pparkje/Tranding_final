<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="header.jsp"%>
<%@ page import="study.spring.trspring.model.Members"%>

<%@ page import="study.spring.trspring.model.Goods"%>
<!doctype html>
<html>

<head>
    <meta charset="UTF-8" />
    <title>Hello JSP</title>
	<style type="text/css">
    </style>
</head>

<body>
<% 
request.setCharacterEncoding("UTF-8");

Members keyIJ = (Members) session.getAttribute("key");
session.setAttribute("key", keyIJ);

Goods goods_A = (Goods) session.getAttribute("id");
session.setAttribute("id", goods_A);
%>
<div class="admin_login_main_A">
	<div class="admin_login">
		<form method="post" action="${pageContext.request.contextPath}/pjh/jsp/admin_login_ok.do">
			<div class="admin_login_A">로그인</div>
			<div class="admin_login_B">
				<label for="m_address">아이디</label>
				<input type="text" placeholder="아이디를 입력해주세요." name="a_id" id="a_id"  />
			</div>
			<div class="admin_login_C">
				<label for="m_address">비밀번호</label>
				<input type="password" placeholder="비밀번호를 입력해주세요." name="a_pw" id="a_pw"  />
			</div>
			<div class="admin_login_D">
				<button type="submit">관리자 로그인 하기</button>
			</div>
		</form>
	</div>
</div>
<%@ include file="footer.jsp"%>
</body>
</html>