<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="study.spring.trspring.model.Admins"%>
<!doctype html>
<html>

<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
    <title>Tranding</title>
    <style type="text/css">
    	<%@ include file="../css/master_form.css" %>
    </style>
</head>

<body>
    <%@ include file="../jsp/master_header.jsp" %>
    <%@ include file="../jsp/master_product_sidebar.jsp" %>
    <!-- ================= 본문영역 시작 ================= -->
                    <%
	request.setCharacterEncoding("UTF-8");
	Admins keyB_N = (Admins) session.getAttribute("keyA");
    session.setAttribute("keyA", keyB_N);
%>
    <div class="Main_place">
        <!-- 이 안에서 내용 작업하시면 됩니다. -->
        
       	<h1>hello bye</h1>
        
        
        <!-- 이 안에서 내용 작업하시면 됩니다. -->
    </div>
    <!-- ================= 본문영역 끝 ================= -->
    <script src="http://code.jQuery.com/jQuery-3.2.1.min.js"></script>
    <script type="text/javascript">
    </script>
</body>

</html>