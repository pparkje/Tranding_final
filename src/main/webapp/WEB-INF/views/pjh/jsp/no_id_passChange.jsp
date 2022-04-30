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

    
	   
    </style>
</head>

<body>
	<div class="pass_word_A_pass">
		<div class="pass_word_A_A">
			<div class="pass_word_main_A">비밀번호 변경 순서 ①</div>
			<div class="pass_word_main_B">
				<form action="${pageContext.request.contextPath}/pjh/jsp/no_id_passChange_ok.do" method="post">
					<div class="pass_id_A">아이디: </div>
					<input type="text" name="m_id" />
					<button type="reset" class="re_button_A">다시작성</button>
					<button type="submit" class="su_button_A">다음단계</button>
				</form>
			</div>
			<div class="pass_cont_A_word">비밀번호 변경 순서는 총 3단계로 id입력 , 이메일 인증, 비밀번호 재설정입니다.</div>
		</div>
	</div>
</body>
<%@ include file="footer.jsp"%>
</html>