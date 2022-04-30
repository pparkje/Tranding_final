<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="header.jsp"%>
<%@ page import="study.spring.trspring.model.Members"%>
<!-- ========== 컨텐츠 영역 시작 ========== -->

<!-- 이곳에 html , css , js , jQuery 적용하면 됩니다. -->
<div class="look_modal">
	<div class="look_modal_look">
		<div class="look_mo">상품정보</div>
		<table border="1" class="look_table" align="center" width="400">
			<thead class="look_table_head">
				<tr class="look_table-color">
					<th width="400"  height="30" colspan="2" align="center">배송 유형</th>
				</tr>
				<tr>
					<th width="90" height="100" align="center">일반배송</td>
					<td width="310" height="100" align="left">
						고객님의 주문과 동시에 현지 온/오프라인 매장에서 상품을 구입한 후 한국으로 배송하는 상품으로, 결제완료 시점을 기준으로 평균 7-10 영업일(현지 기준)내에 배송이 완료됩니다. 상품 수급 현황에 따라 배송 기간이 추가적으로 소요될 수 있습니다.
					</td>
				</tr>
				<tr>
					<th width="90" height="100" align="center">5일배송</th>
					<td width="310" height="100" align="left">
						트렌딩 현지 사무실에 재고를 보유하고 있거나 당일 구매가 가능한 상품으로, 결제완료 시점을 기준으로 평균 3-5 영업일 내에 상품을 받아보실 수 있습니다.
					</td>
				</tr>
				<tr>
					<th width="90" height="100" align="center">당일/익일배송</th>
					<td width="310" height="100" align="left">
					국내에서 바로 배송되는 상품으로, 오후 2시까지 주문 확인된 건은 당일출고, 익일 수령하실 수 있습니다. 당일배송 표기 상품에 한해 서울지역일 경우 당일 수령 가능합니다.
					</td>	
				</tr>
			</thead>
			<tbody class="look_table_body">
				<tr class="look_table-color">
					<th width="400"  height="30" colspan="2" align="center">제공업체</th>
				</tr>
				<tr>
					<th width="90" height="50" align="center">브랜드홈</td>
					<td width="310" height="50" align="left">해당 브랜드의 국가별 공식 홈페이지입니다.</td>
				</tr>
				<tr>
					<th width="90" height="50" align="center">프리모클럽</td>
					<td width="310" height="50" align="left">세계적으로 검증된 글로벌 유명 부티끄와 트렌딩가 직접 검증한 국내외 멀티 브랜드샵입니다.</td>
				</tr>
				<tr>
					<th width="90" height="50" align="center">아울렛</td>
					<td width="310" height="50" align="left">국가별 현지 오프라인 아웃렛 매장입니다.</td>
				</tr>
				<tr>
					<th width="90" height="50" align="center">리세일 상품</td>
					<td width="310" height="50" align="left">리세일 상품을 트렌딩 전문감정팀의 검수를 통해 인증합니다.</td>
				</tr>
				<tr class="look_table-color">
					<th width="400"  height="30" colspan="2" align="center">검수사진</th>
				</tr>
				<tr>
					<th width="90" height="80" align="center">제공</td>
					<td width="310" height="80" align="left">- 단일 상품 25만원 이상 디자이너 브랜드 상품(코스, 자라, 앤아더스토리, 나이키 등 컨템포러리 브랜드 상품 및 해외 리테일러에서 직접 배송하는 상품 제외)<br />-의류의 경우, 단일 상품 40만원 이상 모든 브랜드 상품</td>
				</tr>
				<tr>
					<th width="90" height="80" align="center">미제공</td>
					<td width="310" height="80" align="left">- 검수 사진 제공 기준에 해당하지 않는 제품 검수 사진 미제공시에도 전문 감정팀에 의한 모든 검수과정은 동일하게 진행됩니다.</td>
				</tr>
			</tbody>
		</table>
		<div class="look_modal_footer">
			<a href="javascript:void(0);" class="modal_close">확인</a>
		</div>
	</div>
</div>
<div class="look_modal_A">
	<div class="look_modal_yesang">
		<div class="look_yesang">예상 수령일</div>
		<div class="yesang_imfor1">
			트렌딩 국내 사무실에 재고를 보유하고 있는 제품으로, 2시 입금 확인 건까지 당일 출고(주말 및 공휴일 제외)됩니다.<br />
			※ 국내 사무실 재고 소진 시 현지 주문 상품으로 변경되어 배송기간이 길어지는 점 참고 부탁드립니다.
		</div>
		<div class="yesang_imfor2">
			<div class="yesang_imfor2_A">
			<strong>2021년 1월 31일 (일) 구매기준</strong> 예상 수령일
			</div>
			<div class="yesang_imfor2_B">
			2021년 2월 1일 (월) ~ 2021년 2월 2일 (화)
			</div>
		</div>
		<div class="yesang_imfor3">구매 과정 안내(모든 예상 날짜는 영업일 기준)</div>
		<div class="yesang_imfor4">
			<img src="${pageContext.request.contextPath}/views/tranding/img/look_modal_img1.png">
		</div>
		<div class="yesang_imfor5">
		국내배송<br />(1~2일)
		</div>
		<div class="yesang_imfor6">
			<div class="yesang_imfor6_A">
				사전 통관이 완료된 상품으로 즉시 배송 파트너사에 <br />인수되어 배송을 시작합니다.<br />배송 파트너사: CJ 대한통운(1588-1255)
			</div>
		</div>
		<div class="yesang_imfor7">
		예상 일정은 택배사의 사정에 의해 변동될 수 있습니다.<br />공휴일, 연말이 포함된 경우 배송이 지연될 수 있습니다.
		</div>
		<div class="look_modal_footer1">
			<a href="javascript:void(0);" class="modal_close1">확인</a>
		</div>
	</div>
</div>
<div class="gume_pildok">
	<div class="gume_pildok_A">
		<div class="gume_pildok_A_A">구매 전 필독사항</div>
		<div class="gume_pildok_A_B">
			<div class="gume_pildok_A_B_A">반품 및 반품 수수료 안내</div>
			<table class="gume_pildok_A_B_B">
				<tr class="gume_pildok_A_B_B_A">
					<td>주문접수 ~ 주문확인</td>
					<td>배송 준비 중 이후</td>
				</tr>
				<tr class="gume_pildok_A_B_B_B">
					<td>무료</td>
					<td>
						<strong>수령 후 반품 가능 8,000원</strong><br />(제주/도서 지역의 경우 14,000원)
					</td>
				</tr>
			</table>
		</div>
		<div class="gume_pildok_A_C">
			<ul class="gume_pildok_A_C_A">
				<li>반품/교환 신청 기준</li>
				<li>1. 상품 수령 후 7일 이내 트렌비 고객센터 접수</li>
				<li>2. 접수일 포함 2일 이내 반품 주소지로 택배 수거 접수 필요</li>
			</ul>
			<ul class="gume_pildok_A_C_B">
				<li>반품/교환 유의 사항</li>
				<li>1. 상품 하자/불량은 해당 브랜드의 품질 판단 기준을 바탕으로 한 [상품 하자 기준]에 따르며, 명시된 기준외 제품 컨디션, 미세한 색/디테일 차이 등의 사유는 하자로 판단되지 않습니다.</li>
				<li>2. 대부분의 명품은 수작업 특성상 상품마다 컨디션, 디테일 등이 다를 수 있으며, 이는 하자로 간주하지 않습니다.</li>
				<li>3. 한국 백화점에서 제공되는 품질보증서는 국내에서 자체 제작된 것으로, 현지 대부분의 명품 매장은 개런티카드 및 보증서가 제공되지 않습니다.</li>
				<li>4. 트렌비는 상품의 제조업체가 아니므로 사이즈에 대한 정확한 안내 및 추천이 어려우며, 사이즈 선택에 대한 모든 권한과 책임은 전적으로 구매 고객에게 있습니다.</li>
				<li>5. 상품 하자 및 판매자 과실로 판단되는 경우, 반품/교환 비용은 무료입니다.</li>
				<li>6. 파트너사의 가격 조정/세일 및 환율 변동 등으로, 동일 상품을 교환하는 경우 상품 가격 변동에 따른 결제 금액의 차이가 발생할 수 있습니다.</li>
			</ul>
			<ul class="gume_pildok_A_C_C">
				<li>반품/교환 불가 안내</li>
				<li>1. 상품 하자/불량은 해당 브랜드의 품질 판단 기준을 바탕으로 한 [상품 하자 기준]에 따르며, 명시된 기준외 제품 컨디션, 미세한 색/디테일 차이 등의 사유는 하자로 판단되지 않습니다.</li>
				<li>2. 대부분의 명품은 수작업 특성상 상품마다 컨디션, 디테일 등이 다를 수 있으며, 이는 하자로 간주하지 않습니다.</li>
				<li>3. 수영복, 란제리, 스타킹, 양말, 마스크 등은 시착 또는 부착 필름 제거한 경우 (위생상의 이유)</li>
				<li>4. 영수증, 정품 보증서, 구성품(박스, 더스트 백, 포장 비닐, 쇼핑백 등) 등 동봉된 패키지 누락 및 훼손될 경우</li>
			</ul>
		</div>
		<div class="gume_pildok_A_D">※ <strong>반품할 상품은 받으셨던 상태 그대로 상품이 보존되도록 택배 박스</strong> 또는 <strong>비닐 폴리백을 사용하여 이중 포장하여 반송</strong>해 주셔야 합니다.</div>
		<div class="gume_pildok_A_E">※ 택 제거, 구성품 누락, 사용 등으로 <strong>배송 당시와 다른 상태로 반송된 경우 반품이 거부</strong>될 수 있습니다.</div>
		<div class="gume_pildok_A_F">※ 이때 발생하는 <strong>왕복택배비는 고객 부담</strong>이오니 거부되지 않도록 반송 상태에 주의해 주시기 바랍니다.</div>
		<div class="look_modal_footer2">
			<a href="javascript:void(0);" class="modal_close2">확인</a>
		</div>
	</div>
</div>
<div class="looking_main">
	<div class="looking_center">
		<div class="looking_top">
			<ul class="looking_topmenu">
				<li><a href="javascript:void(0);">${output_A.g_detail_a}</a></li>&nbsp;
				<li><img src="${pageContext.request.contextPath}/views/tranding/img/right_right.png"></li>&nbsp;
				<li><a href="javascript:void(0);">${output_A.g_detail_b}</a></li>
			</ul>
		</div>
		<div class="look_main">
			<div class="look_img">
				<div class="look_img1">
					<a href="${pageContext.request.contextPath}/views/tranding/img/img3.jpg" data-lightbox="myphoto-1">
						<img src="${pageContext.request.contextPath}/views/tranding/img/${output_A.g_image_a}" alt="인터로킹 가방 사진" />
					</a>
				</div>
			</div>
			<div class="look_order">
				<div class="order_imfor1">
					<ul>
						<li>${output_A.g_brand}</li>
						<li class="clear"><button type="button">&nbsp;브랜드샵 ></button></li>
						<li>${output_A.g_cont}</li>
						<li>
							<a href="javascript:void(0);">
								<img src="${pageContext.request.contextPath}/views/tranding/img/upload.png">
							</a>
						</li>
						<li>트렌딩 상품코드 ${output_A.g_code}</li>
					</ul>
				</div>
				<div class="hetek_side">
					<div>결제수단 (무통장 / 카드) 에 따라 최대 2% 할인 자동 적용됩니다.</div>
				</div>
				<div class="hetek_sideA">
					<div>B머니 적립률 2% B머니는 실 결제금액 기준 2% 적립됩니다.<br />(쿠폰 및 적립금 사용, 할인, 배송비등 제외)</div>
				</div>
				<div class="order_imfor2">
					<ul>
						<li>정가</li>
						<li>${output_A.g_ori_price}</li>
						<li>원</li>
						<li>트렌딩판매가</li>
						<li>${output_A.g_price}원&nbsp;</li>
						<li>(관부가세 포함)&nbsp;</li>
						<li>${output_A.g_discount}</li>
						<li>결제혜택가</li>
						<li>${output_A.g_disc_price}&nbsp;</li>
						<li class="brand_hover">!</li>
						<li>D머니</li>
						<li>최대 ${output_A.g_point}D&nbsp;</li>
						<li class="brand_hover_A">!</li>
						<li>배송비</li>
						<li>무료배송</li>
						<li><a href="javascript:void(0);" class="yesang_A">예상 수령일 보기 ▶</a></li>
					</ul>
				</div>
				<div class="order_imfor3">
					<ul>
						<li>반품/교환 여부</li>
						<li>고객 수령 후 반품/교환이 가능한 상품입니다.</li>
						<li><a href="javascript:void(0);" class="banpum_A">반품/교환 안내 ▶</a></li>
						<li><a href="javascript:void(0);" class="baro_gume">바로 구매하기</a></li>
						<%
							request.setCharacterEncoding("UTF-8");
	                    	Members keyZ = (Members) session.getAttribute("output_B");
							if(keyZ == null) {
						%>
						<c:url value="/pjh/jsp/looking_cartpage_login.do" var="viewUrlC">
							<c:param name="id" value="${output_A.id}" />
						</c:url>
						<li>
						<a href="${viewUrlC}">장바구니 담기</a>
						</li>
						<% 
						}else{
							request.setCharacterEncoding("UTF-8");
	                    	Members keyX = (Members) session.getAttribute("output_B");
	                    	session.setAttribute("key", keyX);
						%>
						<c:set var="m_id" value="${output_B.m_id}" />
						<c:url value="/pjh/jsp/looking_cartpage.do" var="viewUrlB">
							<c:param name="id" value="${output_A.id}" />
							<c:param name="m_id" value="${m_id}" />
						</c:url>
						<li><a href="${viewUrlB}">장바구니 담기</a></li>
						<% } %>
						<c:url value="/pjh/jsp/looking_jjim.do" var="viewUrlA">
							<c:param name="id" value="${output_A.id}" />
						</c:url>
						<li><a href="${viewUrlA}">♡찜하기</a></li>
					</ul>
				</div>
			</div>
			<div class="look_explan">
				<ul class="look_ex">
					<li class="explan1">
						<a href="javascript:void(0);" class="modal_cl">!</a>
					</li>
					&nbsp;
					<li class="explan2">상품정보</li>
					<ul class="ex1">
						<li>
							<img src="${pageContext.request.contextPath}/views/tranding/img/deliv.png">
						</li>
						<li>5일배송<br />(4~5영업일)
						</li>
						<li>
							<img src="${pageContext.request.contextPath}/views/tranding/img/provider.png">
						</li>
						<li>아울렛</li>
						<li>
							<img src="${pageContext.request.contextPath}/views/tranding/img/inspector.png">
						</li>
						<li>미제공</li>
					</ul>
				</ul>
			</div>
			<div class="look_information">
				<div class="guidance1">
					<ul>
						<li>&nbsp;&nbsp;<a href="javascript:void(0);">
						[안내] 관부가세 미포함 쇼핑몰 이용 시 주의사항</a>
						</li>
						<li>&nbsp;&nbsp;<a href="javascript:void(0);">
						[안내] 2021년 1월 무이자 카드할부 안내</a>
						</li>
					</ul>
				</div>
				<div class="guidance2">
					<ul class="guid_1">
						<li class="guid_A">
							<ul class="guidA">
								<li class="size_imfor">사이즈 안내</li>
								<li>
									<a href="javascript:void(0);" class="plusA"> 
										<img src="${pageContext.request.contextPath}/views/tranding/img/plus.png">
									</a>
								</li>
								<li>
									<a href="javascript:void(0);" class="plusB"> 
										<img src="${pageContext.request.contextPath}/views/tranding/img/minus.png">
									</a>
								</li>
							</ul>
							<ul class="guid1">
								<li>
									<a href="javascript:void(0);"> 트렌딩 통합 사이즈표 보기</a>
								</li>
								<li>트렌딩 사이즈표는 통상적인 사이즈에 대한 수치이며, 브랜드와 디자인에 따라서 차이가 있을 수
									있습니다. <br />정확한 사이즈는 해당 브랜드 홈페이지나 고객센터를 통해 확인 바랍니다.
								</li>
							</ul>
						</li>
						<li class="guid_B">
							<ul class="guidB">
								<li class="price_1">관부가세/배송비</li>
								<li class="plusC">
									<a href="javascript:void(0);"> 
										<img src="${pageContext.request.contextPath}/views/tranding/img/plus.png">
									</a>
								</li>
								<li class="plusD">
									<a href="javascript:void(0);"> 
										<img src="${pageContext.request.contextPath}/views/tranding/img/minus.png">
									</a>
								</li>
							</ul>
							<ul class="guid2">
								<li><Strong>세관 관/부가세</Strong><br /> 해당 상품은 유럽에서 출고하는 상품으로
									관/부가세 및 수수료를 포함한 가격이며, 추가로 지불하셔야 할 금액은 발생하지 않습니다.</li>
								<li><Strong>배송비</Strong></li>
								<li>무료</li>
							</ul>
						</li>
						<li class="guid_C">
							<ul class="guidC">
								<li>주문진행과정</li>
								<li class="plusE">
									<a href="javascript:void(0);"> 
										<img src="${pageContext.request.contextPath}/views/tranding/img/plus.png">
									</a>
								</li>
								<li class="plusF">
									<a href="javascript:void(0);"> 
										<img src="${pageContext.request.contextPath}/views/tranding/img/minus.png">
									</a>
								</li>
							</ul>
							<ul class="guid3">
								<li class="gumsu">해당 상품은 유럽 현지 물류센터에 재고를 보유하고 있는 상품으로, 주문 시
									2~3영업일 내에 한국으로 출고됩니다. (주말 및 공휴일 제외) <br />※ 재고 소진 시 상품 입고 일정에
									따라 예상 수령일이 변동될 수 있으며, 고객님께 별도 안내드립니다.
								</li>
								<ul class="gumsu1">
									<li>1. 검수 및 출고</li>
									<li>주문/결제가 확인된 상품은 전문 검수팀의 검수 및 물류팀의 포장 작업을 거쳐 한국으로 출고됩니다.</li>
									<li>검수 사진은 제공 상품에 한해 마이페이지를 통해 확인할 수 있으며, 이때 잘못된 물품이 배송
										되었거나 하자가 발견되었을 경우 고객님께 별도 안내드립니다.</li>
									<li>배송 및 세관 통관 과정 동안 안전하게 보호되도록 꼼꼼하게 진행하며, 상품 구매 시 제공받은
										구성품 모두 함께 포장됩니다.</li>
									<li>한국으로 출고된 상품은 1~2영업일 이내 인천공항에 도착하며, 공휴일이나 연말 등에는 일정이
										지연될 수 있습니다.</li>
									<li>※ 대부분의 브랜드가 구성품(박스, 더스트 백, 쇼핑백 등) 패키지 없이 상품을 판매합니다.
										선물용으로 꼭! 구성품에 대한 확인이 필요하신 경우 반드시 트렌딩 고객센터로 문의해 주시기 바랍니다.</li>
								</ul>
								<ul class="gumsu2">
									<li>2. 세관 통관</li>
									<li>인천공항에 도착한 상품은 정식 세관 통관 과정을 거치게 됩니다.</li>
									<li>통관 과정은 2~3영업일 정도 소요되며, 세관 검열 강화에 의해 일정은 변동될 수 있습니다.</li>
								</ul>
								<ul class="gumsu3">
									<li>3. 국내 배송</li>
									<li>세관 통관이 완료된 상품은 국내 택배사에 전달되어 배송을 시작합니다.</li>
									<li>1~2영업일 이내 배송되며, 택배사 사정에 의해 배송 예상일이 변동될 수 있습니다.</li>
									<li>택배사: 우체국 택배(0000-0000)</li>
								</ul>
							</ul>
						</li>
						<li class="guid_D">
							<ul class="guidD">
								<li>취소 및 환불 규정</li>
								<li class="plusG">
									<a href="javascript:void(0);"> 
										<img src="${pageContext.request.contextPath}/views/tranding/img/plus.png">
									</a>
								</li>
								<li class="plusH">
									<a href="javascript:void(0);"> 
										<img src="${pageContext.request.contextPath}/views/tranding/img/minus.png">
									</a>
								</li>
							</ul>
							<ul class="guid4">
								<ul class="besongA">
									<li>1. 5일배송 상품 취소 안내</li>
									<li>주문접수/주문확인 : 무료 취소</li>
									<li>배송 준비중 이후 : 취소 불가<br /> <strong>단, 재고 소진 시
											현지 재고 상황에 따라 구매를 시도하여 현지주문완료 또는 현지바잉중으로 주문 상태가 변경될 수 있습니다.</strong>
									</li>
									<li>현지주문완료 : 반품/교환 안내에서 한국 발송 전 취소가 가능한 상품에 한해
										수수료(27,500원) 공제 후 취소 가능</li>
									<li>현지바잉중 : 현지에서 구매가 완료되었을 수 있으며, 구매 성공 시 어떠한 경우라도 취소 불가</li>
								</ul>
								<ul class="besongB">
									<li>2. 환불 일정 안내</li>
									<li>무통장 : 취소일로부터 1~2영업일 소요</li>
									<li>카드 : 취소일로부터 카드사에 따라 3~5영업일 소요</li>
									<li>B머니 : 취소 당일 복원 (단, 무통장 입금과 복합 결제 시 1~2영업일 소요)</li>
								</ul>
							</ul>
						</li>
						<li class="guid_E">
							<ul class="guidE">
								<li>상품 하자 기준</li>
								<li class="plusI">
									<a href="javascript:void(0);"> 
										<img src="${pageContext.request.contextPath}/views/tranding/img/plus.png">
									</a>
								</li>
								<li class="plusJ">
									<a href="javascript:void(0);"> 
									<img src="${pageContext.request.contextPath}/views/tranding/img/minus.png">
									</a>
								</li>
							</ul>
							<ul class="guid5">
								<li class="hajaimfor1">고객님께서 구매하신 모든 상품은 트렌딩 전문 검수팀이 상품
									컨디션을 꼼꼼하게 확인한 후 출고하고 있습니다. 사진 제공 유무와 관계 없이 모든 검수과정은 동일하게 진행됩니다.
									<br />(단, 트렌딩와 계약된 공식 파트너사의 상품은 해당 업체에서 직접 검수 후 출고됩니다.)
								</li>
								<li class="hajaimfor2">아래와 같이 브랜드 측에서 불량으로 인정하지 않는 사유의 상품은
									하자로 판단하지 않으며, 이로 인한 교환/환불 처리가 불가한 점 구매 전 충분한 주의 부탁드립니다.</li>
								<li class="hajaimfor3">[트렌딩 하자 기준 안내]</li>
								<ul class="jejak">
									<li>제작 공정 중 발생할 수 있는 미세한 스크레치</li>
									<li>미세한 박음질 미흡(작은 실밥)</li>
									<li>천연가죽 특성상 발생하는 가죽 결 차이 또는 눌림 자국</li>
									<li>미세한 색상의 차이 또는 일부 디테일의 차이</li>
									<li>상품에 묻어 있는 본드 자국</li>
									<li>상품 배송 중에 발생하는 구겨짐 등</li>
								</ul>
								<li class="hajaimfor4">자세한 하자 기준 안내는 아래의 버튼을 누르시면 확인하실 수
									있습니다.</li>
								<li class="hajaimfor5">
									<a href="javascript:void(0);">트렌딩 하자 기준 보기</a>
								</li>
								<li class="hajaimfor6">검수 과정 중 하자가 발견될 경우 먼저 고객님께 별도 연락을
									드리고 있습니다만, 검수팀에서 미처 발견하지 못한 부분이 있을 수 있습니다. 이와 같은 사항을 발견하신 경우 즉시
									고객센터 1522-2538로 연락해 주시면 자세히 안내해 드리겠습니다.</li>
							</ul>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<div class="sub_look">
			<div class="sub_look1">관련상품</div>
		</div>
		<div class="swiper-container">
			<div class="swiper-wrapper">
				<!-- 슬라이드 처리 영역  -->
				<div class="swiper-slide">
					<div class="sub_imformation">
						<a href="javascript:void(0);">
							<img src="${pageContext.request.contextPath}/views/tranding/img/sample_looking2.jpg" class="looking_img">
							<ul class="sub_imfor1">
								<li>Gucci | 구찌</li>
								<li>토트 가방 스몰 오피디아 Ophidia small GG tote bag 13437105</li>
								<li>1,173,500원</li>
								<li>50%</li>
								<li>2,347,000원</li>
							</ul>
						</a>
					</div>
				</div>
				<div class="swiper-slide">
					<div class="sub_imformation">
						<a href="javascript:void(0);">
							<img src="${pageContext.request.contextPath}/views/tranding/img/sample_looking2.jpg" class="looking_img">
							<ul class="sub_imfor1">
								<li>Gucci | 구찌</li>
								<li>토트 가방 스몰 오피디아 Ophidia small GG tote bag 13437105</li>
								<li>1,173,500원</li>
								<li>50%</li>
								<li>2,347,000원</li>
							</ul>
						</a>
					</div>
				</div>
				<div class="swiper-slide">
					<div class="sub_imformation">
						<a href="javascript:void(0);">
							<img src="${pageContext.request.contextPath}/views/tranding/img/sample_looking2.jpg" class="looking_img">
							<ul class="sub_imfor1">
								<li>Gucci | 구찌</li>
								<li>토트 가방 스몰 오피디아 Ophidia small GG tote bag 13437105</li>
								<li>1,173,500원</li>
								<li>50%</li>
								<li>2,347,000원</li>
							</ul>
						</a>
					</div>
				</div>
				<div class="swiper-slide">
					<div class="sub_imformation">
						<a href="javascript:void(0);">
							<img src="${pageContext.request.contextPath}/views/tranding/img/sample_looking2.jpg" class="looking_img">
							<ul class="sub_imfor1">
								<li>Gucci | 구찌</li>
								<li>토트 가방 스몰 오피디아 Ophidia small GG tote bag 13437105</li>
								<li>1,173,500원</li>
								<li>50%</li>
								<li>2,347,000원</li>
							</ul>
						</a>
					</div>
				</div>
				<div class="swiper-slide">
					<div class="sub_imformation">
						<a href="javascript:void(0);">
							<img src="${pageContext.request.contextPath}/views/tranding/img/sample_looking2.jpg" class="looking_img">
							<ul class="sub_imfor1">
								<li>Gucci | 구찌</li>
								<li>토트 가방 스몰 오피디아 Ophidia small GG tote bag 13437105</li>
								<li>1,173,500원</li>
								<li>50%</li>
								<li>2,347,000원</li>
							</ul>
						</a>
					</div>
				</div>
				<div class="swiper-slide">
					<div class="sub_imformation">
						<a href="javascript:void(0);">
							<img src="${pageContext.request.contextPath}/views/tranding/img/sample_looking2.jpg" class="looking_img">
							<ul class="sub_imfor1">
								<li>Gucci | 구찌</li>
								<li>토트 가방 스몰 오피디아 Ophidia small GG tote bag 13437105</li>
								<li>1,173,500원</li>
								<li>50%</li>
								<li>2,347,000원</li>
							</ul>
						</a>
					</div>
				</div>
				<div class="swiper-slide">
					<div class="sub_imformation">
						<a href="javascript:void(0);">
							<img src="${pageContext.request.contextPath}/views/tranding/img/sample_looking2.jpg" class="looking_img">
							<ul class="sub_imfor1">
								<li>Gucci | 구찌</li>
								<li>토트 가방 스몰 오피디아 Ophidia small GG tote bag 13437105</li>
								<li>1,173,500원</li>
								<li>50%</li>
								<li>2,347,000원</li>
							</ul>
						</a>
					</div>
				</div>
				<div class="swiper-slide">
					<div class="sub_imformation">
						<a href="javascript:void(0);">
							<img src="${pageContext.request.contextPath}/views/tranding/img/sample_looking2.jpg" class="looking_img">
							<ul class="sub_imfor1">
								<li>Gucci | 구찌</li>
								<li>토트 가방 스몰 오피디아 Ophidia small GG tote bag 13437105</li>
								<li>1,173,500원</li>
								<li>50%</li>
								<li>2,347,000원</li>
							</ul>
						</a>
					</div>
				</div>
				<div class="swiper-slide">
					<div class="sub_imformation">
						<a href="javascript:void(0);">
							<img src="${pageContext.request.contextPath}/views/tranding/img/sample_looking2.jpg" class="looking_img">
							<ul class="sub_imfor1">
								<li>Gucci | 구찌</li>
								<li>토트 가방 스몰 오피디아 Ophidia small GG tote bag 13437105</li>
								<li>1,173,500원</li>
								<li>50%</li>
								<li>2,347,000원</li>
							</ul>
						</a>
					</div>
				</div>
				<div class="swiper-slide">
					<div class="sub_imformation">
						<a href="javascript:void(0);">
							<img src="${pageContext.request.contextPath}/views/tranding/img/sample_looking2.jpg" class="looking_img">
							<ul class="sub_imfor1">
								<li>Gucci | 구찌</li>
								<li>토트 가방 스몰 오피디아 Ophidia small GG tote bag 13437105</li>
								<li>1,173,500원</li>
								<li>50%</li>
								<li>2,347,000원</li>
							</ul>
						</a>
					</div>
				</div>
				<div class="swiper-slide">
					<div class="sub_imformation">
						<a href="javascript:void(0);">
							<img src="${pageContext.request.contextPath}/views/tranding/img/sample_looking2.jpg" class="looking_img">
							<ul class="sub_imfor1">
								<li>Gucci | 구찌</li>
								<li>토트 가방 스몰 오피디아 Ophidia small GG tote bag 13437105</li>
								<li>1,173,500원</li>
								<li>50%</li>
								<li>2,347,000원</li>
							</ul>
						</a>
					</div>
				</div>
				<div class="swiper-slide">
					<div class="sub_imformation">
						<a href="javascript:void(0);">
							<img src="${pageContext.request.contextPath}/views/tranding/img/sample_looking2.jpg" class="looking_img">
							<ul class="sub_imfor1">
								<li>Gucci | 구찌</li>
								<li>토트 가방 스몰 오피디아 Ophidia small GG tote bag 13437105</li>
								<li>1,173,500원</li>
								<li>50%</li>
								<li>2,347,000원</li>
							</ul>
						</a>
					</div>
				</div>
			</div>
			<!-- 좌우버튼 밑에 조그마한 동그라미 버튼 밑에 스크롤바 영역 -->
			<!-- <div class="swiper-pagination"></div> -->
			<!-- 버튼 추가 구현 -->
			<!-- <div class="swiper-button-prev"></div>
			<div class="swiper-button-next"></div> -->
		</div>
		<div class="looking_looking_looking">
			<div class="looking_imformation_im">상품설명</div>
			<div class="looking_imformation_img_look">
				<div class="looking_imformation_img_look1">
					<div class="looking_first">
						<img src="${pageContext.request.contextPath}/views/tranding/img/looking1.png" />
					</div>
					<c:choose>
						<c:when test="${output_A.g_image_b == null || fn:length(output_A.g_image_b) == 0}">
							<h1>조회결과가 없습니다.</h1>
						</c:when>
						<c:otherwise>
							<c:set var="photo" value="${fn:split(output_A.g_image_b,',')}" />
							<c:forEach items="${photo}" varStatus="status" var="i">
								<div class="photo_A">
									<img src="${pageContext.request.contextPath}/views/tranding/img/${i}" />
								</div>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
		<div class="look_14_imfor">
			<img src="${pageContext.request.contextPath}/views/tranding/img/looking14.png" />
		</div>
	</div>
	<div class="service_service_look">
		<div class="serv_serv_look">
			<div>트렌딩 프리미엄 서비스</div>
			<div class="serv_look1">
				<ul>
					<li>공식 루트를 통한 200% 정품 취급</li>
					<li>트렌딩는 공식 루트를 통한 상품만 취급하고 있습니다. 더불어 까다롭기로 소문난 트렌딩 감정팀이 직접
						감정하여 모니터링을 거친 상품들만 취급합니다. 혹여나 가품인 경우, 200% 보상금을 드립니다.
					</li>
				</ul>
			</div>
			<div class="serv_look2">
				<ul>
					<li>프리미엄 A/S 평생 제공</li>
					<li>트렌딩는 백화점과 같은 서비스를 제공합니다. 한국 최상의 A/S 업체와의 제휴를 통하여 편리하게 A/S를
						받으실 수 있도록 도와드립니다. (유상제공)
					</li>
				</ul>
			</div>
			<div class="serv_look3">
				<ul>
					<li>전문가의 상품 검수</li>
					<li>트렌딩 전문 감정팀의 꼼꼼한 검수 이후, 고객에게 검수 결과를 안내해 드리고 있습니다. 하자가 있으면
						환불해야하는 번거로움을 트렌딩가 덜어드리겠습니다.
					</li>
				</ul>
			</div>
			<div class="serv_look4">
				<ul>
					<li>구매영수증 동봉</li>
					<li>트렌딩 판매 가격 20만 원 이상 상품의 경우 현지 백화점, 브랜드 매장에서 구매한 영수증 사본 혹은
						주문한 내역을 출력해 동봉해 드리고 있습니다. (일부 프리모 클럽 및 병행수입 제품 제외)
					</li>
				</ul>
			</div>
			<div class="serv_look5">
				<ul>
					<li>한눈에 보이는 주문 처리 과정</li>
					<li>주문하신 상품이 고객님의 손에 들어가기까지 안심하실 수 있도록 모든 과정을 카카오 알림톡,
						문자(SMS), 이메일 그리고 주문조회를 통해 자세하게 알려드립니다.
					</li>
				</ul>
			</div>
			<div class="serv_look6">
				<ul>
					<li>최저가를 찾아내는 기술력</li>
					<li>한국과 유럽에서 인정받은 전문가들이 모여 개발한 전 세계 가격 수집/비교 시스템으로 최저가를
						찾아드립니다.
					</li>
				</ul>
			</div>
		</div>
	</div>
	<div class="review_looking">리뷰</div>
		<div class="swiper-container">
			<div class="swiper-wrapper">
				<!-- 슬라이드 처리 영역  -->
				<div class="swiper-slide">
					<div class="sub_imformation">
						<a href="javascript:void(0);">
							<img src="${pageContext.request.contextPath}/views/tranding/img/review_looking1.jpeg" class="looking_img">
							<ul class="sub_imfor1">
								<li>
								#2612558 #구찌빠른배송인터로킹체인크로스백스몰블랙 #구찌 #구매후기 많이들 기본적으로 사용하는 #가방 ! 이뻐요 편하고
								</li>
							</ul>
						</a>
					</div>
				</div>
				<div class="swiper-slide">
					<div class="sub_imformation">
						<a href="javascript:void(0);">
							<img src="${pageContext.request.contextPath}/views/tranding/img/review_looking1.jpg" class="looking_img">
							<ul class="sub_imfor1">
								<li>
								기다리던 #가방 인데 배송 빨라서 너무좋았어요포장도 꼼꼼히 잘되서 왔구요 화면하고 똑같구요! 너무이뻐요
								</li>
							</ul>
						</a>
					</div>
				</div>
				<div class="swiper-slide">
					<div class="sub_imformation">
						<a href="javascript:void(0);">
							<img src="${pageContext.request.contextPath}/views/tranding/img/review_looking2.jpeg" class="looking_img">
							<ul class="sub_imfor1">
								<li>
								#가방 너무 예뻐요 #가방 에 대해 자세히 설명도 해주시고 #가방 상태도 너무 좋구요 #2612558 #인터로킹크로스백스몰블랙 #구찌 #구매후기
								</li>
							</ul>
						</a>
					</div>
				</div>
				<div class="swiper-slide">
					<div class="sub_imformation">
						<a href="javascript:void(0);">
							<img src="${pageContext.request.contextPath}/views/tranding/img/review_looking2.jpg" class="looking_img">
							<ul class="sub_imfor1">
								<li>
								#2612558 #인터로킹크로스백스몰블랙 #구찌 #구매후기 #구매완료
								</li>
							</ul>
						</a>
					</div>
				</div>
				<div class="swiper-slide">
					<div class="sub_imformation">
						<a href="javascript:void(0);">
							<img src="${pageContext.request.contextPath}/views/tranding/img/review_looking3.jpeg" class="looking_img">
							<ul class="sub_imfor1">
								<li>
								너무 잘산것 같아요........ 정말 이쁘고 좋습니다!!!!!!!!!! 명품를 인터넷에서 구매한다는게 걱정도 됐지만 역시 트랜비네요 상품도 정말 일찍받았어요!! 명품치고 비싼가격이 아니어서 생각보다 큰 부담도 없고 그냥 정말 이뻐요!!!! 고민할 시간에 그냥 당장 사세요!!!!!정말 후회1도 안할겁니다!!!!
								</li>
							</ul>
						</a>
					</div>
				</div>
				<div class="swiper-slide">
					<div class="sub_imformation">
						<a href="javascript:void(0);">
							<img src="${pageContext.request.contextPath}/views/tranding/img/review_looking3.jpg" class="looking_img">
							<ul class="sub_imfor1">
								<li>
								#2612558 #인터로킹크로스백스몰블랙 #구찌 #구매후기 가장 베이직한 스타일 입니다 :) 색상도 블랙이라 캐주얼 또는 정장에도 쉽게 매치 가능합니다♡ 트렌딩 첫구매 200%만족해요 다음에도 이용할게요^^♡♡
								</li>
							</ul>
						</a>
					</div>
				</div>
				<div class="swiper-slide">
					<div class="sub_imformation">
						<a href="javascript:void(0);">
							<img src="${pageContext.request.contextPath}/views/tranding/img/review_looking4.jpeg" class="looking_img">
							<ul class="sub_imfor1">
								<li>
								배송 안전하게 빨리왔구 생각한거보다 고급지고 이뻐요~~ #2612558 #인터로킹크로스백스몰블랙 #구찌 #구매후기
								</li>
							</ul>
						</a>
					</div>
				</div>
				<div class="swiper-slide">
					<div class="sub_imformation">
						<a href="javascript:void(0);">
							<img src="${pageContext.request.contextPath}/views/tranding/img/review_looking4.jpg" class="looking_img">
							<ul class="sub_imfor1">
								<li>
								예쁜데 작아요ㅜ.ㅜ 큰거 살걸 #2612558 #인터로킹크로스백스몰블랙 #구찌 #구매후기
								</li>
							</ul>
						</a>
					</div>
				</div>
				<div class="swiper-slide">
					<div class="sub_imformation">
						<a href="javascript:void(0);">
							<img src="${pageContext.request.contextPath}/views/tranding/img/review_looking5.jpeg" class="looking_img">
							<ul class="sub_imfor1">
								<li>
								#2612558 #인터로킹크로스백스몰블랙 #구찌 #구매후기 반신반의하며 트렌딩에선 처음 주문했는데 받아보니 정품맞는것 같고 마감처리도 다 잘되어있었습니당!!! 사진보다 실물이 훨씬 더 예뻐요ㅠㅠㅠㅠ데일리템으로 애용할것같네요~~👍🏻
								</li>
							</ul>
						</a>
					</div>
				</div>
				<div class="swiper-slide">
					<div class="sub_imformation">
						<a href="javascript:void(0);">
							<img src="${pageContext.request.contextPath}/views/tranding/img/review_looking6.jpeg" class="looking_img">
							<ul class="sub_imfor1">
								<li>
								명품직구는 처음이라 걱정많이했는데 빠르고 안전하게 잘 온것 같아요~ #2612558 #인터로킹크로스백스몰블랙 #구찌 #구매후기
								</li>
							</ul>
						</a>
					</div>
				</div>
				<div class="swiper-slide">
					<div class="sub_imformation">
						<a href="javascript:void(0);">
							<img src="${pageContext.request.contextPath}/views/tranding/img/review_looking7.jpeg" class="looking_img">
							<ul class="sub_imfor1">
								<li>
								#2612558#인터로킹크로스백스몰블랙#구찌#구매후기 앙증맞고 너무 이뻐요 적당하게 수납도 잘되어있고 간단하게 필요한것만 넣고 다닐수있어 좋은것같아요 택배 배송도 일 이주는 걸릴줄 알았는데 4,5일? 밖에 안걸려서 깜짝 놀랐어요 직구를 이렇게 빨리 받아보길 처음이예요 진짜 쵝오예요 다른거 또 살예정 입니다😄
								</li>
							</ul>
						</a>
					</div>
				</div>
				<div class="swiper-slide">
					<div class="sub_imformation">
						<a href="javascript:void(0);">
							<img src="${pageContext.request.contextPath}/views/tranding/img/review_looking8.jpeg" class="looking_img">
							<ul class="sub_imfor1">
								<li>
								#2612558 #인터로킹크로스백스몰블랙 #구찌 #구매후기
								</li>
							</ul>
						</a>
					</div>
				</div>
			</div>	
		</div>
		<div class="review_write1">
			<a href="javascript:void(0);">리뷰작성</a>
		</div>
</div>

<%@ include file="footer.jsp"%>
<script src="${pageContext.request.contextPath}/views/tranding/js/jquery-3.5.1.min.js"></script>
<script src="${pageContext.request.contextPath}/views/tranding/js/jquery.animatecss.min.js"></script>
<script src="${pageContext.request.contextPath}/views/tranding/js/lightbox/lightbox.min.js"></script>
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<script type="text/javascript">
	$(function() {
		$('.plusA').click(function() {

			var p1 = document.querySelector('.plusA');
			var p2 = document.querySelector('.plusB');

			var pp1 = document.querySelector('.guid_A');
			var pp2 = document.querySelector('.guid1');

			var ppp1 = document.querySelector('.look_main');

			var pppp1 = document.querySelector('.guid2');
			var pppp2 = document.querySelector('.guid3');
			var pppp3 = document.querySelector('.guid4');
			var pppp4 = document.querySelector('.guid5');

			var pppp5 = document.querySelector('.guid_B');
			var pppp6 = document.querySelector('.guid_C');
			var pppp7 = document.querySelector('.guid_D');
			var pppp8 = document.querySelector('.guid_E');

			var ppppp1 = document.querySelector('.plusC');
			var ppppp2 = document.querySelector('.plusD');
			var ppppp3 = document.querySelector('.plusE');
			var ppppp4 = document.querySelector('.plusF');
			var ppppp5 = document.querySelector('.plusG');
			var ppppp6 = document.querySelector('.plusH');
			var ppppp7 = document.querySelector('.plusI');
			var ppppp8 = document.querySelector('.plusJ');

			p1.style.display = "none";
			p2.style.display = "block";
			pp1.style.height = "200px";
			pp2.style.display = "block";
			
			$(".guid1").animateCSS('fadeInRight', { duration : 1000 });

			ppp1.style.height = "1500px";

			pppp1.style.display = "none";
			pppp2.style.display = "none";
			pppp3.style.display = "none";
			pppp4.style.display = "none";
			pppp5.style.height = "50px";
			pppp6.style.height = "50px";
			pppp7.style.height = "50px";
			pppp8.style.height = "50px";

			ppppp1.style.display = "block";
			ppppp2.style.display = "none";
			ppppp3.style.display = "block";
			ppppp4.style.display = "none";
			ppppp5.style.display = "block";
			ppppp6.style.display = "none";
			ppppp7.style.display = "block";
			ppppp8.style.display = "none";
		});
		$('.plusB').click(function() {

			var p3 = document.querySelector('.plusA');
			var p4 = document.querySelector('.plusB');
			var pp3 = document.querySelector('.guid_A');
			var pp4 = document.querySelector('.guid1');

			p3.style.display = "block";
			p4.style.display = "none";
			pp3.style.height = "50px";
			pp4.style.display = "none";

			var ppp1 = document.querySelector('.look_main');
			ppp1.style.height = "1350px";

		});
		$('.plusC').click(function() {

			var p5 = document.querySelector('.plusC');
			var p6 = document.querySelector('.plusD');
			var pp5 = document.querySelector('.guid_B');
			var pp6 = document.querySelector('.guid2');

			var ppp1 = document.querySelector('.look_main');

			var pppp1 = document.querySelector('.guid1');
			var pppp2 = document.querySelector('.guid3');
			var pppp3 = document.querySelector('.guid4');
			var pppp4 = document.querySelector('.guid5');

			var pppp5 = document.querySelector('.guid_A');
			var pppp6 = document.querySelector('.guid_C');
			var pppp7 = document.querySelector('.guid_D');
			var pppp8 = document.querySelector('.guid_E');

			var ppppp1 = document.querySelector('.plusA');
			var ppppp2 = document.querySelector('.plusB');
			var ppppp3 = document.querySelector('.plusE');
			var ppppp4 = document.querySelector('.plusF');
			var ppppp5 = document.querySelector('.plusG');
			var ppppp6 = document.querySelector('.plusH');
			var ppppp7 = document.querySelector('.plusI');
			var ppppp8 = document.querySelector('.plusJ');

			p5.style.display = "none";
			p6.style.display = "block";
			pp5.style.height = "200px";
			pp6.style.display = "block";
			
			$(".guid2").animateCSS('fadeInRight', { duration : 1000 });

			ppp1.style.height = "1500px";

			pppp1.style.display = "none";
			pppp2.style.display = "none";
			pppp3.style.display = "none";
			pppp4.style.display = "none";
			pppp5.style.height = "50px";
			pppp6.style.height = "50px";
			pppp7.style.height = "50px";
			pppp8.style.height = "50px";

			ppppp1.style.display = "block";
			ppppp2.style.display = "none";
			ppppp3.style.display = "block";
			ppppp4.style.display = "none";
			ppppp5.style.display = "block";
			ppppp6.style.display = "none";
			ppppp7.style.display = "block";
			ppppp8.style.display = "none";

		});
		$('.plusD').click(function() {

			var p7 = document.querySelector('.plusC');
			var p8 = document.querySelector('.plusD');
			var pp7 = document.querySelector('.guid_B');
			var pp8 = document.querySelector('.guid2');
			p7.style.display = "block";
			p8.style.display = "none";
			pp7.style.height = "50px";
			pp8.style.display = "none";

			var ppp1 = document.querySelector('.look_main');
			ppp1.style.height = "1350px";

		});
		$('.plusE').click(function() {

			var p9 = document.querySelector('.plusE');
			var p10 = document.querySelector('.plusF');
			var pp9 = document.querySelector('.guid_C');
			var pp10 = document.querySelector('.guid3');

			var ppp1 = document.querySelector('.look_main');

			var pppp1 = document.querySelector('.guid1');
			var pppp2 = document.querySelector('.guid2');
			var pppp3 = document.querySelector('.guid4');
			var pppp4 = document.querySelector('.guid5');

			var pppp5 = document.querySelector('.guid_A');
			var pppp6 = document.querySelector('.guid_B');
			var pppp7 = document.querySelector('.guid_D');
			var pppp8 = document.querySelector('.guid_E');

			var ppppp1 = document.querySelector('.plusA');
			var ppppp2 = document.querySelector('.plusB');
			var ppppp3 = document.querySelector('.plusC');
			var ppppp4 = document.querySelector('.plusD');
			var ppppp5 = document.querySelector('.plusG');
			var ppppp6 = document.querySelector('.plusH');
			var ppppp7 = document.querySelector('.plusI');
			var ppppp8 = document.querySelector('.plusJ');

			p9.style.display = "none";
			p10.style.display = "block";
			pp9.style.height = "650px";
			pp10.style.display = "block";
			$(".guid3").animateCSS('fadeInRight', { duration : 1000 });

			ppp1.style.height = "1950px";

			pppp1.style.display = "none";
			pppp2.style.display = "none";
			pppp3.style.display = "none";
			pppp4.style.display = "none";
			pppp5.style.height = "50px";
			pppp6.style.height = "50px";
			pppp7.style.height = "50px";
			pppp8.style.height = "50px";

			ppppp1.style.display = "block";
			ppppp2.style.display = "none";
			ppppp3.style.display = "block";
			ppppp4.style.display = "none";
			ppppp5.style.display = "block";
			ppppp6.style.display = "none";
			ppppp7.style.display = "block";
			ppppp8.style.display = "none";

		});
		$('.plusF').click(function() {

			var p11 = document.querySelector('.plusE');
			var p12 = document.querySelector('.plusF');
			var pp11 = document.querySelector('.guid_C');
			var pp12 = document.querySelector('.guid3');

			p11.style.display = "block";
			p12.style.display = "none";
			pp11.style.height = "50px";
			pp12.style.display = "none";

			var ppp1 = document.querySelector('.look_main');
			ppp1.style.height = "1350px";

		});
		$('.plusG').click(function() {

			var p13 = document.querySelector('.plusG');
			var p14 = document.querySelector('.plusH');
			var pp13 = document.querySelector('.guid_D');
			var pp14 = document.querySelector('.guid4');

			var ppp1 = document.querySelector('.look_main');

			var pppp1 = document.querySelector('.guid1');
			var pppp2 = document.querySelector('.guid2');
			var pppp3 = document.querySelector('.guid3');
			var pppp4 = document.querySelector('.guid5');

			var pppp5 = document.querySelector('.guid_A');
			var pppp6 = document.querySelector('.guid_B');
			var pppp7 = document.querySelector('.guid_C');
			var pppp8 = document.querySelector('.guid_E');

			var ppppp1 = document.querySelector('.plusA');
			var ppppp2 = document.querySelector('.plusB');
			var ppppp3 = document.querySelector('.plusC');
			var ppppp4 = document.querySelector('.plusD');
			var ppppp5 = document.querySelector('.plusE');
			var ppppp6 = document.querySelector('.plusF');
			var ppppp7 = document.querySelector('.plusI');
			var ppppp8 = document.querySelector('.plusJ');

			p13.style.display = "none";
			p14.style.display = "block";
			pp13.style.height = "400px";
			pp14.style.display = "block";
			$(".guid4").animateCSS('fadeInRight', { duration : 1000 });

			ppp1.style.height = "1700px";

			pppp1.style.display = "none";
			pppp2.style.display = "none";
			pppp3.style.display = "none";
			pppp4.style.display = "none";
			pppp5.style.height = "50px";
			pppp6.style.height = "50px";
			pppp7.style.height = "50px";
			pppp8.style.height = "50px";

			ppppp1.style.display = "block";
			ppppp2.style.display = "none";
			ppppp3.style.display = "block";
			ppppp4.style.display = "none";
			ppppp5.style.display = "block";
			ppppp6.style.display = "none";
			ppppp7.style.display = "block";
			ppppp8.style.display = "none";

		});
		$('.plusH').click(function() {

			var p15 = document.querySelector('.plusG');
			var p16 = document.querySelector('.plusH');
			var pp15 = document.querySelector('.guid_D');
			var pp16 = document.querySelector('.guid4');

			p15.style.display = "block";
			p16.style.display = "none";
			pp15.style.height = "50px";
			pp16.style.display = "none";

			var ppp1 = document.querySelector('.look_main');
			ppp1.style.height = "1350px";

		});
		$('.plusI').click(function() {

			var p17 = document.querySelector('.plusI');
			var p18 = document.querySelector('.plusJ');
			var pp17 = document.querySelector('.guid_E');
			var pp18 = document.querySelector('.guid5');

			var ppp1 = document.querySelector('.look_main');

			var pppp1 = document.querySelector('.guid1');
			var pppp2 = document.querySelector('.guid2');
			var pppp3 = document.querySelector('.guid3');
			var pppp4 = document.querySelector('.guid4');

			var pppp5 = document.querySelector('.guid_A');
			var pppp6 = document.querySelector('.guid_B');
			var pppp7 = document.querySelector('.guid_C');
			var pppp8 = document.querySelector('.guid_D');

			var ppppp1 = document.querySelector('.plusA');
			var ppppp2 = document.querySelector('.plusB');
			var ppppp3 = document.querySelector('.plusC');
			var ppppp4 = document.querySelector('.plusD');
			var ppppp5 = document.querySelector('.plusE');
			var ppppp6 = document.querySelector('.plusF');
			var ppppp7 = document.querySelector('.plusG');
			var ppppp8 = document.querySelector('.plusH');

			p17.style.display = "none";
			p18.style.display = "block";
			pp17.style.height = "500px";
			pp18.style.display = "block";
			$(".guid5").animateCSS('fadeInRight', { duration : 1000 });

			ppp1.style.height = "1800px";

			pppp1.style.display = "none";
			pppp2.style.display = "none";
			pppp3.style.display = "none";
			pppp4.style.display = "none";
			pppp5.style.height = "50px";
			pppp6.style.height = "50px";
			pppp7.style.height = "50px";
			pppp8.style.height = "50px";

			ppppp1.style.display = "block";
			ppppp2.style.display = "none";
			ppppp3.style.display = "block";
			ppppp4.style.display = "none";
			ppppp5.style.display = "block";
			ppppp6.style.display = "none";
			ppppp7.style.display = "block";
			ppppp8.style.display = "none";

		});
		$('.plusJ').click(function() {

			var p19 = document.querySelector('.plusI');
			var p20 = document.querySelector('.plusJ');
			var pp19 = document.querySelector('.guid_E');
			var pp20 = document.querySelector('.guid5');

			p19.style.display = "block";
			p20.style.display = "none";
			pp19.style.height = "50px";
			pp20.style.display = "none";

			var ppp1 = document.querySelector('.look_main');
			ppp1.style.height = "1350px";

		});
	});

	/* 관련 상품 슬라이드 구현 */
	var mySwiper = new Swiper('.swiper-container', {
		//한번에 보는 슬라이드 갯수
		slidesPerView : 6,
		spaceBetween : 100,
		//페이지 순서 나타내는 불릿
		/* pagination : {
			el : '.swiper-pagination',
			clickable : true,
		},
		//좌우 버튼
		navigation : {
			nextEl : '.swiper-button-next',
			prevEl : '.swiper-button-prev',
		} */
	});
	
	$(function() {
		$('.brand_hover').hover(function() {
			
			$(".hetek_side").stop().fadeToggle(300);

		});
		
	});
	
	$(function() {
		$('.brand_hover_A').hover(function() {
			
			$(".hetek_sideA").stop().fadeToggle(300);

		});
		
	});
	$(function() {
		$('.modal_cl').click(function() {
			
			var mo1 = document.querySelector('.look_modal');
			
			mo1.style.display = "block";

		});
	});
	
	$(function() {
		$('.modal_close').click(function() {
			
			var mo1 = document.querySelector('.look_modal');
			
			mo1.style.display = "none";

		});
	});
	
	$(function() {
		$('.yesang_A').click(function() {
			
			var mo1 = document.querySelector('.look_modal_A');
			
			mo1.style.display = "block";

		});
	});
	
	$(function() {
		$('.modal_close1').click(function() {
			
			var mo1 = document.querySelector('.look_modal_A');
			
			mo1.style.display = "none";

		});
	});
	$(function() {
		$('.banpum_A').click(function() {
			
			var mo1 = document.querySelector('.gume_pildok');
			
			mo1.style.display = "block";

		});
	});
	
	$(function() {
		$('.modal_close2').click(function() {
			
			var mo1 = document.querySelector('.gume_pildok');
			
			mo1.style.display = "none";

		});
	});
	
</script>
</body>
</html>
