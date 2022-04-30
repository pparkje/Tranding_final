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
    	<%@ include file="../css/sujungB.css" %>
    </style>
</head>

<body>
     <%@ include file="../admins/master_header_main_admin.jsp" %>
    <%@ include file="../admins/master_members_sidebar_admin.jsp" %>
    <!-- ================= 본문영역 시작 ================= -->
    <%
	request.setCharacterEncoding("UTF-8");
	Admins keyAB = (Admins) session.getAttribute("keyA");
    session.setAttribute("keyA", keyAB);
%>
    <div class="Main_place">
        <!-- 이 안에서 내용 작업하시면 됩니다. -->
        <div class="sujung_suA">
        	<div class="sujung_userA">
        		<div class="sujung_topA">관리자 확인 및 수정</div>
        		<form action="${pageContext.request.contextPath}/pjh/members/master_admin_edit_ok.do" method="post">
        		<input type="hidden" value="${output.id}" name="id">
        		<input type="hidden" value="${output.a_id}" name="a_id_A">
        		<div class="sujung_nameA">
	        		<div>이름</div>
	        		<div class="sujung_name_AA">
	        			<input type="text" name="a_name" value="${output.a_name}" />
	        		</div>
	        	</div>
	        	<div class="sujung_idA">
	        		<div>아이디</div>
	        		<div class="sujung_id_AA">
	        			<input type="text" name="a_id" value="${output.a_id}"  />
	        		</div>
	        	</div>
	        	<div class="sujung_nickA">
	        		<div>비밀번호</div>
	        		<div class="sujung_nick_AA">
	        			<input type="password" name="a_pw" placeholder="확인용 비밀 번호 입력해 주세요."  />
	        		</div>
	        	</div>
	        	<div class="sujung_phoneA">
	        		<div>이메일</div>
	        		<div class="sujung_phone_AA">
	        			<input type="text" name="a_email" value="${output.a_email}" />
	        		</div>
	        	</div>
	        	<div class="sujung_clearA">
	        		<button type="submit">수정완료</button>
	        	</div>
	        	</form>
        	</div>
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