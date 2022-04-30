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
    	<%@ include file="../css/master_question_news_update.css" %>
    </style>
</head>

<body>   
    <%@ include file="../jsp/master_question_sidebar.jsp" %>
    <form method="post" action="${pageContext.request.contextPath }/tranding/master_question_news_update_ok.do" enctype="multipart/form-data">
    <%@ include file="../jsp/master_header_news_update.jsp" %>
    <!-- ================= 본문영역 시작 ================= -->
    <div class="Main_place">
        <!-- 이 안에서 내용 작업하시면 됩니다. -->
                <%
	request.setCharacterEncoding("UTF-8");
	Admins keyB_B = (Admins) session.getAttribute("keyA");
    session.setAttribute("keyA", keyB_B);
%>
        
        <div class="main_place4">
            소식 내용을 수정하는 페이지입니다.
        </div>
        
        <input name="id" id="id" type="hidden" value="${output.id }" />
        <input name="bf_img" id="bf_img" type="hidden" value="${output.n_image }" />
        
        <div class="main_place3">
            <table border="1" width="80%">
                <thead>
                    <tr>
                        <th width="300px" height="40px" align="left">
                        	분류<span style="color: red;"> *</span>
                        </th>
                        <th align="left">
                        	<c:choose>
							    <c:when test="${output.n_group == 'event'}">
							        <input type="radio" name="n_group" id="n_group1" value="event" checked/> <label for="n_group1">이벤트</label>
                            		<input type="radio" name="n_group" id="n_group2" value="news" /> <label for="n_group2">소식</label>
							    </c:when>
							    <c:when test="${output.n_group == 'news'}">
							        <input type="radio" name="n_group" id="n_group1" value="event" /> <label for="n_group1">이벤트</label>
                            		<input type="radio" name="n_group" id="n_group2" value="news" checked/> <label for="n_group2">소식</label>
							    </c:when>
							</c:choose>
                        </th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td height="40px">
                            이미지
                        </td>
                        <td>
                            <input type="file" name="n_image" id="n_image" />
                        </td>
                    </tr>
                    <tr>
                        <td height="40px">
                            기간
                        </td>
                        <td>
                            <input type="date" name="n_term1" id="n_term1" value="${output.n_term1 }" /> ~ <input type="date" name="n_term2" id="n_term2" value="${output.n_term2 }" />
                        </td>
                    </tr>
                    <tr>
                        <td height="40px">
                            제목<span style="color: red;"> *</span>
                        </td>
                        <td>
                            <input type="text" name="n_subject" id="n_subject" class="question_title" value="${output.n_subject }" placeholder=" 내용을 입력해주세요." />
                        </td>
                    </tr>
                    <tr>
                        <td height="40px">
                            내용<span style="color: red;"> *</span>
                        </td>
                        <td>
                            <textarea class="question_content" name="n_cont" id="n_cont" placeholder="내용을 입력해주세요.">${output.n_cont }</textarea>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        
        <!-- 이 안에서 내용 작업하시면 됩니다. -->
    </div>
    </form>
    <!-- ================= 본문영역 끝 ================= -->
    <script src="http://code.jQuery.com/jQuery-3.2.1.min.js"></script>
    <script type="text/javascript">
    </script>
</body>

</html>