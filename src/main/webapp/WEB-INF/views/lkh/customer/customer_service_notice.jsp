<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../jsp/header.jsp"%>
<!doctype html>
<html>

<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
    <title>Tranding</title>
    <style type="text/css">
    	<%@ include file="../css/customer_service_notice.css" %>
    </style>
</head>

<body>
    <div class="body">
        <div class="total_place">
            <div class="text1">
                고객센터
            </div>
            <div class="customer_img_box ">
                <div class="customer_img_box_1 clearfix">
                    <img class="customer_img pull-left" src="${pageContext.request.contextPath }/views/tranding/img/customer_img.PNG">
                    <div class="customer_text1 pull-left">
                        상담 운영시간<br />
                        평일 9:00~21:00<br />
                        주말 및 공휴일 10:00~17:00
                    </div>
                </div>
            </div>
            <div class="choice_box clearfix">
                <a href="${pageContext.request.contextPath}/tranding/customer_service_question.do">
                    <div class="choice_box_4 pull-left">
                        자주 찾는 질문
                    </div>
                </a>
                <a href="${pageContext.request.contextPath}/tranding/customer_service_notice.do">
                    <div class="choice_box_3 pull-left">
                        공지사항
                    </div>
                </a>
            </div>
            <div class="notice_type_box">
				<!-- 빈공간 -->
            </div>
            <div class="notice_title_box clearfix">
                <div class="notice_title_box_1 pull-left">No</div>
                <div class="notice_title_box_2 pull-left">제목</div>
                <div class="notice_title_box_3 pull-left">기간</div>
            </div>
            <div class="notice_content_box">
                <table class="table_e" border="1">
                    <tbody>
                    	<c:choose>
		    				<%-- 조회결과가 없는 경우 --%>
		    				<c:when test="${output == null || fn:length(output) == 0}">
			    				<tr>
			    					<td colspan="3" width="900px" height="90px" align="center">조회결과가 없습니다.</td>
			    				</tr>
			    			</c:when>
			    			<%-- 조회결과가 있는 경우 --%>
			    			<c:otherwise>
			    				<%-- 조회 결과에 따라 반복 처리 --%>
			    				<c:forEach var="item" items="${output}" varStatus="status">
			    				<c:url value="/pjh/jsp/event_contents.do" var="event_cont">
									<c:param name="id" value="${item.id}" />
								</c:url>
			    					<tr>
			                            <td class="text_css1" width="100px" height="28px">${item.id }</td>
			                            <td class="text_css2" width="500px"> <a href="${event_cont}">[소식] ${item.n_subject }</a></td>
			                            <td class="text_css1" width="300px">
			                            	<c:choose>
											    <c:when test="${item.n_term1 == '무기한'}">
											        ${item.n_term1 }
											    </c:when>
											    <c:otherwise>
											        ${item.n_term1 } ~ ${item.n_term2 }
											    </c:otherwise>
											</c:choose>
			                            </td>
			                        </tr>
			    				</c:forEach>
			    			</c:otherwise>
			    		</c:choose>
                    </tbody>
                </table>
                <div class="page_number">
                    <!-- 페이지 번호 구현 -->
				    <%-- 이전 그룹에 대한 링크 --%>
				    <c:choose>
				    	<%-- 이전 그룹으로 이동 가능하다면? --%>
				    	<c:when test="${pageData.prevPage > 0 }">
				    		<%-- 이동할 URL 생성 --%>
				    		<c:url value="/tranding/customer_service_notice.do" var="prevPageUrl">
					    		<c:param name="page" value="${pageData.prevPage }" />
					    		<c:param name="keyword" value="${keyword }" />
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
				    	<c:url value="/tranding/customer_service_notice.do" var="pageUrl">
				    		<c:param name="page" value="${i }" />
				    		<c:param name="keyword" value="${keyword }" />
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
				    		<c:url value="/tranding/customer_service_notice.do" var="nextPageUrl">
				    			<c:param name="page" value="${pageData.nextPage }" />
				    			<c:param name="keyword" value="${keyword }" />
				    		</c:url>
				    		<a href="${nextPageUrl }">[다음]</a>
				    	</c:when>
				    	<c:otherwise>
				    		[다음]
				    	</c:otherwise>
				    </c:choose>
                </div>
                <div class="search_box">
                    <form method="get" action="${pageContext.request.contextPath }/tranding/customer_service_notice.do">
                        <input class="checkbox_size" type="checkbox" name="n_subject" id="n_subject" value="n_subject" checked/> 제목
                        <input class="checkbox_size" type="checkbox" name="n_cont" id="n_cont" value="n_cont"/> 내용
                        <input class="search_size" type="text" name="keyword" id="keyword" value="${keyword }" placeholder="검색" />
                        <button type="submit">검색</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <%@ include file="../jsp/footer.jsp"%>
    <script src="http://code.jQuery.com/jQuery-3.2.1.min.js"></script>
    <script type="text/javascript">
    </script>
</body>

</html>