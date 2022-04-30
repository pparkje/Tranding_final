<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="header.jsp" %>
<%@ page import="study.spring.trspring.model.Goods"%>
<%@ page import="study.spring.trspring.model.Members"%>
<!doctype html>
<html>

<head>
    <meta charset="UTF-8" />
    <title>Trending Official Page</title>
  	<style type="text/css">

    </style>

</head>

<body>
    <div class="mainAAA"> 
	    <h1>
		    <span class="title1">찜한 상품</span>
		</h1>
		<div class="prod list_A_A">
		<br/>
			<div class="prod list2" style="margin-top: 20px;">
				<ul class="fav_favA">
				<c:choose>
		        <c:when test="${output == null || fn:length(output) == 0 }">
					<div>
						<div>조회결과가 없습니다.</div>
					</div>
				</c:when>
				<c:otherwise>
				<% 
	            request.setCharacterEncoding("UTF-8");
	            Members keyD = (Members) session.getAttribute("key");
                if(keyD == null){ 
                %>
					<c:forEach var="item" items="${output}" varStatus="status">
						<c:url value="/pjh/jsp/no_looking.do" var="favpage">
							<c:param name="id" value="${item.f_goods_id}" />
						</c:url>
						<li class="fav_di">
							<a class="prodwrap_A" href="${favpage}">
								<img src="${pageContext.request.contextPath}/views/tranding/img/${item.g_image_a}">
								<div class="out_brand">${item.g_brand}</div>
								<div class="out_name">${item.g_name}</div>
								<div class="out_ori">${item.g_ori_price}</div>
								<div class="out_dis">${item.g_discount}</div>
								<div class="out_price">${item.g_price}</div>
							</a>
							<form action="${pageContext.request.contextPath}/pjh/jsp/favlogin.do" method="post" 
							onclick="login_msg()" class="fav_buA">
								<button type="submit">장바구니담기</button>
							</form>
							<c:url value="/pjh/jsp/favdelete.do" var="favpageA">
								<c:param name="id" value="${item.id}" />
							</c:url>
							<form action="${favpageA}" method="post" class="fav_buB">
								<button type="submit">삭제</button>
							</form>
						</li>
					</c:forEach>
				<%
                }else { 
                	session.setAttribute("key", keyD); 
                %>
                    <c:forEach var="item" items="${output}" varStatus="status">
						<c:url value="/pjh/jsp/looking_look.do" var="favpageB">
							<c:param name="id" value="${item.f_goods_id}" />
						</c:url>
						<li class="fav_di">
							<a class="prodwrap_A" href="${favpageB}">
								<img src="${pageContext.request.contextPath}/views/tranding/img/${item.g_image_a}">
								<div class="out_brand">${item.g_brand}</div>
								<div class="out_name">${item.g_name}</div>
								<div class="out_ori">${item.g_ori_price}</div>
								<div class="out_dis">${item.g_discount}</div>
								<div class="out_price">${item.g_price}</div>
							</a>
							<c:url value="/pjh/jsp/cartPage_add.do" var="favpageC">
								<c:param name="g_id" value="${item.f_goods_id}" />
							</c:url>
							<form action="${favpageC}" method="post" class="fav_buA">
								<button type="submit">장바구니담기</button>
							</form>
	                		<c:url value="/pjh/jsp/favdelete.do" var="favpageD">
								<c:param name="id" value="${item.id}" />
							</c:url>
							<form action="${favpageD}" method="post" class="fav_buB">
								<button type="submit">삭제</button>
							</form>
						</li>
						</c:forEach>
						<% } %>
					</c:otherwise>
	        	</c:choose>
				</ul>
			</div>
		</div>
		</div>
		
<script type="text/javascript">

function login_msg(){
	alert("로그인이 필요합니다.");
}

</script>
</body>
<%@ include file="footer.jsp" %>
</html>