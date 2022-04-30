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
</head>

<body>
	<h1>관리자</h1>
	<ul>
		<li>관리자 메인페이지 : <a href="${pageContext.request.contextPath}/tranding/master_main.do">master_main</a></li>
		
		<li>관리자 상품관리 : <a href="${pageContext.request.contextPath}/tranding/master_product_manager.do">master_product_manager</a></li>

		<li>관리자 상품문의 : <a href="${pageContext.request.contextPath}/tranding/master_product_question.do">master_product_question</a></li>
	</ul>
	
	<h1>랭크</h1>
	<ul>
		<li>랭크 페이지 : <a href="${pageContext.request.contextPath}/tranding/rank_page.do">rank_page</a></li>
		<li>베스트상품 페이지 : <a href="${pageContext.request.contextPath}/tranding/rank_best_product.do">rank_best_product</a></li>
	</ul>
	
	<h1>고객센터</h1>
	<ul>
		<li>고객센터 공지사항 페이지 : <a href="${pageContext.request.contextPath}/tranding/customer_service_notice.do">customer_service_notice</a></li>
		<li>고객센터 자주묻는질문 페이지 : <a href="${pageContext.request.contextPath}/tranding/customer_service_question.do">customer_service_question</a></li>
	</ul>
	
</body>

</html>