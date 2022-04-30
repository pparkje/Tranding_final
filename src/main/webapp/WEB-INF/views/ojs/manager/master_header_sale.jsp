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
    	<%@ include file="../../tranding/css/master_header.css" %>
    	<%@ include file="../../tranding/css/master_form.css" %>
		<%@ include file="../../tranding/css/master_event.css" %>
		<%@ include file="../../tranding/css/master_sale.css" %>
		<%@ include file="../../tranding/css/master_sidebar.css" %>	
    </style>
</head>

<body>
<%@ include file="../manager/master_sidebar_event.jsp" %>
    <!-- header -->
    <div class="top_box1">
        <span class="box1_top">
            <a href="#">
                <div class="box1_text">ADMIN</div>
            </a>
            <a href="#">
                <div class="home_img"><img src="${pageContext.request.contextPath }/tranding/img/k_home.png"></div>
            </a>
            <select class="drop_out" name="drop_out">
                <option vlaue="master_info">관리자 정보</option>
                <option vlaue="master_rogout">로그아웃</option>
            </select>
        </span>
    </div>
    <div class="top_box2">
        <div class="title_and_button clearfix">
            <span class="title_text pull-left">세일상품관리</span>
            <div class="button_place pull-left">
                <button class="button_property1 button_a1" type="submit">저장</button>
                <button class="button_property2 button_a4" type="button">선택삭제</button>
                <button class="button_property2 button_a4" type="button">선택수정추가</button>
            </div>
        </div>
    </div>