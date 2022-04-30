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
    	<%@ include file="../css/master_product_inventory.css" %>
    </style>
</head>

<body>
    <%@ include file="../jsp/master_header_inventory.jsp" %>
    <%@ include file="../jsp/master_product_sidebar.jsp" %>
    <!-- ================= 본문영역 시작 ================= -->
                    <%
	request.setCharacterEncoding("UTF-8");
	Admins keyB_K = (Admins) session.getAttribute("keyA");
    session.setAttribute("keyA", keyB_K);
%>
    <div class="Main_place">
        <!-- 이 안에서 내용 작업하시면 됩니다. -->
        
        <div class="main_place1 clearfix">
            <a href="${pageContext.request.contextPath}/tranding/master_product_inventory.do"><button type="button" class="button_property3 pull-left">전체목록</button></a>
            <div class="count_name pull-left">
                전체 상품
            </div>
            <div class="count_product pull-left">
                ${totalCount}건
            </div>
        </div>
        <div class="main_place2">
            <form name="product_form" method="get" action="${pageContext.request.contextPath }/tranding/master_product_inventory.do">
                <select class="total_classification1" name="g_detail_a" id="g_detail_a">
                	<option value="">전체분류</option>
                    <%-- 조회 결과에 따른 반복 처리 --%>
	    			<c:forEach var="item" items="${g_detail_a_List }" varStatus="status">
	    				<option value="${item.g_detail_a }" <c:if test="${item.g_detail_a == g_detail_a }">selected</c:if>>${item.g_detail_a }</option>
	    			</c:forEach>
                </select>
                <select class="total_classification2" name="g_detail_b" id="g_detail_b">
                	<option value="">전체분류</option>
                   	<%-- 조회 결과에 따른 반복 처리 --%>
	    			<c:forEach var="item" items="${g_detail_b_List }" varStatus="status">
	    				<option value="${item.g_detail_b }" <c:if test="${item.g_detail_b == g_detail_b }">selected</c:if>>${item.g_detail_b }</option>
	    			</c:forEach>
	            </select>
				
                <input class="search_place" type="text" name="keyword" id="keyword" value="${keyword }"/>
                <button class="search_button" type="submit">검색</button>
            </form>
        </div>
        <div class="main_place4">
            상품의 재고 수량을 확인할 수 있는 페이지입니다.
        </div>
        <div class="main_place3">
        	<table border="1" width="80%">
                <thead>
                    <tr>
                        <th width="70px" height="30px">상품코드</th>
                        <th width="80px">이미지</th>
                        <th>상품명</th>
                        <th width="70px">창고재고</th>
                        <th width="70px">주문대기</th>
                        <th width="70px">판매가격</th>
                        <th width="70px">판매</th>
                        <th width="70px">관리</th>
                    </tr>
                </thead>
                <tbody>
                	<c:choose>
	    				<%-- 조회결과가 없는 경우 --%>
	    				<c:when test="${output == null || fn:length(output) == 0}">
		    				<tr>
		    					<td colspan="8"  height="90px" align="center">조회결과가 없습니다.</td>
		    				</tr>
		    			</c:when>
		    			<%-- 조회결과가 있는 경우 --%>
		    			<c:otherwise>
		    				<%-- 조회 결과에 따라 반복 처리 --%>
		    				<c:forEach var="item" items="${output }" varStatus="status">
		    					
		    					<tr>
			                        <td width="70px" height="60px" align="center">${item.g_code }</td>
			                        <td width="70px" height="60px" align="center">
			                        	<img class="product_img" src="${pageContext.request.contextPath }/views/tranding/img/${item.g_image_a }" />
									</td>
			                        <td align="center">${item.g_name }</td>
			                        <td width="70px" align="center">${item.g_inven }</td>
			                        <td width="70px" align="center">0</td>
			                        <td width="70px" align="center">${item.g_price }</td>
			                        <td width="70px" align="center">
			                            <c:choose>
										    <c:when test="${item.g_sell == 'Y'}">
										        <h1>O</h1>
										    </c:when>
										    <c:when test="${item.g_sell == 'N'}">
										        <h1>X</h1>
										    </c:when>
										</c:choose>
			                        </td>
			                        <td width="70px" align="center">
			                            <a href="${pageContext.request.contextPath}/tranding/master_product_update.do?id=${item.id }&g_detail_a=${item.g_detail_a }&g_detail_b=${item.g_detail_b }&way=master_product_inventory"><button>수정</button></a>
			                        </td>
			                    </tr>
		    				</c:forEach>
		    			</c:otherwise>
		    		</c:choose>
                </tbody>
            </table>
            <!-- 페이지 번호 구현 -->
		    <%-- 이전 그룹에 대한 링크 --%>
		    <c:choose>
		    	<%-- 이전 그룹으로 이동 가능하다면? --%>
		    	<c:when test="${pageData.prevPage > 0 }">
		    		<%-- 이동할 URL 생성 --%>
		    		<c:url value="/tranding/master_product_inventory.do" var="prevPageUrl">
			    		<c:param name="page" value="${pageData.prevPage }" />
			    		<c:param name="keyword" value="${keyword }" />
			    		<c:param name="g_detail_a" value="${g_detail_a }" />
			    		<c:param name="g_detail_b" value="${g_detail_b }" />
			    	</c:url>
			    	<a href="${prevPageUrl }">[이전]</a>
		    	</c:when>
		    	<c:otherwise>
		    		[이전]
		    	</c:otherwise>
		    </c:choose>
		    
		    <%-- 페이지 번호 (시작 페이지 부터 끝 페이지까지 반복) --%>
		    <c:forEach var="i" begin="${pageData.startPage }" end="${pageData.endPage }" varStatus="status">
		    	<%-- 이동할 URL 생성 --%>
		    	<c:url value="/tranding/master_product_inventory.do" var="pageUrl">
		    		<c:param name="page" value="${i }" />
		    		<c:param name="keyword" value="${keyword }" />
		    		<c:param name="g_detail_a" value="${g_detail_a }" />
			    	<c:param name="g_detail_b" value="${g_detail_b }" />
		    	</c:url>
		    	
		    	<%-- 페이지 번호 출력 --%>
		    	<c:choose>
		    		<%-- 현재 머물고 있는 페이지 번호를 출력할 경우 링크 적용 안함 --%>
		    		<c:when test="${pageData.nowPage == i }">
		    			<strong>[${i }]</strong>
		    		</c:when>
		    		<%-- 나머지 페이지의 경우 링크 적용함 --%>
		    		<c:otherwise>
		    			<a href="${pageUrl }">[${i }]</a>
		    		</c:otherwise>
		    	</c:choose>
		    </c:forEach>
		    
		    <%-- 다음 그룹에 대한 링크 --%>
		    <c:choose>
		    	<%-- 다음 그룹으로 이동 가능하다면? --%>
		    	<c:when test="${pageData.nextPage > 0 }">
		    		<%-- 이동할 URL 생성 --%>
		    		<c:url value="/tranding/master_product_inventory.do" var="nextPageUrl">
		    			<c:param name="page" value="${pageData.nextPage }" />
		    			<c:param name="keyword" value="${keyword }" />
		    			<c:param name="g_detail_a" value="${g_detail_a }" />
			    		<c:param name="g_detail_b" value="${g_detail_b }" />
		    		</c:url>
		    		<a href="${nextPageUrl }">[다음]</a>
		    	</c:when>
		    	<c:otherwise>
		    		[다음]
		    	</c:otherwise>
		    </c:choose>
        </div>
        
        
        <!-- 이 안에서 내용 작업하시면 됩니다. -->
    </div>
    <!-- ================= 본문영역 끝 ================= -->
    <script src="http://code.jQuery.com/jQuery-3.2.1.min.js"></script>
    <script type="text/javascript">
    </script>
</body>

</html>