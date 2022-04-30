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
    	<%@ include file="../../tranding/css/gokek_email.css" %>
    </style>
</head>

<body>
    <%@ include file="../admins/master_header_main_email.jsp" %>
    <%@ include file="../admins/master_members_sidebar.jsp" %>
    <!-- ================= 본문영역 시작 ================= -->
 <%
	request.setCharacterEncoding("UTF-8");
	Admins keyAG = (Admins) session.getAttribute("keyA");
    session.setAttribute("keyA", keyAG);
%>
    <div class="Main_place">
        <!-- 이 안에서 내용 작업하시면 됩니다. -->
        <div class="admin_gokek_topA_A">
			<h1 class="admin_hy_A">이메일관리</h1>
			<form method="get" action="${pageContext.request.contextPath}/pjh/members/email_list.do">
			<label for="keyword">검색어: </label> 
				<input type="search" name="keyword" id="keyword" placeholder="회원 아이디 검색" value="${keyword}" />
			<button type="submit">검색</button>
			</form>
		</div>
       <div class="gokek_email">
        	<div class="gokek_email_A">
        		<div>번호</div>
        		<div>보낼회원</div>
        		<div>이메일 제목</div>
        		<div>이메일 내용</div>
        		<div>작성날짜</div>
        		<div>보낸날짜</div>
        		<div>비밀번호 인증키</div>
        		<div>선택삭제</div>
        		<div></div>
        	</div>
        	<c:forEach var="i" items="${output}" varStatus="status">
        			<c:set var="e_men" value="${i.e_men}" />
						<c:if test="${keyword != ''}">
							<c:set var="mark" value="<mark>${keyword}</mark>" />
							<c:set var="e_men" value="${fn:replace(e_men, keyword, mark)}" />
						</c:if>
						<c:url value="/pjh/members/email_view.do" var="hwak">
							<c:param name="id" value="${i.id}" />
						</c:url>
	        		<div class="gokek_email_B">
	        		<div>${i.id}</div>
	        		<div>
	        			<a href="${hwak}">
	        			${e_men}
	        			</a>
	        		</div>
	        		<div>${i.e_sub}</div>
	        		<div>${i.e_cont}</div>
	        		<div>${i.e_wdate}</div>
	        		<div>${i.e_sdate}</div>
	        		<div>${i.e_passcode}</div>
	        		<div class="delete_A">
	        			<button type="button" onclick="email_yes_no('${i.id}');">삭제</button>
			        </div>
	        		<div></div>
	        	</div>
        	</c:forEach>
        	<div class="gokek_number_pageB">
                <c:choose>
					<c:when test="${pageData.prevPage > 0}">
						<c:url value="/pjh/members/email_list.do" var="prevPageUrl">
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
					<c:url value="/pjh/members/email_list.do" var="pageUrl">
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
						<c:url value="/pjh/members/email_list.do" var="nextPageUrl">
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
function email_yes_no(ABC){
	if(confirm("이메일 내역을 삭제하겠습니까?")){
		
		var A = '${pageContext.request.contextPath}';
		
		location.href = A +'/pjh/members/email_delete.do?id=' + ABC;
		
	}else {
		
		alert("취소되었습니다.");
		
	}
}
</script>
</body>

</html>