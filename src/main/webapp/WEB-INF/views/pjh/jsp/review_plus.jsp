<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="header.jsp"%>
<%@ page import="study.spring.trspring.model.Members"%>

<%@ page import="study.spring.trspring.model.Goods"%>
<% 
request.setCharacterEncoding("UTF-8");

Members key_AA = (Members) session.getAttribute("key");
session.setAttribute("key", key_AA);

%>
<!-- ========== 컨텐츠 영역 시작 ========== -->
<div class="review_re">
	<div class="review_cont">
		<div class="review_re_re">리뷰작성</div>
		<form method="post" action="${pageContext.request.contextPath}/pjh/jsp/review_plus_ok.do" enctype="multipart/form-data">
			<input type="hidden" name="m_id" value="${output.m_id}">
			<div class="review_subject">
				<label for="review_subject">리뷰 작성 제목</label>
				<input type="text" name="review_subject" id="review_subject" />
			</div>
			<div class="review_name">
				<label for="review_name">상품 이름</label>
				<input type="text" name="review_name" id="review_name" />
			</div>
			<div class="review_brand">
				<label for="review_brand">상품 브랜드</label>
				<input type="text" name="review_brand" id="review_brand" />
			</div>
			<div class="review_cont1">
				<label for="review_contents">리뷰 작성 내용</label>
				<input type="text" name="review_contents" id="review_contents" />
			</div>
			<div class="review_cont2">
				<label for="picture_review">사진업로드 선택</label>
				<input type="file" name="picture_review" id="picture_review" />
			</div>
			<div class="review_btn_A">
				<button type="reset" class="review_reset_A">다시작성</button>
				<button type="submit" class="review_submit_A">저장</button>
			</div>
		</form>
	</div>
</div>
<%@ include file="footer.jsp"%>
</body>
</html>
