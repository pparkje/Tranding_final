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
import study.spring.trspring.model.Goods;
import study.spring.trspring.model.Members;
import study.spring.trspring.service.GoodsService;
import study.spring.trspring.service.MembersService;
import study.spring.trspring.service.SearchService;

@Controller
public class SearchController {
	@Autowired
	WebHelper webHelper;
	@Autowired
	RegexHelper regexHelper;
	@Autowired
	MembersService membersService;
	@Autowired
	SearchService searchService;
	@Autowired
	GoodsService goodsService;
	
	

	@Value("#{servletContext.contextPath}")
	String contextPath;
	
	@RequestMapping(value = "/pjh/jsp/search.do", method = RequestMethod.GET)
	public ModelAndView search(Model model) {
		
		List<Goods> outputA = null;
		List<Goods> outputB = null;
		
		try {
			outputA = goodsService.getGoodsListA();
			outputB = goodsService.getGoodsListB();
			
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		model.addAttribute("outputA",outputA);
		model.addAttribute("outputB",outputB);
		
		return new ModelAndView("pjh/jsp/search");
	}
	
	@RequestMapping(value = "/pjh/jsp/search_s.do", method = RequestMethod.GET)
	public ModelAndView search_s(Model model,
			HttpServletRequest request,
			@RequestParam(value="page" ,defaultValue = "1") int nowPage,
			@RequestParam(value = "search" , required = false) String search) {
		
		HttpSession session  = request.getSession();
		Members key = (Members) session.getAttribute("key");
		
		int totalCount = 0;
		int listCount = 16;
		int pageCount = 5;
		
		String s = search;
		
		Goods input = new Goods();
		
		if(s.contains("여자") | s.contains("여성")) {
			input.setG_detail_a("여성");
		}
		if(s.contains("남자") | s.contains("남성")) {
			input.setG_detail_a("남성");
		}
		
		if(s.contains("가방") ) {
			input.setG_detail_b("가방");
		}else if (s.contains("액세서리")) {
			input.setG_detail_b("액세서리");
		}else if (s.contains("의류")) {
			input.setG_detail_b("의류");
		}else if (s.contains("신발")) {
			input.setG_detail_b("신발");
		}
		
		if(s.contains("구찌") ) {
			input.setG_brand("구찌");
		}else if (s.contains("버버리")) {
			input.setG_brand("버버리");
		}else if (s.contains("몽클레어")) {
			input.setG_brand("몽클레어");
		}else if (s.contains("프라다")) {
			input.setG_brand("프라다");
		}else if (s.contains("메종마르지엘라")) {
			input.setG_brand("메종마르지엘라");
		}else if (s.contains("로에베")) {
			input.setG_brand("로에베");
		}else if (s.contains("생로랑")) {
			input.setG_brand("생로랑");
		}else if (s.contains("펜디")) {
			input.setG_brand("펜디");
		}else if (s.contains("발렌티노")) {
			input.setG_brand("발렌티노");
		}else if (s.contains("바버")) {
			input.setG_brand("바버");
		}else if (s.contains("보테가베네타")) {
			input.setG_brand("보테가베네타");
		}else if (s.contains("돌체앤가바나")) {
			input.setG_brand("돌체앤가바나");
		}else if (s.contains("코치")) {
			input.setG_brand("코치");
		}else if (s.contains("루이비통")) {
			input.setG_brand("루이비통");
		}else if (s.contains("고야드")) {
			input.setG_brand("고야드");
		}else if (s.contains("미우미우")) {
			input.setG_brand("미우미우");
		}else if (s.contains("스톤아일랜드")) {
			input.setG_brand("스톤아일랜드");
		}else if (s.contains("디젤")) {
			input.setG_brand("디젤");
		}else if (s.contains("몽블랑")) {
			input.setG_brand("몽블랑");
		}else if (s.contains("베르사체")) {
			input.setG_brand("베르사체");
		}else if (s.contains("뉴발란스")) {
			input.setG_brand("뉴발란스");
		}else if (s.contains("발망")) {
			input.setG_brand("발망");
		}else if (s.contains("톰브라운")) {
			input.setG_brand("톰브라운");
		}else if (s.contains("발렌시아가")) {
			input.setG_brand("발렌시아가");
		}else if (s.contains("아미")) {
			input.setG_brand("아미");
		}else if (s.contains("메종키츠네")) {
			input.setG_brand("메종키츠네");
		}else if (s.contains("지방시")) {
			input.setG_brand("지방시");
		}else if (s.contains("에르메스")) {
			input.setG_brand("에르메스");
		}else if (s.contains("오프화이트")) {
			input.setG_brand("오프화이트");
		}else {
			input.setG_brand("");
		}
		
		List<Goods> outputA = null;
		PageData pageData = null;
		
		try {
			totalCount = goodsService.getGoodsCountSearch(input);
			
			pageData = new PageData(nowPage, totalCount, listCount, pageCount);
			
			Goods.setOffset(pageData.getOffset());
			Goods.setListCount(pageData.getListCount());
			
			if( input.getG_detail_a() != null | input.getG_detail_b() != null | input.getG_brand() != null) {
				outputA = goodsService.getGoodsSearch(input);
			}else {
				outputA = goodsService.getGoodsListBrand(input);
			}
			
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		model.addAttribute("outputA",outputA);
		model.addAttribute("pageData",pageData);
		session.setAttribute("key", key);
		
		return new ModelAndView("pjh/jsp/brand_brand");
	}
	
	
}
