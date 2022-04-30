<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<title>Tranding</title>

<!-- css 참조 -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/views/tranding/css/reset.css" />

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/views/pjh/css/head.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/views/pjh/css/footer.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/views/tranding/css/looking.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/views/tranding/css/look_side.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/views/tranding/css/wo.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/views/tranding/css/wocontent.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/views/tranding/css/brand_brand.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/views/tranding/css/brand_brand_cont.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/views/pjh/css/main.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/views/tranding/css/animate.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/views/tranding/css/lightbox.min.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/views/tranding/plugin/slick/slick-theme.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/views/tranding/plugin/slick/slick.css" />
<style type="text/css">
<%--@ include file="/views/tranding/css/mencontent.css"--%>


.header {
	z-index: 1000;
}

</style>
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.css" />
<script>
    // JS에서 사이트의 ContextPath를 식별하기 위해 변수값을 생성해 둔다.
    // 여기서 만든 변수는 이후 참조되는 모든 JS파일에서 공유하는 전역변수가 됨.
    const ROOT_URL = "${pageContext.request.contextPath}";
</script>
<!-- js참조 -->
<script src="https://use.fontawesome.com/70ab4d52b6.js"></script>
</head>
<body>
    <div class="container">
        <div class="header">
            <div class="logo">
                <a href="${pageContext.request.contextPath}/main.do" class="logoA">
                    <img src="${pageContext.request.contextPath}/views/tranding/img/logo.png" alt="로고" />
                </a>
            </div>
            <div class="search">
                <div class="search1">
                    <a href="#" class="search2">&nbsp;플스미스 최대 60% 세일</a>
                    <a href="#" class="search3">
                        <img src="${pageContext.request.contextPath}/views/tranding/img/icon_magnifier_black.png">
                    </a>
                </div>
            </div>
            <div class="headWidth">
                <div class="head">
                    <ul class="head1">
                        <li><a href="#">Woman</a></li>
                        <li><a href="#">Man</a></li>
                        <li><a href="#">Brand</a></li>
                        <li><a href="${pageContext.request.contextPath}/tranding/work.do" class="">랭킹</a></li>
                        <li><a href="#">세일</a></li>
                        <li><a href="#">이벤트</a></li>
                        <li><a href="#">아울렛</a></li>
                    </ul>
                </div>
            </div>
            <div class="icon">
                <ul class="icon1">
                    <li>
                        <a href="${pageContext.request.contextPath}/pjh/jsp/favPagejsp.do">
                        <img src="${pageContext.request.contextPath}/views/tranding/img/iconB.PNG" alt="찜" />
                        </a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/pjh/jsp/cartPage.do">
                        <img src="${pageContext.request.contextPath}/views/tranding/img/iconC.PNG" alt="장바구니" />
                        </a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/pjh/jsp/Mypage.do">
                        <img src="${pageContext.request.contextPath}/views/tranding/img/iconD.PNG" alt="마이페이지" />
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
