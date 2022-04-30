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
    	<%@ include file="../css/master_product_insert.css" %>
    </style>
</head>

<body>
    
    <%@ include file="../jsp/master_product_sidebar.jsp" %>
    <form method="post" action="${pageContext.request.contextPath }/tranding/master_product_insert_ok.do" enctype="multipart/form-data">
    <%@ include file="../jsp/master_header_insert.jsp" %>
    <!-- ================= 본문영역 시작 ================= -->
                    <%
	request.setCharacterEncoding("UTF-8");
	Admins keyB_L = (Admins) session.getAttribute("keyA");
    session.setAttribute("keyA", keyB_L);
%>
    <div class="Main_place">
        <!-- 이 안에서 내용 작업하시면 됩니다. -->
     	
        <div class="text_element1">상품분류</div>
        <div class="main_place4">
            상품을 등록할 수 있습니다.
        </div>
        <div class="main_place3">
            <table border="1" width="80%">
                <tbody>
                    <tr>
                        <td width="300px" height="100px">
                            1차분류<span style="color: red;"> *</span>
                        </td>
                        <td>
                            <select class="dropdown_type1" name="g_detail_a" id="g_detail_a">
                                <option value="">전체분류</option>
			                    <%-- 조회 결과에 따른 반복 처리 --%>
				    			<c:forEach var="item" items="${g_detail_a_List }" varStatus="status">
				    				<option value="${item.g_detail_a }">${item.g_detail_a }</option>
				    			</c:forEach>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td width="300px" height="100px">
                            2차분류<span style="color: red;"> *</span>
                        </td>
                        <td>
                            <select class="dropdown_type1" name="g_detail_b" id="g_detail_b">
                                <option value="">전체분류</option>
			                   	<%-- 조회 결과에 따른 반복 처리 --%>
				    			<c:forEach var="item" items="${g_detail_b_List }" varStatus="status">
				    				<option value="${item.g_detail_b }" >${item.g_detail_b }</option>
				    			</c:forEach>
                            </select>
                        </td>
                    </tr>

                </tbody>
            </table>
            <div class="text_element2">기본정보</div>
            <table border="1" width="80%">
                <tbody>
                    <tr>
                        <td width="300px" height="100px">
                            상품코드<span style="color: red;"> *</span>
                        </td>
                        <td>
                            <input type="text" name="g_code" class="question_title" placeholder=" 내용을 입력해주세요." />
                        </td>
                    </tr>
                    <tr>
                        <td width="300px" height="100px">
                            상품명<span style="color: red;"> *</span>
                        </td>
                        <td>
                            <input type="text" name="g_name" class="question_title" placeholder=" 내용을 입력해주세요." />
                        </td>
                    </tr>
                    <tr>
                        <td width="300px" height="100px">
                            상품유형
                        </td>
                        <td>
                            <input type="checkbox" name="g_hit" class="checkbox_size" value="Y"/>히트
                            <input type="checkbox" name="g_recom" class="checkbox_size" value="Y"/>추천
                            <input type="checkbox" name="g_new" class="checkbox_size" value="Y"/>신상품
                            <input type="checkbox" name="g_popul" class="checkbox_size" value="Y"/>인기
                            <input type="checkbox" name="g_sale" class="checkbox_size" value="Y"/>할인
                        </td>
                    </tr>
                    <tr>
                        <td width="300px" height="100px">
                            제조사<span style="color: red;"> *</span>
                        </td>
                        <td>
                            <input type="text" name="g_make" class="question_title" placeholder=" 내용을 입력해주세요." />
                        </td>
                    </tr>
                    <tr>
                        <td width="300px" height="100px">
                            브랜드<span style="color: red;"> *</span>
                        </td>
                        <td>
                            <input type="text" name="g_brand" class="question_title" placeholder=" 내용을 입력해주세요." />
                        </td>
                    </tr>
                    <tr>
                        <td width="300px" height="100px">
                            판매가능
                        </td>
                        <td>
                            <input type="checkbox" name="g_sell" class="checkbox_size" value="Y" />예
                        </td>
                    </tr>
                    <tr>
                        <td height="40px">
                            상품설명<span style="color: red;"> *</span>
                        </td>
                        <td>
                            <textarea class="question_content" name="g_cont" placeholder="내용을 입력해주세요."></textarea>
                        </td>
                    </tr>
                    <tr>
                        <td height="40px">
                            상점메모
                        </td>
                        <td>
                            <textarea class="question_content2" name="g_memo" placeholder="내용을 입력해주세요."></textarea>
                        </td>
                    </tr>
                </tbody>
            </table>
            <div class="text_element2">가격 및 재고
            </div>
            <table border="1" width="80%">
                <tbody>
                    <tr>
                        <td width="300px" height="100px">
                            판매가격<span style="color: red;"> *</span>
                        </td>
                        <td>
                            <input type="text" name="g_price" class="question_title2" placeholder=" 내용을 입력해주세요." /> 원
                        </td>
                    </tr>
                    <tr>
                        <td width="300px" height="100px">
                            재고수량<span style="color: red;"> *</span>
                        </td>
                        <td>
                            <input type="text" name="g_inven" class="question_title2" placeholder=" 내용을 입력해주세요." /> 개
                        </td>
                    </tr>
                    <tr>
                        <td height="40px">
                            상품선택옵션<span style="color: red;"> *</span>
                        </td>
                        <td class="product_option00">
                            <div class="product_option1">
                                <div class="product_option_textbox">
                                    상품선택옵션을 설정할 수 있습니다.
                                </div>
                                <div class="product_option_textbox1">
                                    옵션1 <input type="text" name="g_option_a" class="product_option_textbox_size1" />
                                </div>
                                <div class="product_option_textbox1">
                                    옵션2 <input type="text" name="g_option_b" class="product_option_textbox_size1" />
                                </div>
                            </div>
                        </td>
                    </tr>
					<tr>
                        <td width="300px" height="100px">
                            원가<span style="color: red;"> *</span>
                        </td>
                        <td>
                            <input type="text" name="g_ori_price" class="question_title2" placeholder=" 내용을 입력해주세요." /> 원
                        </td>
                    </tr>
                    <tr>
                        <td width="300px" height="100px">
                            할인율<span style="color: red;"> *</span>
                        </td>
                        <td>
                            <input type="text" name="g_discount" class="question_title2" placeholder=" 내용을 입력해주세요." /> %
                        </td>
                    </tr>
                    <tr>
                        <td width="300px" height="100px">
                            결제혜택가<span style="color: red;"> *</span>
                        </td>
                        <td>
                            <input type="text" name="g_disc_price" class="question_title2" placeholder=" 내용을 입력해주세요." /> 원
                        </td>
                    </tr>
                </tbody>
            </table>
            <div class="text_element2">이미지
            </div>
            <table border="1" width="80%">
                <tbody>
                    <tr>
                        <td width="300px" height="70px">
                            이미지1<span style="color: red;"> *</span>
                        </td>
                        <td>
                            <input type="file" name="g_image_a" id="g_image_a" />
                        </td>
                    </tr>
                    <tr>
                        <td width="300px" height="70px">
                            이미지2<span style="color: red;"> *</span>
                        </td>
                        <td>
                            <input type="file" name="g_image_b" id="g_image_b" />
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