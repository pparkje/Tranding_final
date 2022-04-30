<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../jsp/header.jsp"%>
<!DOCTYPE html>
<html lang="ko">

<head>
	<meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
    <link rel="stylesheet" type="text/css" href="../css/rank_best_product.css" />
    <title>Tranding</title>
    <style type="text/css">
    	<%@ include file="../css/rank_best_product.css" %>
    </style>
</head>

<body>
<%
	request.setCharacterEncoding("UTF-8");
    Members keyAZX = (Members) session.getAttribute("key");
    session.setAttribute("key", keyAZX);
%>
    <div class="body">
        <div class="product_box">
            <div class="best_product">
                <span class="best_product_title">베스트 상품</span>
                <span class="text_a">상품 1위부터 25위 리스트입니다.</span>
                <div class="best_product_all">
                    <a href="${pageContext.request.contextPath}/tranding/rank_best_product.do">전체</a>
                </div>
                <div class="best_product_women">
                    <a href="${pageContext.request.contextPath}/tranding/rank_best_product.do?g_detail_a=여성">여성</a>
                </div>
                <div class="best_product_men">
                    <a href="${pageContext.request.contextPath}/tranding/rank_best_product.do?g_detail_a=남성">남성</a>
                </div>
                <div class="object_list1">
                    <div class="product_list clearfix">
                    
                    	<c:forEach var="item" items="${output}" varStatus="status" begin="0" end="24" step="1">
                    	<% 
                    	if(keyAZX == null){ 
               			%>
               			<c:url value="/pjh/jsp/no_looking.do" var="look_B_A">
							<c:param name="id" value="${item.id}" />
						</c:url>
					    	<a href="${look_B_A}">
	                            <div class="product1 pull-left">
	                                <img class="product_img" src="${pageContext.request.contextPath }/views/tranding/img/${item.g_image_a }">
	                                ${item.g_brand }<br />
	                                ${item.g_name }<br />
	                                ${item.g_price }원<br />
	                            </div>
	                        </a>
	                    <% }else{ 
                    	session.setAttribute("key", keyAZX);
	                	%>
	                	<c:url value="/pjh/jsp/looking.do" var="look_B_B">
							<c:param name="id" value="${item.id}" />
						</c:url>
							<a href="${look_B_B}">
	                            <div class="product1 pull-left">
	                                <img class="product_img" src="${pageContext.request.contextPath }/views/tranding/img/${item.g_image_a }">
	                                ${item.g_brand }<br />
	                                ${item.g_name }<br />
	                                ${item.g_price }원<br />
	                            </div>
	                        </a>
	                	<% } %>
					    </c:forEach>
					    
                    </div>
                    <div class="product_list2 clearfix">
                    
                    	<c:forEach var="item" items="${output }" varStatus="status" begin="25" end="49" step="1">
                    	<% 
                    	if(keyAZX == null){ 
               			%>
               			<c:url value="/pjh/jsp/no_looking.do" var="look_C_A">
							<c:param name="id" value="${item.id}" />
						</c:url>
					    	<a href="${look_C_A}">
	                            <div class="product2 pull-left">
	                                <img class="product_img" src="${pageContext.request.contextPath }/views/tranding/img/${item.g_image_a }">
	                                ${item.g_brand }<br />
	                                ${item.g_name }<br />
	                                ${item.g_price }원<br />
	                            </div>
	                        </a>
	                    <% }else{ 
		                session.setAttribute("key", keyAZX);
			            %>
			            <c:url value="/pjh/jsp/looking.do" var="look_C_B">
							<c:param name="id" value="${item.id}" />
						</c:url>
							<a href="${look_C_B}">
	                            <div class="product2 pull-left">
	                                <img class="product_img" src="${pageContext.request.contextPath }/views/tranding/img/${item.g_image_a }">
	                                ${item.g_brand }<br />
	                                ${item.g_name }<br />
	                                ${item.g_price }원<br />
	                            </div>
	                        </a>
	                    <% } %>
					    </c:forEach>
					    
                    </div>
                </div>
            </div>
        </div>
    	<%@ include file="../jsp/footer.jsp"%>
    </div>
        <script src="http://code.jQuery.com/jQuery-3.2.1.min.js"></script>
        <script type="text/javascript">
        <%@ include file="../js/rank_best_product.js" %>
        </script>
</body>

</html>