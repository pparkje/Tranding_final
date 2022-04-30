<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="header.jsp" %>
<!doctype html>
<html>

<head>
    <meta charset="UTF-8" />
    <title>Hello JSP</title>
	<style type="text/css">

    	* {
	    	margin:0;
	    	padding:0;
	    	text-decoration: none;
	    	list-style: none;
    	}
    	
    	 /** body 태그에 기본적으로 적용된 padding, margin을 off시킨다.*/
  	  body {
        padding: 0;
        margin: 0;
    	}

    /** 부모를 기준으로 크기를 갖기 때문에, body와 html에게도 크기 설정 */
	    html,
	    body {
	        width: 100%;
	        height: 100%;
	    }
    </style>
</head>

<body>

    <div class="mainAA">
    	<div class="mainAA_A"> 
				<div class="textBox_A">트렌딩 회원 탈퇴하기</div>
				<div class="textBox">
					<div class="redtext">탈퇴시 주의사항</div>
					<div class="text_cont">
						<div class="text_cont_A">
						고객님의 정보는 고객정보 보호정책에 관한 법률에 의거하여 일정기간 관리 후 삭제됩니다.<br/>
						고객님께서 보유하신 D머니는 모두 삭제되며 재가입시 복구가 불가능 합니다.
						</div>
					</div>
				</div>	
				<div class="textBox2">
					<div class="textBox2_A">탈퇴사유&nbsp;(중복 선택이 가능합니다.)</div>
					<c:url value="/pjh/jsp/deleteAcc_ok.do" var="Url">
						<c:param name="id" value="${output.id}" />
						<c:param name="m_id" value="${output.m_id}" />
						<c:param name="m_pw" value="${output.m_pw}" />
					</c:url>
					<form action="${Url}" method="post" class="form_A">
							<input type="checkbox" value="서비스(상담,포장 등)불만" name="memo">&nbsp; 서비스(상담,포장 등)불만
							<input type="checkbox" value="배송불만" name="memo">&nbsp; 배송불만
							<input type="checkbox" value="개인정보 유출 우려" name="memo">&nbsp; 개인정보 유출 우려
							<input type="checkbox" value="상품가격 불만" name="memo">&nbsp; 상품가격 불만
							<input type="checkbox" value="방문 빈도가 낮음" name="memo">&nbsp; 방문 빈도가 낮음
							<br />
							<div class="gita">기타</div>
							<input type="text" name="memo" placeholder="기타사항을 입력해주세요." />
							<div class="lastBox">
								<div>고객님의 개인정보 보호를 위해 비밀번호를 한번 더 입력해주세요<br/></div>
								<input type="password" name="m_pwA" class="pass_word_A" placeholder="비밀번호를 입력해주세요.">
							</div>
							<div class="hh_AA">
								<div class="hwak_A">
									<button type="submit">확인</button>
								</div>
								<div class="hwak_B">
									<button type="reset">다시작성</button>
								</div>
							</div>
					</form>
				</div>
			<div class="textBox" style="height: 100px;">
				<p>불편하셨던 점이나 불만사항을 적극 반영해서 더 나은 트렌딩이 되겠습니다.</p>
			</div>
		</div>
	</div>
</body>
<%@ include file="footer.jsp"%>
</html>