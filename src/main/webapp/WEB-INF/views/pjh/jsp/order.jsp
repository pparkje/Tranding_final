<%@page import="java.text.NumberFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="header.jsp" %>
<%@ page import="study.spring.trspring.model.Goods"%>
<%@ page import="study.spring.trspring.model.Members"%>
<%@ page import="study.spring.trspring.model.Basket"%>
<!doctype html>
<html>

<head>
    <meta charset="UTF-8" />
   <title>Trending Official Page</title>
  	<style type="text/css">
 
    </style>
</head>

<body>
<%
	request.setCharacterEncoding("UTF-8");
    Members key_Z = (Members) session.getAttribute("key");
    session.setAttribute("key", key_Z);
%>
   <div class="main wrap"> 
   <form action="${pageContext.request.contextPath}/pjh/jsp/orderfin.do" method="post">
   <input type="hidden" name="members_id" value="${outputB.id}">
   
   <c:set var= "m_name" 	value="${outputB.m_name}"/>
   <c:set var= "m_phone" 	value="${outputB.m_phone}"/>
   <c:set var= "m_address" 	value="${outputB.m_address}"/>
    <h1><span class="title1">주문 / 결제</span></h1>
    <div class="box1">
    	<div class="inbox1">
		    <h2 class="besong_jungbo">배송정보*</h2>
		    <ul class="left_text_adress">
		    	<li>이름</li>
				<li>연락처</li>
				<li>주소</li>
		    </ul>
		    <ul class="right_text_adress">
		    	<li class="right_text_adressA">
		    		<input type="text" name="m_name"  value="" class="text_right_adress" id="m_name_A">
		    	</li>
				<li class="right_text_adressA">
					<input type="text" name="m_phone" value="" class="text_right_adress" id="m_phone_A">
				</li>
				<li class="right_text_adressB">
					<input type="text" placeholder="우편번호"  name="m_postcode" id="m_postcode_A" readonly="readonly" />
					<input type="button" onclick="postcode()" value="주소검색">
					<input type="text" placeholder="주소"  name="m_address" id="m_address_A" class="sangse_heawon_A"/>
				</li>
		    </ul>
		    <br/>
		    <h2 class="jumun_jungbo">주문자 정보*</h2>
			<a class="b2" style="cursor:pointer" onclick="same_jungbo();">주문자와 같음</a>
			<div class="Rtext">
				<ul class="left_text_line">
					<li>이름</li>
					<li>연락처</li>
					<li>주소</li>
				</ul>
			</div>
			<div class="Ltext">
				<ul class="right_text_line">
					<li><input type="text"  value="${outputB.m_name}" readonly="readonly" id="ABC_A" name="m_name_ori"></li>
					<li><input type="text"  value="${outputB.m_phone}" readonly="readonly" id="ABC_B" name="m_phone_ori"></li>
					<li><input type="text"  value="${outputB.m_address}" readonly="readonly" id="ABC_C" name="m_address_ori"></li>
					<input type="hidden"  value="${outputB.m_postcode}" readonly="readonly" id="ABC_D" name="m_postcode_ori">
				</ul>
			</div>
		</div>
	</div>
	
	<div class="box2">
	<div class="inbox2">
		<h2>배송 상품</h2>
		<c:choose>
		        <c:when test="${outputA == null || fn:length(outputA) == 0 }">
					<div>
						<div>조회결과가 없습니다. 관리자에게 문의 바랍니다.</div>
					</div>
				</c:when>
				<c:otherwise>
				<c:forEach var="item" items="${outputA}" varStatus="status">
  				<input type="hidden" name="b_g_id" value="${item.b_g_id}" />
  				<input type="hidden" name="b_id" value="${item.id}" />
			    	<span class="line"></span>
			    	<br/>
			    		<div class="pSpace">
			    		<img alt="상품이미지" src="${pageContext.request.contextPath}/views/tranding/img/${item.b_image}">
			    		<ul>
			    		<li>${item.b_g_brand}</li>
			    		<li>${item.b_name}</li>
			    		<li>단품: 1개 </li>
			    		<li>${item.b_memprice}</li>
			    		</ul>
			    		</div>	
			    	<br/>
			    	<span class="blackLine"></span>
			    	<br/>
		    	</c:forEach>
    		</c:otherwise>
	   	</c:choose>
    	<c:set var = "total_oriprice" value = "0" />
		<c:set var = "total_nomem_price" value = "0" />
		<c:set var = "total_mem_price" value = "0" />
		<c:set var = "total_kul" value = "0" />
		<c:set var = "total_point" value = "0" />
    	<c:choose>
			<c:when test="${outputA == null || fn:length(outputA) == 0 }">
				<div>
					<div></div>
				</div>
			</c:when>
			<c:otherwise>
				<c:forEach var="item" items="${outputA}" varStatus="status">
					<c:set var= "total_oriprice" value="${total_oriprice + item.b_oriprice}"/>
					<c:set var= "total_nomem_price" value="${total_nomem_price + item.b_disprice}"/>
					<c:set var= "total_mem_price" value="${total_mem_price + item.b_discount}"/>
					<c:set var= "total_kul" value="${total_kul + item.b_memprice}"/>
					<c:set var= "total_point" value="${total_point + item.b_point}"/>
					<c:set var= "total_kul_fin" value="${total_kul + outputC.a_add_money}"/>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		
    	
    	<c:set var="jeju" value="${outputB.m_address}"/>
    	<c:choose>
	    	<c:when test="${ !(fn:contains(jeju, '제주'))  }">
	    	<span class="txt1"> 상품 <c:out value="${total_kul}"/>&nbsp;원 + 배송비 0원</span>
	    	</c:when>
	    	
	    	<c:otherwise>
	    	<input type="hidden" name="delivery" value="${outputC.a_add_money}" />
	    	<span class="txt1"> 상품 <c:out value="${total_kul}"/>&nbsp;원 + 배송비 ${outputC.a_add_money}원</span>
	    	</c:otherwise>
    	</c:choose>
    	
    	<br/>
    	
    	
    	<span class="txt2">합계 <c:out value="${total_kul}"/>&nbsp;원</span>
    	
    	
					
					
    </div>
  </div>  
    
    <div class="box3">
       	<div class="inbox3">
        <h2>결제수단*</h2>
    	
    	<br/>
    	<span class="line" style="margin-top: -20px;"></span>
    	<br/>
    	
    	<input type="radio" name="pay_info" value="무통장입금" />&nbsp;무통장입금
   		<br/>
    	<input type="radio" name="pay_info" value="신용카드, 에스크로 계좌이체, 삼성페이" />&nbsp;신용카드, 에스크로 계좌이체, 삼성페이
    	<br/>
    	<input type="radio" name="pay_info" value="네이버페이"/>&nbsp;네이버페이
  		
    	</div>
    </div>
    
    
    <div class="box5">
    	<div class="box5_A">
    		<div class="kul_je_A">결제 금액</div>
	    	<div class="inbox5">
	    		<ul>
	    			<li>총 상품 금액</li>
	    			<li>배송비</li>
	    			<li>총 상품 할인금액</li>
	    			<li>D머니 적립</li>
	    			<li>총 결제 예상 금액</li>
	    		</ul>
	    	</div>
	    	<div class="inbox6">
		    	<ul>
		    		<li><c:out value="${total_kul}"/>&nbsp;원</li>
		    		
		    		<c:choose>
			    		<c:when test="${ !(fn:contains(jeju, '제주'))  }">
			    			<li>0 원</li>
			    		</c:when>
			    		<c:otherwise>
			    			<li>${outputC.a_add_money} 원</li>
			    		</c:otherwise>
			    	</c:choose>
		    		<li><c:out value="${total_mem_price}"/>&nbsp;원</li>
		    		<li><c:out value="${total_point}"/>&nbsp;D</li>
		    		<c:choose>
			    		<c:when test="${ !(fn:contains(jeju, '제주'))  }">
			    			<li><c:out value="${total_kul}"/>&nbsp;원</li>
			    		</c:when>
			    		<c:otherwise>
			    			<li><c:out value="${total_kul_fin}"/>&nbsp;원</li>
			    		</c:otherwise>
			    	</c:choose>
		    		
		    	</ul>
	    	</div>
    	</div>
	</div>	
	<input type="hidden" name="total_mem_price" value="${total_mem_price}" />
	<input type="hidden" name="total_point" value="${total_point}" />
	<c:choose>
	<c:when test="${ !(fn:contains(jeju, '제주'))  }">
		<input type="hidden" name="total_kul" value="${total_kul}" />
	</c:when>
	<c:otherwise>
		<input type="hidden" name="total_kul" value="${total_kul_fin}" />
	</c:otherwise>
	</c:choose>
	<div class="btn_fin_A">
		<a href="#"><button type="submit" class="Orderfin">주문 완료하기</button></a>
	</div>
	
</form>
</div>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">

function same_jungbo(){
	var m_nameA = document.getElementById("ABC_A").value;
	var m_phoneA = document.getElementById("ABC_B").value;
	var m_addressA = document.getElementById("ABC_C").value;
	var m_postcodeA = document.getElementById("ABC_D").value;
	
	document.getElementById("m_name_A").innerText = m_nameA;
	document.getElementById("m_phone_A").innerText = m_phoneA;
	document.getElementById("m_address_A").innerText = m_addressA;
	document.getElementById("m_postcode_A").innerText = m_postcodeA;
	
	document.getElementById("m_name_A").value = m_nameA;
	document.getElementById("m_phone_A").value = m_phoneA;
	document.getElementById("m_address_A").value = m_addressA;
	document.getElementById("m_postcode_A").value = m_postcodeA;
	
}
function postcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
                // document.getElementById("sample6_extraAddress").value = extraAddr;
            
            } else {
                document.getElementById("m_address_A").value = '';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('m_postcode_A').value = data.zonecode;
            document.getElementById('m_address_A').value = addr + extraAddr;
            // 커서를 상세주소 필드로 이동한다.
            alert("상세 주소를 주소란 뒤에 입력해 주세요.");
            document.getElementById('m_address_A').focus();
        }
    }).open();
}


</script>
</body>
<%@ include file="footer.jsp"%>
</html>