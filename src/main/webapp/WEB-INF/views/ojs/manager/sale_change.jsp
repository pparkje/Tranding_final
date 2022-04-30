<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../manager/master_header_salech.jsp" %>
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

.sale_change {
	width: 960px;
    height: auto;
    margin-top:150px;
    margin-bottom: 10px;
    margin-left: 250px;
}
.sale_change_side{
	width:10%;
	text-align: center;
}
.sale_change_side li{
	border-bottom:1px solid black;
	border-right:1px solid black;
	height:30px;
	padding-top:10px;
}

.sale_change_container div{
	border-bottom:1px solid black;
	border-right:1px solid black;
	
	padding-right:50px;
	padding-top:10px;
	padding-bottom:10px;
	padding-left:50px;
	position:relative;
	top:1px;
}

.sale_change_container div:nth-child(3){
	padding-top:8px;
}

.sale_change_container div:nth-child(2),
.sale_change_container div:nth-child(4),
.sale_change_container div:nth-child(5),
.sale_change_container div:nth-child(6),
.sale_change_container div:nth-child(7){
	padding-bottom:11px;
}
.intext{
	width:200px;
}

</style>
    
    <div class="sale_change clearfix">
        <!-- 이 안에서 내용 작업하시면 됩니다. -->
        <div class="sale_change_side pull-left">
        	<ul>
        		<li>할인율</li>
        		<li>브랜드명</li>
        		<li>이미지</li>
        		<li>상품명</li>
        		<li>원가</li>
        		<li>할인가</li>
        		<li>성별</li>
        	</ul>
        </div>
   <div class="sale_change_container pull-left">
       <div class="sale_price_chk">
       <label>
       <input type="radio" name="price" value="70"/>70%이상
       <input type="radio" name="price" value="5070"/>50~70%
       <input type="radio" name="price" value="3050"/>30~50%
       <input type="radio" name="price" value="30"/>30%이하
       </label>
       </div>
       
       <div class="sale_change_brand">
       <label><input type="text" placeholder="브랜드를 입력해주세요." class="intext"/></label>
       </div>
       
       <div class="sale_change_img">
       <form>
       		<label><input type="file" accept="image/jpeg" multiple/></label>
       </form>
       </div>
       
       <div class="sale_change_sub">
       <label><input type="text" placeholder="상품명을 입력해주세요." class="intext"/></label>
       </div>
       
       <div class="sale_change_price">
       		<label><input type="text" placeholder="원가를 입력해주세요." class="intext"/></label>
       </div>
       <div class="sale_change_dwprice">
       		<label><input type="text" placeholder="할인가를 입력해주세요." class="intext"/></label>
       </div>
       <div class="sale_change_gender">
       		<label>
       		<input type="radio" name="gender" value="MEN"/>남자
       		<input type="radio" name="gender" value="WOMEN"/>여자
       		</label>
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