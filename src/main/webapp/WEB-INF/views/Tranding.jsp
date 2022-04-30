<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
	<meta charset="utf-8" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css" />
</head>
<body>
<h1>
	Hello world!  
</h1>

<!-- 홈 컨트롤러로 접근하기 위한 링크 -->
<h2>HomeController</h2>
<ul>
	<li><a href="${pageContext.request.contextPath}">home 페이지</a></li>
	<li><a href="${pageContext.request.contextPath}/user_agent.do">UserAgent 확인 예제</a></li>
</ul>

<P>  The time on the server is ${serverTime}. </P>

<h2>회원관리확인용</h2>
<ul>
	<li><a href="${pageContext.request.contextPath}/pjh/members/members_list.do">확인용</a></li>
</ul>

<h2>kihun_work</h2>
<ul>
	<li><a href="${pageContext.request.contextPath}/tranding/work.do">kihun_work</a></li>
</ul>

<h2>찜확인용</h2>
<ul>
	<li><a href="${pageContext.request.contextPath}/pjh/jsp/favPagejsp.do">확인용</a></li>
</ul>

<script src="${pageContext.request.contextPath}/assets/js/script.js"></script>


</body>
</html>
