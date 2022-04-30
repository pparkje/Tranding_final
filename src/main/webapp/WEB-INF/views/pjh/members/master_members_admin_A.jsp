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
    	<%@ include file="../css/master_main.css" %>
    	<%@ include file="../../tranding/css/admin_admin.css" %>
    </style>
</head>

<body>
    <%@ include file="../admins/master_header_main_admin.jsp" %>
    <%@ include file="../admins/master_members_sidebar_admin.jsp" %>
    <!-- ================= 본문영역 시작 ================= -->
    <%
	request.setCharacterEncoding("UTF-8");
	Admins keyA = (Admins) session.getAttribute("keyA");
    session.setAttribute("keyA", keyA);
%>
    <div class="Main_place">
        <!-- 이 안에서 내용 작업하시면 됩니다. -->
        <div class="admin_gokek_topA_A">
			<h1 class="admin_hy_A">관리자관리</h1>
			<form method="get" action="${pageContext.request.contextPath}/pjh/members/admin_list.do">
			<label for="keyword">검색어: </label> 
				<input type="search" name="keyword" id="keyword" placeholder="관리자 아이디 검색" value="${keyword}" />
			<button type="submit">검색</button>
			</form>
		</div>
       <div class="gokek_admin">
        	<div class="gokek_admin_A">
        		<div>관리자번호</div>
        		<div>관리자이름</div>
        		<div>아이디</div>
        		<div>이메일</div>
        		<div>선택삭제</div>
        		<div></div>
        	</div>
        	<c:forEach var="i" items="${output}" varStatus="status">
        			<c:set var="a_id" value="${i.a_id}" />
						<c:if test="${keyword != ''}">
							<c:set var="mark" value="<mark>${keyword}</mark>" />
							<c:set var="a_id" value="${fn:replace(a_id, keyword, mark)}" />
						</c:if>
						<c:url value="admin_view.do" var="adminB">
							<c:param name="id" value="${i.id}" />
						</c:url>
	        		<div class="gokek_admin_B">
	        		<div>${i.id}</div>
	        		<div>${i.a_name}</div>
	        		<div>
	        			<a href="${adminB}">
	        			${a_id}
	        			</a>
	        		</div>
	        		<div>${i.a_email}</div>
	        		<div class="delete_A">
	        			<button type="button" onclick="admin_yes_no('${i.id}');">삭제</button>
			        </div>
	        		<div></div>
	        	</div>
        	</c:forEach>
        	<div class="gokek_number_pageB">
                <c:choose>
					<c:when test="${pageData.prevPage > 0}">
						<c:url value="/pjh/members/admin_list.do" var="prevPageUrl">
							<c:param name="page" value="${pageData.prevPage}" />
							<c:param name="keyword" value="${keyword}" />
						</c:url>
						<a href="${prevPageUrl}">[이전]</a>
					</c:when>
					<c:otherwise>
						[이전]
					</c:otherwise>
				</c:choose>
				<c:forEach var="i" begin="${pageData.startPage}" end="${pageData.endPage}" varStatus="status">
					<c:url value="/pjh/members/admin_list.do" var="pageUrl">
						<c:param name="page" value="${i}" />
						<c:param name="keyword" value="${keyword}" />
					</c:url>
					
					<c:choose>
						<c:when test="${pageData.nowPage == i }">
							<strong>[${i}]</strong>
						</c:when>
						
						<c:otherwise>
							<a href="${pageUrl}">[${i}]</a>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:choose>
					<c:when test="${pageData.nextPage > 0}">
						<c:url value="/pjh/members/admin_list.do" var="nextPageUrl">
							<c:param name="page" value="${pageData.nextPage}" />
							<c:param name="keyword" value="${keyword}" />
						</c:url>
						<a href="${nextPageUrl}">[다음]</a>
					</c:when>
					<c:otherwise>
						[다음]
					</c:otherwise>
				</c:choose>
            </div>
        </div>
        <!-- 이 안에서 내용 작업하시면 됩니다. -->
    </div>
    <!-- ================= 본문영역 끝 ================= -->
<script src="http://code.jQuery.com/jQuery-3.2.1.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
function admin_yes_no(ABC){
	if(confirm("관리자를 삭제하겠습니까?")){
		
		var A = '${pageContext.request.contextPath}';
		
		location.href = A +'/pjh/members/admin_delete.do?id=' + ABC;
		
	}else {
		
		alert("취소되었습니다.");
		
	}
}
</script>
</body>

</html>