<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page import="study.spring.trspring.model.Members"%>
<!doctype html>
<html>

<head>
    <meta charset="UTF-8" />
    <title>Hello JSP</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/views/pjh/css/searchA.css" />
	<style type="text/css">
    </style>
</head>

<body>
<%
request.setCharacterEncoding("UTF-8");
Members key_ZX = (Members) session.getAttribute("key");
session.setAttribute("key", key_ZX); 
%>
	<div class="search_all">
		<div class="search_search">
			<div class="searA">
				<form method="get" action="${pageContext.request.contextPath}/pjh/jsp/search_s.do">
					<input type="search" name="search" class="search" id="search" placeholder="  검색어를 입력해주세요. ( ex)여자 구찌 가방 )"  />
					<button type="submit">
						<img src="${pageContext.request.contextPath}/views/tranding/img/icon_magnifier_black.png">
					</button>
				</form>
			</div>
		</div>
		<c:url value="/pjh/jsp/no_looking.do" var="viewUrlA">
			<c:param name="id" value="${status.index}" />
		</c:url>
		<div class="search_chu">
			<div class="search_chuA">
				<ul>
					<li>추천검색어</li>
					<c:forEach var="i" items="${outputA}" varStatus="status" >
					<c:url value="/pjh/jsp/no_looking.do" var="no_members">
						<c:param name="id" value="${i.id}" />
					</c:url>
					<c:url value="/pjh/jsp/looking.do" var="mem_look">
						<c:param name="id" value="${i.id}" />
					</c:url>
					<% 
                    	if(key_ZX == null){ 
	            	%>
					<li><a href="${no_members}">${status.index + 1}.&nbsp;${i.g_name}</a></li>
					<% }else{ 
                    	session.setAttribute("key", key_ZX);
	           	 	%>
	           	 	<li><a href="${mem_look}">${status.index + 1}.&nbsp;${i.g_name}</a></li>
	           	 	<% } %>
					</c:forEach>
				</ul>
			</div>
		</div>
		<div class="search_prev">
			<div class="search_prev_A">
				<ul>
					<li>인기검색어</li>
					<c:forEach var="j" items="${outputB}" varStatus="status" >
					<c:url value="/pjh/jsp/no_looking.do" var="no_members_A">
						<c:param name="id" value="${j.id}" />
					</c:url>
					<c:url value="/pjh/jsp/looking.do" var="mem_look_A">
						<c:param name="id" value="${j.id}" />
					</c:url>
					<% 
                    	if(key_ZX == null){ 
	            	%>
					<li><a href="${no_members_A}">${status.index + 1}.&nbsp;${j.g_name}</a></li>
					<% }else{ 
                    	session.setAttribute("key", key_ZX);
	           	 	%>
	           	 	<li><a href="${mem_look_A}">${status.index + 1}.&nbsp;${j.g_name}</a></li>
	           	 	<% } %>
					</c:forEach>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>