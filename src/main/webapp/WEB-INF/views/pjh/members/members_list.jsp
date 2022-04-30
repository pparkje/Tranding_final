
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="study.spring.trspring.model.Admins"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
    <title>Tranding</title>
    <style type="text/css">
    	<%@ include file="../css/master_formA.css" %>
    	<%@ include file="../css/gokek.css" %>
    </style>
</head>
<body>
	<%@ include file="../admins/master_header_main_members.jsp" %>
    <%@ include file="../admins/master_members_sidebar.jsp" %>
	<!-- ================= 본문영역 시작 ================= -->
	
<%
	request.setCharacterEncoding("UTF-8");
	Admins keyAM = (Admins) session.getAttribute("keyA");
   	session.setAttribute("keyA", keyAM);
%>
	<div class="Main_placeA">
	<!-- 이 안에서 내용 작업하시면 됩니다. -->
		<div class="admin_gokek_topA">
			<h1 class="admin_hy">회원관리</h1>
			<form method="get" action="${pageContext.request.contextPath}/pjh/members/members_list.do">
			<label for="keyword">검색어: </label> 
				<input type="search" name="keyword" id="keyword" placeholder="회원 이름 검색" value="${keyword}" />
			<button type="submit">검색</button>
			</form>
		</div>
		<div class="gokekA">
        	<div class="gokekA_A">
        		<div class="gokokA_checkbox">
        			<input type="checkbox" id="checkA_A" />
        		</div>
        		<div>회원번호</div>
        		<div>이름</div>
        		<div>아이디</div>
        		<div>닉네임</div>
        		<div>휴대폰번호</div>
        		<div>포인트</div>
        		<div>주소</div>
        		<div>이메일</div>
        		<div>메일수신동의</div>
        		<div>가입날짜</div>
        		<div>수정날짜</div>
        		<div>탈퇴여부</div>
        		<div>탈퇴날짜</div>
        		<div>관리</div>
        		<div>선택삭제</div>
        		<div></div>
        	</div>
        	<div class="gokekA_B">
	        	<c:choose>
		        	<c:when test="${output == null || fn:length(output) == 0 }">
						<div>
							<div>조회결과가 없습니다.</div>
						</div>
					</c:when>
					<c:otherwise>
						<c:forEach var="item" items="${output}" varStatus="status">
							<c:set var="m_name" value="${item.m_name}" />
							<c:if test="${keyword != ''}">
								<c:set var="mark" value="<mark>${keyword}</mark>" />
								<c:set var="m_name" value="${fn:replace(m_name, keyword, mark)}" />
							</c:if>
	
							<c:url value="/pjh/members/members_view.do" var="viewUrl">
								<c:param name="id" value="${item.id}" />
							</c:url>
							<div class="gokokB_checkbox">
		        				<input type="checkbox" id="checkA_B" />
			        		</div>
			        		<div class="gokek1">${item.id}</div>
			        		<div class="gokek2">${m_name}</div>
			        		<div class="gokek3">${item.m_id}</div>
			        		<div class="gokek4">${item.m_username}</div>
			        		<div class="gokek5">${item.m_phone}</div>
			        		<div class="gokek6">${item.m_point}</div>
			        		<div class="gokek7">${item.m_address}</div>
			        		<div class="gokek8">${item.m_email}</div>
			        		<div class="gokek9">${item.m_email_agree}</div>
			        		<div class="gokek10">${item.m_joindate}</div>
			        		<div class="gokek11">${item.m_modifydate}</div>
			        		<div class="gokek12">${item.m_end}</div>
			        		<div class="gokek13">${item.m_enddate}</div>
			        		<div class="sujung_A">
				        		<form action="${pageContext.request.contextPath}/pjh/members/members_sujung.do" method="get">
				        			<input type="hidden" name="id" value="${item.id}" />
				        			<button type="submit">수정</button>
			        			</form>
			        		</div>
			        		<div class="sujung_A">
				        		<button type="button" onclick="members_yes_no('${item.id}');">삭제</button>
			        		</div>
			        		<div class="gokek14"></div>
			        		<br />
						</c:forEach>
					</c:otherwise>
	        	</c:choose>
        	</div>
        	
        	<div class="gokekA_C">
				<c:choose>
					<c:when test="${pageData.prevPage > 0}">
						<c:url value="/pjh/members/members_list.do" var="prevPageUrl">
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
					<c:url value="/pjh/members/members_list.do" var="pageUrl">
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
						<c:url value="/pjh/members/members_list.do" var="nextPageUrl">
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
    <script type="text/javascript">

function members_yes_no(ABC){
	if(confirm("회원을 삭제하겠습니까?")){
		
		var A = '${pageContext.request.contextPath}';
		
		location.href = A +'/pjh/members/members_delete.do?id=' + ABC;
		
	}else {
		
		alert("취소되었습니다.");
		
	}
}


</script>
</body>

</html>