<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="study.spring.trspring.model.Admins"%>
<!DOCTYPE html>
<html lang="ko">

<head>
	<meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
    <title>Tranding</title>
    <style type="text/css">
    	<%@ include file="../css/master_header.css" %>
    </style>
</head>

<body>
<%
	request.setCharacterEncoding("UTF-8");
	Admins keyC_N = (Admins) session.getAttribute("keyA");
    session.setAttribute("keyA", keyC_N);
%>
    <!-- header -->
    <div class="top_box1">
        <span class="box1_top">
            <a href="#">
                <div class="box1_text">ADMIN</div>
            </a>
            <a href="${pageContext.request.contextPath}/tranding/master_main.do">
                <div class="home_img"><img src="${pageContext.request.contextPath }/views/tranding/img/k_home.png"></div>
            </a>
            <select class="drop_out" name="drop_out">
                <option vlaue="master_info">관리자 정보</option>
                <option vlaue="master_rogout">${outputZ.a_id}</option>
            </select>
        </span>
    </div>
</body>

</html>