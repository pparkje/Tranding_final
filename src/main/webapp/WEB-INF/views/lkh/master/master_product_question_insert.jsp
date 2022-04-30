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
    	<%@ include file="../css/master_question_question_insert.css" %>
    </style>
</head>

<body>
    <%@ include file="../jsp/master_question_sidebar.jsp" %>
    <form method="post" action="${pageContext.request.contextPath }/tranding/master_product_question_insert_ok.do">
    <%@ include file="../jsp/master_header_question_insert.jsp" %>
    <!-- ================= 본문영역 시작 ================= -->
                    <%
	request.setCharacterEncoding("UTF-8");
	Admins keyB_H = (Admins) session.getAttribute("keyA");
    session.setAttribute("keyA", keyB_H);
%>
    <div class="Main_place">
        <!-- 이 안에서 내용 작업하시면 됩니다. -->
        
        <input type="hidden" name="id" value="${output.id }"/>
        <input type="hidden" name="q_answer_ch" value="${output.q_answer_ch }"/>
        <input type="hidden" name="q_pname" value="${output.q_pname }"/>
        <input type="hidden" name="q_image" value="${output.q_image }"/>
        
        <div class="main_place4">
            상품에 대한 문의에 답변할 수 있습니다. 상품 문의 내용의 수정도 가능합니다.
        </div>
        <div class="main_place3">
            <table border="1" width="80%">
                <thead>
                    <tr>
                        <th width="300px" height="40px" align="left">닉네임</th>
                        <th align="left">${m_username }</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td height="40px">
                            이메일
                        </td>
                        <td>
                            ${m_email }
                        </td>
                    </tr>
                    <tr>
                        <td height="40px">
                            휴대폰
                        </td>
                        <td>
                            ${m_phone }
                        </td>
                    </tr>
                    <tr>
                        <td height="40px">
                            제목<span style="color: red;"> *</span>
                        </td>
                        <td>
                            <input type="text" class="question_title" name="q_subject" value="${output.q_subject }" placeholder=" 내용을 입력해주세요." />
                        </td>
                    </tr>
                    <tr>
                        <td height="40px">
                            질문<span style="color: red;"> *</span>
                        </td>
                        <td>
                            <textarea class="question_content" name="q_cont" placeholder="내용을 입력해주세요.">${output.q_cont }</textarea>
                        </td>
                    </tr>
                    <tr>
                        <td height="40px">
                            답변<span style="color: red;"> *</span>
                        </td>
                        <td>
                            <textarea class="question_content" name="q_answer" placeholder="내용을 입력해주세요.">${output.q_answer }</textarea>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        </form>
        
        <!-- 이 안에서 내용 작업하시면 됩니다. -->
    </div>
    <!-- ================= 본문영역 끝 ================= -->
    <script src="http://code.jQuery.com/jQuery-3.2.1.min.js"></script>
    <script type="text/javascript">
    </script>
</body>

</html>