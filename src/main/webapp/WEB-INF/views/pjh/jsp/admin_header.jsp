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
    <!-- header -->
    <div class="top_box1">
        <span class="box1_top">
            <a href="javascript:void(0);" >
                <div class="box1_text">ADMIN</div>
            </a>
            <a href="javascript:void(0);" >
                <div class="home_img"><img src="${pageContext.request.contextPath }/tranding/img/k_home.png"></div>
            </a>
            <select class="drop_out" name="drop_out">
                <option vlaue="master_rogout">${output.a_id}</option>
            </select>
        </span>
    </div>
    <div class="top_box2">
        <div class="title_and_button clearfix">
            <span class="title_text pull-left">회원관리</span>
            <div class="button_place pull-left">
                <button class="button_property1 button_a1" type="button">상품등록</button>
                <button class="button_property2 button_a2" type="button">상품일괄등록</button>
                <button class="button_property2 button_a3" type="button">선택수정</button>
                <button class="button_property2 button_a4" type="button">선택삭제</button>
            </div>
        </div>
    </div>
    <!-- header -->
    <script src="http://code.jQuery.com/jQuery-3.2.1.min.js"></script>
    <script type="text/javascript">
    </script>
</body>

</html>