<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="pjh/jsp/header.jsp"%>
<%@ page import="study.spring.trspring.model.Members"%>
<!-- ========== 컨텐츠 영역 시작 ========== -->
<%
	request.setCharacterEncoding("UTF-8");
    Members keyA = (Members) session.getAttribute("key");
    session.setAttribute("key", keyA);
%>
<!-- 이곳에 html , css , js , jQuery 적용하면 됩니다. -->
<div class="mainpage_main">
	
	<div id="ddiv">
		<div class="swiper-container swiperA">
			<div class="swiper-wrapper">
				<!-- 슬라이드 처리 영역  -->
				<div class="swiper-slide swiperA_A">
					<div class="sub_imformation swiperA_A_A">
					<c:url value="/pjh/jsp/brand_brand.do" var="URL">
						<c:param name="g_detail_b" value="지갑" />
					</c:url>
					<a href="${URL}">
						        <img src="${pageContext.request.contextPath}/views/tranding/img/1.jpg" />
						    </a>
					</div>
				</div>
				<div class="swiper-slide swiperA_A">
					<div class="sub_imformation swiperA_A_A">
					<c:url value="/pjh/jsp/brand_brand.do" var="URLA">
						<c:param name="g_brand" value="메종마르지엘라" />
					</c:url>
					<a href="${URLA}">
					        <img src="${pageContext.request.contextPath}/views/tranding/img/2.jpg" />
					    </a>
					</div>
				</div>
				<div class="swiper-slide swiperA_A">	
					<div class="sub_imformation swiperA_A_A">
					<c:url value="/pjh/jsp/brand_brand.do" var="URLB">
						<c:param name="g_detail_b" value="의류" />
					</c:url>
					<a href="${URLB}">
					        <img src="${pageContext.request.contextPath}/views/tranding/img/3.jpg" />
					    </a>
					</div>
				</div>
				<div class="swiper-slide swiperA_A">	
					<div class="sub_imformation swiperA_A_A">
					<c:url value="/pjh/jsp/brand_brand.do" var="URLC">
						<c:param name="g_detail_b" value="가방" />
					</c:url>
					<a href="${URLC}">
					        <img src="${pageContext.request.contextPath}/views/tranding/img/4.jpg" />
					    </a>
					</div>
				</div>
				<div class="swiper-slide swiperA_A">	
					<div class="sub_imformation swiperA_A_A">
					<c:url value="/pjh/jsp/brand_brand.do" var="URLD">
					</c:url>
					<a href="${URLD}">
					        <img src="${pageContext.request.contextPath}/views/tranding/img/5.jpg" />
					    </a>
					</div>
				</div>
				<div class="swiper-slide swiperA_A">	
					<div class="sub_imformation swiperA_A_A">
					<c:url value="/pjh/jsp/brand_brand.do" var="URLE">
						<c:param name="g_detail_b" value="가방" />
					</c:url>
					<a href="${URLE}">
					        <img src="${pageContext.request.contextPath}/views/tranding/img/6.jpg" />
					    </a>
					</div>
				</div>
				<div class="swiper-slide swiperA_A">	
					<c:url value="/pjh/jsp/brand_brand.do" var="URLF">
						<c:param name="g_detail_b" value="액세서리" />
					</c:url>
					<div class="sub_imformation swiperA_A_A">
							<a href="${URLF}">
					        <img src="${pageContext.request.contextPath}/views/tranding/img/7.jpg" />
					    </a>
					</div>
				</div>
			</div>
			<!-- 좌우버튼 밑에 조그마한 동그라미 버튼 밑에 스크롤바 영역 -->
			<div class="swiper-pagination"></div>
			<!-- 버튼 추가 구현 -->
			<div class="swiper-button-prev"></div>
			<div class="swiper-button-next"></div>
		</div>
	</div>
	<div class="t_time">
		<div class="timeA">
		    <div class="timetxt">
		    	<h5>TIME DEAL</h5>
		    	<h1 id="timeDeal"></h1>
		    </div>
		</div>
		<div class="timeB">
		    <div class="timeprod_A">

				<% 
                    	if(key == null){ 
                %>
                <c:url value="/pjh/jsp/no_looking.do" var="viewUrl">
					<c:param name="id" value="1" />
				</c:url>
				<a href="${viewUrl}" class="timeprodA">
				   	 	<span class="timeprodimg">
				    		<img src="${pageContext.request.contextPath}/views/tranding/img/${outputA[0].g_image_a}">
				    	</span>
				    	<div class="brandtxt">
					    	<span class="brand">${outputA[0].g_brand}</span>
					    	<span class="bname">${outputA[0].g_name}</span>
					    	<span class="price">${outputA[0].g_count_memprice_price}</span>
					    	<span class="priceA">&nbsp;${outputA[0].g_discount}</span>
					    	<span class="priceB">${outputA[0].g_ori_price}</span>
				    	</div>
			    	</a>
		    	<% }else{ 
                    	
                    	session.setAttribute("key", key);
                %>
                <c:set var="m_id" value="${outputZ.m_id}" />
                <c:url value="/pjh/jsp/looking.do" var="viewUrl">
					<c:param name="id" value="1" />
					<c:param name="m_id" value="${m_id}" />
				</c:url>
                <a href="${viewUrl}" class="timeprodA">
			   	 	<span class="timeprodimg">
			    		<img src="${pageContext.request.contextPath}/views/tranding/img/${outputA[0].g_image_a}">
			    	</span>
			    	<div class="brandtxt">
				    	<span class="brand">${outputA[0].g_brand}</span>
				    	<span class="bname">${outputA[0].g_name}</span>
				    	<span class="price">${outputA[0].g_count_memprice_price}</span>
				    	<span class="priceA">&nbsp;${outputA[0].g_discount}</span>
				    	<span class="priceB">${outputA[0].g_ori_price}</span>
			    	</div>
		    		</a>
		    	<% } %>
		    </div>
		    <div class="timeprod_B">
		    	<% 
                    	if(key == null){ 
                %>
                <c:url value="/pjh/jsp/no_looking.do" var="viewUrl">
					<c:param name="id" value="2" />
				</c:url>
				<a href="${viewUrl}" class="timeprodA">
			   	 	<span class="timeprodimg">
			    		<img src="${pageContext.request.contextPath}/views/tranding/img/${outputA[1].g_image_a}">
			    	</span>
			    	<div class="brandtxt">
				    	<span class="brand">${outputA[1].g_brand}</span>
				    	<span class="bname">${outputA[1].g_name}</span>
				    	<span class="price">${outputA[1].g_count_memprice_price}</span>
				    	<span class="priceA">&nbsp;${outputA[1].g_discount}</span>
				    	<span class="priceB">${outputA[1].g_ori_price}</span>
			    	</div>
			    	</a>
		    	<% }else{ 
                    	session.setAttribute("key", key);
                %>
                <c:set var="m_id" value="${outputZ.m_id}" />
                <c:url value="/pjh/jsp/looking.do" var="viewUrl">
					<c:param name="id" value="2" />
					<c:param name="m_id" value="${m_id}" />
				</c:url>
				<a href="${viewUrl}" class="timeprodA">
			   	 	<span class="timeprodimg">
			    		<img src="${pageContext.request.contextPath}/views/tranding/img/${outputA[1].g_image_a}">
			    	</span>
			    	<div class="brandtxt">
				    	<span class="brand">${outputA[1].g_brand}</span>
				    	<span class="bname">${outputA[1].g_name}</span>
				    	<span class="price">${outputA[1].g_count_memprice_price}</span>
				    	<span class="priceA">&nbsp;${outputA[1].g_discount}</span>
				    	<span class="priceB">${outputA[1].g_ori_price}</span>
			    	</div>
			    	</a>
		    	<% } %>
		    </div>
		    <div class="timeprod_C">
			    <% 
                    	if(key == null){ 
                %>
                <c:url value="/pjh/jsp/no_looking.do" var="viewUrl">
					<c:param name="id" value="3" />
				</c:url>
		    	<a href="${viewUrl}" class="timeprodA">
			   	 	<span class="timeprodimg">
			    		<img src="${pageContext.request.contextPath}/views/tranding/img/${outputA[2].g_image_a}">
			    	</span>
			    	<div class="brandtxt">
				    	<span class="brand">${outputA[2].g_brand}</span>
				    	<span class="bname">${outputA[2].g_name}</span>
				    	<span class="price">${outputA[2].g_count_memprice_price}</span>
				    	<span class="priceA">&nbsp;${outputA[2].g_discount}</span>
				    	<span class="priceB">${outputA[2].g_ori_price}</span>
			    	</div>
		    		</a>
		    	<% }else{ 
                    	session.setAttribute("key", key);
                %>
                <c:url value="/pjh/jsp/looking.do" var="viewUrl">
					<c:param name="id" value="3" />
					<c:param name="m_id" value="${m_id}" />
				</c:url>
                <a href="${viewUrl}" class="timeprodA">
			   	 	<span class="timeprodimg">
			    		<img src="${pageContext.request.contextPath}/views/tranding/img/${outputA[2].g_image_a}">
			    	</span>
			    	<div class="brandtxt">
				    	<span class="brand">${outputA[2].g_brand}</span>
				    	<span class="bname">${outputA[2].g_name}</span>
				    	<span class="price">${outputA[2].g_count_memprice_price}</span>
				    	<span class="priceA">&nbsp;${outputA[2].g_discount}</span>
				    	<span class="priceB">${outputA[2].g_ori_price}</span>
			    	</div>
		    		</a>
		    	<% } %>
		    </div>
	    </div>
	</div>
	<div class="liA"></div>
	<div class="pro_subject">#봄철에 하늘하늘 이쁜 아이템</div>
	<div class="main_chu">
		<div class="swiper-container swiperB">
			<div class="swiper-wrapper swiperB_A">
				<c:forEach var="i" begin="1" end="12" step="1" varStatus="status">
				<!-- 슬라이드 처리 영역  -->
				<div class="swiper-slide">
					<div class="sub_imformation swiperB_A_A">
					<% 
                    	if(key == null){ 
	                %>
	                <c:url value="/pjh/jsp/no_looking.do" var="viewUrl">
						<c:param name="id" value="${status.index}" />
					</c:url>
					<a href="${viewUrl}" >
							<img src="${pageContext.request.contextPath}/views/tranding/img/${outputA[status.index-1].g_image_a}" />
							<div class="pro_name">${outputA[status.index-1].g_brand}</div>
							<div class="pro_pro">${outputA[status.index-1].g_name}</div>
							<div class="pro_pri_A">${outputA[status.index-1].g_count_memprice_price}</div>
							<div class="pro_pri_B">${outputA[status.index-1].g_discount}</div>
							<div class="pro_pri_C">${outputA[status.index-1].g_ori_price}</div>
						</a>
					<% }else{ 
                    	session.setAttribute("key", key);
	                %>
	                <c:set var="m_id" value="${outputZ.m_id}" />
	                <c:url value="/pjh/jsp/looking.do" var="viewUrl">
						<c:param name="id" value="${status.index}" />
					</c:url>
					<a href="${viewUrl}" >
							<img src="${pageContext.request.contextPath}/views/tranding/img/${outputA[status.index-1].g_image_a}" />
							<div class="pro_name">${outputA[status.index-1].g_brand}</div>
							<div class="pro_pro">${outputA[status.index-1].g_name}</div>
							<div class="pro_pri_A">${outputA[status.index-1].g_count_memprice_price}</div>
							<div class="pro_pri_B">${outputA[status.index-1].g_discount}</div>
							<div class="pro_pri_C">${outputA[status.index-1].g_ori_price}</div>
						</a>
					<% } %>
					</div>
				</div>
			</c:forEach>
			</div>
			<!-- 좌우버튼 밑에 조그마한 동그라미 버튼 밑에 스크롤바 영역 -->
			<!-- <div class="swiper-pagination"></div> -->
			<!-- 버튼 추가 구현 -->
			<div class="swiper-button-prev"></div>
			<div class="swiper-button-next"></div>
		</div>
	</div>
	<div class="pro_subject">#슬슬 준비해야 할걸?!</div>
	<div class="main_chu">
		<div class="swiper-container swiperB">
			<div class="swiper-wrapper swiperB_A">
			<c:forEach var="i" begin="13" end="24" step="1" varStatus="status">
				<!-- 슬라이드 처리 영역  -->
				<div class="swiper-slide">
					<div class="sub_imformation swiperB_A_A">
					<% 
                    	if(key == null){ 
	                %>
	                <c:url value="/pjh/jsp/no_looking.do" var="viewUrl">
						<c:param name="id" value="${status.index}" />
					</c:url>
					<a href="${viewUrl}" >
							<img src="${pageContext.request.contextPath}/views/tranding/img/${outputA[status.index-1].g_image_a}" />
							<div class="pro_name">${outputA[status.index-1].g_brand}</div>
							<div class="pro_pro">${outputA[status.index-1].g_name}</div>
							<div class="pro_pri_A">${outputA[status.index-1].g_count_memprice_price}</div>
							<div class="pro_pri_B">${outputA[status.index-1].g_discount}</div>
							<div class="pro_pri_C">${outputA[status.index-1].g_ori_price}</div>
						</a>
					<% }else{ 
                    	session.setAttribute("key", key);
	                %>
	                <c:url value="/pjh/jsp/looking.do" var="viewUrl">
						<c:param name="id" value="${status.index}" />
					</c:url>
					<a href="${viewUrl}" >
							<img src="${pageContext.request.contextPath}/views/tranding/img/${outputA[status.index-1].g_image_a}" />
							<div class="pro_name">${outputA[status.index-1].g_brand}</div>
							<div class="pro_pro">${outputA[status.index-1].g_name}</div>
							<div class="pro_pri_A">${outputA[status.index-1].g_count_memprice_price}</div>
							<div class="pro_pri_B">${outputA[status.index-1].g_discount}</div>
							<div class="pro_pri_C">${outputA[status.index-1].g_ori_price}</div>
						</a>
					<% } %>
					</div>
				</div>
			</c:forEach>
			</div>
			<!-- 좌우버튼 밑에 조그마한 동그라미 버튼 밑에 스크롤바 영역 -->
			<!-- <div class="swiper-pagination"></div> -->
			<!-- 버튼 추가 구현 -->
			<div class="swiper-button-prev"></div>
			<div class="swiper-button-next"></div>
		</div>
	</div>
	<div class="pro_subject">#레디 투 고~</div>
	<div class="main_chu">
		<div class="swiper-container swiperB">
			<div class="swiper-wrapper swiperB_A">
				<c:forEach var="i" begin="25" end="36" step="1" varStatus="status">
				<!-- 슬라이드 처리 영역  -->
				<div class="swiper-slide">
					<div class="sub_imformation swiperB_A_A">
					<% 
                    	if(key == null){ 
	                %>
	                <c:url value="/pjh/jsp/no_looking.do" var="viewUrl">
						<c:param name="id" value="${status.index}" />
					</c:url>
					<a href="${viewUrl}" >
							<img src="${pageContext.request.contextPath}/views/tranding/img/${outputA[status.index-1].g_image_a}" />
							<div class="pro_name">${outputA[status.index-1].g_brand}</div>
							<div class="pro_pro">${outputA[status.index-1].g_name}</div>
							<div class="pro_pri_A">${outputA[status.index-1].g_count_memprice_price}</div>
							<div class="pro_pri_B">${outputA[status.index-1].g_discount}</div>
							<div class="pro_pri_C">${outputA[status.index-1].g_ori_price}</div>
						</a>
					<% }else{ 
                    	session.setAttribute("key", key);
	                %>
	                <c:url value="/pjh/jsp/looking.do" var="viewUrl">
						<c:param name="id" value="${status.index}" />
					</c:url>
					<a href="${viewUrl}" >
							<img src="${pageContext.request.contextPath}/views/tranding/img/${outputA[status.index-1].g_image_a}" />
							<div class="pro_name">${outputA[status.index-1].g_brand}</div>
							<div class="pro_pro">${outputA[status.index-1].g_name}</div>
							<div class="pro_pri_A">${outputA[status.index-1].g_count_memprice_price}</div>
							<div class="pro_pri_B">${outputA[status.index-1].g_discount}</div>
							<div class="pro_pri_C">${outputA[status.index-1].g_ori_price}</div>
						</a>
					<% } %>
					</div>
				</div>
			</c:forEach>
			</div>
			<!-- 좌우버튼 밑에 조그마한 동그라미 버튼 밑에 스크롤바 영역 -->
			<!-- <div class="swiper-pagination"></div> -->
			<!-- 버튼 추가 구현 -->
			<div class="swiper-button-prev"></div>
			<div class="swiper-button-next"></div>
		</div>
	</div>
	<div class="pro_subject">#시간이 지나도 변하지 않는 가치</div>
	<div class="main_chu">
		<div class="swiper-container swiperB">
			<div class="swiper-wrapper swiperB_A">
				<c:forEach var="i" begin="37" end="48" step="1" varStatus="status">
				<!-- 슬라이드 처리 영역  -->
				<div class="swiper-slide">
					<div class="sub_imformation swiperB_A_A">
					<% 
                    	if(key == null){ 
	                %>
	                <c:url value="/pjh/jsp/no_looking.do" var="viewUrl">
						<c:param name="id" value="${status.index}" />
					</c:url>
					<a href="${viewUrl}" >
							<img src="${pageContext.request.contextPath}/views/tranding/img/${outputA[status.index-1].g_image_a}" />
							<div class="pro_name">${outputA[status.index-1].g_brand}</div>
							<div class="pro_pro">${outputA[status.index-1].g_name}</div>
							<div class="pro_pri_A">${outputA[status.index-1].g_count_memprice_price}</div>
							<div class="pro_pri_B">${outputA[status.index-1].g_discount}</div>
							<div class="pro_pri_C">${outputA[status.index-1].g_ori_price}</div>
						</a>
					<% }else{ 
                    	session.setAttribute("key", key);
	                %>
	                <c:url value="/pjh/jsp/looking.do" var="viewUrl">
						<c:param name="id" value="${status.index}" />
					</c:url>
					<a href="${viewUrl}" >
							<img src="${pageContext.request.contextPath}/views/tranding/img/${outputA[status.index-1].g_image_a}" />
							<div class="pro_name">${outputA[status.index-1].g_brand}</div>
							<div class="pro_pro">${outputA[status.index-1].g_name}</div>
							<div class="pro_pri_A">${outputA[status.index-1].g_count_memprice_price}</div>
							<div class="pro_pri_B">${outputA[status.index-1].g_discount}</div>
							<div class="pro_pri_C">${outputA[status.index-1].g_ori_price}</div>
						</a>
					<% } %>
					</div>
				</div>
			</c:forEach>
			</div>
			<!-- 좌우버튼 밑에 조그마한 동그라미 버튼 밑에 스크롤바 영역 -->
			<!-- <div class="swiper-pagination"></div> -->
			<!-- 버튼 추가 구현 -->
			<div class="swiper-button-prev"></div>
			<div class="swiper-button-next"></div>
		</div>
	</div>
	<div class="pro_subject">#어디든 가볍게~</div>
	<div class="main_chu">
		<div class="swiper-container swiperB">
			<div class="swiper-wrapper swiperB_A">
				<c:forEach var="i" begin="49" end="60" step="1" varStatus="status">
				<!-- 슬라이드 처리 영역  -->
				<div class="swiper-slide">
					<div class="sub_imformation swiperB_A_A">
					<% 
                    	if(key == null){ 
	                %>
	                <c:url value="/pjh/jsp/no_looking.do" var="viewUrl">
						<c:param name="id" value="${status.index}" />
					</c:url>
					<a href="${viewUrl}" >
							<img src="${pageContext.request.contextPath}/views/tranding/img/${outputA[status.index-1].g_image_a}" />
							<div class="pro_name">${outputA[status.index-1].g_brand}</div>
							<div class="pro_pro">${outputA[status.index-1].g_name}</div>
							<div class="pro_pri_A">${outputA[status.index-1].g_count_memprice_price}</div>
							<div class="pro_pri_B">${outputA[status.index-1].g_discount}</div>
							<div class="pro_pri_C">${outputA[status.index-1].g_ori_price}</div>
						</a>
					<% }else{ 
                    	session.setAttribute("key", key);
	                %>
	                <c:url value="/pjh/jsp/looking.do" var="viewUrl">
						<c:param name="id" value="${status.index}" />
					</c:url>
					<a href="${viewUrl}" >
							<img src="${pageContext.request.contextPath}/views/tranding/img/${outputA[status.index-1].g_image_a}" />
							<div class="pro_name">${outputA[status.index-1].g_brand}</div>
							<div class="pro_pro">${outputA[status.index-1].g_name}</div>
							<div class="pro_pri_A">${outputA[status.index-1].g_count_memprice_price}</div>
							<div class="pro_pri_B">${outputA[status.index-1].g_discount}</div>
							<div class="pro_pri_C">${outputA[status.index-1].g_ori_price}</div>
						</a>
					<% } %>
					</div>
				</div>
			</c:forEach>
			</div>
			<!-- 좌우버튼 밑에 조그마한 동그라미 버튼 밑에 스크롤바 영역 -->
			<!-- <div class="swiper-pagination"></div> -->
			<!-- 버튼 추가 구현 -->
			<div class="swiper-button-prev"></div>
			<div class="swiper-button-next"></div>
		</div>
	</div>
	<div class="pro_subject">#티나는 포인트</div>
	<div class="main_chu">
		<div class="swiper-container swiperB">
			<div class="swiper-wrapper swiperB_A">
				<c:forEach var="i" begin="61" end="72" step="1" varStatus="status">
				<!-- 슬라이드 처리 영역  -->
				<div class="swiper-slide">
					<div class="sub_imformation swiperB_A_A">
					<% 
                    	if(key == null){ 
	                %>
	                <c:url value="/pjh/jsp/no_looking.do" var="viewUrl">
						<c:param name="id" value="${status.index}" />
					</c:url>
					
							<img src="${pageContext.request.contextPath}/views/tranding/img/${outputA[status.index-1].g_image_a}" />
							<div class="pro_name">${outputA[status.index-1].g_brand}</div>
							<div class="pro_pro">${outputA[status.index-1].g_name}</div>
							<div class="pro_pri_A">${outputA[status.index-1].g_count_memprice_price}</div>
							<div class="pro_pri_B">${outputA[status.index-1].g_discount}</div>
							<div class="pro_pri_C">${outputA[status.index-1].g_ori_price}</div>
						</a>
					<% }else{ 
                    	session.setAttribute("key", key);
	                %>
	                <c:url value="/pjh/jsp/looking.do" var="viewUrl">
						<c:param name="id" value="${status.index}" />
					</c:url>
					<a href="${viewUrl}" >
							<img src="${pageContext.request.contextPath}/views/tranding/img/${outputA[status.index-1].g_image_a}" />
							<div class="pro_name">${outputA[status.index-1].g_brand}</div>
							<div class="pro_pro">${outputA[status.index-1].g_name}</div>
							<div class="pro_pri_A">${outputA[status.index-1].g_count_memprice_price}</div>
							<div class="pro_pri_B">${outputA[status.index-1].g_discount}</div>
							<div class="pro_pri_C">${outputA[status.index-1].g_ori_price}</div>
						</a>
					<% } %>
					</div>
				</div>
			</c:forEach>
			</div>
			<!-- 좌우버튼 밑에 조그마한 동그라미 버튼 밑에 스크롤바 영역 -->
			<!-- <div class="swiper-pagination"></div> -->
			<!-- 버튼 추가 구현 -->
			<div class="swiper-button-prev"></div>
			<div class="swiper-button-next"></div>
		</div>
	</div>
	<div class="load_A">
		<a href="javascript:void(0);" class="cl_chu">추천상품 더 준비했어요 !</a>
	</div>
	<div class="pro_subjectA">#플렉스~ flex~!</div>
	<div class="main_chuA">
		<div class="swiper-container swiperC">
			<div class="swiper-wrapper swiperC_A">
				<c:forEach var="i" begin="1" end="24" step="2" varStatus="status">
				<!-- 슬라이드 처리 영역  -->
				<div class="swiper-slide">
					<div class="sub_imformation swiperB_A_A">
					<% 
                    	if(key == null){ 
	                %>
	                <c:url value="/pjh/jsp/no_looking.do" var="viewUrl">
						<c:param name="id" value="${status.index}" />
					</c:url>
					<a href="${viewUrl}" >
							<img src="${pageContext.request.contextPath}/views/tranding/img/${outputA[status.index-1].g_image_a}" />
							<div class="pro_name">${outputA[status.index-1].g_brand}</div>
							<div class="pro_pro">${outputA[status.index-1].g_name}</div>
							<div class="pro_pri_A">${outputA[status.index-1].g_count_memprice_price}</div>
							<div class="pro_pri_B">${outputA[status.index-1].g_discount}</div>
							<div class="pro_pri_C">${outputA[status.index-1].g_ori_price}</div>
						</a>
					<% }else{ 
                    	session.setAttribute("key", key);
	                %>
	                <c:url value="/pjh/jsp/looking.do" var="viewUrl">
						<c:param name="id" value="${status.index}" />
					</c:url>
					<a href="${viewUrl}" >
							<img src="${pageContext.request.contextPath}/views/tranding/img/${outputA[status.index-1].g_image_a}" />
							<div class="pro_name">${outputA[status.index-1].g_brand}</div>
							<div class="pro_pro">${outputA[status.index-1].g_name}</div>
							<div class="pro_pri_A">${outputA[status.index-1].g_count_memprice_price}</div>
							<div class="pro_pri_B">${outputA[status.index-1].g_discount}</div>
							<div class="pro_pri_C">${outputA[status.index-1].g_ori_price}</div>
						</a>
					<% } %>
					</div>
				</div>
			</c:forEach>
			</div>
			<!-- 좌우버튼 밑에 조그마한 동그라미 버튼 밑에 스크롤바 영역 -->
			<!-- <div class="swiper-pagination"></div> -->
			<!-- 버튼 추가 구현 -->
			<div class="swiper-button-prev"></div>
			<div class="swiper-button-next"></div>
		</div>
	</div>
	<div class="pro_subjectB">#브라보 마이 라이프~</div>
	<div class="main_chuB">
		<div class="swiper-container swiperC">
			<div class="swiper-wrapper swiperC_A">
				<c:forEach var="i" begin="2" end="24" step="2" varStatus="status">
				<!-- 슬라이드 처리 영역  -->
				<div class="swiper-slide">
					<div class="sub_imformation swiperB_A_A">
					<% 
                    	if(key == null){ 
	                %>
	                <c:url value="/pjh/jsp/no_looking.do" var="viewUrl">
						<c:param name="id" value="${status.index}" />
					</c:url>
					<a href="${viewUrl}" >
							<img src="${pageContext.request.contextPath}/views/tranding/img/${outputA[status.index-1].g_image_a}" />
							<div class="pro_name">${outputA[status.index-1].g_brand}</div>
							<div class="pro_pro">${outputA[status.index-1].g_name}</div>
							<div class="pro_pri_A">${outputA[status.index-1].g_count_memprice_price}</div>
							<div class="pro_pri_B">${outputA[status.index-1].g_discount}</div>
							<div class="pro_pri_C">${outputA[status.index-1].g_ori_price}</div>
						</a>
					<% }else{ 
                    	session.setAttribute("key", key);
	                %>
	                <c:url value="/pjh/jsp/looking.do" var="viewUrl">
						<c:param name="id" value="${status.index}" />
					</c:url>
					<a href="${viewUrl}" >
							<img src="${pageContext.request.contextPath}/views/tranding/img/${outputA[status.index-1].g_image_a}" />
							<div class="pro_name">${outputA[status.index-1].g_brand}</div>
							<div class="pro_pro">${outputA[status.index-1].g_name}</div>
							<div class="pro_pri_A">${outputA[status.index-1].g_count_memprice_price}</div>
							<div class="pro_pri_B">${outputA[status.index-1].g_discount}</div>
							<div class="pro_pri_C">${outputA[status.index-1].g_ori_price}</div>
						</a>
					<% } %>
					</div>
				</div>
			</c:forEach>
			</div>
			<!-- 좌우버튼 밑에 조그마한 동그라미 버튼 밑에 스크롤바 영역 -->
			<!-- <div class="swiper-pagination"></div> -->
			<!-- 버튼 추가 구현 -->
			<!-- <div class="swiper-button-prev"></div> -->
			<div class="swiper-button-next"></div>
		</div>
	</div>
	<div class="pro_subjectC">#개학날 인싸되는 법~</div>
	<div class="main_chuC">
		<div class="swiper-container swiperC">
			<div class="swiper-wrapper swiperC_A">
				<c:forEach var="i" begin="69" end="80" step="1" varStatus="status">
				<!-- 슬라이드 처리 영역  -->
				<div class="swiper-slide">
					<div class="sub_imformation swiperB_A_A">
					<% 
                    	if(key == null){ 
	                %>
	                <c:url value="/pjh/jsp/no_looking.do" var="viewUrl">
						<c:param name="id" value="${status.index}" />
					</c:url>
					<a href="${viewUrl}" >
							<img src="${pageContext.request.contextPath}/views/tranding/img/${outputA[status.index-1].g_image_a}" />
							<div class="pro_name">${outputA[status.index-1].g_brand}</div>
							<div class="pro_pro">${outputA[status.index-1].g_name}</div>
							<div class="pro_pri_A">${outputA[status.index-1].g_count_memprice_price}</div>
							<div class="pro_pri_B">${outputA[status.index-1].g_discount}</div>
							<div class="pro_pri_C">${outputA[status.index-1].g_ori_price}</div>
						</a>
					<% }else{ 
                    	session.setAttribute("key", key);
	                %>
	                <c:url value="/pjh/jsp/looking.do" var="viewUrl">
						<c:param name="id" value="${status.index}" />
					</c:url>
				    	<a href="${viewUrl}" >
							<img src="${pageContext.request.contextPath}/views/tranding/img/${outputA[status.index-1].g_image_a}" />
							<div class="pro_name">${outputA[status.index-1].g_brand}</div>
							<div class="pro_pro">${outputA[status.index-1].g_name}</div>
							<div class="pro_pri_A">${outputA[status.index-1].g_count_memprice_price}</div>
							<div class="pro_pri_B">${outputA[status.index-1].g_discount}</div>
							<div class="pro_pri_C">${outputA[status.index-1].g_ori_price}</div>
						</a>
					<% } %>
					</div>
				</div>
			</c:forEach>
			</div>
			<!-- 좌우버튼 밑에 조그마한 동그라미 버튼 밑에 스크롤바 영역 -->
			<!-- <div class="swiper-pagination"></div> -->
			<!-- 버튼 추가 구현 -->
			<div class="swiper-button-prev"></div>
			<div class="swiper-button-next"></div>
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
					<a href="${pageContext.request.contextPath}/tranding/customer_service_notice.do" role="button" class="customer_inq">1:1문의하기</a>
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
 




<script src="${pageContext.request.contextPath}/views/tranding/js/jquery-3.5.1.min.js"></script>
<script src="${pageContext.request.contextPath}/views/tranding/js/jquery.animatecss.min.js"></script>
<script src="${pageContext.request.contextPath}/views/tranding/plugin/slick/slick.min.js" type="text/javascript" charset="utf-8"></script>
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<script type="text/javascript">
/* 배너 */
var mySwiper = new Swiper('.swiperA', {
    //한번에 보는 슬라이드 갯수
     autoplay: { delay: 3000 },
    loop: true,
    slidesPerView: 1,
    spaceBetween: 100,
    centeredSlides: true, 
    //페이지 순서 나타내는 불릿
     pagination: {
        el: '.swiper-pagination',
        clickable: true,
    }, 
    //좌우 버튼
     navigation: {
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev',
    }, 
	
});
var mySwiper = new Swiper('.swiperB', {
    //한번에 보는 슬라이드 갯수
     autoplay: { delay: 3000 },
    loop: true,
    slidesPerView: 6,
     spaceBetween: 20, 
    centeredSlides: true, 
    slidesPerGroup: 6,
    //페이지 순서 나타내는 불릿
    /*  pagination: {
        el: '.swiper-pagination',
        clickable: true,
    },  */
    //좌우 버튼
     navigation: {
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev',
    }, 
	
});

/* 타임딜 */
function CountDownTimer(dt, id) {
	
    var end = new Date(dt);
    
    var _second = 1000;
    var _minute = _second * 60;
    var _hour = _minute * 60;
    var _day = _hour * 24;
    
    var timer;
    
    function showRemaining() {
    	
        var now = new Date();
        var distance = end - now;
        
        if (distance < 0) {
            clearInterval(timer);
            document.getElementById(id).innerHTML = '타임딜 종료됨';
            return;
        }
        
        var days = Math.floor(distance / _day);
        var hours = Math.floor((distance % _day) / _hour);
        var minutes = Math.floor((distance % _hour) / _minute);
        var seconds = Math.floor((distance % _minute) / _second);
        
        document.getElementById(id).innerHTML = days + '일 ';
        document.getElementById(id).innerHTML += hours + ' : ';
        document.getElementById(id).innerHTML += minutes + ' : ';
        document.getElementById(id).innerHTML += seconds ;
        
    }
    
    timer = setInterval(showRemaining, 1000);
    
}

CountDownTimer('12/30/2022 24:00:00', 'timeDeal'); 

$(function() {
	$('.cl_chu').click(function() {
	
		var cl1 = document.querySelector('.pro_subjectA');
		var cl2 = document.querySelector('.main_chuA');
		var cl3 = document.querySelector('.load_A');
	
		var cl4 = document.querySelector('.pro_subjectB');
		var cl5 = document.querySelector('.main_chuB');
		
		var cl6 = document.querySelector('.pro_subjectC');
		var cl7 = document.querySelector('.main_chuC');
		
		cl1.style.display = "block";
		cl2.style.display = "block";
		cl3.style.display = "none";
		
		cl4.style.display = "block";
		cl5.style.display = "block";
		
		cl6.style.display = "block";
		cl7.style.display = "block";
		
		var mySwiper = new Swiper('.swiperC', {
		    //한번에 보는 슬라이드 갯수
		     autoplay: { delay: 3000 },
		    loop: true,
		    slidesPerView: 6,
		     spaceBetween: 20, 
		    centeredSlides: true, 
		    slidesPerGroup: 6,
		    //페이지 순서 나타내는 불릿
		     /* pagination: {
		        el: '.swiper-pagination',
		        clickable: true,
		    }, */
		    //좌우 버튼
		     navigation: {
		        nextEl: '.swiper-button-next',
		        prevEl: '.swiper-button-prev',
		    }, 
			
		});

	});
});
</script>
</body>
</html>
