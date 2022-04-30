package study.spring.trspring.controllers;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.slf4j.Slf4j;
import study.spring.trspring.helper.PageData;
import study.spring.trspring.helper.RegexHelper;
import study.spring.trspring.helper.WebHelper;
import study.spring.trspring.model.Admins;
import study.spring.trspring.model.Basket;
import study.spring.trspring.model.Delivery;
import study.spring.trspring.model.Goods;
import study.spring.trspring.model.Members;
import study.spring.trspring.model.Orders;
import study.spring.trspring.model.Payment;
import study.spring.trspring.service.BasketService;
import study.spring.trspring.service.DeliveryService;
import study.spring.trspring.service.GoodsService;
import study.spring.trspring.service.MembersService;
import study.spring.trspring.service.OrdersService;
import study.spring.trspring.service.PaymentService;

@Controller
public class OrderController {
	@Autowired
	WebHelper webHelper;
	@Autowired
	RegexHelper regexHelper;
	@Autowired
	MembersService membersService;
	@Autowired
	GoodsService goodsService;
	@Autowired
	BasketService basketService;
	@Autowired
	DeliveryService deliveryService;
	@Autowired
	OrdersService ordersService;
	@Autowired
	PaymentService paymentService;
	
	@Value("#{servletContext.contextPath}")
	String contextPath;
	

	@RequestMapping(value = "/pjh/jsp/order.do", method = RequestMethod.POST)
	public ModelAndView order_view(Model model,
			@RequestParam(value="check_one" ,required = false) String check_one,
			@RequestParam(value = "selectAll" , required = false) String selectAll,
			 HttpServletRequest request) {
		
		HttpSession session  = request.getSession();
		
		Members members = (Members) session.getAttribute("key");
		
		if( check_one == null ) 				{ return webHelper.redirect(null, "주문할 상품을 선택해주세요."); }
		
		String checkA = check_one;
		
		String[] checkB = checkA.split(",");
		
		List<String> check = new ArrayList<String>();
		
		for( int i = 0 ; i < checkB.length; i ++) {
			check.add( checkB[i]);
		}
		
		Basket inputA = new Basket();
		inputA.setCheck(check);
		
		List<Basket> outputA = null;
		
		try {
			
			outputA = basketService.getBasketListOrders(inputA);
			
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		Members inputB = new Members();
		inputB.setId(members.getId());
		Members outputB = null;
		
		Delivery inputC = new Delivery();
		inputC.setId(1);
		Delivery outputC = null;
		
		try {
			
			outputB = membersService.getMembersItem(inputB);
			outputC = deliveryService.getDeliveryItem(inputC);
			
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		model.addAttribute("outputA",outputA);
		model.addAttribute("outputB",outputB);
		model.addAttribute("outputC",outputC);
		session.setAttribute("members", outputB); 
		
		return new ModelAndView("pjh/jsp/order");
	}
	
	@RequestMapping(value = "/pjh/jsp/orderfin.do", method = RequestMethod.POST)
	public ModelAndView orderfin(Model model,
			@RequestParam(value = "members_id" , defaultValue =  "0") int members_id,
			@RequestParam(value = "b_g_id" , required = false) String b_g_id,
			@RequestParam(value = "b_id" , required = false) String b_id,
			@RequestParam(value = "delivery" , defaultValue =  "0") int delivery,
			@RequestParam(value = "total_mem_price" , defaultValue =  "0") int total_mem_price,
			@RequestParam(value = "total_point" , defaultValue =  "0") int total_point,
			@RequestParam(value = "total_kul" , defaultValue =  "0") int total_kul,
			@RequestParam(value="m_name" ,required = false) String m_name,
			@RequestParam(value="m_phone" ,required = false) String m_phone,
			@RequestParam(value="m_address" ,required = false) String m_address,
			@RequestParam(value="m_name_ori" ,required = false) String m_name_ori,
			@RequestParam(value="m_phone_ori" ,required = false) String m_phone_ori,
			@RequestParam(value="m_address_ori" ,required = false) String m_address_ori,
			@RequestParam(value="pay_info" ,required = false) String pay_info,
			 HttpServletRequest request) {
		
		HttpSession session  = request.getSession();
		
		if(members_id == 0) 								{ return webHelper.redirect(null, "관리자에게 문의하세요."); }
		if(b_g_id == null) 									{ return webHelper.redirect(null, "관리자에게 문의하세요."); }
		if(total_mem_price == 0) 							{ return webHelper.redirect(null, "관리자에게 문의하세요."); }
		if(total_point == 0) 								{ return webHelper.redirect(null, "관리자에게 문의하세요."); }
		if(total_kul == 0) 									{ return webHelper.redirect(null, "관리자에게 문의하세요."); }
		
		if(m_name == null || m_name.equals("")) 				{ return webHelper.redirect(null, "받는 사람 이름을 입력하세요."); }
		if(m_phone == null || m_phone.equals("")) 				{ return webHelper.redirect(null, "받는 연락처를 입력하세요."); }
		if(m_address == null || m_address.equals("")) 			{ return webHelper.redirect(null, "받는 사람 주소를 입력하세요."); }
		
		if(m_name_ori == null || m_name_ori.equals("")) 				{ return webHelper.redirect(null, "배송지관련 오류 입니다. 관리자에게 문의하세요."); }
		if(m_phone_ori == null || m_phone_ori.equals("")) 				{ return webHelper.redirect(null, "배송지관련 오류 입니다. 관리자에게 문의하세요."); }
		if(m_address_ori == null || m_address_ori.equals("")) 			{ return webHelper.redirect(null, "배송지관련 오류 입니다. 관리자에게 문의하세요."); }
		
		String A = m_name;
		String B = m_phone;
		String C = m_address;
		
		String AA = m_name_ori;
		String AB = m_phone_ori;
		String AC = m_address_ori;
		
		int sam = total_kul;
		
		DecimalFormat com = new DecimalFormat("#,###");
		String comA = (String) com.format(sam);
		Date date = new Date(System.currentTimeMillis());
		SimpleDateFormat YYYYMM = new SimpleDateFormat("yyyyMMddHHmmss"); 
		SimpleDateFormat YYYYMM_A = new SimpleDateFormat("yyyy-MM-dd"); 
		String dateA =YYYYMM.format(date);
		String dateB =YYYYMM_A.format(date);
		
		String checkA = b_id;
		
		String[] checkB = checkA.split(",");
		
		List<String> check = new ArrayList<String>();
		
		for( int i = 0 ; i < checkB.length; i ++) {
			check.add( checkB[i]);
		}
		
		Members input = new Members();
		input.setId(members_id);
		Members output = null;
		
		Basket inputA = new Basket();
		inputA.setCheck(check);
		int outputA = 0;
		
		try {
			
			output = membersService.getMembersItem(input);
			outputA = basketService.getBasketCountA(inputA);
			
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		String checkC = b_g_id;
		
		String[] checkD = checkC.split(",");
		
		int checkE = Integer.valueOf(checkD[0]);
		
		Goods input_Z = new Goods();
		input_Z.setId(checkE);
		
		Goods ouput_Z = null;
		
		try {
			
			ouput_Z = goodsService.getGoodsItem(input_Z);
			
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		Orders input_A = new Orders();
		// 받는사람
		if(A == AA) {
			input_A.setO_getpeople(m_name_ori);
		}else {
			input_A.setO_getpeople(m_name);
		}
		//주문자
		input_A.setO_orderpeople(m_name_ori);
		// 보내는사람
		input_A.setO_sendpeople("(주)트렌딩");
		//주문한사람 주소
		input_A.setO_orderadress(m_address_ori);
		//받는사람주소
		if(C == AC) {
			input_A.setO_getadress(m_address_ori);
		}else {
			input_A.setO_getadress(m_address);
		}
		//보내는사람주소
		input_A.setO_sendadress("서울 서초구 서초대로 77길 55");
		//보내는 사람 연락처
		input_A.setO_phone("017-1234-9876");
		input_A.setO_count(0);
		input_A.setO_status("결제대기중");
		input_A.setO_order_count(outputA);
		input_A.setO_allprice(comA);
		input_A.setO_not_money(total_kul);
		input_A.setO_trans_number(dateA);
		input_A.setO_delivery_comp("빡재택배");
		input_A.setO_allprice(comA);
		input_A.setO_input_money("0");
		input_A.setO_point(0);
		input_A.setO_cancle("N");
		input_A.setO_cancle_money("0");
		input_A.setO_enddate(null);
		input_A.setO_editdate(dateB);
		input_A.setO_product(null);
		input_A.setO_m_id(output.getM_id());
		input_A.setO_g_id(b_g_id);
		input_A.setO_putdate(dateB);
		input_A.setO_photo(ouput_Z.getG_image_a());
		input_A.setO_firstid(checkE);
		input_A.setO_first_name(ouput_Z.getG_name());
		input_A.setO_first_brand(ouput_Z.getG_brand());
	
		try {
			
			ordersService.addOrders(input_A);
			
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		model.addAttribute("outputA",outputA);
		model.addAttribute("ouput_Z",ouput_Z);
		model.addAttribute("dateA",dateA);
		model.addAttribute("m_name_ori",m_name_ori);
		model.addAttribute("dateB",dateB);
		model.addAttribute("comA",comA);
		session.setAttribute("members", output); 
		
		Payment input_X = new Payment();
		input_X.setP_point_a(0);
		input_X.setP_cancle_money(0);
		if(delivery == 0) {
			input_X.setP_smoney(0);
		}else {
			input_X.setP_smoney(delivery);
		}
		input_X.setP_pay(pay_info);
		input_X.setP_m_id(output.getM_id());
		input_X.setP_pay_yes("N");
		input_X.setP_g_id(b_g_id);
		input_X.setP_cancle("N");
		input_X.setP_o_id(input_A.getId());
		
		try {
			
			paymentService.addPayment(input_X);
			
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		Basket input_Y = new Basket();
		input_Y.setCheck(check);
		
		try {
			
			basketService.deleteBasketA(input_Y);
			
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		
		return new ModelAndView("pjh/jsp/orderFin");
	}
	@RequestMapping(value = "/pjh/jsp/orderList.do", method = RequestMethod.GET)
	public ModelAndView orderList(Model model,
			 HttpServletRequest request) {
		
		HttpSession session  = request.getSession();
		
		Members key = (Members) session.getAttribute("key");
		
		int A = key.getId();
		
		Members input = new Members();
		input.setId(A);
		Members output = null;
		
		try {
			output = membersService.getMembersItem(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		String B = output.getM_id();
		
		Orders inputA = new Orders();
		inputA.setO_m_id(B);
		List<Orders> outputA = null;
		int count = 0;
		
		try {
			outputA = ordersService.getOrdersList(inputA);
			count = ordersService.getOrdersCount(inputA);
			
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		model.addAttribute("output",output);
		model.addAttribute("count",count);
		model.addAttribute("outputA",outputA);
		session.setAttribute("key", key); 
		
		return new ModelAndView("pjh/jsp/orderList");
	}
	@RequestMapping(value = "/pjh/jsp/orderInfo.do", method = RequestMethod.GET)
	public ModelAndView orderInfo(Model model,
			@RequestParam(value = "o_id" , defaultValue =  "0") int o_id,
			HttpServletRequest request) {
		
		HttpSession session  = request.getSession();
		
		Members key = (Members) session.getAttribute("key");
		
		int A = key.getId();
		
		Members input = new Members();
		input.setId(A);
		Members output = null;
		
		try {
			output = membersService.getMembersItem(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		String B = output.getM_id();
		
		Orders inputA = new Orders();
		inputA.setId(o_id);
		Orders outputA = null;
		
		try {
			outputA = ordersService.getOrdersItem(inputA);
			
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		String C = outputA.getO_g_id() ;
		String[] D = C.split(",");
		int[] inte =  new int[D.length];
		int[] countA = new int[D.length];
		
		for(int i = 0; i< D.length; i++) {
			countA[i] = 1;
			inte[i] = Integer.valueOf(D[i]);
		}
		
		if( !(inte.length == 1)) {
			for(int i = 0; i< inte.length; i++) {
				for(int j = i + 1; j< inte.length; j++) {
					if( inte[i] == 0 ) {
					}else {
						if( inte[i] == inte[j]) {
							countA[i] += 1;
							inte[j] = 0;
						}
					}
				}
			}
		}
		
		
		Map<Integer,Integer> kv = new HashMap<Integer,Integer>();
		for(int i = 0; i< D.length; i++) {
			kv.put(inte[i], countA[i]);
		}
		
		List<Integer> check = new ArrayList<Integer>();
		for(int i = 0; i< D.length; i++) {
			check.add(inte[i]);
		}
		
		Goods inputB = new Goods();
		inputB.setNumberListA(check);
		List<Goods> outputB = null;
		int count = 0;
		
		try {
			outputB = goodsService.getGoodsHalIn(inputB);
			count = goodsService.getGoodsCountHalInA(inputB);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		Payment inputC = new Payment();
		inputC.setP_o_id(o_id);
		Payment outputC = null;
		
		try {
			outputC = paymentService.getPaymentItem(inputC);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		model.addAttribute("outputC",outputC);
		
		model.addAttribute("output",output);
		model.addAttribute("outputA",outputA);
		model.addAttribute("outputB",outputB);
		model.addAttribute("kv",kv);
		model.addAttribute("count",count);
		session.setAttribute("key", key); 
		session.setAttribute("outputB", outputB); 
		session.setAttribute("kv", kv); 
		
		return new ModelAndView("pjh/jsp/orderInfo");
	}
	
	@RequestMapping(value = "/pjh/jsp/cart_order.do", method = RequestMethod.GET)
	public ModelAndView cart_order(Model model,
			@RequestParam(value = "id" , defaultValue =  "0") int id,
			 HttpServletRequest request) {
		
		HttpSession session  = request.getSession();
		
		Members members = (Members) session.getAttribute("key");
		
		Members inputB = new Members();
		inputB.setId(members.getId());
		Members outputB = null;
		
		Delivery inputC = new Delivery();
		inputC.setId(1);
		Delivery outputC = null;
		
		Goods inputA = new Goods();
		inputA.setId(id);
		Goods outputA = null;
		
		try {
			outputA = goodsService.getGoodsAllA(inputA);
			outputB = membersService.getMembersItem(inputB);
			outputC = deliveryService.getDeliveryItem(inputC);
			
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		model.addAttribute("outputA",outputA);
		model.addAttribute("outputB",outputB);
		model.addAttribute("outputC",outputC);
		session.setAttribute("members", outputB); 
		session.setAttribute("key", members); 
		
		return new ModelAndView("pjh/jsp/cart_order");
	}
	@RequestMapping(value = "/pjh/jsp/cart_orderfin.do", method = RequestMethod.POST)
	public ModelAndView cart_orderfin(Model model,
			@RequestParam(value = "members_id" , defaultValue =  "0") int members_id,
			@RequestParam(value = "b_g_id" , defaultValue =  "0") int b_g_id,
			@RequestParam(value = "b_id" , required = false) String b_id,
			@RequestParam(value = "delivery" , defaultValue =  "0") int delivery,
			@RequestParam(value = "total_mem_price" , defaultValue =  "0") int total_mem_price,
			@RequestParam(value = "total_point" , defaultValue =  "0") int total_point,
			@RequestParam(value = "total_kul" , defaultValue =  "0") int total_kul,
			@RequestParam(value="m_name" ,required = false) String m_name,
			@RequestParam(value="m_phone" ,required = false) String m_phone,
			@RequestParam(value="m_address" ,required = false) String m_address,
			@RequestParam(value="m_name_ori" ,required = false) String m_name_ori,
			@RequestParam(value="m_phone_ori" ,required = false) String m_phone_ori,
			@RequestParam(value="m_address_ori" ,required = false) String m_address_ori,
			@RequestParam(value="pay_info" ,required = false) String pay_info,
			 HttpServletRequest request) {
		
		HttpSession session  = request.getSession();
		
		if(members_id == 0) 								{ return webHelper.redirect(null, "관리자에게 문의하세요."); }
		if(b_g_id == 0) 									{ return webHelper.redirect(null, "관리자에게 문의하세요."); }
		if(total_mem_price == 0) 							{ return webHelper.redirect(null, "관리자에게 문의하세요."); }
		if(total_point == 0) 								{ return webHelper.redirect(null, "관리자에게 문의하세요."); }
		if(total_kul == 0) 									{ return webHelper.redirect(null, "관리자에게 문의하세요."); }
		
		if(m_name == null || m_name.equals("")) 				{ return webHelper.redirect(null, "받는 사람 이름을 입력하세요."); }
		if(m_phone == null || m_phone.equals("")) 				{ return webHelper.redirect(null, "받는 연락처를 입력하세요."); }
		if(m_address == null || m_address.equals("")) 			{ return webHelper.redirect(null, "받는 사람 주소를 입력하세요."); }
		
		if(m_name_ori == null || m_name_ori.equals("")) 				{ return webHelper.redirect(null, "배송지관련 오류 입니다. 관리자에게 문의하세요."); }
		if(m_phone_ori == null || m_phone_ori.equals("")) 				{ return webHelper.redirect(null, "배송지관련 오류 입니다. 관리자에게 문의하세요."); }
		if(m_address_ori == null || m_address_ori.equals("")) 			{ return webHelper.redirect(null, "배송지관련 오류 입니다. 관리자에게 문의하세요."); }
		
		String A = m_name;
		String B = m_phone;
		String C = m_address;
		
		String AA = m_name_ori;
		String AB = m_phone_ori;
		String AC = m_address_ori;
		
		int sam = total_kul;
		
		DecimalFormat com = new DecimalFormat("#,###");
		String comA = (String) com.format(sam);
		Date date = new Date(System.currentTimeMillis());
		SimpleDateFormat YYYYMM = new SimpleDateFormat("yyyyMMddHHmmss"); 
		SimpleDateFormat YYYYMM_A = new SimpleDateFormat("yyyy-MM-dd"); 
		String dateA =YYYYMM.format(date);
		String dateB =YYYYMM_A.format(date);
		
		
		Members input = new Members();
		input.setId(members_id);
		Members output = null;
		
		try {
			
			output = membersService.getMembersItem(input);
			
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		Goods input_Z = new Goods();
		input_Z.setId(b_g_id);
		
		Goods ouput_Z = null;
		
		try {
			
			ouput_Z = goodsService.getGoodsItem(input_Z);
			
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		String I= String.valueOf(b_g_id);
		
		Orders input_A = new Orders();
		// 받는사람
		if(A == AA) {
			input_A.setO_getpeople(m_name_ori);
		}else {
			input_A.setO_getpeople(m_name);
		}
		//주문자
		input_A.setO_orderpeople(m_name_ori);
		// 보내는사람
		input_A.setO_sendpeople("(주)트렌딩");
		//주문한사람 주소
		input_A.setO_orderadress(m_address_ori);
		//받는사람주소
		if(C == AC) {
			input_A.setO_getadress(m_address_ori);
		}else {
			input_A.setO_getadress(m_address);
		}
		//보내는사람주소
		input_A.setO_sendadress("서울 서초구 서초대로 77길 55");
		//보내는 사람 연락처
		input_A.setO_phone("017-1234-9876");
		input_A.setO_count(0);
		input_A.setO_status("결제대기중");
		input_A.setO_order_count(1);
		input_A.setO_allprice(comA);
		input_A.setO_not_money(total_kul);
		input_A.setO_trans_number(dateA);
		input_A.setO_delivery_comp("빡재택배");
		input_A.setO_allprice(comA);
		input_A.setO_input_money("0");
		input_A.setO_point(0);
		input_A.setO_cancle("N");
		input_A.setO_cancle_money("0");
		input_A.setO_enddate(null);
		input_A.setO_editdate(dateB);
		input_A.setO_product(null);
		input_A.setO_m_id(output.getM_id());
		input_A.setO_g_id(I);
		input_A.setO_putdate(dateB);
		input_A.setO_photo(ouput_Z.getG_image_a());
		input_A.setO_firstid(b_g_id);
		input_A.setO_first_name(ouput_Z.getG_name());
		input_A.setO_first_brand(ouput_Z.getG_brand());
	
		try {
			
			ordersService.addOrders(input_A);
			
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		int outputA = 1;
		
		model.addAttribute("outputA",outputA);
		model.addAttribute("ouput_Z",ouput_Z);
		model.addAttribute("dateA",dateA);
		model.addAttribute("m_name_ori",m_name_ori);
		model.addAttribute("dateB",dateB);
		model.addAttribute("comA",comA);
		session.setAttribute("members", output); 
		
		Payment input_X = new Payment();
		input_X.setP_point_a(0);
		input_X.setP_cancle_money(0);
		if(delivery == 0) {
			input_X.setP_smoney(0);
		}else {
			input_X.setP_smoney(delivery);
		}
		input_X.setP_pay(pay_info);
		input_X.setP_m_id(output.getM_id());
		input_X.setP_pay_yes("N");
		input_X.setP_g_id(I);
		input_X.setP_cancle("N");
		input_X.setP_o_id(input_A.getId());
		
		try {
			
			paymentService.addPayment(input_X);
			
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		
		return new ModelAndView("pjh/jsp/orderFin");
	}
	
	@RequestMapping(value = "/pjh/members/jumun_list.do", method = RequestMethod.GET)
	public ModelAndView jumun_list(
			Model model,
			HttpServletRequest request,
			@RequestParam(value="keyword" ,required = false) String keyword,
			@RequestParam(value="page" ,defaultValue = "1") int nowPage) {
		
		HttpSession session  = request.getSession();
		
		Admins key = (Admins) session.getAttribute("keyA");
		
		model.addAttribute("outputZ",key);
		
		session.setAttribute("keyA", key); 
		
		int totalCount = 0;
		int listCount = 10;
		int pageCount = 5;
		
		Orders input = new Orders();
		input.setO_orderpeople(keyword);
		
		List<Orders> output = null;
		PageData pageData = null;
		
		try {
			totalCount = ordersService.getOrdersCount(input);
			
			pageData = new PageData(nowPage, totalCount, listCount, pageCount);
			
			Orders.setOffset(pageData.getOffset());
			Orders.setListCount(pageData.getListCount());
			
			output = ordersService.getOrdersList(input);
			
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		model.addAttribute("keyword",keyword);
		model.addAttribute("output",output);
		model.addAttribute("totalCount",totalCount);
		model.addAttribute("pageData",pageData);
		
		return new ModelAndView("pjh/members/master_members_jumun");
	}
	
	@RequestMapping(value = "/pjh/members/jumun_view.do", method = RequestMethod.GET)
	public ModelAndView jumun_view(Model model,
			@RequestParam(value = "id" , defaultValue = "0") int id,
			HttpServletRequest request) {
		
		HttpSession session  = request.getSession();
		
		Admins key = (Admins) session.getAttribute("keyA");
		
		model.addAttribute("outputZ",key);
		
		session.setAttribute("keyA", key); 	
		
		Orders inputA = new Orders();
		inputA.setId(id);
		Orders inputA_A = new Orders();
		if( id >= 1 && id <= 20 ) {
			inputA_A.setId(23);
		}else {
			inputA_A.setId(id);
		}
		Orders outputA = null;
		Orders outputA_A = null;
		
		try {
			
			outputA = ordersService.getOrdersItem(inputA);
			outputA_A = ordersService.getOrdersItem(inputA_A);
			
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		Members input = new Members();
		input.setM_id(outputA.getO_m_id());
		Members output = null;
		
		try {
			output = membersService.getMembersItemPoint(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		String B = output.getM_id();
		
		String C = outputA.getO_g_id() ;
		String[] D = C.split(",");
		int[] inte =  new int[D.length];
		int[] countA = new int[D.length];
		
		for(int i = 0; i< D.length; i++) {
			countA[i] = 1;
			inte[i] = Integer.valueOf(D[i]);
		}
		
		if( !(inte.length == 1)) {
			for(int i = 0; i< inte.length; i++) {
				for(int j = i + 1; j< inte.length; j++) {
					if( inte[i] == 0 ) {
					}else {
						if( inte[i] == inte[j]) {
							countA[i] += 1;
							inte[j] = 0;
						}
					}
				}
			}
		}
		
		
		Map<Integer,Integer> kv = new HashMap<Integer,Integer>();
		for(int i = 0; i< D.length; i++) {
			kv.put(inte[i], countA[i]);
		}
		
		List<Integer> check = new ArrayList<Integer>();
		for(int i = 0; i< D.length; i++) {
			check.add(inte[i]);
		}
		
		Goods inputB = new Goods();
		inputB.setNumberListA(check);
		List<Goods> outputB = null;
		int count = 0;
		
		try {
			outputB = goodsService.getGoodsHalIn(inputB);
			count = goodsService.getGoodsCountHalInA(inputB);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		Payment inputC = new Payment();
		inputC.setP_o_id(outputA_A.getId());
		Payment outputC = null;
		
		try {
			outputC = paymentService.getPaymentItem(inputC);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		model.addAttribute("outputC",outputC);
		
		model.addAttribute("output",output);
		model.addAttribute("outputA",outputA);
		model.addAttribute("outputB",outputB);
		model.addAttribute("kv",kv);
		model.addAttribute("count",count);
		session.setAttribute("outputB", outputB); 
		session.setAttribute("kv", kv); 
		
		return new ModelAndView("pjh/members/master_members_jumun_view");
	}
	
	@RequestMapping(value = "/pjh/members/jumun_delete.do", method = RequestMethod.GET)
	public ModelAndView email_delete(Model model,
			@RequestParam(value="id", defaultValue = "0") int id,
			 HttpServletRequest request) {
		
		HttpSession session  = request.getSession();
		
		Admins key = (Admins) session.getAttribute("keyA");
		
		model.addAttribute("outputZ",key);
		
		session.setAttribute("keyA", key); 
		
		if(id == 0) {
			return webHelper.redirect(null, "주문내역 id번호가 없습니다.");
		}
		
		Orders input = new Orders();
		input.setId(id);
		
		try {
			
			ordersService.deleteOrders(input);
			
		} catch (Exception e) {
			return webHelper.redirect(null, "주문내역 삭제에 실패 했습니다.");
		}
		
		String redirectUrl = contextPath + "/pjh/members/jumun_list.do";
		
		return webHelper.redirect(redirectUrl, "주문내역이 삭제 되었습니다.");
	}
}
