<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="header.jsp" %>
<%@ include file="fortest.jsp" %>
<%@ include file="imgSlide.jsp" %>
<%@ include file="imgSlide2.jsp" %>

<html>

<head>
    <meta charset="UTF-8" />
    <title>Trending Official Page</title>
    <!-- CSS 참조 -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/plugins/slick/slick-theme.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/plugins/slick/slick.css" />
    <link rel="stylesheet" type="text/css" href="css/footer.css" />
	<script src="https://use.fontawesome.com/70ab4d52b6.js"></script>
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
    		min-height:1300px;
    		width: 1440px;
    		margin: auto;
    		
    	}


    	.list {
    		height: 507px;
    		margin-top: 66px;
    		padding: 5px 195px 0 195px;
    		 
    	}
    	.prodwrap {
    	 display: inline-block;
    	 float: left;
    	 width: 151px;
    	 height: 327px;
    	 margin-right: 24px;
    	 background-color:  #eeeeee;
    	}
		.prodwrap img {
		width: 151px;
		}
		.load {
		height: 80px;
		width: 700px;
		margin: auto;
		text-align: center;
		line-height: 80px;
		border-top: 1px solid #BDBDBD;
		border-bottom: 1px solid #BDBDBD;
		margin-top: 80px;
		margin-bottom: 80px;
		}
    	
    
    </style>
</head>

<body>

   
 <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
   	<!-- 플러그인 JS 참조 -->
	
	<script src="${pageContext.request.contextPath}/plugins/slick/slick.min.js" type="text/javascript" charset="utf-8"></script>
     <script>
    $(function() {
        $(function() {
            $('#imgslide').slick({
        		autoplay : true,
        		dots: true,
        		speed : 300 /* 이미지가 슬라이딩시 걸리는 시간 */,
        		infinite: true,
        		autoplaySpeed: 3000 /* 이미지가 다른 이미지로 넘어 갈때의 텀 */,
        		arrows: true,
       			slidesToShow:6,
        		slidesToScroll:6,
        		fade: false
            });
        });
    </script>
</body>

</html>