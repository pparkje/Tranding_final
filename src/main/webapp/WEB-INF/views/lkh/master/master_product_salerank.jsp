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
    	<%@ include file="../css/master_product_salerank.css" %>
    </style>
</head>

<body>
    <%@ include file="../jsp/master_header_salerank.jsp" %>
    <%@ include file="../jsp/master_product_sidebar.jsp" %>
    <!-- ================= 본문영역 시작 ================= -->
                    <%
	request.setCharacterEncoding("UTF-8");
	Admins keyB_F = (Admins) session.getAttribute("keyA");
    session.setAttribute("keyA", keyB_F);
%>
    <div class="Main_place">
        <!-- 이 안에서 내용 작업하시면 됩니다. -->
        
        <div class="main_place1 clearfix">
            <button type="button" class="button_property3 pull-left">전체목록</button>
            <div class="count_name pull-left">
                등록상품
            </div>
            <div class="count_product pull-left">
                00건
            </div>
        </div>
        <div class="main_place2">
            <form name="product_form">
                <select class="total_classification1">
                    <option value="">전체분류</option>
                    <option value="man">남자</option>
                    <option value="woman">여자</option>
                </select>
                <select class="total_classification2">
                    <option value="">전체분류</option>
                    <option value="cloth">의류</option>
                    <option value="bag">가방</option>
                    <option value="accessories">액세서리</option>
                    <option value="shoes">신발</option>
                </select>
                기간설정 <input class="input_date" type="date" /> 에서 <input class="input_date" type="date" /> 까지
                <button class="search_button" type="submit">검색</button>
            </form>
        </div>
        <div class="main_place4">
            판매량을 합산하여 상품판매순위를 집계합니다.
        </div>
        <div class="main_place3">
            <table border="1" width="80%">
                <thead>
                    <tr>
                        <th width="70px" height="30px">순위</th>
                        <th>상품명</th>
                        <th width="70px">주문</th>
                        <th width="70px">입금</th>
                        <th width="70px">준비</th>
                        <th width="70px">배송</th>
                        <th width="70px">완료</th>
                        <th width="70px">취소</th>
                        <th width="70px">반품</th>
                        <th width="70px">품절</th>
                        <th width="70px">합계</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td width="70px" height="60px" align="center">1</td>
                        <td>
                            <div class="img_box">
                                <img src="${pageContext.request.contextPath }/tranding/img/iconB.PNG">
                            </div>
                            TH-블랙 체크 셔츠
                        </td>
                        <td width="70px" align="center">00</td>
                        <td width="70px" align="center">00</td>
                        <td width="70px" align="center">00</td>
                        <td width="70px" align="center">00</td>
                        <td width="70px" align="center">00</td>
                        <td width="70px" align="center">00</td>
                        <td width="70px" align="center">00</td>
                        <td width="70px" align="center">00</td>
                        <td width="70px" align="center">00</td>
                    </tr>
                </tbody>
            </table>
        </div>
        
        
        <!-- 이 안에서 내용 작업하시면 됩니다. -->
    </div>
    <!-- ================= 본문영역 끝 ================= -->
    <script src="http://code.jQuery.com/jQuery-3.2.1.min.js"></script>
    <script type="text/javascript">
    </script>
</body>

</html>