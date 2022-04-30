<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="study.spring.trspring.model.Goods"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8" />
	<title>Hello JSP</title>
</head>
<body>
	<%
		Goods keyB = (Goods) session.getAttribute("outputB");
		if(keyB == null) {
			return;
		} else {
			Goods keyC = (Goods) session.getAttribute("outputB");
        	session.setAttribute("keyC", keyC);
		
	%>
	<script type="text/javascript">
	alert("찜목록에 추가 되었습니다.");
	</script>
	<%
		response.sendRedirect("favPagejsp_add.do");
		}
	%>
</body>
</html>