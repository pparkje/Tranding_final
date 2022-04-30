<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

	
<!doctype html>
<html>

<head>
    <meta charset="UTF-8" />
    <title>Hello JSP</title>
       <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/plugins/slick/slick-theme.css">
	 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/plugins/slick/slick.css" />
	<style type="text/css">
  	#product img {
  		height: 360px;
  		margin: auto 0 auto;
  	}
  	#ddiv {
  	margin-left: -600px;
  	}
  	    	.timedeal {
    		width: 997px;
    		height: 293px;
    		margin: 40px auto 20px ;
    	}
    	.timetxt {
    	display: block;
    	text-align: center;
    	}
    	.timeprod {
    	float: left;
    	margin-top: 30px;
    	margin-right: 20px;
    	width: 310px;
    	height: 144px;
    	background-color: #FAFAFA;
    	}
    	.timeprodimg img {
    	width: 109px;
    	display: block;
    	}
    	.bname {
    	text-overflow: ellipsis;
    	font-size: 13px;
    	display: block;
    	}
    	.brandtxt {
    	width: 135px;
    	height: 126px;
    	margin-top: 8px;
    	position: relative;
    	float: right;
    	top: -140px;
    	right: 40px;
    	  	
    	}
    	.line {
    		width: 100%;
    		height: 10px;
    		background-color: #eeeeee;
    	}
  
  	</style>
</head>

<body>

<div id="ddiv">
<div id="slider">
<div id="product">
   		<a href="${contextPath}">
	        <img src="${pageContext.request.contextPath}/tranding/img/1.jpg" style="height: 360px; " />
	    </a>
	</div>
	<div id="product">
   		<a href="${contextPath}">
	        <img src="${pageContext.request.contextPath}/tranding/img/2.jpg" style="height: 360px; " />
	    </a>
	</div>
	
	<div id="product">
   		<a href="${contextPath}">
	       <img src="${pageContext.request.contextPath}/tranding/img/3.jpg" style="height: 360px"/>
	    </a>
	</div>
		<div id="product">
   		<a href="${contextPath}">
	        <img src="${pageContext.request.contextPath}/tranding/img/4.jpg" style="height: 360px"/>
	    </a>
	</div>
		<div id="product">
   		<a href="${contextPath}">
	        <img src="${pageContext.request.contextPath}/tranding/img/5.jpg" style="height: 360px"/>
	    </a>
	</div>
	<div id="product">
   		<a href="${contextPath}">
	        <img src="${pageContext.request.contextPath}/tranding/img/6.jpg" style="height: 360px; " />
	    </a>
	</div>
	<div id="product">
   		<a href="${contextPath}">
	        <img src="${pageContext.request.contextPath}/tranding/img/7.jpg" style="height: 360px; " />
	    </a>
	</div>
</div>
</div>

    <div class= "timedeal">
    <div class="timetxt">
    	<h5>TIME DEAL</h5>
    	<h1>00 : 00 : 00</h1>
    </div>
    <div class="timeprod">
   	 	<span class="timeprodimg">
    		<img src="img/11.png">
    	</span>
    	<div class="brandtxt">
    	<span class="brand">아페쎄</span>
    	<span class="bname">메리노 울 크루넥 베이직 가디건 네이비 Marine cardigan 14053121</span>
    	<span class="price">217,280</span>
    </div>
    </div>
     <div class="timeprod">
    	<span class="timeprodimg">
    		<img src="img/11.png">
    	</span>
    	<div class="brandtxt">
    	<span class="brand">아페쎄</span>
    	<span class="bname">메리노 울 크루넥 베이직 가디건 네이비 Marine cardigan 14053121</span>
    	<span class="price">217,280</span>
    </div>
    </div>
         <div class="timeprod">
    	<span class="timeprodimg">
    		<img src="img/11.png">
    	</span>
    	<div class="brandtxt">
    	<span class="brand">아페쎄</span>
    	<span class="bname">메리노 울 크루넥 베이직 가디건 네이비 Marine cardigan 14053121</span>
    	<span class="price">217,280</span>
    </div>
    </div>
    </div>
    <div class="line"></div>
 	<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
   	<!-- 플러그인 JS 참조 -->
	
	<script src="${pageContext.request.contextPath}/plugins/slick/slick.min.js" type="text/javascript" charset="utf-8"></script>
    <script>
    $(function() {
        $('#slider').slick({
    		autoplay : true,
    		speed : 300 /* 이미지가 슬라이딩시 걸리는 시간 */,
    		infinite: true,
    		autoplaySpeed: 3000 /* 이미지가 다른 이미지로 넘어 갈때의 텀 */,
    		arrows: true,
   			slidesToShow: 1,
    		slidesToScroll: 1,
    		fade: false
        });
    });
 </script>
</body>

</html>