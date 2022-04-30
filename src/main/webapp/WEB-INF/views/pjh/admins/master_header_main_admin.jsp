<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">

<head>
	<meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
    <title>Tranding</title>
    <style type="text/css">
    	<%@ include file="../css/master_header.css" %>
    	<%@ include file="../css/header_master_admin.css" %>
    </style>
</head>

<body>
<%
	request.setCharacterEncoding("UTF-8");
	Admins keyAAA = (Admins) session.getAttribute("keyA");
    session.setAttribute("keyA", keyAAA);
%>            
    <%@ include file="master_header.jsp" %>
    
    <div class="top_box2">
        <div class="title_and_button clearfix">
            <span class="title_text pull-left">관리자관리</span>
            <div class="button_place pull-left">
                <a href="${pageContext.request.contextPath}/pjh/members/admin_list_add.do" class="a_members_list mem_button">관리자추가</a>
                <a href="${pageContext.request.contextPath}/pjh/members/admin_list.do" class="a_members_list">목록보기</a>
            </div>
        </div>
    </div>
    <!-- header -->
    <script src="http://code.jQuery.com/jQuery-3.2.1.min.js"></script>
    <script type="text/javascript">
    </script>
</body>

</html>