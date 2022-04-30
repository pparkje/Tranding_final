<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../tranding/jsp/newheader.jsp"%>
<style type="text/css">
.eventcontents h1{
	width:100%;
	text-align: center;
	font-size: 50px;
	margin-bottom:50px;
	margin-top:50px;
}


.text {
	margin-left:200px;
	margin-right:200px;
	margin-top: 50px;
	margin-bottom: 50px;
	text-align: center;
}
.eventmain_btn{
    display: block;
    width: 250px;
    height: 40px;
    text-align: center;
    font-weight: bold;
    line-height: 40px;
    border: 1px solid black;

    margin: auto;
    margin-bottom: 40px;
}
</style>
<div class="eventcontents">
	<h1>소식 제목1</h1>
	
	<div class="eventcontents_main">
		<img alt="소식이미지" style="position: relative; left: 29.5em;width:500px; height:600px;" src="https://images.unsplash.com/photo-1611315407926-3cbbd74cc137?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=581&q=80">
		<div class="text">
			'유통공룡' 이마트가 SK 와이번스를 인수하며 프로야구 시장에 뛰어들었다.
			관련업계에서는 프로야구가 코로나19로 오프라인 사업에 어려움을 겪은 
			이마트에 새바람을 불러일으킬 '키 콘텐츠'가 될 것으로 전망하고 있다.
			특히 프로야구 관중의 60%에 달하는 20~30대 관객들에게 '이마트'라는 브랜드를
			 새롭게 알리고, 후발 온라인 중심 유통업체들에 뺏긴 
			 MZ세대(1980년대 초~2000년대 초 출생 세대)를 되찾을 좋은 기회라는 분석이다.
			여성, 연인, 가족단위 관람객이 많은 한국 프로야구 특성도
			 이마트엔 매력적인 대목. 씀씀이가 큰 연인들은 물론이고,
			  다양한 연령대에 어필해야할 가족 단위 관람객들은 
			  유통업체의 마케팅 타깃 그룹으로서 상당히 큰 의미를 지닌다고 볼 수 있다.
		</div>
	</div>
	<div class="eventmain_btn"><a href="#">이벤트 메인으로</a></div>
</div>
<%@ include file="../tranding/jsp/footer.jsp"%>