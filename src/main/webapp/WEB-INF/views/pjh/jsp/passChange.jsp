<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="header.jsp" %>
<%@ page import="study.spring.trspring.model.Members"%>
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
    		min-height: 600px;
    		width: 1440px;
    		margin: auto;
    		
    	}
    	button {
    	width: 560px;
    	height: 40px;
    	background-color: #000;
    	color: #fff;
		margin-top: 20px;
		text-align: center;
		display:block;
		border: 0px;
	
		}
	    .rightDiv {
	   	font-size: 18px;
	    width: 650px;
	    height: 400px;
	    margin: auto;
	    margin-top: 100px;
	    border: 1px solid #000;
	    }
	      .rightDiv h2 {
	    margin: 30px 40px ;
	    }
	     .rightDiv input {
	 	width: 400px;
	 	height: 40px;
	  	margin-left: 10px;
	  	border: 0px solid #fff;
	  	border-bottom: 1px solid #BDBDBD;
	    }
	    .rightDiv a {
	    margin: 10px 0px 0px 435px;
	    display: block;
	    font-size: 0.8em;
	    }
	    .rightDiv form {
	    margin: 40px 0 0 45px;
	    }
	   
    </style>
</head>

<body>
<% 
request.setCharacterEncoding("UTF-8");

Members keyL = (Members) session.getAttribute("key");
session.setAttribute("key", keyL);

%>
    <div class="main wrap"> 
		<div class="rightDiv">
			<h2>비밀번호 변경</h2>
			<form action="${pageContext.request.contextPath}/pjh/jsp/passChange_ok.do">
				<input type="hidden" value="${output.id}" name="id"/>
				<input type="hidden" value="${output.m_id}" name="m_id"/>
				현재 비밀번호 <input type="password" name="m_pw">
				<br/>
				비밀번호 확인 <input type="password" name="now_m_pw">
				<br/>
				신규 비밀번호 <input type="password" name="new_m_pw">
				<br/>
				<span>
					<button type="submit">확인</button>
				</span>
				<span>
					<button type="reset" style="background-color: #BDBDBD;">다시작성</button>
				</span>
			</form>
		</div>
	</div>
</body>
<%@ include file="footer.jsp"%>
</html>