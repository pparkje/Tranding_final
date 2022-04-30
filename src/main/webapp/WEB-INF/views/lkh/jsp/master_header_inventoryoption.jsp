<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="study.spring.trspring.model.Admins"%>
<!DOCTYPE html>
<html lang="ko">

<head>
	<meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
    <title>Tranding</title>
    <style type="text/css">
    	<%@ include file="../css/master_header.css" %>
    </style>
</head>

<body>
 <%
	request.setCharacterEncoding("UTF-8");
	Admins keyC_C = (Admins) session.getAttribute("keyA");
    session.setAttribute("keyA", keyC_C);
%>               
    <%@ include file="../jsp/master_header.jsp" %>
    
    <div class="top_box2">
        <div class="title_and_button clearfix">
            <span class="title_text pull-left">상품옵션재고관리</span>
            <div class="button_place pull-left">
                <a href="${pageContext.request.contextPath}/tranding/master_product_inventory.do"><button class="button_property2 button_a2" type="button">상품재고관리</button></a>
                <button class="button_property2 button_a2" type="button">상품판매순위</button>
            </div>
        </div>
    </div>
    <!-- header -->
</body>

</html>