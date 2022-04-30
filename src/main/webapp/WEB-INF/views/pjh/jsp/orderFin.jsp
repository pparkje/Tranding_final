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
  	
    	* {
	    	margin:0;
	    	padding:0;
	    	text-decoration: none;
	    	list-style: none;
    	}
    	
    	 /** body 태그에 기본적으로 적용된 padding, margin을 off시킨다.*/
  	  body {
        padding: 0;
        margin: 0;
    	}

    /** 부모를 기준으로 크기를 갖기 때문에, body와 html에게도 크기 설정 */
	    html,
	    body {
	        width: 100%;
	        height: 100%;
	    }

    	.main {
    		min-height: 900px;
    		width: 1440px;
    		margin: auto;
    		
    	}
    	.wrap {
    	padding-top: 130px;
    	}
    	.wrap h2 {
    	text-align: center;
    	margin-bottom: 30px;
    	}
    	.wrap img {
    	display: block; 
    	 margin: auto;
    	 padding: 0 0 10px 0 ;
    	}
    	.leftText_A li {
    	text-align: right;
    	font-size: 20px;
    	margin: 20px 740px 0 0;
    	display: block;
    	font-weight: bold;
    	
    
    	}
    	.rightText_A li {
    	text-align: left;
    	font-size: 20px;
    	margin: 20px 0 0 760px;
    	display: block;
    
    	}
    	.rightText_A {
    	 margin-top: -278px;
    	 margin-left: -40px;
    	}
    	  	.rightText_A p {
    	  	display: block;
    	  	font-size: 20px;
    	  	text-align: center;
    	  	margin-top: 50px;
    	  	margin-left: 30px;
    	}
    	.div {
    	padding: 10px 0 10px 0;
    	}
    	.rig_ht_A {
    		margin-top: 55px;
    	}
    	.order_fin_btn {
    	width: 1000px;
    	height: 100px;
    	line-height: 100px;
    	text-align:center;
    	margin: auto;
    	}
    	.order_fin_btn_A {
    		width: 180px;
    		height: 60px;
    		background-color: #fff;
    		border: 1px solid #ccc;
    	}
    </style>
</head>

<body>
    <div class="main wrap">
    
    <div class="wrap">
    <h2>${ouput_Z.g_name} 외 ${outputA}건 주문이 완료되었습니다.</h2>
    <span><img src="${pageContext.request.contextPath}/views/tranding/img/${ouput_Z.g_image_a}"/></span>
    
    <div class="leftText_A">
	<ul>
		<li>주문번호</li>
		<li>주문자</li>
		<li>주문일자</li>
		<li>주문총금액</li>
		<li>입금하실 계좌</li>
		<li>예금주</li>
	</ul>
	</div>
    <div class="rightText_A">
	<ul class="rig_ht_A">
		<li>${dateA}</li>
		<li>${m_name_ori}</li>
		<li>${dateB}</li>
		<li>${comA}</li>
		<li>77-777777-7777</li>
		<li>(주) 트렌딩</li>
	</ul>
	<p> 트렌딩를 이용해 주셔서 감사합니다.<br/>
	주문 진행 상황은 마이페이지에서 조회하실 수 있습니다.</p>
	</div>
		
    </div>
    
    </div>
    <div class="order_fin_btn">
    	<form action="${pageContext.request.contextPath}/pjh/jsp/Mypage.do">
    		<%
    		Members mem = (Members) session.getAttribute("key");
    		session.setAttribute("key", mem); 
    		%>
    		<button type="submit" class="order_fin_btn_A">완료</button>
    	</form>
    </div>
</body>
<%@ include file="footer.jsp"%>
</html>