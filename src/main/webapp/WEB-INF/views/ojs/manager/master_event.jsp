<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="../manager/master_header_event.jsp" %>
    <!-- ================= 본문영역 시작 ================= -->
    <div class="event_manage">
        <div class="event_title clearfix">
        	<ul>
        		<li class="pull-left">선택</li>
        		<li class="pull-left">분류</li>
        		<li class="pull-left">게시물번호</li>
        		<li class="pull-left">제목</li>
        		<li class="pull-left">이미지</li>
        		<li class="pull-left">작성자</li>
        		<li class="pull-left">읽기권한</li>
        		<li class="pull-left">수정 버튼</li>
        	</ul>
        </div>
        <div class="event_checkbox pull-left">
       		<label><input type="checkbox" /></label>
       		<label><input type="checkbox" /></label>
       		<label><input type="checkbox" /></label>
       		<label><input type="checkbox" /></label>
       		<label><input type="checkbox"/></label>
       	</div>
        <div class="event_group pull-left">
        	<ul>
        		<li>이벤트</li>
        		<li>소식</li>
        		<li>소식</li>
        		<li>소식</li>
        		<li>이벤트</li>
        	</ul>
        </div>
        <div class="event_num pull-left">
        	<ul>
        		<li>12</li>
        		<li>13</li>
        		<li>14</li>
        		<li>15</li>
        		<li>17</li>
        	</ul>
        </div>
        <div class="event_sub pull-left">
        	<ul>
        		<li>test1</li>
        		<li>test2</li>
        		<li>test4</li>
        		<li>test21</li>
        		<li>test32</li>
        	</ul>
        </div>
        <div class="event_img pull-left">
        	<ul>
        		<li>123123.jpg</li>
        		<li>124124.png</li>
        		<li></li>
        		<li></li>
        		<li>12341221.png</li>
        	</ul>
        </div>
        <div class="event_dir pull-left">
        	<ul>
        		<li>오준성</li>
        		<li>오준성</li>
        		<li>이기훈</li>
        		<li>박재현</li>
        		<li>박재현</li>
        	</ul>
        </div>
        <div class="event_autho pull-left">
        	<ul>
        		<li>운영자</li>
        		<li>모두</li>
        		<li>모두</li>
        		<li>모두</li>
        		<li>모두</li>
        	</ul>
        </div>
        <div class="event_change_btn pull-left">
        	<ul>
        		<li><a href="#">수정</a></li>
        		<li><a href="#">수정</a></li>
        		<li><a href="#">수정</a></li>
        		<li><a href="#">수정</a></li>
        		<li><a href="#">수정</a></li>
        	</ul>
        </div>
       <div class="event_list_btn">
       		<ul>
       			<li><a href="#">1</a></li>
       			<li><a href="#">2</a></li>
       			<li><a href="#">3</a></li>
       			<li><a href="#">4</a></li>
       		</ul>
       </div>
    </div>
    
    <!-- ================= 본문영역 끝 ================= -->
    <script src="http://code.jQuery.com/jQuery-3.2.1.min.js"></script>
    <script type="text/javascript">
    </script>
</body>

</html>