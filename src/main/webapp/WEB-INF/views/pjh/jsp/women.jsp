<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="header.jsp" %>
<%@ page import="study.spring.trspring.model.Goods"%>
<!-- ========== 컨텐츠 영역 시작 ========== -->
<%
	request.setCharacterEncoding("UTF-8");
    Members key_A = (Members) session.getAttribute("key");
    session.setAttribute("key", key_A);
%>
<!-- 이곳에 html , css , js , jQuery 적용하면 됩니다. -->
<div class="women">
    <div class="women_top">
        <div class="women_text">
            <a href="${pageContext.request.contextPath}/pjh/jsp/women.do" class="wtext">WOMEN</a>
            <ul class="wtext1">
            
                <li>
                	<form action="${pageContext.request.contextPath}/pjh/jsp/womenF.do" method="post">
                	 	<input type="hidden" name="g_brand" value="구찌" />
                	 	<input type="hidden" name="detailB" value="${detailB}" />	
						<input type="hidden" name="min_price" value="${min_price}" />	
						<input type="hidden" name="max_price" value="${max_price}" />		
						<input type="hidden" name="minsale" value="${minsale}" />		
						<input type="hidden" name="maxsale" value="${maxsale}" />		
						<input type="hidden" name="sessionA" value="${sessionA}" />	
                		<button type="submit">구찌</button>
                	</form>
                </li>
                
                <li>
                	<form action="${pageContext.request.contextPath}/pjh/jsp/womenF.do" method="post">
                	 	<input type="hidden" name="g_brand" value="펜디" />
                	 	<input type="hidden" name="detailB" value="${detailB}" />	
						<input type="hidden" name="min_price" value="${min_price}" />	
						<input type="hidden" name="max_price" value="${max_price}" />		
						<input type="hidden" name="minsale" value="${minsale}" />		
						<input type="hidden" name="maxsale" value="${maxsale}" />		
						<input type="hidden" name="sessionA" value="${sessionA}" />	
                		<button type="submit">펜디</button>
                	</form>
                </li>
                
                <li>
                	<form action="${pageContext.request.contextPath}/pjh/jsp/womenF.do" method="post">
                	 	<input type="hidden" name="g_brand" value="코치" />
                	 	<input type="hidden" name="detailB" value="${detailB}" />	
						<input type="hidden" name="min_price" value="${min_price}" />	
						<input type="hidden" name="max_price" value="${max_price}" />		
						<input type="hidden" name="minsale" value="${minsale}" />		
						<input type="hidden" name="maxsale" value="${maxsale}" />		
						<input type="hidden" name="sessionA" value="${sessionA}" />	
                		<button type="submit">코치</button>
                	</form>
                </li>
            
                <li>
	                <form action="${pageContext.request.contextPath}/pjh/jsp/womenF.do" method="post">
                	 	<input type="hidden" name="g_brand" value="고야드" />
                	 	<input type="hidden" name="detailB" value="${detailB}" />	
						<input type="hidden" name="min_price" value="${min_price}" />	
						<input type="hidden" name="max_price" value="${max_price}" />		
						<input type="hidden" name="minsale" value="${minsale}" />		
						<input type="hidden" name="maxsale" value="${maxsale}" />		
						<input type="hidden" name="sessionA" value="${sessionA}" />	
                		<button type="submit">고야드</button>
                	</form>
	               </li>
                
                <li>
	               <form action="${pageContext.request.contextPath}/pjh/jsp/womenF.do" method="post">
                	 	<input type="hidden" name="g_brand" value="생로랑" />
						<input type="hidden" name="detailB" value="${detailB}" />	
						<input type="hidden" name="min_price" value="${min_price}" />	
						<input type="hidden" name="max_price" value="${max_price}" />		
						<input type="hidden" name="minsale" value="${minsale}" />		
						<input type="hidden" name="maxsale" value="${maxsale}" />		
						<input type="hidden" name="sessionA" value="${sessionA}" />			
                		<button type="submit">생로랑</button>
                	</form>
                </li>
            </ul>
            <div class="wtext2">
                <select class="wtext2_wtext" name="clas" id="clas" onchange="goUrl(this.options[this.selectedIndex].value)">
                   		<c:url value="/pjh/jsp/womenA.do" var="URLA">
							<c:param name="sessionA" value="1"/>
	                	 	<c:param name="detailB" value="${detailB}"  />
							<c:param name="g_brand" value="${g_brand}"  />		
							<c:param name="min_price" value="${min_price}"  />
							<c:param name="max_price" value="${max_price}"  />	
							<c:param name="minsale" value="${minsale}"  />		
							<c:param name="maxsale" value="${maxsale}"  />	
						</c:url>
						 <c:url value="/pjh/jsp/womenA.do" var="URLB">
							<c:param name="sessionA" value="2" />
	                	 	<c:param name="detailB" value="${detailB}"  />
							<c:param name="g_brand" value="${g_brand}"  />	
							<c:param name="min_price" value="${min_price}"  />
							<c:param name="max_price" value="${max_price}"  />	
							<c:param name="minsale" value="${minsale}"  />		
							<c:param name="maxsale" value="${maxsale}"  />	
						</c:url>
						 <c:url value="/pjh/jsp/womenA.do" var="URLC">
							<c:param name="sessionA" value="3" />
	                	 	<c:param name="detailB" value="${detailB}"  />
							<c:param name="g_brand" value="${g_brand}"  />		
							<c:param name="min_price" value="${min_price}"  />
							<c:param name="max_price" value="${max_price}"  />	
							<c:param name="minsale" value="${minsale}"  />		
							<c:param name="maxsale" value="${maxsale}"  />	
						</c:url>
						 <c:url value="/pjh/jsp/womenA.do" var="URLD">
							<c:param name="sessionA" value="4" />
	                	 	<c:param name="detailB" value="${detailB}"  />
							<c:param name="g_brand" value="${g_brand}"  />	
							<c:param name="min_price" value="${min_price}"  />
							<c:param name="max_price" value="${max_price}"  />	
							<c:param name="minsale" value="${minsale}"  />		
							<c:param name="maxsale" value="${maxsale}"  />	
						</c:url>
                   	
                    <option value="${URLA}" <c:if test="${sessionA == 1}">selected</c:if> >인기순</option>
                    <option value="${URLB}" <c:if test="${sessionA == 2}">selected</c:if> >최신순</option>
                    <option value="${URLC}" <c:if test="${sessionA == 3}">selected</c:if> >가격낮은순</option>
                    <option value="${URLD}" <c:if test="${sessionA == 4}">selected</c:if> >가격높은순</option>
                </select>
            </div>
        </div>
    </div>
    <div class="women_middle">
        <div class="women_cont">
            <div class="women_side">
                <ul class="side_bar1">
                    <li class="womenside1">
                        <div class="kategorie1">
                            <a href="javascript:void(0);" class="ka1">카테고리</a> 
                            <a href="javascript:void(0);" class="dodoA"><img
                                src="${pageContext.request.contextPath}/views/tranding/img/down_down.png"></a>
                            <a href="javascript:void(0);" class="upupA"><img
                                src="${pageContext.request.contextPath}/views/tranding/img/up_up.png"></a>
                        </div>
                        <ul class="kategorie2">
                            <li>
	                            <form action="${pageContext.request.contextPath}/pjh/jsp/womenF.do" method="post">
                	 				<input type="hidden" name="detailB" value="의류" />
                	 				<input type="hidden" name="g_brand" value="${g_brand}" />	
									<input type="hidden" name="min_price" value="${min_price}" />
									<input type="hidden" name="max_price" value="${max_price}" />		
									<input type="hidden" name="minsale" value="${minsale}" />		
									<input type="hidden" name="maxsale" value="${maxsale}" />	
									<input type="hidden" name="sessionA" value="${sessionA}" />	
	                            	<button type="submit">의류</button>
	                            </form>
                            </li>
                            <li>
                            	<form action="${pageContext.request.contextPath}/pjh/jsp/womenF.do" method="post">
                	 				<input type="hidden" name="detailB" value="가방" />
                	 				<input type="hidden" name="g_brand" value="${g_brand}" />	
									<input type="hidden" name="min_price" value="${min_price}" />
									<input type="hidden" name="max_price" value="${max_price}" />		
									<input type="hidden" name="minsale" value="${minsale}" />		
									<input type="hidden" name="maxsale" value="${maxsale}" />	
									<input type="hidden" name="sessionA" value="${sessionA}" />	
	                            	<button type="submit">가방</button>
	                            </form>
                            </li>
                            <li>
                            	<form action="${pageContext.request.contextPath}/pjh/jsp/womenF.do" method="post">
                	 				<input type="hidden" name="detailB" value="액세서리" />
									<input type="hidden" name="g_brand" value="${g_brand}" />	
									<input type="hidden" name="min_price" value="${min_price}" />
									<input type="hidden" name="max_price" value="${max_price}" />		
									<input type="hidden" name="minsale" value="${minsale}" />		
									<input type="hidden" name="maxsale" value="${maxsale}" />	
									<input type="hidden" name="sessionA" value="${sessionA}" />	
	                            	<button type="submit">액세서리</button>
	                            </form>
                            </li>
                            <li>
                           	 	<form action="${pageContext.request.contextPath}/pjh/jsp/womenF.do" method="post">
                	 				<input type="hidden" name="detailB" value="신발" />
									<input type="hidden" name="g_brand" value="${g_brand}" />	
									<input type="hidden" name="min_price" value="${min_price}" />	
									<input type="hidden" name="max_price" value="${max_price}" />	
									<input type="hidden" name="minsale" value="${minsale}" />			
									<input type="hidden" name="maxsale" value="${maxsale}" />	
									<input type="hidden" name="sessionA" value="${sessionA}" />	
	                            	<button type="submit">신발</button>
	                            </form>
                            </li>
                        </ul>
                    </li>
                    <li class="womenside2">
                        <ul>
                            <li class="brand1">
                            <a href="javascript:void(0);" class="ka2">브랜드</a> 
	                            <a href="javascript:void(0);" class="dodoB">
	                            	<img src="${pageContext.request.contextPath}/views/tranding/img/down_down.png">
	                            </a>
                                <a href="javascript:void(0);" class="upupB">
                                	<img src="${pageContext.request.contextPath}/views/tranding/img/up_up.png">
                                </a>
                            </li>
                            <form class="brand2" method="post" action="${pageContext.request.contextPath}/pjh/jsp/womenF.do">
									<input type="hidden" name="detailB" value="${detailB}" />		
									<input type="hidden" name="min_price" value="${min_price}" />	
									<input type="hidden" name="max_price" value="${max_price}" />	
									<input type="hidden" name="minsale" value="${minsale}" />	
									<input type="hidden" name="maxsale" value="${maxsale}" />
									<input type="hidden" name="sessionA" value="${sessionA}" />		
                                <input type="text" name="g_brand" class="search_text1"
                                    placeholder="ex)구지,구라다..." value="${g_brand}" />
                                <button type="submit" class="search_icon1">
                                    <img src="${pageContext.request.contextPath}/views/tranding/img/search_sch.png" />
                                </button>
                            </form>
                        </ul>
                    </li>
                    <li class="womenside3">
                        <div class="price1">
                            <a href="javascript:void(0);" class="ka3">가격</a> <a
                                href="javascript:void(0);" class="dodoC"><img
                                src="${pageContext.request.contextPath}/views/tranding/img/down_down.png"></a>
                                <a href="javascript:void(0);" class="upupC"><img
                                    src="${pageContext.request.contextPath}/views/tranding/img/up_up.png"></a>
                        </div>
                        <div class="price2">
							<form action="${pageContext.request.contextPath}/pjh/jsp/womenF.do" method="post">
								<input type="hidden" name="detailB" value="${detailB}" />			
								<input type="hidden" name="g_brand" value="${g_brand}" />		
								<input type="hidden" name="minsale" value="${minsale}" />		
								<input type="hidden" name="maxsale" value="${maxsale}" />	
								<input type="hidden" name="sessionA" value="${sessionA}" />		
	                            <select class="min_price" name="min_price" id="min_price">
	                                <option value=0>최저가</option>
	                                <option value=100000>10만</option>
		                            <option value=300000>30만</option>
		                            <option value=1000000>100만</option>
		                            <option value=3000000>300만</option>
		                            <option value=5000000>500만</option>
	                            </select> ~ <select class="max_price" name="max_price" id="max_price">
	                                <option value=0>최고가</option>
	                                <option value=100000>10만</option>
		                            <option value=300000>30만</option>
		                            <option value=1000000>100만</option>
		                            <option value=3000000>300만</option>
		                            <option value=5000000>500만</option>
	                            </select>
	                            <button type="submit" class="search_icon1">
                                    <img src="${pageContext.request.contextPath}/views/tranding/img/search_sch.png" />
                                </button>
                            </form>
                        </div>
                    </li>
                    <li class="womenside4">
                        <div class="salepok1">
                            <a href="javascript:void(0);" class="ka4">할인율</a> <a
                                href="javascript:void(0);" class="dodoD"><img
                                src="${pageContext.request.contextPath}/views/tranding/img/down_down.png"></a>
                                <a href="javascript:void(0);" class="upupD"><img
                                    src="${pageContext.request.contextPath}/views/tranding/img/up_up.png"></a>
                        </div>
                        <ul class="salepok2">
                            <li>
	                            <form action="${pageContext.request.contextPath}/pjh/jsp/womenF.do" method="post">
									<input type="hidden" name="detailB" value="${detailB}" />		
									<input type="hidden" name="g_brand" value="${g_brand}" />		
									<input type="hidden" name="max_price" value="${max_price}" />	
									<input type="hidden" name="min_price" value="${min_price}" />		
									<input type="hidden" name="sessionA" value="${sessionA}" />			
	                            <input type="hidden" name="minsale" value=30 /> 
	                            <button type="submit">30% 이하 세일</button>
	                            </form>
                            </li>
                            <li>
                            <form action="${pageContext.request.contextPath}/pjh/jsp/womenF.do" method="post">
	                            <input type="hidden" name="detailB" value="${detailB}" />		
									<input type="hidden" name="g_brand" value="${g_brand}" />		
									<input type="hidden" name="max_price" value="${max_price}" />	
									<input type="hidden" name="min_price" value="${min_price}" />		
									<input type="hidden" name="sessionA" value="${sessionA}" />		
	                            <input type="hidden" name="minsale" value=30 /> 
	                            <input type="hidden" name="maxsale" value=50 /> 
	                            <button type="submit">30%~50%세일</button>
	                            </form>
                            </li>
                            <li>
                            <form action="${pageContext.request.contextPath}/pjh/jsp/womenF.do" method="post">
	                            <input type="hidden" name="detailB" value="${detailB}" />		
									<input type="hidden" name="g_brand" value="${g_brand}" />		
									<input type="hidden" name="max_price" value="${max_price}" />	
									<input type="hidden" name="min_price" value="${min_price}" />		
									<input type="hidden" name="sessionA" value="${sessionA}" />		
	                            <input type="hidden" name="minsale" value=50 /> 
	                            <input type="hidden" name="maxsale" value=70 /> 
	                            <button type="submit">50%~70%세일</button>
	                            </form>
                            </li>
                            <li>
                            <form action="${pageContext.request.contextPath}/pjh/jsp/womenF.do" method="post">
	                            <input type="hidden" name="detailB" value="${detailB}" />		
									<input type="hidden" name="g_brand" value="${g_brand}" />		
									<input type="hidden" name="max_price" value="${max_price}" />	
									<input type="hidden" name="min_price" value="${min_price}" />		
									<input type="hidden" name="sessionA" value="${sessionA}" />		
	                            <input type="hidden" name="maxsale" value=70 /> 
	                            <button type="submit">70%이상세일</button>
	                            </form>
                           	</li>
                        </ul>
                    </li>
                </ul>
            </div>
            <div class="women_content clear">
                <ul class="women_cont1">
                    <c:choose>
		        	<c:when test="${outputA == null || fn:length(outputA) == 0 }">
						<div>
							<div>조회결과가 없습니다.</div>
						</div>
					</c:when>
					<c:otherwise>
                	<% 
                    	if(key_A == null){ 
                	%>
                	<c:forEach var="i" items="${outputA}" varStatus="status">
                	<c:url value="/pjh/jsp/no_looking.do" var="viewUrl">
						<c:param name="id" value="${i.id}" />
					</c:url>
                    <li class="cont1_1">
                    	<a href="${viewUrl}"> 
                    		<img src="${pageContext.request.contextPath}/views/tranding/img/${i.g_image_a}" />
                            <div>
                                <strong>${i.g_brand}</strong><br />${i.g_name}<br />
                            </div>
                            <div class="lf">${i.g_count_memprice_price}</div>
                            <div class="lf">${i.g_discount}</div>
                            <div>${i.g_ori_price}</div>
                    	</a>
                    </li>
                    </c:forEach>
                    <%
                    	}else{ 
                        	session.setAttribute("key", key_A);
                    %>
                    <c:forEach var="i" items="${outputA}" varStatus="status">
                	<c:url value="/pjh/jsp/looking_look.do" var="viewUrl">
						<c:param name="id" value="${i.id}" />
					</c:url>
                    <li class="cont1_1">
                    	<a href="${viewUrl}"> 
                    		<img src="${pageContext.request.contextPath}/views/tranding/img/${i.g_image_a}" />
                            <div>
                                <strong>${i.g_brand}</strong><br />${i.g_name}<br />
                            </div>
                            <div class="lf">${i.g_count_memprice_price}</div>
                            <div class="lf">${i.g_discount}</div>
                            <div>${i.g_ori_price}</div>
                    	</a>
                    </li>
                    </c:forEach>
                    <% } %>
                    </c:otherwise>
	        	</c:choose>
                </ul>
            </div>
            <div class="womenpage">
	        <c:choose>
				<c:when test="${pageData.prevPage > 0}">
					<c:url value="/pjh/jsp/womenB.do" var="prevPageUrl">
						<c:param name="page" value="${pageData.prevPage}" />
						<c:param name="g_detail_a" value="여성" />
						<c:param name="detailB" value="${detailB}" />
						<c:param name="g_brand" value="${g_brand}" />
						<c:param name="min_price" value="${min_price}" />
						<c:param name="max_price" value="${max_price}" />
						<c:param name="minsale" value="${minsale}" />
						<c:param name="maxsale" value="${maxsale}" />
						<c:param name="sessionA" value="${sessionA}" />
						<c:param name="pageData" value="${pageData}" />
					</c:url>
					<a href="${prevPageUrl}">[이전]</a>
				</c:when>
				<c:otherwise>
					[이전]
				</c:otherwise>
			</c:choose>
	
			<c:forEach var="i" begin="${pageData.startPage}" end="${pageData.endPage}" varStatus="status">
				<c:url value="/pjh/jsp/womenB.do" var="pageUrl">
					<c:param name="page" value="${i}" />
					<c:param name="g_detail_a" value="여성" />
					<c:param name="detailB" value="${detailB}" />
						<c:param name="g_brand" value="${g_brand}" />
						<c:param name="min_price" value="${min_price}" />
						<c:param name="max_price" value="${max_price}" />
						<c:param name="minsale" value="${minsale}" />
						<c:param name="maxsale" value="${maxsale}" />
						<c:param name="sessionA" value="${sessionA}" />
						<c:param name="pageData" value="${pageData}" />
				</c:url>
				
				<c:choose>
					<c:when test="${pageData.nowPage == i }">
						<strong>[${i}]</strong>
					</c:when>
					
					<c:otherwise>
						<a href="${pageUrl}">[${i}]</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			
			<c:choose>
				<c:when test="${pageData.nextPage > 0}">
					<c:url value="/pjh/jsp/womenB.do" var="nextPageUrl">
						<c:param name="page" value="${pageData.nextPage}" />
						<c:param name="g_detail_a" value="여성" />
						<c:param name="detailB" value="${detailB}" />
						<c:param name="g_brand" value="${g_brand}" />
						<c:param name="min_price" value="${min_price}" />
						<c:param name="max_price" value="${max_price}" />
						<c:param name="minsale" value="${minsale}" />
						<c:param name="maxsale" value="${maxsale}" />
						<c:param name="sessionA" value="${sessionA}" />
						<c:param name="pageData" value="${pageData}" />
					</c:url>
					<a href="${nextPageUrl}">[다음]</a>
				</c:when>
				<c:otherwise>
					[다음]
				</c:otherwise>
			</c:choose>
			</div>
        </div>
    </div>
</div>

<%@ include file="footer.jsp"%>
<script src="${pageContext.request.contextPath}/tranding/js/jquery-3.5.1.min.js"></script>
<script src="${pageContext.request.contextPath}/tranding/js/jquery.animatecss.min.js"></script>
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<script type="text/javascript">
$(function() {
	$('.dodoA').click(function() {

		var d1 = document.querySelector('.womenside1');
		var d2 = document.querySelector('.upupA');
		var d3 = document.querySelector('.dodoA');
		var d4 = document.querySelector('.kategorie2');

		d1.style.height = "200px";
		d2.style.display = "block";
		d3.style.display = "none";
		d4.style.display = "block";
		
		$(".kategorie2").animateCSS('fadeInLeft', { duration : 1000 });

	
	});
	$('.upupA').click(function() {

		var d1 = document.querySelector('.womenside1');
		var d2 = document.querySelector('.upupA');
		var d3 = document.querySelector('.dodoA');
		var d4 = document.querySelector('.kategorie2');

		d1.style.height = "30px";
		d2.style.display = "none";
		d3.style.display = "block";
		d4.style.display = "none";

	});
	$('.dodoB').click(function() {

		var d1 = document.querySelector('.womenside2');
		var d2 = document.querySelector('.upupB');
		var d3 = document.querySelector('.dodoB');
		var d4 = document.querySelector('.brand2');

		d1.style.height = "100px";
		d2.style.display = "block";
		d3.style.display = "none";
		d4.style.display = "block";
		
		$(".brand2").animateCSS('fadeInLeft', { duration : 1000 });

	
	});
	$('.upupB').click(function() {

		var d1 = document.querySelector('.womenside2');
		var d2 = document.querySelector('.upupB');
		var d3 = document.querySelector('.dodoB');
		var d4 = document.querySelector('.brand2');

		d1.style.height = "30px";
		d2.style.display = "none";
		d3.style.display = "block";
		d4.style.display = "none";

	});
	$('.dodoC').click(function() {

		var d1 = document.querySelector('.womenside3');
		var d2 = document.querySelector('.upupC');
		var d3 = document.querySelector('.dodoC');
		var d4 = document.querySelector('.price2');

		d1.style.height = "150px";
		d2.style.display = "block";
		d3.style.display = "none";
		d4.style.display = "block";
		
		$(".price2").animateCSS('fadeInLeft', { duration : 1000 });

	
	});
	$('.upupC').click(function() {

		var d1 = document.querySelector('.womenside3');
		var d2 = document.querySelector('.upupC');
		var d3 = document.querySelector('.dodoC');
		var d4 = document.querySelector('.price2');

		d1.style.height = "30px";
		d2.style.display = "none";
		d3.style.display = "block";
		d4.style.display = "none";

	});
	$('.dodoD').click(function() {

		var d1 = document.querySelector('.womenside4');
		var d2 = document.querySelector('.upupD');
		var d3 = document.querySelector('.dodoD');
		var d4 = document.querySelector('.salepok2');

		d1.style.height = "100px";
		d2.style.display = "block";
		d3.style.display = "none";
		d4.style.display = "block";
		
		$(".salepok2").animateCSS('fadeInLeft', { duration : 1000 });

	
	});
	$('.upupD').click(function() {

		var d1 = document.querySelector('.womenside4');
		var d2 = document.querySelector('.upupD');
		var d3 = document.querySelector('.dodoD');
		var d4 = document.querySelector('.salepok2');

		d1.style.height = "30px";
		d2.style.display = "none";
		d3.style.display = "block";
		d4.style.display = "none";

	});
	$('.ka1').click(function() {

		var d1 = document.querySelector('.womenside1');
		var d2 = document.querySelector('.upupA');
		var d3 = document.querySelector('.dodoA');
		var d4 = document.querySelector('.kategorie2');

		d1.style.height = "200px";
		d2.style.display = "block";
		d3.style.display = "none";
		d4.style.display = "block";
		
		$(".kategorie2").animateCSS('fadeInLeft', { duration : 1000 });

	
	});

	$('.ka2').click(function() {

		var d1 = document.querySelector('.womenside2');
		var d2 = document.querySelector('.upupB');
		var d3 = document.querySelector('.dodoB');
		var d4 = document.querySelector('.brand2');

		d1.style.height = "100px";
		d2.style.display = "block";
		d3.style.display = "none";
		d4.style.display = "block";
		
		$(".brand2").animateCSS('fadeInLeft', { duration : 1000 });

	
	});
	
	$('.ka3').click(function() {

		var d1 = document.querySelector('.womenside3');
		var d2 = document.querySelector('.upupC');
		var d3 = document.querySelector('.dodoC');
		var d4 = document.querySelector('.price2');

		d1.style.height = "150px";
		d2.style.display = "block";
		d3.style.display = "none";
		d4.style.display = "block";
		
		$(".price2").animateCSS('fadeInLeft', { duration : 1000 });

	
	});
	
	$('.ka4').click(function() {

		var d1 = document.querySelector('.womenside4');
		var d2 = document.querySelector('.upupD');
		var d3 = document.querySelector('.dodoD');
		var d4 = document.querySelector('.salepok2');

		d1.style.height = "100px";
		d2.style.display = "block";
		d3.style.display = "none";
		d4.style.display = "block";
		
		$(".salepok2").animateCSS('fadeInLeft', { duration : 1000 });

	
	});

});

function goUrl(url){
	window.location.href=url;
}

</script>
</body>
</html>
