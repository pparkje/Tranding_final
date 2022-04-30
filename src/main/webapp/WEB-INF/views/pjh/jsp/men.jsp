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
    Members key_B = (Members) session.getAttribute("key");
    session.setAttribute("key", key_B);
%>
<!-- 이곳에 html , css , js , jQuery 적용하면 됩니다. -->
<div class="men">
    <div class="men_top">
        <div class="men_text">
            <a href="${pageContext.request.contextPath}/pjh/jsp/men.do" class="mtext">MEN</a>
            <ul class="mtext1">
                <li>
                	<form action="${pageContext.request.contextPath}/pjh/jsp/menF.do" method="post">
                	 	<input type="hidden" name="g_brand" value="디젤" />
                	 	<input type="hidden" name="detailB" value="${detailB}" />	
						<input type="hidden" name="min_price" value="${min_price}" />	
						<input type="hidden" name="max_price" value="${max_price}" />		
						<input type="hidden" name="minsale" value="${minsale}" />		
						<input type="hidden" name="maxsale" value="${maxsale}" />		
						<input type="hidden" name="sessionA" value="${sessionA}" />	
                		<button type="submit">디젤</button>
                	</form>
                </li>
                
                <li>
                	<form action="${pageContext.request.contextPath}/pjh/jsp/menF.do" method="post">
                	 	<input type="hidden" name="g_brand" value="발망" />
                	 	<input type="hidden" name="detailB" value="${detailB}" />	
						<input type="hidden" name="min_price" value="${min_price}" />	
						<input type="hidden" name="max_price" value="${max_price}" />		
						<input type="hidden" name="minsale" value="${minsale}" />		
						<input type="hidden" name="maxsale" value="${maxsale}" />		
						<input type="hidden" name="sessionA" value="${sessionA}" />	
                		<button type="submit">발망</button>
                	</form>
                </li>
                
                <li>
                <form action="${pageContext.request.contextPath}/pjh/jsp/menF.do" method="post">
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
                	<form action="${pageContext.request.contextPath}/pjh/jsp/menF.do" method="post">
                	 	<input type="hidden" name="g_brand" value="몽블랑" />
                	 	<input type="hidden" name="detailB" value="${detailB}" />	
						<input type="hidden" name="min_price" value="${min_price}" />	
						<input type="hidden" name="max_price" value="${max_price}" />		
						<input type="hidden" name="minsale" value="${minsale}" />		
						<input type="hidden" name="maxsale" value="${maxsale}" />		
						<input type="hidden" name="sessionA" value="${sessionA}" />	
                		<button type="submit">몽블랑</button>
                	</form>
                </li>
                <li>
                	<form action="${pageContext.request.contextPath}/pjh/jsp/menF.do" method="post">
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
            </ul>
            <div class="mtext2">
	                <select class="mmtext2_mtext" name="clas" id="clas" onchange="goUrl(this.options[this.selectedIndex].value)">
                   		<c:url value="/pjh/jsp/menA.do" var="URLA">
							<c:param name="sessionA" value="1"/>
	                	 	<c:param name="detailB" value="${detailB}"  />
							<c:param name="g_brand" value="${g_brand}"  />		
							<c:param name="min_price" value="${min_price}"  />
							<c:param name="max_price" value="${max_price}"  />	
							<c:param name="minsale" value="${minsale}"  />		
							<c:param name="maxsale" value="${maxsale}"  />	
						</c:url>
						 <c:url value="/pjh/jsp/menA.do" var="URLB">
							<c:param name="sessionA" value="2" />
	                	 	<c:param name="detailB" value="${detailB}"  />
							<c:param name="g_brand" value="${g_brand}"  />	
							<c:param name="min_price" value="${min_price}"  />
							<c:param name="max_price" value="${max_price}"  />	
							<c:param name="minsale" value="${minsale}"  />		
							<c:param name="maxsale" value="${maxsale}"  />	
						</c:url>
						 <c:url value="/pjh/jsp/menA.do" var="URLC">
							<c:param name="sessionA" value="3" />
	                	 	<c:param name="detailB" value="${detailB}"  />
							<c:param name="g_brand" value="${g_brand}"  />		
							<c:param name="min_price" value="${min_price}"  />
							<c:param name="max_price" value="${max_price}"  />	
							<c:param name="minsale" value="${minsale}"  />		
							<c:param name="maxsale" value="${maxsale}"  />	
						</c:url>
						 <c:url value="/pjh/jsp/menA.do" var="URLD">
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
    <div class="men_middle">
        <div class="men_cont">
            <div class="men_side">
                <ul class="side_bar1">
                    <li class="menside1">
                        <div class="kategorie1">
                            <a href="javascript:void(0);" class="ka1">카테고리</a> 
                            <a href="javascript:void(0);" class="dododoA"><img
                                src="${pageContext.request.contextPath}/views/tranding/img/down_down.png"></a>
                            <a href="javascript:void(0);" class="upupupA"><img
                                src="${pageContext.request.contextPath}/views/tranding/img/up_up.png"></a>
                        </div>
                        <ul class="kategorie2">
                        	<li>
	                            <form action="${pageContext.request.contextPath}/pjh/jsp/menF.do" method="post">
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
                            	<form action="${pageContext.request.contextPath}/pjh/jsp/menF.do" method="post">
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
                            	<form action="${pageContext.request.contextPath}/pjh/jsp/menF.do" method="post">
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
                           	 	<form action="${pageContext.request.contextPath}/pjh/jsp/menF.do" method="post">
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
                    <li class="menside2">
                        <ul>
                            <li class="brand1">
	                            <a href="javascript:void(0);" class="ka2">브랜드</a> 
	                            <a href="javascript:void(0);" class="dododoB">
	                            	<img src="${pageContext.request.contextPath}/views/tranding/img/down_down.png"">
	                            </a>
	                            <a href="javascript:void(0);" class="upupupB">
	                            	<img src="${pageContext.request.contextPath}/views/tranding/img/up_up.png">
	                            </a>
                            </li>
                            <form class="brand2" method="post" action="${pageContext.request.contextPath}/pjh/jsp/menF.do">
                           		<input type="hidden" name="detailB" value="${detailB}" />		
								<input type="hidden" name="min_price" value="${min_price}" />	
								<input type="hidden" name="max_price" value="${max_price}" />	
								<input type="hidden" name="minsale" value="${minsale}" />	
								<input type="hidden" name="maxsale" value="${maxsale}" />
								<input type="hidden" name="sessionA" value="${sessionA}" />		
                                <input type="text" name="g_brand" class="search_text1"
                                    placeholder="ex)구지,구라다..." value="${g_brand}"/>
                                <button type="submit" class="search_icon1">
                                    <img src="${pageContext.request.contextPath}/views/tranding/img/search_sch.png" />
                                </button>
                            </form>
                        </ul>
                    </li>
                    <li class="menside3">
                        <div class="price1">
                            <a href="javascript:void(0);" class="ka3">가격</a> 
                            <a href="javascript:void(0);" class="dododoC">
                            	<img src="${pageContext.request.contextPath}/views/tranding/img/down_down.png"">
                            </a>
                            <a href="javascript:void(0);" class="upupupC">
                            	<img src="${pageContext.request.contextPath}/views/tranding/img/up_up.png">
                            </a>
                        </div>
                        <div class="price2">
                        	<form action="${pageContext.request.contextPath}/pjh/jsp/menF.do" method="post">
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
                    <li class="menside4">
                        <div class="salepok1">
                            <a href="javascript:void(0);" class="ka4">할인율</a> <a
                                href="javascript:void(0);" class="dododoD"><img
                                src="${pageContext.request.contextPath}/views/tranding/img/down_down.png""></a>
                            <a href="javascript:void(0);" class="upupupD"><img
                                src="${pageContext.request.contextPath}/views/tranding/img/up_up.png"></a>
                        </div>
                        <ul class="salepok2">
                            <li>
	                            <form action="${pageContext.request.contextPath}/pjh/jsp/menF.do" method="post">
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
                            <form action="${pageContext.request.contextPath}/pjh/jsp/menF.do" method="post">
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
                            <form action="${pageContext.request.contextPath}/pjh/jsp/menF.do" method="post">
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
                            <form action="${pageContext.request.contextPath}/pjh/jsp/menF.do" method="post">
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
            <div class="men_content">
                <ul class="men_cont1">
                <c:choose>
		        	<c:when test="${outputA == null || fn:length(outputA) == 0 }">
						<div>
							<div>조회결과가 없습니다.</div>
						</div>
					</c:when>
					<c:otherwise>
                	<% 
                    	if(key_B == null){ 
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
                        	session.setAttribute("key", key_B);
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
            <div class="menpage">
	        <c:choose>
				<c:when test="${pageData.prevPage > 0}">
					<c:url value="/pjh/jsp/menB.do" var="prevPageUrl">
						<c:param name="page" value="${pageData.prevPage}" />
						<c:param name="g_detail_a" value="남성" />
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
				<c:url value="/pjh/jsp/menB.do" var="pageUrl">
					<c:param name="page" value="${i}" />
					<c:param name="g_detail_a" value="남성" />
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
					<c:url value="/pjh/jsp/menB.do" var="nextPageUrl">
						<c:param name="page" value="${pageData.nextPage}" />
						<c:param name="g_detail_a" value="남성" />
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
<div id="footer" class="footer_main">
	<h2 class="sr-only">Footer</h2>
	<div class="footer_container">
		<div class="footer_customer">
			<div class="footer_customer_contents">
				<span class="footer_contents_text">고객센터</span>
				<div class="footer_customer_contents_main">
					<div class="footer_customer_contents_depth1">
						<a href="#" role="button" class="customer_phone_number"> <span
							class="sr-only">고객센터전화번호</span> 1234-5678
						</a>
						<div class="callcenterinfo_outer">
							<div class="callcenter_info_inner">
								<span class="info">전화상담 운영시간</span>
								<div class="callcenterinfo_inner_contents">
									<span class="sr-only">운영요일 및 시간</span>
									<dl>
										<dt>평일</dt>
										<dd>9:00~21:00</dd>
									</dl>
									<dl>
										<dt>주말 및 공휴일</dt>
										<dd>10:00~17:00</dd>
									</dl>
								</div>
							</div>
						</div>
					</div>
					<a href="#" role="button" class="customer_inq">1:1문의하기</a>
				</div>
			</div>

		</div>
		<div class="footer_other">
			<span class="sr-only">트렌딩 회사정보</span>
			<div class="footer_company">
				<div class="bod">
					<span class="sr-only">트렝딩 회사 서비스 소개</span>
					<ul>
						<li><a href="#">회사소개</a></li>
						<li><a href="#">제휴문의</a></li>
						<li><a href="#">개인정보취급방침</a></li>
						<li><a href="#">이용약관</a></li>
					</ul>
				</div>
				<div class="footer_company_info">
					<span class="sr-only">트렌딩 sns 및 사업자정보</span>
					<ul class="footer_sns">
						<li class="footer_insta"><a href="#"><span
								class="sr-only">인스타그램</span><i class="fa fa-instagram"
								aria-hidden="true" style="font-size: 25px;"></i> </a></li>
						<li class="footer_facebook"><a href="#"><span
								class="sr-only">페이스북</span><i class="fa fa-facebook-official"
								aria-hidden="true" style="font-size: 25px;"></i> </a></li>
						<li class="footer_youtube"><a href="#"><span
								class="sr-only">유튜브</span><i class="fa fa-youtube-play"
								aria-hidden="true" style="font-size: 25px;"></i> </a></li>
						<li class="footer_blog"><a href="#"><span class="sr-only">블로그</span><i
								class="fa fa-bold" aria-hidden="true" style="font-size: 25px;"></i></a></li>
					</ul>
					<div class="footer_company_info">
						<ul>
							<li>상호명: 주식회사 트렌딩</li>
							<li>메일: wdwjsjdj@gmail.com</li>
							<li>전화번호: 1234-5678</li>
							<li>주소: 서울시 서초구 서초대로111길 32,20층(서초동)</li>
							<li>copyright(c)www.trending.com</li>
							<li>all right reserved</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>


<script type="text/javascript">
$(function() {
	$('.dododoA').click(function() {

		var d1 = document.querySelector('.menside1');
		var d2 = document.querySelector('.upupupA');
		var d3 = document.querySelector('.dododoA');
		var d4 = document.querySelector('.kategorie2');

		d1.style.height = "200px";
		d2.style.display = "block";
		d3.style.display = "none";
		d4.style.display = "block";
		
		$(".kategorie2").animateCSS('fadeInLeft', { duration : 1000 });

	
	});
	$('.upupupA').click(function() {

		var d1 = document.querySelector('.menside1');
		var d2 = document.querySelector('.upupupA');
		var d3 = document.querySelector('.dododoA');
		var d4 = document.querySelector('.kategorie2');

		d1.style.height = "30px";
		d2.style.display = "none";
		d3.style.display = "block";
		d4.style.display = "none";

	});
	$('.dododoB').click(function() {

		var d1 = document.querySelector('.menside2');
		var d2 = document.querySelector('.upupupB');
		var d3 = document.querySelector('.dododoB');
		var d4 = document.querySelector('.brand2');

		d1.style.height = "100px";
		d2.style.display = "block";
		d3.style.display = "none";
		d4.style.display = "block";
		
		$(".brand2").animateCSS('fadeInLeft', { duration : 1000 });

	
	});
	$('.upupupB').click(function() {

		var d1 = document.querySelector('.menside2');
		var d2 = document.querySelector('.upupupB');
		var d3 = document.querySelector('.dododoB');
		var d4 = document.querySelector('.brand2');

		d1.style.height = "30px";
		d2.style.display = "none";
		d3.style.display = "block";
		d4.style.display = "none";

	});
	$('.dododoC').click(function() {

		var d1 = document.querySelector('.menside3');
		var d2 = document.querySelector('.upupupC');
		var d3 = document.querySelector('.dododoC');
		var d4 = document.querySelector('.price2');

		d1.style.height = "150px";
		d2.style.display = "block";
		d3.style.display = "none";
		d4.style.display = "block";
		
		$(".price2").animateCSS('fadeInLeft', { duration : 1000 });

	
	});
	$('.upupupC').click(function() {

		var d1 = document.querySelector('.menside3');
		var d2 = document.querySelector('.upupupC');
		var d3 = document.querySelector('.dododoC');
		var d4 = document.querySelector('.price2');

		d1.style.height = "30px";
		d2.style.display = "none";
		d3.style.display = "block";
		d4.style.display = "none";

	});
	$('.dododoD').click(function() {

		var d1 = document.querySelector('.menside4');
		var d2 = document.querySelector('.upupupD');
		var d3 = document.querySelector('.dododoD');
		var d4 = document.querySelector('.salepok2');

		d1.style.height = "100px";
		d2.style.display = "block";
		d3.style.display = "none";
		d4.style.display = "block";
		
		$(".salepok2").animateCSS('fadeInLeft', { duration : 1000 });

	
	});
	$('.upupupD').click(function() {

		var d1 = document.querySelector('.menside4');
		var d2 = document.querySelector('.upupupD');
		var d3 = document.querySelector('.dododoD');
		var d4 = document.querySelector('.salepok2');

		d1.style.height = "30px";
		d2.style.display = "none";
		d3.style.display = "block";
		d4.style.display = "none";

	});
	$('.ka1').click(function() {

		var d1 = document.querySelector('.menside1');
		var d2 = document.querySelector('.upupupA');
		var d3 = document.querySelector('.dododoA');
		var d4 = document.querySelector('.kategorie2');

		d1.style.height = "200px";
		d2.style.display = "block";
		d3.style.display = "none";
		d4.style.display = "block";
		
		$(".kategorie2").animateCSS('fadeInLeft', { duration : 1000 });

	
	});

	$('.ka2').click(function() {

		var d1 = document.querySelector('.menside2');
		var d2 = document.querySelector('.upupupB');
		var d3 = document.querySelector('.dododoB');
		var d4 = document.querySelector('.brand2');

		d1.style.height = "100px";
		d2.style.display = "block";
		d3.style.display = "none";
		d4.style.display = "block";
		
		$(".brand2").animateCSS('fadeInLeft', { duration : 1000 });

	
	});
	
	$('.ka3').click(function() {

		var d1 = document.querySelector('.menside3');
		var d2 = document.querySelector('.upupupC');
		var d3 = document.querySelector('.dododoC');
		var d4 = document.querySelector('.price2');

		d1.style.height = "150px";
		d2.style.display = "block";
		d3.style.display = "none";
		d4.style.display = "block";
		
		$(".price2").animateCSS('fadeInLeft', { duration : 1000 });

	
	});
	
	$('.ka4').click(function() {

		var d1 = document.querySelector('.menside4');
		var d2 = document.querySelector('.upupupD');
		var d3 = document.querySelector('.dododoD');
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
