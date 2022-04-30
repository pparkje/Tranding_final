<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="header.jsp"%>
<style type="text/css">
.eventcontents h1{
	width:100%;
	text-align: center;
	font-size: 50px;
	margin-bottom:50px;
	margin-top:50px;
}


.text {
	margin-left:200px;
	margin-right:200px;
	margin-top: 50px;
	margin-bottom: 50px;
	text-align: center;
}
.eventmain_btn{
    display: block;
    width: 250px;
    height: 40px;
    text-align: center;
    font-weight: bold;
    line-height: 40px;
    border: 1px solid black;

    margin: auto;
    margin-bottom: 40px;
}
</style>
<div class="eventcontents">
	<h1>${output.n_subject}</h1>
	
	<div class="eventcontents_main">
		<img alt="이벤트이미지" style="position: relative; left: 29.5em; width:1000px; height:600px;" src="${pageContext.request.contextPath}/views/tranding/img/${output.n_image}">
		<div class="text">
			${output.n_cont}
		</div>
		<div class="text">
			${output.n_term1}&nbsp;~&nbsp;${output.n_term2}
		</div>
	</div>
	<div class="eventmain_btn">
	<a href="${pageContext.request.contextPath}/pjh/jsp/event.do">이벤트 메인으로</a>
	</div>
</div>
<%@ include file="footer.jsp"%>