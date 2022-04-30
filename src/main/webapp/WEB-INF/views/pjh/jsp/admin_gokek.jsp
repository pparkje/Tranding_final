<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html>

<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
    <title>Tranding</title>
    <style type="text/css">
    	<%@ include file="../css/master_form.css" %>
    	<%@ include file="../css/gokek.css" %>
    </style>
</head>

<body>
    <%@ include file="admin_header.jsp" %>
    <%@ include file="admin_sidebar.jsp" %>
    <!-- ================= 본문영역 시작 ================= -->
    <div class="Main_place">
        <!-- 이 안에서 내용 작업하시면 됩니다. -->
        <div class="gokekA">
        	<div class="gokekA_A">
        		<div class="gokokA_checkbox">
        			<input type="checkbox" id="checkA_A" />
        		</div>
        		<div>회원번호</div>
        		<div>이름</div>
        		<div>아이디</div>
        		<div>닉네임</div>
        		<div>휴대폰번호</div>
        		<div>포인트</div>
        		<div>주소</div>
        		<div>이메일</div>
        		<div>메일수신동의</div>
        		<div>가입날짜</div>
        		<div>수정날짜</div>
        		<div>탈퇴여부</div>
        		<div>탈퇴날짜</div>
        		<div>관리</div>
        		<div></div>
        	</div>
        	<div class="gokekA_B">
        		<div class="gokokB_checkbox">
        			<input type="checkbox" id="checkA_B" />
        		</div>
        		<div>1</div>
        		<div>유재석</div>
        		<div>youjesuk1</div>
        		<div>youjesuk1</div>
        		<div>010-1111-1111</div>
        		<div>1000</div>
        		<div>서울시 강남구 논현동 241-1</div>
        		<div>you12@naver.com</div>
        		<div class="gokokB_checkbox1">
        			<input type="checkbox" id="checkA_C" />
        		</div>
        		<div>2021-01-01</div>
        		<div>2021-01-02</div>
        		<div>N</div>
        		<div></div>
        		<div class="sujung_A">
        			<button>수정</button>
        		</div>
        		<div></div>
        	</div>
        	<div class="gokek_number_page">
                <ul class="gokek_pagenum">
                    <li>
	                    <a href="javascript:void(0);"> 
	                    	<img src="${pageContext.request.contextPath}/tranding/img/left_left.png" />
	                    </a>
                    </li>
                    <li><a href="javascript:void(0);">1</a></li>
                    <li><a href="javascript:void(0);">2</a></li>
                    <li><a href="javascript:void(0);">3</a></li>
                    <li><a href="javascript:void(0);">4</a></li>
                    <li><a href="javascript:void(0);">5</a></li>
                    <li><a href="javascript:void(0);">6</a></li>
                    <li><a href="javascript:void(0);">7</a></li>
                    <li><a href="javascript:void(0);">8</a></li>
                    <li><a href="javascript:void(0);">9</a></li>
                    <li><a href="javascript:void(0);">10&nbsp;</a></li>
                    <li>
                        <a href="javascript:void(0);"> 
                            <img src="${pageContext.request.contextPath}/tranding/img/right_right.png" />
                        </a>
                    </li>
                </ul>
            </div>
        </div>

        <!-- 이 안에서 내용 작업하시면 됩니다. -->
    </div>
    <!-- ================= 본문영역 끝 ================= -->
    <script src="http://code.jQuery.com/jQuery-3.2.1.min.js"></script>
    <script type="text/javascript">
    </script>
</body>

</html>