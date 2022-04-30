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
    	<%@ include file="../css/master_product_manager.css" %>
    </style>
</head>

<body>
    
    <%@ include file="../jsp/master_product_sidebar.jsp" %>
    <%@ include file="../jsp/master_header_manager.jsp" %>
    <!-- ================= 본문영역 시작 ================= -->
                    <%
	request.setCharacterEncoding("UTF-8");
	Admins keyB_I = (Admins) session.getAttribute("keyA");
    session.setAttribute("keyA", keyB_I);
%>
    <div class="Main_place">
        <!-- 이 안에서 내용 작업하시면 됩니다. -->
        <div class="main_place1 clearfix">
            <a href="${pageContext.request.contextPath}/tranding/master_product_manager.do"><button type="button" class="button_property3 pull-left">전체목록</button></a>
            <div class="count_name pull-left">
                등록된 상품
            </div>
            <div class="count_product pull-left">
                ${totalCount}건
            </div>
        </div>
        <div class="main_place2">
            <form name="product_form" method="get" action="${pageContext.request.contextPath }/tranding/master_product_manager.do">
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
        <div class="main_place3">
            <table border="1" width="80%">
                <thead>
                    <tr>
                        <th rowspan="3" width="20px" height="90px">
                            <input class="checkbox_size" id="g_ch1" type="checkbox" />
                        </th>
                        <th rowspan="3" width="80px" height="90px">
                            상품코드
                        </th>
                        <th colspan="4" width="800px" height="30px">분류</th>
                        <th rowspan="3" width="50px" height="90px">순서</th>
                        <th rowspan="3" width="50px" height="90px">판매</th>
                        <th rowspan="3" width="50px" height="90px">조회</th>
                        <th rowspan="3" width="50px" height="90px">관리</th>
                    </tr>
                    <tr>
                        <th rowspan="2" width="80px" height="60px">이미지</th>
                        <th rowspan="2" height="60px">상품명</th>
                        <th colspan="2" width="200px" height="30px">판매가격</th>
                    </tr>
                    <tr>
                        <th width="150px" height="30px">포인트</th>
                        <th width="150px" height="30px">재고</th>
                    </tr>
                </thead>
                <tbody>
                	<c:choose>
	    				<%-- 조회결과가 없는 경우 --%>
	    				<c:when test="${output == null || fn:length(output) == 0}">
		    				<tr>
		    					<td colspan="11"  height="90px" align="center">조회결과가 없습니다.</td>
		    				</tr>
		    			</c:when>
		    			<%-- 조회결과가 있는 경우 --%>
		    			<c:otherwise>
		    				<%-- 조회 결과에 따라 반복 처리 --%>
		    				<c:forEach var="item" items="${output }" varStatus="status">
		    					<tr>
			                        <td rowspan="3" width="20px" height="90px" align="center">
			                            <input class="checkbox_size" name="g_ch" type="checkbox" value="C" />
			                        </td>
			                        <td rowspan="3" width="80px" height="90px" align="center">
			                            ${item.g_code }
			                        </td>
			                        <td colspan="4" width="800px" height="30px" align="center">
			                            ${item.g_detail_a }, ${item.g_detail_b }
			                        </td>
			                        <td rowspan="3" width="50px" height="90px" align="center">
			                            ${item.id }
			                        </td>
			                        <td rowspan="3" width="50px" height="90px" align="center">
			                            <c:choose>
										    <c:when test="${item.g_sell == 'Y'}">
										        <h1>O</h1>
										    </c:when>
										    <c:when test="${item.g_sell == 'N'}">
										        <h1>X</h1>
										    </c:when>
										</c:choose>
			                        </td>
			                        <td rowspan="3" width="50px" height="90px" align="center">${item.g_count }</td>
			                        <td rowspan="3" width="50px" height="90px" align="center">
			                            <a href="${pageContext.request.contextPath}/tranding/master_product_update.do?id=${item.id }&g_detail_a=${item.g_detail_a }&g_detail_b=${item.g_detail_b }&way=master_product_manager"><button style="margin-bottom: 7px;">수정</button></a>
			                            <br />
			                            <a href=""><button style="margin-bottom: 7px;">보기</button></a>
			                            <br />
			                            <a href="${pageContext.request.contextPath}/tranding/master_product_delete_ok.do?id=${item.id }"><button>삭제</button></a>
			                        </td>
				                </tr>
			                    <tr>
			                        <td rowspan="2" width="80px" height="60px" align="center">
			                        	<img class="product_img" src="${pageContext.request.contextPath }/views/tranding/img/${item.g_image_a }" />
			                        </td>
			                        <td rowspan="2" height="60px" align="center">
			                            ${item.g_name }
			                        </td>
			                        <td colspan="2" width="200px" height="30px" align="center">
			                            ${item.g_price }
			                        </td>
			                    </tr>
			                    <tr>
			                        <td width="150px" height="30px" align="center">
			                            ${item.g_point }
			                        </td>
			                        <td width="150px" height="30px" align="center">
			                            ${item.g_inven }
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
		    		<c:url value="/tranding/master_product_manager.do" var="prevPageUrl">
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
		    	<c:url value="/tranding/master_product_manager.do" var="pageUrl">
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
		    		<c:url value="/tranding/master_product_manager.do" var="nextPageUrl">
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
    	<%@ include file="../js/master_product_manager1.js" %>
    </script>
</body>

</html>