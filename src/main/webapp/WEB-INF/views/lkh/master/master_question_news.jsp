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
    	<%@ include file="../css/master_question_news.css" %>
    </style>
</head>

<body>

    <%@ include file="../jsp/master_header_news.jsp" %>
    <%@ include file="../jsp/master_question_sidebar.jsp" %>
    <!-- ================= 본문영역 시작 ================= -->
    <div class="Main_place">
        <%
	request.setCharacterEncoding("UTF-8");
	Admins keyB_A = (Admins) session.getAttribute("keyA");
    session.setAttribute("keyA", keyB_A);
%>
        <!-- 이 안에서 내용 작업하시면 됩니다. -->
        
        <div class="main_place1 clearfix">
            <a href="${pageContext.request.contextPath}/tranding/master_question_news.do"><button type="button" class="button_property3 pull-left">전체목록</button></a>
            <div class="count_name pull-left">
                전체 소식내역
            </div>
            <div class="count_product pull-left">
                ${totalCount }건
            </div>
        </div>
        <div class="main_place2">
            <form name="product_form">
                <select class="total_classification1" name="n_group" id="n_group">
                    <option value="">전체분류</option>
                    <option value="event"<c:if test="${n_group == 'event' }">selected</c:if>>이벤트</option>
                    <option value="news"<c:if test="${n_group == 'news' }">selected</c:if>>소식</option>
                </select>
                <input class="search_place" type="text" name="keyword" id="keyword" value="${keyword }"/>
                <button class="search_button" type="submit">검색</button>
            </form>
        </div>
        <div class="main_place3">
            <table border="1" width="80%">
                <thead>
                    <tr>
                        <th width="80px">
                            소식번호
                        </th>
                        <th width="80px">이미지</th>
                        <th>제목</th>
                        <th width="230px">기간</th>
                        <th width="80px">분류</th>
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
		    						<td height="80px" align="center">
			                            ${item.id }
			                        </td>
			                        <td height="80px" align="center">
			                            <img class="product_img" src="${pageContext.request.contextPath }/views/tranding/img/${item.n_image }" />
			                        </td>
			                        <td height="80px" align="center">
			                            ${item.n_subject }
			                        </td>
			                        <td height="80px" align="center">
			                        	<c:choose>
										    <c:when test="${item.n_term1 == '무기한'}">
										        ${item.n_term1 }
										    </c:when>
										    <c:otherwise>
										        ${item.n_term1 } ~ ${item.n_term2 }
										    </c:otherwise>
										</c:choose>
			                        </td>
			                        <td height="80px" align="center">
			                            <c:choose>
										    <c:when test="${item.n_group == 'news'}">
										        소식
										    </c:when>
										    <c:when test="${item.n_group == 'event'}">
										        이벤트
										    </c:when>
										</c:choose>
			                        </td>
			                        <td height="80px" align="center">
			                            <a href="${pageContext.request.contextPath }/tranding/master_question_news_update.do?id=${item.id }"><button type="button" style="margin-bottom: 10px;">수정</button></a>
			                            <br />
			                            <a href="${pageContext.request.contextPath }/tranding/master_question_news_delete_ok.do?id=${item.id }"><button type="button">삭제</button></a>
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
		    		<c:url value="/tranding/master_question_news.do" var="prevPageUrl">
			    		<c:param name="page" value="${pageData.prevPage }" />
			    		<c:param name="keyword" value="${keyword }" />
			    		<c:param name="n_group" value="${n_group }" />
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
		    	<c:url value="/tranding/master_question_news.do" var="pageUrl">
		    		<c:param name="page" value="${i }" />
		    		<c:param name="keyword" value="${keyword }" />
			    	<c:param name="n_group" value="${n_group }" />
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
		    		<c:url value="/tranding/master_question_news.do" var="nextPageUrl">
		    			<c:param name="page" value="${pageData.nextPage }" />
		    			<c:param name="keyword" value="${keyword }" />
			    		<c:param name="n_group" value="${n_group }" />
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