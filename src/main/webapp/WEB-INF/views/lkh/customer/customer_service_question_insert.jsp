<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../jsp/header.jsp"%>
<!doctype html>
<html>

<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
    <title>Tranding</title>
    <style type="text/css">
    	<%@ include file="../css/customer_service_question_insert.css" %>
    </style>
</head>

<body>
    <div class="body">
        <div class="total_place">
            <div class="title_place">
                질문입력
            </div>
            <form method="post" action="${pageContext.request.contextPath }/tranding/customer_service_question_insert_ok.do">
                <div class="main_place1">
                    <table class="table_e" border="1" width="900px">
                        <tbody>
                            <tr>
                                <td width="200px" height="35px" align="left">닉네임</td>
                                <td align="left">${m_username }</td>
                            </tr>
                            <tr>
                                <td height="35px">
                                    이메일
                                </td>
                                <td>
                                    ${m_email }
                                </td>
                            </tr>
                            <tr>
                                <td height="35px">
                                    휴대폰
                                </td>
                                <td>
                                    ${m_phone }
                                </td>
                            </tr>
                            <tr>
                                <td height="35px">
                                    상품명<span style="color: red;"> *</span>
                                </td>
                                <td>
                                    <input type="text" class="question_title" name="q_pname" value="" placeholder=" 내용을 입력해주세요." />
                                </td>
                            </tr>
                            <tr>
                                <td height="35px">
                                    제목<span style="color: red;"> *</span>
                                </td>
                                <td>
                                    <input type="text" class="question_title" name="q_subject" value="" placeholder=" 내용을 입력해주세요." />
                                </td>
                            </tr>
                            <tr>
                                <td height="80px">
                                    <div class="question_a">
                                    	질문<span style="color: red;"> *</span>
                                    </div>
                                </td>
                                <td height="500px">
                                    <textarea class="question_content" name="q_cont" placeholder="내용을 입력해주세요."></textarea>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <div class="button_place">
                        <a href="${pageContext.request.contextPath }/tranding/customer_service_question.do"><button class="button_q1" type="button">목 록</button></a>
                        <button class="button_q2" type="submit">등 록</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <%@ include file="../jsp/footer.jsp"%>
    <script src="http://code.jQuery.com/jQuery-3.2.1.min.js"></script>
    <script type="text/javascript">
    </script>
</body>

</html>