
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
    	<%@ include file="../css/master_form.css" %>
    	<%@ include file="../css/login.css" %>
    </style>
</head>
<body>
	<%@ include file="../admins/master_header_main_members.jsp" %>
    <%@ include file="../admins/master_members_sidebar.jsp" %>
	<!-- ================= 본문영역 시작 ================= -->
	
<%
	request.setCharacterEncoding("UTF-8");
	Admins keyAL = (Admins) session.getAttribute("keyA");
   	session.setAttribute("keyA", keyAL);
%>
	<div class="Main_place">
	<!-- 이 안에서 내용 작업하시면 됩니다. -->
		<div class="login_main_A">
	<div class="login_main_left_A_A">
		<div class="heawon_A">회원추가</div>
		<form action="${pageContext.request.contextPath}/pjh/members/members_add_list_ok.do" method="post">
			<div class="id_members_login">
				<label for="m_id">아이디</label>
				<input type="text" placeholder="아이디"  name="m_id" id="m_id" />
			</div>
			<div class="id_members_login">
				<label for="m_pwA">비밀번호</label>
				<input type="password" placeholder="비밀번호"  name="m_pwA" id="m_pwA" />
			</div>
			<div class="id_members_login">	
				<label for="m_pwB">비밀번호 확인</label>
				<input type="password" placeholder="비밀번호 확인"   name="m_pwB" id="m_pwB" />
			</div>
			<div class="id_members_login">
				<label for="m_email">이메일</label>
				<input type="email" placeholder="이메일 주소"  name="m_email" id="m_email" />
			</div>
			<div class="id_members_login">
				<label for="m_username">닉네임</label>
				<input type="text" placeholder="닉네임을 입력해주세요"  name="m_username" id="m_username" />
			</div>
			<div class="id_members_login">
				<label for="m_name">이름</label>
				<input type="text" placeholder="이름을 입력해주세요"  name="m_name" id="m_name" />
			</div>
			<div class="id_members_login">
				<label for="m_phone">연락처</label>
				<input type="text" placeholder="연락처를 입력해주세요."  name="m_phone" id="m_phone" />
			</div>
			<div class="id_members_m_address">
				<label for="m_address">주소</label>
				<input type="text" placeholder="우편번호"  name="m_postcode" id="m_postcode" readonly="readonly" />
				<input type="button" onclick="postcode()" value="주소검색">
				<input type="text" placeholder="주소"  name="m_address" id="m_address" class="sangse_heawon_A"/>
				<input type="text" placeholder="상세주소"  name="m_address_detail" id="m_address_detail" class="sangse_heawon_B"/>
			</div>
			<div class="id_members_m_birthday">
				<label for="m_birthday">생년월일</label>
				<input type="date" name="m_birthday" id="m_birthday" />
			</div>
			<div class="id_members_gender">
				<label for="gender">성별</label>
				<input type="radio" class="chk_gender" name="gender" value="F" />&nbsp;여성
	    	 	<input type="radio" class="chk_gender" name="gender" value="M" />&nbsp;남성
			</div>
			<div class="id_members_m_email_agree">
				<label for="m_email_agree">수신동의</label>
	   		 	<input class="chk" type="checkbox" value="Y" name="m_email_agree" id="m_email_agree" />&nbsp;마케팅 수신동의
			</div>
			<div class="id_members_agree_cont">트렌딩의 가족을 추가하시려면 수신동의해주세요~</div>
			<div class="id_members_login_submit">
				<button type="submit">회원추가하기</button>
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
                    document.getElementById("m_address").value = '';
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