<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html>

<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
    <title>Tranding</title>
    <style type="text/css">
    	<%@ include file="../css/master_sidebar.css" %>
	</style>
</head>

<body>
	<!-- sidebar -->
    <div class="sidebar_place pull-left">
        <div class="sidebar_icon_place pull-left">
            <a href="javascript:void(0);" >
                <img class="sidebar_icon" src="${pageContext.request.contextPath }/tranding/img/master_sidebar_icon1.png" />
            </a>
            <a href="javascript:void(0);" >
                <img class="sidebar_icon" src="${pageContext.request.contextPath }/tranding/img/master_sidebar_icon2.png" />
            </a>
            <a href="javascript:void(0);" >
                <img class="sidebar_icon" src="${pageContext.request.contextPath }/tranding/img/master_sidebar_icon3.png" />
            </a>
            <a href="javascript:void(0);" >
                <img class="sidebar_icon" src="${pageContext.request.contextPath }/tranding/img/master_sidebar_icon4.png" />
            </a>
            <a href="javascript:void(0);" >
                <img class="sidebar_icon" src="${pageContext.request.contextPath }/tranding/img/master_sidebar_icon5.png" />
            </a>
        </div>
        <div class="sidebar_text_place pull-left">
            <div class="sidebar_text_place2">
                <h3>회원관리</h3>
                <ul>
                    <li><a href="javascript:void(0);" >회원관리</a></li>
                    <li><a href="javascript:void(0);" >회원 이메일 관리</a></li>
                    <li><a href="javascript:void(0);" >포인트(D머니)관리</a></li>
                </ul>
            </div>
        </div>
    </div>
    <!-- sidebar -->
    <script src="http://code.jQuery.com/jQuery-3.2.1.min.js"></script>
    <script type="text/javascript">
    </script>
</body>

</html>