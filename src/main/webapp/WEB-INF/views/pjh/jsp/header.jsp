<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="study.spring.trspring.model.Members"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<title>Tranding</title>

<!-- css 참조 -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/views/tranding/css/reset.css" />

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/views/pjh/css/head.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/views/pjh/css/footerA.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/views/pjh/css/no_id_password.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/views/pjh/css/login.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/views/pjh/css/admin_login.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/views/pjh/css/looking.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/views/pjh/css/look_side.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/views/pjh/css/reviewB.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/views/pjh/css/review_infoB.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/views/pjh/css/woA.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/views/pjh/css/wocontent.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/views/pjh/css/brand_brand.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/views/pjh/css/brand_brand_cont.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/views/pjh/css/menmen.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/views/pjh/css/mcontent.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/views/pjh/css/main.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/views/pjh/css/myPageA.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/views/pjh/css/event.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/views/pjh/css/delete.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/views/pjh/css/sujungB.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/views/pjh/css/fav.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/views/pjh/css/order.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/views/pjh/css/orderinfo.css" />

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/views/tranding/css/animate.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/views/tranding/css/lightbox.min.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/views/tranding/plugin/slick/slick-theme.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/views/tranding/plugin/slick/slick.css" />
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />
<style type="text/css">
<%--@ include file="/views/tranding/css/mencontent.css"--%>


.header {
	z-index: 1000;
}

</style>
<script src="https://use.fontawesome.com/70ab4d52b6.js"></script>
<script src="${pageContext.request.contextPath}/views/tranding/js/jquery-3.5.1.min.js"></script>
<script src="${pageContext.request.contextPath}/views/tranding/js/jquery.animatecss.min.js"></script>
<script src="${pageContext.request.contextPath}/views/tranding/js/lightbox/lightbox.min.js"></script>
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<script>
    // JS에서 사이트의 ContextPath를 식별하기 위해 변수값을 생성해 둔다.
    // 여기서 만든 변수는 이후 참조되는 모든 JS파일에서 공유하는 전역변수가 됨.
    const ROOT_URL = "${pageContext.request.contextPath}";
    $(function() {
        $(".hoA").hover(function() {
        	 $('.hideA').stop().slideToggle(300);
        });
        $(".menu_auto").hover(function() {
       	 $('.hideA').stop().slideToggle(300);
       });
    });
</script>
<!-- js참조 -->
<script src="https://use.fontawesome.com/70ab4d52b6.js"></script>
</head>
<body>
<%

request.setCharacterEncoding("UTF-8");
Members key = (Members) session.getAttribute("key");
session.setAttribute("key", key); 
%>

    <div class="container">
        <div class="header">
            <div class="logo">
                <a href="${pageContext.request.contextPath}/main.do" class="logoA">
                	<%
                	session.setAttribute("key", key);
                	%>
                    <img src="${pageContext.request.contextPath}/views/tranding/img/logo.png" alt="로고" />
                </a>
            </div>
            <div class="search">
                <div class="search1">
                    <a href="${pageContext.request.contextPath}/pjh/jsp/search.do" class="search2">&nbsp;플스미스 최대 60% 세일</a>
                    <a href="${pageContext.request.contextPath}/pjh/jsp/search.do" class="search3">
                        <img src="${pageContext.request.contextPath}/views/tranding/img/icon_magnifier_black.png">
                    </a>
                </div>
            </div>
            <div class="headWidth">
                <div class="head">
                    <ul class="head1">
		                <li>
                        	<a href="${pageContext.request.contextPath}/pjh/jsp/women.do" class="hoA co_black">
                       		Women
                       		</a>
                       	</li>
		                
		                <li>
                        	<a href="${pageContext.request.contextPath}/pjh/jsp/men.do" class="hoA co_black">
                        	Men
                        	</a>
                        </li>
		                <li>
                        	<a href="${pageContext.request.contextPath}/pjh/jsp/brand_brand.do" class="hoA co_black">
                        	Brand
                        	</a>
                        </li>
                        <li><a href="${pageContext.request.contextPath}/tranding/rank_page.do" class="hoA">랭킹</a></li>
                        <li><a href="${pageContext.request.contextPath}/tranding/customer_service_notice.do" class="hoA">문의</a></li>
                        <li>
                        	<a href="${pageContext.request.contextPath}/pjh/jsp/event.do" class="hoA">이벤트</a>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="icon">
                <ul class="icon1">
                	<%
	                    if(key == null){ 
                    %>
                    <li>
                        <a href="${pageContext.request.contextPath}/pjh/jsp/favPagejsp.do">
                        	<img src="${pageContext.request.contextPath}/views/tranding/img/iconB.PNG" alt="찜" />
                        </a>
                    </li>
                    <% }else{ 
                    	session.setAttribute("key", key); 
                    %>
                    <li>
                        <a href="${pageContext.request.contextPath}/pjh/jsp/favPagejsp.do">
                        	<img src="${pageContext.request.contextPath}/views/tranding/img/iconB.PNG" alt="찜" />
                        </a>
                    </li>
                    <% } %>
                    <%
	                    if(key == null){ 
                    %>
                    <li>
                        <a href="${pageContext.request.contextPath}/pjh/jsp/login.do">
                        <img src="${pageContext.request.contextPath}/views/tranding/img/iconC.PNG" alt="로그인페이지" />
                        </a>
                    </li>
                    <% }else{ 
                    	session.setAttribute("key", key);
                    %>
                    <li>
                        <a href="${pageContext.request.contextPath}/pjh/jsp/cartPage.do">
                        <img src="${pageContext.request.contextPath}/views/tranding/img/iconC.PNG" alt="장바구니" />
                        </a>
                    </li>
                    <% } %>
                    <% 
                    	if(key == null){ 
                    %>
                    <li>
                        <a href="${pageContext.request.contextPath}/pjh/jsp/login.do">
                        <img src="${pageContext.request.contextPath}/views/tranding/img/iconD.PNG" alt="로그인페이지" />
                        </a>
                    </li>
                    <% }else{ 
                    	session.setAttribute("key", key);
                    %>
                    <li>
                        <a href="${pageContext.request.contextPath}/pjh/jsp/Mypage.do">
                        <img src="${pageContext.request.contextPath}/views/tranding/img/iconD.PNG" alt="마이페이지" />
                        </a>
                    </li>
                    <% } %>
                </ul>
            </div>

            <div class="menu_bar hideA">
			            <div class="menu_auto">
				            <div class="menu_autoA">
				            	<ul class="menubarA">
				            		<li>
					            		<form action="${pageContext.request.contextPath}/pjh/jsp/womenF.do" method="post" class="head_bu">
		                	 				<input type="hidden" name="detailB" value="의류" />
			                            	<button type="submit">의류</button>
			                            </form>
	                            	</li>
				            	
				                    <li>
				                   		<form action="${pageContext.request.contextPath}/pjh/jsp/womenF.do" method="post" class="head_bu">
		                	 				<input type="hidden" name="detailB" value="가방" />
			                            	<button type="submit">가방</button>
			                            </form>
			                        </li>
				                   
				                    <li>
				                    	<form action="${pageContext.request.contextPath}/pjh/jsp/womenF.do" method="post" class="head_bu">
		                	 				<input type="hidden" name="detailB" value=액세서리 />
			                            	<button type="submit">액세서리</button>
			                            </form>
				                    </li>
				                   
				                    <li>
				                   		<form action="${pageContext.request.contextPath}/pjh/jsp/womenF.do" method="post" class="head_bu">
		                	 				<input type="hidden" name="detailB" value=신발 />
			                            	<button type="submit">신발</button>
			                            </form>
				                    </li>
				                    
				                    <li>
				                    <a href="${pageContext.request.contextPath}/pjh/jsp/women.do">전체</a>
				                    </li>
				            	</ul>
				            	<ul class="menubarB">
				            		<li>
					            		<form action="${pageContext.request.contextPath}/pjh/jsp/menF.do" method="post" class="head_bu">
		                	 				<input type="hidden" name="detailB" value="의류" />
			                            	<button type="submit">의류</button>
			                            </form>
	                            	</li>
				            	
				                    <li>
				                   		<form action="${pageContext.request.contextPath}/pjh/jsp/menF.do" method="post" class="head_bu">
		                	 				<input type="hidden" name="detailB" value="가방" />
			                            	<button type="submit">가방</button>
			                            </form>
			                        </li>
				                   
				                    <li>
				                    	<form action="${pageContext.request.contextPath}/pjh/jsp/menF.do" method="post" class="head_bu">
		                	 				<input type="hidden" name="detailB" value=액세서리 />
			                            	<button type="submit">액세서리</button>
			                            </form>
				                    </li>
				                   
				                    <li>
				                   		<form action="${pageContext.request.contextPath}/pjh/jsp/menF.do" method="post" class="head_bu">
		                	 				<input type="hidden" name="detailB" value=신발 />
			                            	<button type="submit">신발</button>
			                            </form>
				                    </li>
				                    
				                    <li>
				                    <a href="${pageContext.request.contextPath}/pjh/jsp/men.do">전체</a>
				                    </li>
				            	</ul>
				            	<ul class="menubarC">
				                    <li>
					                    <form action="${pageContext.request.contextPath}/pjh/jsp/brand_brandF.do" method="post" class="head_bu">
					                	 	<input type="hidden" name="g_brand" value="구찌" />
					                		<button type="submit">구찌</button>
					                	</form>
				                    </li>
				                    <li>
				                    	<form action="${pageContext.request.contextPath}/pjh/jsp/brand_brandF.do" method="post" class="head_bu">
					                	 	<input type="hidden" name="g_brand" value="버버리" />
					                		<button type="submit">버버리</button>
					                	</form>
				                    </li>
				                    <li class="mejong">
				                    	<form action="${pageContext.request.contextPath}/pjh/jsp/brand_brandF.do" method="post" >
					                	 	<input type="hidden" name="g_brand" value="메종마르지엘라" />
					                		<button type="submit">메종마르지엘라</button>
					                	</form>
				                    </li>
				                    <li>
				                    	<form action="${pageContext.request.contextPath}/pjh/jsp/brand_brandF.do" method="post" class="head_bu">
					                	 	<input type="hidden" name="g_brand" value="루이비통" />
					                		<button type="submit">루이비통</button>
					                	</form>
				                    </li>
				                  	<li>
				                  	<a href="${pageContext.request.contextPath}/pjh/jsp/brand_brand.do">전체</a>
				                  	</li>
				                </ul>
				                <ul class="menubarD">
				                    <li><a href="${pageContext.request.contextPath}/tranding/rank_page.do">랭킹보러가기</a></li>
				                </ul>
				                <ul class="menubarE">
				                    <li><a href="${pageContext.request.contextPath}/tranding/customer_service_notice.do">문의보러가기</a></li>
				                </ul>
				                <ul class="menubarF">
				                    <li><a href="${pageContext.request.contextPath}/pjh/jsp/event.do">이벤트보러가기</a></li>
				                </ul>
				            </div>
			            </div>
		            </div>
        </div>
    </div>
