package study.spring.trspring.controllers;

import java.util.ArrayList;
import java.util.HashMap;
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

import study.spring.trspring.helper.PageData;
import study.spring.trspring.helper.RegexHelper;
import study.spring.trspring.helper.WebHelper;
import study.spring.trspring.model.Basket;
import study.spring.trspring.model.Goods;
import study.spring.trspring.model.Jjim;
import study.spring.trspring.model.Members;
import study.spring.trspring.model.News;
import study.spring.trspring.model.Review;
import study.spring.trspring.service.BasketService;
import study.spring.trspring.service.GoodsService;
import study.spring.trspring.service.JjimService;
import study.spring.trspring.service.MembersService;
import study.spring.trspring.service.NewsService;
import study.spring.trspring.service.ReviewService;
import uap_clj.java.api.Browser;
import uap_clj.java.api.Device;
import uap_clj.java.api.OS;

@Controller
public class LookingController {
	@Autowired
	WebHelper webHelper;
	@Autowired
	RegexHelper regexHelper;
	@Autowired
	GoodsService goodsService;
	@Autowired
	JjimService jjimService;
	@Autowired
	BasketService basketService;
	@Autowired
	MembersService membersService;
	@Autowired
	ReviewService reviewService;
	@Autowired
	NewsService newsService;
	

	@Value("#{servletContext.contextPath}")
	String contextPath;
	
	@RequestMapping(value = "/pjh/jsp/looking.do", method = RequestMethod.GET)
	public ModelAndView view(Model model, 
			 @RequestParam(value = "id", defaultValue = "0") int id,
			 @RequestParam(value = "m_id" , defaultValue = "null") String m_id,
			 HttpServletRequest request) {
		
		News inputJ = new News();
		List<News> outputJ = null;
		
		try {
			outputJ = newsService.getNewsListB(inputJ);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		model.addAttribute("outputJ",outputJ);
		
		HttpSession session  = request.getSession();
		Members key = (Members) session.getAttribute("key");
		
		if(id == 0) {
			return webHelper.redirect(null, "상품번호가 없습니다.");
		}
		if(key.getM_id() == null) {
			return webHelper.redirect(null, "아이디가 없습니다.");
		}
		
		Goods input = new Goods();
		input.setId(id);
		
		Members inputA = new Members();
		inputA.setM_id(key.getM_id());
		
		Goods output = null;
		Members outputA = null;
		List<Goods> outputB = null;
		List<Review> outputC = null;
		
		try {
			output = goodsService.getGoodsItem(input);
			outputA = membersService.getMembersCartpage(inputA);
			outputB = goodsService.getGoodsAll();
			outputC = reviewService.getReviewListAll();
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		model.addAttribute("output",output);
		model.addAttribute("outputA",outputA);
		model.addAttribute("outputB",outputB);

		model.addAttribute("outputC",outputC);
		
		session.setAttribute("outputA", outputA);
		session.setAttribute("key", key);
		
		return new ModelAndView("pjh/jsp/looking");
	}
	@RequestMapping(value = "/pjh/jsp/looking_look.do", method = RequestMethod.GET)
	public ModelAndView viewB(Model model, 
			 @RequestParam(value = "id", defaultValue = "0") int id,
			 HttpServletRequest request) {
		
		News inputJ = new News();
		List<News> outputJ = null;
		
		try {
			outputJ = newsService.getNewsListB(inputJ);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		model.addAttribute("outputJ",outputJ);
		
		HttpSession session  = request.getSession();
		
		Members output_A = (Members) session.getAttribute("key");
		
		if(id == 0) {
			return webHelper.redirect(null, "상품번호가 없습니다.");
		}
		
		if(output_A.getM_id() == null) {
			return webHelper.redirect(null, "아이디가 없습니다.");
		}
		
		Goods input = new Goods();
		input.setId(id);
		
		Members inputA = new Members();
		inputA.setM_id(output_A.getM_id());
		
		Goods output = null;
		Members outputA = null;
		List<Goods> outputB = null;
		
		List<Review> outputC = null;
		
		try {
			output = goodsService.getGoodsItem(input);
			outputA = membersService.getMembersCartpage(inputA);
			outputB = goodsService.getGoodsAll();
			outputC = reviewService.getReviewListAll();
			
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		model.addAttribute("output",output);
		model.addAttribute("outputA",outputA);
		model.addAttribute("outputB",outputB);
		model.addAttribute("outputC",outputC);
		session.setAttribute("outputA", outputA); 
		session.setAttribute("key", output_A); 
		
		return new ModelAndView("pjh/jsp/looking_look");
		
	}
	
	@RequestMapping(value = "/pjh/jsp/no_looking.do", method = RequestMethod.GET)
	public ModelAndView viewA(Model model, 
			 @RequestParam(value = "id", defaultValue = "0") int id,
			 HttpServletRequest request) {
		
		News inputJ = new News();
		List<News> outputJ = null;
		
		try {
			outputJ = newsService.getNewsListB(inputJ);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		model.addAttribute("outputJ",outputJ);
		
		HttpSession session  = request.getSession();
		
		Goods input = new Goods();
		input.setId(id);
		
		Goods output = null;
		List<Goods> outputB = null;
		List<Review> outputC = null;
		try {
			output = goodsService.getGoodsItem(input);
			outputB = goodsService.getGoodsAll();
			outputC = reviewService.getReviewListAll();
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		model.addAttribute("output",output);

		model.addAttribute("outputB",outputB);
		
		model.addAttribute("outputC",outputC);
		
		session.setAttribute("id", output);
		
		return new ModelAndView("pjh/jsp/looking");
	}
	
	@RequestMapping(value = "/pjh/jsp/looking_jjim.do", method = RequestMethod.GET)
	public ModelAndView jjim(Model model, 
			 @RequestParam(value = "id", defaultValue = "0") int id,
			 HttpServletRequest request) {
		
		
		
		HttpSession session  = request.getSession();
		Members key = (Members) session.getAttribute("key");
		
		Goods input = new Goods();
		input.setId(id);
		
		if(id == 0) {
			return webHelper.redirect(null, "관리자에게 문의 하세요.");
		}
		
		Goods outputB = null;
		
		try {
			
			outputB = goodsService.getGoodsItem(input);
			
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		String ua = request.getHeader("User-Agent");
		
		Map<String, String> browser = Browser.lookup(ua);
		
		Map<String, String> os = (Map<String, String>) OS.lookup(ua);
		
		Map<String, String> device = (Map<String, String>) Device.lookup(ua);
		
		String browserStr = String.format("family=%s, patch=%s, major=%s, minor=%s", 
				browser.get("family"), browser.get("patch"),browser.get("major"),browser.get("minor"));
			
		String osStr = String.format("family=%s, patch=%s, patch_minor=%s, major=%s, minor=%s", 
				os.get("family"), os.get("patch"),os.get("patch_minor"),os.get("major"),os.get("minor"));
			
		String deviceStr = String.format("family=%s, model=%s, brand=%s", 
				device.get("family"), device.get("model"),device.get("brand"));
		
		Jjim inputB = new Jjim();
		inputB.setF_user_agent(ua);
		inputB.setF_browser(browserStr);
		inputB.setF_os(osStr);
		inputB.setF_device(deviceStr);
		inputB.setF_goods_id(outputB.getId());
		inputB.setG_image_a(outputB.getG_image_a());
		inputB.setG_name(outputB.getG_name());
		inputB.setG_brand(outputB.getG_brand());
		inputB.setG_ori_price(outputB.getG_ori_price());
		inputB.setG_price(outputB.getG_price());
		inputB.setG_discount(outputB.getG_discount());
		
		try {
			jjimService.addJjim(inputB);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		session.setAttribute("key", key);
		String redirectUrl = contextPath + "/pjh/jsp/favPagejsp.do";
		
		return webHelper.redirectA(redirectUrl, "찜 목록이 추가 되었습니다.");
		
	}
	
	@RequestMapping(value = "/pjh/jsp/looking_cartpage.do", method = RequestMethod.GET)
	public ModelAndView cartpage(Model model, 
			 @RequestParam(value = "id", defaultValue = "0") int id,
			 HttpServletRequest request) {
		
		HttpSession session  = request.getSession();
		Members key = (Members) session.getAttribute("key");
		
		Goods input = new Goods();
		input.setId(id);
		
		Members inputA = new Members();
		inputA.setId(key.getId());
		
		if(key.getId() == 0) {
			return webHelper.redirect(null, "관리자에게 문의 하세요.");
		}
		
		Goods outputC = null;
		Members outputD = null;
		
		try {
			outputC = goodsService.getGoodsItem(input);
			outputD = membersService.getMembersItem(inputA);
			
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		Basket inputC = new Basket();
		inputC.setB_image(outputC.getG_image_a());
		inputC.setB_id(outputD.getM_id());
		inputC.setB_name(outputC.getG_name());
		inputC.setB_point(outputC.getG_point());
		inputC.setB_disprice(outputC.getG_count_disprice());
		inputC.setB_oriprice(outputC.getG_count_oriprice());
		inputC.setB_discount(outputC.getG_count_memprice());
		inputC.setB_memprice(outputC.getG_count_memprice_price());
		inputC.setB_g_id(outputC.getId());
		inputC.setB_g_brand(outputC.getG_brand());
		
		
		try {
			basketService.addBasket(inputC);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		model.addAttribute("outputD",outputD);
		session.setAttribute("keyC", outputD);
		session.setAttribute("key", key);
		
		String redirectUrl = contextPath + "/pjh/jsp/cartPage.do";
		
		return webHelper.redirect(redirectUrl, "장바구니 목록이 추가 되었습니다.");
		
	}
}
