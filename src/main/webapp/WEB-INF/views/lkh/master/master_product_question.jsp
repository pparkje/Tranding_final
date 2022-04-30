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
    	<%@ include file="../css/master_question_question.css" %>
    </style>
</head>

<body>
    <%@ include file="../jsp/master_header_question.jsp" %>
    <%@ include file="../jsp/master_question_sidebar.jsp" %>
    <!-- ================= 본문영역 시작 ================= -->
                    <%
	request.setCharacterEncoding("UTF-8");
	Admins keyB_G = (Admins) session.getAttribute("keyA");
    session.setAttribute("keyA", keyB_G);
%>
    <div class="Main_place">
        <!-- 이 안에서 내용 작업하시면 됩니다. -->
        
        <div class="main_place1 clearfix">
            <a href="${pageContext.request.contextPath}/tranding/master_product_question.do"><button type="button" class="button_property3 pull-left">전체목록</button></a>
            <div class="count_name pull-left">
                전체 문의내역
            </div>
            <div class="count_product pull-left">
                ${totalCount}건
            </div>
        </div>
        <div class="main_place2">
            <form name="product_form" method="get" action="${pageContext.request.contextPath }/tranding/master_product_question.do">
                <select class="total_classification1" name="p_detail" id="p_detail">
                	<option value="">전체분류</option>
                	<option value="A" <c:if test="${p_detail == 'A' }">selected</c:if>>상품명</option>
                    <option value="B" <c:if test="${p_detail == 'B' }">selected</c:if>>닉네임</option>
                </select>
				
                <input class="search_place" type="text" name="keyword" id="keyword" value="${keyword }"/>
                <button class="search_button" type="submit">검색</button>
            </form>
        </div>
        <div class="main_place3">
            <table border="1" width="80%">
                <thead>
                    <tr>
                        <th width="70px" align="center">
                            일련번호
                        </th>
                        <th width="80px" height="60px">이미지</th>
                        <th>상품명</th>
                        <th width="250px">질문제목</th>
                        <th width="150px">닉네임</th>
                        <th width="80px">답변</th>
                        <th width="100px">관리</th>
                    </tr>
                </thead>
                <tbody>
                	<c:choose>
	    				<%-- 조회결과가 없는 경우 --%>
	    				<c:when test="${output == null || fn:length(output) == 0}">
		    				<tr>
		    					<td colspan="7"  height="90px" align="center">조회결과가 없습니다.</td>
		    				</tr>
		    			</c:when>
		    			<%-- 조회결과가 있는 경우 --%>
		    			<c:otherwise>
		    				<%-- 조회 결과에 따라 반복 처리 --%>
		    				<c:forEach var="item" items="${output }" varStatus="status">
		    					<tr>
		    						<td width="30px" height="80px" align="center">
			                            ${item.id }
			                        </td>
			                        <td width="80px" height="60px" align="center">
			                        	<img class="product_img" src="${pageContext.request.contextPath }/views/tranding/img/${item.q_image }" />
			                        </td>
			                        <td height="80px" align="center">
			                            ${item.q_pname }
			                        </td>
			                        <td width="250px" height="80px" align="center">
			                            ${item.q_subject }
			                        </td>
			                        <td width="150px" height="80px" align="center">
			                            ${item.m_username }
			                        </td>
			                        <td width="80px" height="80px" align="center">
			                        	<c:choose>
										    <c:when test="${item.q_answer_ch == 'Y'}">
										        <h1>O</h1>
										    </c:when>
										    <c:when test="${item.q_answer_ch == 'N'}">
										        <h1>X</h1>
										    </c:when>
										</c:choose>
			                        </td>
			                        <td width="100px" height="80px" align="center">
			                            <a href="${pageContext.request.contextPath}/tranding/master_product_question_insert.do?m_username=${item.m_username }&m_email=${item.m_email }&m_phone=${item.m_phone }&id=${item.id }"><button type="button" style="margin-bottom: 10px;">수정</button></a>
			                            <br />
			                            <a href="${pageContext.request.contextPath}/tranding/master_product_question_delete_ok.do?id=${item.id }"><button type="button">삭제</button></a>
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
		    		<c:url value="/tranding/master_product_question.do" var="prevPageUrl">
			    		<c:param name="page" value="${pageData.prevPage }" />
			    		<c:param name="keyword" value="${keyword }" />
			    		<c:param name="g_detail_a" value="${p_detail }" />
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
		    	<c:url value="/tranding/master_product_question.do" var="pageUrl">
		    		<c:param name="page" value="${i }" />
		    		<c:param name="keyword" value="${keyword }" />
			    	<c:param name="g_detail_a" value="${p_detail }" />
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
		    		<c:url value="/tranding/master_product_question.do" var="nextPageUrl">
		    			<c:param name="page" value="${pageData.nextPage }" />
		    			<c:param name="keyword" value="${keyword }" />
			    		<c:param name="g_detail_a" value="${p_detail }" />
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