package study.spring.trspring.controllers;

import java.util.List;

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

import study.spring.trspring.helper.PageData;
import study.spring.trspring.helper.RegexHelper;
import study.spring.trspring.helper.WebHelper;
import study.spring.trspring.model.Basket;
import study.spring.trspring.model.Goods;
import study.spring.trspring.model.Members;
import study.spring.trspring.service.BasketService;
import study.spring.trspring.service.GoodsService;
import study.spring.trspring.service.MembersService;

@Controller
public class CartPageController {
	@Autowired
	WebHelper webHelper;
	@Autowired
	RegexHelper regexHelper;
	@Autowired
	MembersService membersService;
	@Autowired
	BasketService basketService;
	@Autowired
	GoodsService goodsService;
	
	@Value("#{servletContext.contextPath}")
	String contextPath;
	
	@RequestMapping(value = "/pjh/jsp/cartPage.do", method = RequestMethod.GET)
	public ModelAndView list(Model model,
			HttpServletRequest request) {
		
		HttpSession session  = request.getSession();
		
		Members members = (Members) session.getAttribute("key");
		
		if(members == null) {
			return webHelper.redirect(null, "개발자에게 문의하세요.");
		}

		Basket input = new Basket();
		input.setB_id(members.getM_id());

		List<Basket> outputA = null;

		try {
			outputA = basketService.getBasketList(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		model.addAttribute("outputA",outputA);
		model.addAttribute("key",members);
		session.setAttribute("outputA", outputA);
		session.setAttribute("key", members);
	
		return new ModelAndView("pjh/jsp/cartPage");
	}
		
		@RequestMapping(value = "/pjh/jsp/cart_looking.do", method = RequestMethod.GET)
		public ModelAndView cartpage_looking(Model model,
				HttpServletRequest request,
				@RequestParam(value = "id" , defaultValue =  "0") int id,
				@RequestParam(value = "b_id" , required = false) String b_id,
				@RequestParam(value = "b_g_id" , defaultValue =  "0") int b_g_id) {

			HttpSession session  = request.getSession();

			if(id == 0) {
				return webHelper.redirect(null, "개발자에게 문의하세요.");
			}
			if(b_id == null) {
				return webHelper.redirect(null, "개발자에게 문의하세요.");
			}
			if(b_g_id == 0) {
				return webHelper.redirect(null, "개발자에게 문의하세요.");
			}

			Goods input = new Goods();
			input.setId(b_g_id);

			Members inputA = new Members();
			inputA.setM_id(b_id);

			Goods output_A = null;
			Members output_B = null;


			try {
				output_A = goodsService.getGoodsItem(input);
				output_B = membersService.getMembersCartpage(inputA);

			} catch (Exception e) {
				return webHelper.redirect(null, e.getLocalizedMessage());
			}

			model.addAttribute("output_A",output_A);
			session.setAttribute("output_B", output_B);

			return new ModelAndView("pjh/jsp/cart_looking");
		}
		
		
		@RequestMapping(value = "/pjh/jsp/cartPage_add.do", method = RequestMethod.POST)
		public ModelAndView cartPage_add(Model model,
				HttpServletRequest request,
				@RequestParam(value = "g_id" , defaultValue =  "0") int g_id) {
			
			HttpSession session  = request.getSession();
			
			Members members = (Members) session.getAttribute("key");
			
			if(g_id == 0) {
				return webHelper.redirect(null, "개발자에게 문의하세요.");
			}

			Goods input = new Goods();
			input.setId(g_id);

			Goods outputA = null;

			try {
				outputA = goodsService.getGoodsItem(input);
			} catch (Exception e) {
				return webHelper.redirect(null, e.getLocalizedMessage());
			}
			
			Basket inputA = new Basket();
			inputA.setB_image(outputA.getG_image_a());
			inputA.setB_id(members.getM_id());
			inputA.setB_name(outputA.getG_name());
			inputA.setB_point(outputA.getG_point());
			inputA.setB_disprice(outputA.getG_count_disprice());
			inputA.setB_oriprice(outputA.getG_count_oriprice());
			inputA.setB_discount(outputA.getG_count_memprice());
			inputA.setB_memprice(outputA.getG_count_memprice_price());
			inputA.setB_g_id(g_id);
			inputA.setB_g_brand(outputA.getG_brand());
			
			Basket inputB = new Basket();
			inputB.setB_id(members.getM_id());
			List<Basket> output = null;
			
			try {
				basketService.addBasket(inputA);
				output = basketService.getBasketList(inputB);
			} catch (Exception e) {
				return webHelper.redirect(null, e.getLocalizedMessage());
			}

			model.addAttribute("outputA",output);
			session.setAttribute("key", members); 
			session.setAttribute("outputA", output); 
			
		
			return new ModelAndView("pjh/jsp/cartPage");
		}
		
		@RequestMapping(value = "/pjh/jsp/cart_delete.do", method = RequestMethod.GET)
		public ModelAndView cart_delete(Model model,
				HttpServletRequest request,
				@RequestParam(value = "id" , defaultValue =  "0") int id,
				@RequestParam(value = "m_id" , required = false) String m_id) {
			
			HttpSession session  = request.getSession();
			
			Members key = (Members) session.getAttribute("key");
			
			if(id == 0 && m_id == null) {
				return webHelper.redirect(null, "개발자에게 문의하세요.");
			}

			Basket input = new Basket();
			if(id != 0) {
				input.setId(id);
			}
			
			if(m_id != null) {
				input.setB_id(m_id);
			}
			
			try {
				basketService.deleteBasket(input);
			} catch (Exception e) {
				return webHelper.redirect(null, e.getLocalizedMessage());
			}
			
			session.setAttribute("key", key); 
			
			String redirectUrl = contextPath + "/pjh/jsp/cartPage.do";
			
			return webHelper.redirect(redirectUrl, "장바구니 목록이 삭제 되었습니다.");
		
		}
		
}
