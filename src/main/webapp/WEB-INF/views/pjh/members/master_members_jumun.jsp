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
    	<%@ include file="../../tranding/css/admin_jumun.css" %>
    </style>
</head>

<body>
    <%@ include file="../admins/master_header_main_jumun.jsp" %>
    <%@ include file="../admins/master_members_sidebar_jumun.jsp" %>
    <!-- ================= 본문영역 시작 ================= -->
    <%
	request.setCharacterEncoding("UTF-8");
	Admins keyAI = (Admins) session.getAttribute("keyA");
    session.setAttribute("keyA", keyAI);
%>
    <div class="Main_place">
        <!-- 이 안에서 내용 작업하시면 됩니다. -->
        <div class="admin_gokek_topA_A">
			<h1 class="admin_hy_A">주문관리</h1>
			<form method="get" action="${pageContext.request.contextPath}/pjh/members/jumun_list.do">
			<label for="keyword">검색어: </label> 
				<input type="search" name="keyword" id="keyword" placeholder="주문자 검색" value="${keyword}" />
			<button type="submit">검색</button>
			</form>
		</div>
      	<div class="admin_jumun_main">
	       	<div class="admin_jumun_main_A">
	        	<div>주문번호</div>
		       	<div>주문자</div>
		       	<div>받는사람</div>
		       	<div>보내는사람</div>
		        <div>주문자주소</div>
		       	<div>받는사람주소</div>
		       	<div>보내는사람주소</div>
		       	<div>주문자연락처</div>
		       	<div>주문상태</div>
		       	<div>주문수량</div>
		       	<div>주문합계</div>
		       	<div>미수금</div>
		       	<div>운송장번호</div>
		       	<div>택배회사</div>
		       	<div>입금금액</div>
		       	<div>사용포인트</div>
		       	<div>주문취소여부</div>
		       	<div>주문취소금액</div>
		       	<div>배송완료일시</div>
		       	<div>수정일시</div>
		       	<div>주문자아이디</div>
		       	<div>주문날짜</div>
	        	<div>선택삭제</div>
	        </div>
	        <c:forEach var="i" items="${output}" varStatus="status">
        		<c:set var="o_orderpeople " value="${i.o_orderpeople}" />
					<c:if test="${keyword != ''}">
						<c:set var="mark" value="<mark>${keyword}</mark>" />
						<c:set var="o_orderpeople " value="${fn:replace(o_orderpeople , keyword, mark)}" />
					</c:if>
					<c:url value="jumun_view.do" var="jumunA">
						<c:param name="id" value="${i.id}" />
					</c:url>
	        	<div class="admin_jumun_main_B">
		        	<div>${i.id}</div>
			       	<div>
			       		<a href="${jumunA}">	
			       		${i.o_orderpeople}
			       		</a>
			       	</div>
			       	<div>${i.o_getpeople}</div>
			       	<div>${i.o_sendpeople}</div>
			       	<div>${i.o_orderadress}</div>
			       	<div>${i.o_getadress}</div>
			       	<div>${i.o_sendadress}</div>
			       	<div>${i.o_phone}</div>
			       	<div>${i.o_status}</div>
			       	<div>${i.o_order_count}</div>
			       	<div>${i.o_allprice}</div>
			       	<div>${i.o_not_money}</div>
			       	<div>${i.o_trans_number}</div>
			       	<div>${i.o_delivery_comp}</div>
			       	<div>${i.o_input_money}</div>
			       	<div>${i.o_point}</div>
			       	<div>${i.o_cancle}</div>
			        <div>${i.o_cancle_money}</div>
			        <div>${i.o_enddate}</div>
			        <div>${i.o_editdate}</div>
			        <div>${i.o_m_id}</div>
			        <div>${i.o_putdate}</div>
		        	<div class="delete_A">
		        		<button type="button" onclick="jumun_yes_no('${i.id}');">삭제</button>
				    </div>
	        	</div>
        	</c:forEach>
        	<div class="gokek_number_pageB">
                <c:choose>
					<c:when test="${pageData.prevPage > 0}">
						<c:url value="/pjh/members/jumun_list.do" var="prevPageUrl">
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
					<c:url value="/pjh/members/jumun_list.do" var="pageUrl">
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
						<c:url value="/pjh/members/jumun_list.do" var="nextPageUrl">
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
function jumun_yes_no(ABC){
	if(confirm("주문내역을 삭제하겠습니까?")){
		
		var A = '${pageContext.request.contextPath}';
		
		location.href = A +'/pjh/members/jumun_delete.do?id=' + ABC;
		
	}else {
		
		alert("취소되었습니다.");
		
	}
}
</script>
</body>

</html>