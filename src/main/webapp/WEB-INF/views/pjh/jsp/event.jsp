<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file = "header.jsp" %>	
<div class="event">
	<div class="event_head clearfix">
		<ul>
			<c:url value="/pjh/jsp/event.do" var="viewUrlA">
				<c:param name="n_group" value="news" />
			</c:url>
			<c:url value="/pjh/jsp/event.do" var="viewUrlB">
				<c:param name="n_group" value="event" />
			</c:url>
			<li class="pull-left">
				<a href="${pageContext.request.contextPath}/pjh/jsp/event.do">ALL</a>
			</li>
			<li class="pull-left">
				<a href="${viewUrlA}">NEWS</a>
			</li>
			<li class="pull-left">
				<a href="${viewUrlB}">EVENT</a>
			</li>
		</ul>
	</div>
	
	<div class="event_contents clearfix">
		<ul>
			<c:choose>
		        <c:when test="${output == null || fn:length(output) == 0 }">
					<div>
						<div>조회결과가 없습니다.</div>
					</div>
				</c:when>
				<c:otherwise>
					<c:forEach var="i" items="${output}" varStatus="status">
		                <c:url value="/pjh/jsp/event_contents.do" var="UrlA">
							<c:param name="id" value="${i.id}" />
						</c:url>
					<li class="pull-left">
						<a href="${UrlA}" class="cont_min">
						<span>
							<img class="thumbnail" width="200" height="100" src="${pageContext.request.contextPath}/views/tranding/img/${i.n_image}">
						</span>
						<div class="cont_min_su">
							<h3 class="cont_min_chul">${i.n_subject}</h3>
							<div class="cont_min_chul">${i.n_cont}</div>
						</div>
						</a>
					</li >
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</ul>
	</div>
</div>

<%@ include file = "footer.jsp" %>
