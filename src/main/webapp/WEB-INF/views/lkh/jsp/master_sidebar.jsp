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
    	<%@ include file="../css/master_sidebar.css" %>
	</style>
</head>

<body>
<%
	request.setCharacterEncoding("UTF-8");
	Admins keyC_Q = (Admins) session.getAttribute("keyA");
    session.setAttribute("keyA", keyC_Q);
%>
	<!-- sidebar -->
    <div class="sidebar_place pull-left">
        <div class="sidebar_icon_place pull-left">
            <a href="${pageContext.request.contextPath}/pjh/members/members_list.do">
                <img class="sidebar_icon" src="${pageContext.request.contextPath }/views/tranding/img/master_sidebar_icon1_A.png" />
            </a>
            <a href="${pageContext.request.contextPath}/tranding/master_product_manager.do">
                <img class="sidebar_icon" src="${pageContext.request.contextPath }/views/tranding/img/master_sidebar_icon2_A.png" />
            </a>
            <a href="${pageContext.request.contextPath}/pjh/members/jumun_list.do">
                <img class="sidebar_icon" src="${pageContext.request.contextPath }/views/tranding/img/master_sidebar_icon3_A.png" />
            </a>
            <a href="${pageContext.request.contextPath}/pjh/members/admin_list.do">
                <img class="sidebar_icon" src="${pageContext.request.contextPath }/views/tranding/img/master_sidebar_icon4_A.png" />
            </a>
            <a href="${pageContext.request.contextPath}/tranding/master_product_question.do">
                <img class="sidebar_icon" src="${pageContext.request.contextPath }/views/tranding/img/master_sidebar_icon5_A.png" />
            </a>
        </div>
        <div class="sidebar_text_place pull-left">
            <div class="sidebar_text_place2">
                <h3>??????</h3>
                <ul>
                    <li><a href="${pageContext.request.contextPath}/tranding/master_product_manager.do"">????????????</a></li>
                    <li><a href="${pageContext.request.contextPath}/tranding/master_product_question.do">????????????</a></li>
                    <li><a href="${pageContext.request.contextPath}/tranding/master_product_salerank.do">??????????????????</a></li>
                    <li><a href="${pageContext.request.contextPath}/tranding/master_product_inventory.do">??????????????????</a></li>
                    <li><a href="${pageContext.request.contextPath}/tranding/master_product_inventoryoption.do">????????????????????????</a></li>
                    <li><a href="${pageContext.request.contextPath}/tranding/master_product_type.do">??????????????????</a></li>
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