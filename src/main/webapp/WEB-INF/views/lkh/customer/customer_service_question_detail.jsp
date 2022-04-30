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
    	<%@ include file="../css/customer_service_question_detail.css" %>
    </style>
</head>

<body>
    <div class="body">
        <div class="total_place">
            <div class="title_place">
                질문입력
            </div>
                <div class="main_place1">
                    <table class="table_e" border="1" width="900px">
                        <tbody>
                            <tr>
                                <td width="200px" height="35px" align="left">닉네임</td>
                                <td align="left">
                                	${output.m_username }
                                </td>
                            </tr>
                            <tr>
                                <td height="35px">
                                    이메일
                                </td>
                                <td>
                                    ${output.m_email }
                                </td>
                            </tr>
                            <tr>
                                <td height="35px">
                                    휴대폰
                                </td>
                                <td>
                                    ${output.m_phone }
                                </td>
                            </tr>
                            <tr>
                                <td height="35px">
                                    상품명<span style="color: red;"> *</span>
                                </td>
                                <td>
                                    ${output.q_pname }
                                </td>
                            </tr>
                            <tr>
                                <td height="35px">
                                    제목<span style="color: red;"> *</span>
                                </td>
                                <td>
                                    ${output.q_subject }
                                </td>
                            </tr>
                            <tr>
                                <td height="500px">
                                    질문<span style="color: red;"> *</span>
                                </td>
                                <td valign="top">
                                    ${output.q_cont }
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <div class="button_place">
                        <a href="${pageContext.request.contextPath }/tranding/customer_service_question.do"><button class="button_q1" type="button">목 록</button></a>
                        <a href="${pageContext.request.contextPath }/tranding/customer_service_question_update.do?id=${output.id}"><button class="button_q2" type="button">수 정</button>
                     	<a href="${pageContext.request.contextPath }/tranding/customer_service_question_detail_ok.do?id=${output.id}"><button class="button_q3" type="button">삭 제</button>
                    
                    </div>
                </div>
        </div>
    </div>
    <%@ include file="../jsp/footer.jsp"%>
    <script src="http://code.jQuery.com/jQuery-3.2.1.min.js"></script>
    <script type="text/javascript">
    </script>
</body>

</html>