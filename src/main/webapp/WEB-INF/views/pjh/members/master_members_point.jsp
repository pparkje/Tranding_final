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
    	<%@ include file="../../tranding/css/admin_point.css" %>
    </style>
</head>

<body>
    <%@ include file="../admins/master_header_main_point.jsp" %>
    <%@ include file="../admins/master_members_sidebar.jsp" %>
    <!-- ================= 본문영역 시작 ================= -->
    <%
	request.setCharacterEncoding("UTF-8");
	Admins keyAJ = (Admins) session.getAttribute("keyA");
    session.setAttribute("keyA", keyAJ);
%>
    <div class="Main_place">
        <!-- 이 안에서 내용 작업하시면 됩니다. -->
        <div class="admin_gokek_topA_A">
			<h1 class="admin_hy_A">포인트관리</h1>
			<form method="get" action="${pageContext.request.contextPath}/pjh/members/members_point.do">
			<label for="keyword">검색어: </label> 
				<input type="search" name="keyword" id="keyword" placeholder="회원 아이디 검색" value="${keyword}" />
			<button type="submit">검색</button>
			</form>
		</div>
       <div class="gokek_point">
        	<div class="gokek_point_A">
        		<div>번호</div>
        		<div>회원번호</div>
        		<div>회원아이디</div>
        		<div>포인트내용</div>
        		<div>포인트</div>
        		<div>받은날짜</div>
        		<div>만료일</div>
        		<div>포인트합</div>
        		<div></div>
        	</div>
        	<c:forEach var="i" items="${output}" varStatus="status">
        			<c:set var="p_m_id" value="${i.p_m_id}" />
						<c:if test="${keyword != ''}">
							<c:set var="mark" value="<mark>${keyword}</mark>" />
							<c:set var="p_m_id" value="${fn:replace(p_m_id, keyword, mark)}" />
						</c:if>
	        		<div class="gokek_point_B">
	        		<div>${i.id}</div>
	        		<div>${i.p_mid}</div>
	        		<div>${p_m_id}</div>
	        		<div>${i.p_cont}</div>
	        		<div>${i.p_point}</div>
	        		<div>${i.p_pointdate}</div>
	        		<div>${i.p_endpoint}</div>
	        		<div>${i.p_total_point}</div>
	        		<div></div>
	        	</div>
        	</c:forEach>
        	<div class="gokek_number_pageB">
                <c:choose>
					<c:when test="${pageData.prevPage > 0}">
						<c:url value="/pjh/members/members_point.do" var="prevPageUrl">
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
					<c:url value="/pjh/members/members_point.do" var="pageUrl">
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
						<c:url value="/pjh/members/members_point.do" var="nextPageUrl">
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
        <div class="point_plus_minus">
        	<div class="point_pm">개별 회원 포인트 증감 설정</div>
        	<form action="${pageContext.request.contextPath}/pjh/members/point_plus_minus.do" method="post">
        	<div class="point_pm_A">
        		<div>회원아이디</div>
        		<div class="point_pm_text">
        			<input type="text" placeholder="회원 아이디를 입력해 주세요." name="p_m_id"/>
        		</div>
        	</div>
        	<div class="point_pm_A">
        		<div>포인트 내용</div>
        		<div class="point_pm_text">
        			<input type="text" placeholder="포인트 내용를 입력해 주세요." name="p_cont"/>
        		</div>
        	</div>
        	<div class="point_pm_A">
        		<div>포인트</div>
        		<div class="point_pm_text">
        			<input type="number" placeholder="포인트를 입력해 주세요." name="p_point"/>
        		</div>
        	</div>
        	<div class="point_pm_A">
        		<div>포인트 받은날짜</div>
        		<div class="point_pm_text">
        			<input type="date" name="p_pointdate"/>
        		</div>
        	</div>
        	<div class="point_button">
        		<button type="submit">적용</button>
        	</div>
        	</form>
        </div>
       	
        <!-- 이 안에서 내용 작업하시면 됩니다. -->
    </div>
    <!-- ================= 본문영역 끝 ================= -->
<script src="http://code.jQuery.com/jQuery-3.2.1.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function postcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    // document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('m_postcode').value = data.zonecode;
                document.getElementById('m_address').value = addr + extraAddr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('m_address_detail').focus();
            }
        }).open();
    }
</script>
</body>

</html>