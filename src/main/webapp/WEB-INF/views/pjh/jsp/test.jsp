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
	<img src="${pageContext.request.contextPath}/${output}" />
<%@ include file="footer.jsp"%>
</html>