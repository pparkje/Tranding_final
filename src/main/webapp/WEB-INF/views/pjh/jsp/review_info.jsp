<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="header.jsp"%>
<%@ page import="study.spring.trspring.model.Members"%>
<%@ page import="study.spring.trspring.model.Goods"%>
<!-- ========== 컨텐츠 영역 시작 ========== -->
<body>
<% 
request.setCharacterEncoding("UTF-8");

Members key_AA = (Members) session.getAttribute("key");
session.setAttribute("key", key_AA);

%>
<div class="info_review">
	<div class="info_review_main">
		<div class="info_review_cont_A">
			<img src="${pageContext.request.contextPath}/views/tranding/img/${output.r_img}">
		</div>
		<div class="info_review_cont_B">
			<div class="info_review_subject">${output.r_sub}</div>
			<div class="info_review_member">작성자:&nbsp;${output.r_m_id}</div>
			<div class="info_review_brand">브랜드:&nbsp;${output.r_brand}</div>
			<div class="info_review_name">상품이름:&nbsp;${output.r_name}</div>
			<div class="info_review_cont_cont">${output.r_cont}</div>
		</div>
	</div>
</div>
<%@ include file="footer.jsp"%>
</body>
</html>
