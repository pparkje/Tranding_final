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
    <title>Hello JSP</title>
    <style type="text/css">
  	
    </style>
</head>

<body>
<%
	request.setCharacterEncoding("UTF-8");
	Members keyB = (Members) session.getAttribute("key");
	session.setAttribute("key", keyB);
%>
   <div class="main wrap">
	    <div class="rap">
	   		<div class="img_rap">
	    		<img src="${pageContext.request.contextPath}/views/tranding/img/normal.png"/>
	    		<h4>안녕하세요, ${output.m_name}님.<br/>
		   	 	고객님과 트렌딩은 반가운 사이입니다.</h4>
	    	</div>
	    	<div class="text_rap">
		    	<div class="leftText">D 머니</div>
		    	<div class="rightText"><strong>${output.m_point}</strong>D</div>
			</div>
		</div>
		<div class="text_text_A">
			<a class="btn1A" href="${pageContext.request.contextPath}/pjh/jsp/logout.do">로그아웃</a>
		</div>
		<div class="menu">
			<div class="left_jumun">
				<a href="${pageContext.request.contextPath}/pjh/jsp/orderList.do">
					<img src="${pageContext.request.contextPath}/views/tranding/img/iconC.PNG" />
					<div>주문내역</div>
				</a>
			</div>
			<div class="right_jung">
			<c:url value="/pjh/jsp/sujung.do" var="sujung"></c:url>
				<a href="${sujung}">
					<img src="${pageContext.request.contextPath}/views/tranding/img/iconD.PNG" />
					<div>내정보관리</div>
				</a>
			</div>
		</div>
		<div class="line"></div>    
    	<div class="defaultName">
    		<h2> 기본 정보 </h2>
    		<ul class="fir">
    			<li>이메일</li>
    			<li>이름</li>
    			<li>연락처</li>
    		</ul>
    		<ul class="thr">
    			<li>${output.m_email}</li>
    			<li>${output.m_name}</li>
    			<li>${output.m_phone}</li>
    		</ul>
    		<ul class="sec">
    			<li>닉네임</li>
    			<li>비밀번호</li>
    			<li>수신동의</li>
    		</ul>
    		<ul class="for">
    			<li>${output.m_username}</li>
				<c:url value="/pjh/jsp/passChange.do" var="pass">
    				<c:param name="id" value="${output.id}" />
					<c:param name="m_id" value="${output.m_id}" />
				</c:url>
    			<li class="btn_A">
    				<a href="${pass}" class="btn2">
    				변경하기
    				</a>
    			</li>
    			<li>${output.m_email_agree}</li>
    		</ul>
    	</div>
		<span class="line"></span>
    	<span class="lineA"></span>
    	<div class="optional">
	    	<h2> 추가 정보 </h2>
	    		<ul class="fir1">
	    			<li>성별</li>
	    		</ul>
	    		<ul class="thr1">
					<li>${output.m_gender}</li>
	    		</ul>
	    		<ul class="sec1">
	    			<li>생년월일</li> 
	    		</ul>
	    		<ul class="for1">
	    			<li>${output.m_birthday}</li>   
	    		</ul>
	    </div>
    	<span class="line"></span>
    	<div class="btn_btn"> 
    		<c:url value="/pjh/jsp/deleteAcc.do" var="Url">
				<c:param name="id" value="${output.id}" />
				<c:param name="m_id" value="${output.m_id}" />
			</c:url>
	    	<a href="${Url}" class="btn4">
	    	트렌딩 탈퇴하기
	    	</a>
    	</div>
    </div>
</body>
<%@ include file="footer.jsp"%>
</html>