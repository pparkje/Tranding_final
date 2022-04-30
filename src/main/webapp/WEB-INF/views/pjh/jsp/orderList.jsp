<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="header.jsp" %>
<%@ include file="fortest.jsp" %>
<!doctype html>
<html>

<head>
    <meta charset="UTF-8" />
   <title>Trending Official Page</title>
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

    	.main_BB {
    		min-height: 1000px;
    		width: 1440px;
    		margin: auto;
    		padding-bottom: 200px;
    	}
    	   	.bot {
	    	width: 100%;
	    	height: 361px;
	    	background-color: #eeeeee;
    	}
    	    	.list_A {
    		height: 200px;
    		border-top: 1px solid #BDBDBD;
    		border-bottom: 1px solid #BDBDBD;
    		margin: 20px 195px 0 195px;
    	}
    	.prodwrap_AB {
    	 display: inline-block;
    	 float: left;
    	 width: 151px;
    	 height: 150px;
    	 margin-right: 24px;
 
    	}
		.prodwrap_AB img {
		width: 150px;
		height: 150px;
		margin-top: -10px;
		margin-left: 5px;
		}
    	.title1 {
    		display: block;
 		   	padding: 50px 0 30px 0;
 		   	text-align: center;
 		   	margin: auto;
 		   	font-size: 25px;
 		   	width: 1050px;	   	
   		} 	

	.list2{
	 margin: 55px 0 0 0;
	}

	.list2 li input {
	margin-left: 15px;
	}

	.pSpace li {
   		margin: 10px 0  0 350px;
   		}
   		.pSpace li:nth-child(1) {
   		color: #A4A4A4;
   		font-weight: bold;
   		font-size: 0.8em;
   		}
   		.pSpace li:nth-child(2) {
   		font-weight: bold;
   		}
   		.pSpace li:nth-child(3) {
   		 color: #A4A4A4;
   		font-weight: bold;
   		font-size: 0.8em;
   		}
   		.pSpace li:nth-child(4) {
   		font-weight: bold;
   		font-size: 20px;
   		}
   		.pSpace ul {
   		width: 600px;
   		margin: 0 0 0 -150px;
   		}
   		
   		.pSpace {
   		margin: -20px;
   		border-right: 1px solid #BDBDBD;
   		width: 550px;
   		height: 130px;
   		}
   		
		.load {
		height: 80px;
		width: 700px;
		margin: auto;
		text-align: center;
		line-height: 80px;
		margin-top: 30px;
		}
  
    </style>
</head>

<body>
<% 
request.setCharacterEncoding("UTF-8");
Members keyE = (Members) session.getAttribute("key");
session.setAttribute("key", keyE);
%>
	<div class="main_BB wrap"> 
	    <h1><span class="title1">주문내역 관리</span></h1>
		<c:forEach var="i" begin="0" end="${count-1}" step="1" varStatus="status" >
		<div class="prod list_A">
			<div class="prod list2" >
				<ul>
					<li><span class="prodwrap_AB">
					<img src="${pageContext.request.contextPath}/views/tranding/img/${outputA[status.index].o_photo}">
					</span></li>
				</ul>
				<div class="pSpace">
				<ul>	
					<li>${i+1}. ${outputA[status.index].o_first_brand} 외 ${outputA[status.index].o_order_count}건</li>
					<c:url value="/pjh/jsp/orderInfo.do" var="info">
						<c:param name="o_id" value="${outputA[status.index].id}" />
					</c:url>
		    		<li><a href="${info}">${outputA[status.index].o_first_name} 외 ${outputA[status.index].o_order_count}건</a></li>
		    		<li>주문일: ${outputA[status.index].o_putdate}</li>
		    		<li>진행과정 : ${outputA[status.index].o_status} </li>
				</ul>
				<ul style="margin: -110px 0 0 450px;">
					<li>고객센터</li> 
					<li>1234-5678</li>
				</ul>
				</div>
			</div>
		</div>
		</c:forEach>
</div>
</body>
<%@ include file="footer.jsp"%>
</html>