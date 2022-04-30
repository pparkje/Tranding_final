<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../tranding/jsp/newheader.jsp"%>
<style type="text/css">
.inq{
	min-height:600px;
	margin-top:50px;
}
.inq h1{
	width:100%;
	text-align: center;
	font-size: 50px;
	margin-bottom:80px;
	border-bottom: thin solid black;
}
.inq_subject{
	width:40%;
	margin:auto;
	padding-bottom:10px;
	border-bottom: thin solid black;	
}
.inq_img{
	width:40%;
	margin:auto;
	padding-top:10px;
	padding-bottom:10px;
	border-bottom: thin solid black;
}
.inq_body{
	width:40%;
	margin:auto;
	padding-top:10px;
	padding-bottom:10px;
	border-bottom: thin solid black;
	background-color: #eee;
}
.inq_body span{	
	position:relative;
	bottom:90px;
}
.inq_btn{
    display: block;
    width: 250px;
    height: 40px;
    text-align: center;
    font-weight: bold;
    line-height: 40px;
    border: 1px solid black;

    margin: auto;
    margin-top:50px;
}

</style>

<div class=inq>
	<h1>1:1문의</h1>
	<div class=inq_main>
		<div class="inq_subject">
			제목 : <input type="text" style="width:400px;" placeholder="제목을 입력하세요"/>
		</div>
		
		<div class="inq_img">
		<label class="inq_imgsub">이미지 업로드 :</label>
		<input type="file" value="업로드"/>
		
		</div>
		<div class="inq_body">
		<span>내용 : </span>
		<textarea rows="10" cols="45" placeholder="문의내용을 입력해주세요."></textarea>
		</div>
		<button	class="inq_btn" type="submit" >문의 보내기</button>
	</div>
</div>

<%@ include file="../tranding/jsp/footer.jsp"%>
