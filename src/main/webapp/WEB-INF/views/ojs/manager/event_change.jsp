<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../manager/master_header_eventch.jsp" %>
    <!-- ================= 본문영역 시작 ================= -->
<style type="text/css">
    .pull-left{
	float:left;
}
.clearfix:after{
	content:'';
	display:block;
	float:none;
	clear: both;
}

.event_change {
	width: 960px;
    height: auto;
    margin-top:150px;
    margin-bottom: 10px;
    margin-left: 250px;
}
.event_change_side{
	width:10%;
	text-align: center;
}
.event_change_side li{
	border-bottom:1px solid black;
	border-right:1px solid black;
	height:30px;
	padding-top:10px;
}
.event_change_side li:nth-child(5){
	height:200px;
}
.event_change_container div{
	border-bottom:1px solid black;
	padding-top:10px;
	padding-bottom:10px;
}
.event_change_content{
	height:190px;
}
.event_change_container{
	position:relative;
	top:1px;
}
.event_change_container label{
	padding-left:30px;
}
.event_change_subject {
	position:relative;
	top:1px;
}
.event_change_img{
	position:relative;
	bottom:1px;
}

</style>
    
    <div class="event_change clearfix">
        <!-- 이 안에서 내용 작업하시면 됩니다. -->
        <div class="event_change_side pull-left">
        	<ul>
        		<li>분류</li>
        		<li>제목</li>
        		<li>이미지</li>
        		<li>게시자</li>
        		<li>내용</li>
        	</ul>
        </div>
   <div class="event_change_container pull-left">
       <div class="event_change_chk">
       <label><input type="checkbox" />이벤트</label>
       <label><input type="checkbox" />뉴스</label>
       </div>
       <div class="event_change_subject">
       <label><input type="text" placeholder="내용을 입력해주세요."/></label>
       </div>
       <div class="event_change_img">
       <form>
       		<label><input type="file" accept="image/jpeg" multiple/></label>
       </form>
       </div>
       <div class="event_change_manager">
       <label><input type="text" /></label>
       </div>
       <div class="event_change_content">
       <label><textarea rows="12" cols="90" placeholder="문의내용을 입력해주세요."></textarea></label>
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