package study.spring.trspring.controllers;

import java.util.ArrayList;
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

@Controller
public class BrandController {
	@Autowired
	WebHelper webHelper;
	@Autowired
	RegexHelper regexHelper;
	@Autowired
	MembersService membersService;
	@Autowired
	GoodsService goodsService;
	
	@Value("#{servletContext.contextPath}")
	String contextPath;
	

	@RequestMapping(value = "/pjh/jsp/brand_brand.do", method = RequestMethod.GET)
	public ModelAndView view(Model model,
			@RequestParam(value="page" ,defaultValue = "1") int nowPage,
			@RequestParam(value = "g_brand" , required = false) String g_brand,
			 HttpServletRequest request) {
		
		HttpSession session  = request.getSession();
		Members key = (Members) session.getAttribute("key");
		
		int totalCount = 0;
		int listCount = 16;
		int pageCount = 5;
		
		Goods inputA = new Goods();
		inputA.setG_brand(g_brand);
		
		List<Goods> outputA = null;
		PageData pageData = null;
		
		try {
			
			totalCount = goodsService.getGoodsCountBrand(inputA);
			
			pageData = new PageData(nowPage, totalCount, listCount, pageCount);
			
			Goods.setOffset(pageData.getOffset());
			Goods.setListCount(pageData.getListCount());
			
			outputA = goodsService.getGoodsListBrand(inputA);
			
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		model.addAttribute("outputA",outputA);
		model.addAttribute("pageData",pageData);
		session.setAttribute("key", key);
		
		return new ModelAndView("pjh/jsp/brand_brand");
	}
	
	@RequestMapping(value = "/pjh/jsp/brand_brandA.do", method = RequestMethod.GET)
	public ModelAndView viewA(Model model,
			 HttpServletRequest request,
			 @RequestParam(value="page" ,defaultValue = "1") int nowPage,
			 @RequestParam(value = "detailB" , required = false) String detailB,
			 @RequestParam(value = "g_brand" , required = false) String g_brand,
			 @RequestParam(value = "min_price" , defaultValue = "0") int min_price,
			 @RequestParam(value = "max_price" , defaultValue = "0") int max_price,
			 @RequestParam(value="minsale" ,defaultValue = "0") int minsale,
			 @RequestParam(value="maxsale" ,defaultValue = "0") int maxsale,
			 @RequestParam(value="sessionA" , defaultValue = "0") int sessionA) {
		
		HttpSession session  = request.getSession();
		Members key = (Members) session.getAttribute("key");
		
		Goods inputA = new Goods();
		inputA.setG_detail_a("여성");
		if(detailB != null) {
			inputA.setG_detail_b(detailB);
		}
		if(g_brand != null) {
			inputA.setG_brand(g_brand);
		}
		if(min_price != 0) {
			inputA.setMin_price(min_price);
		}
		if(max_price != 0) {
			inputA.setMax_price(max_price);
		}
		
		List<Goods> outputA = null;
		
		int totalCount = 0;
		int listCount = 16;
		int pageCount = 5;
		PageData pageData = null;

			try {
				totalCount = goodsService.getGoodsCountBrand(inputA);
				
				pageData = new PageData(nowPage, totalCount, listCount, pageCount);
				
				Goods.setOffset(pageData.getOffset());
				Goods.setListCount(pageData.getListCount());
				
				if(sessionA == 1) {
					outputA = goodsService.getGoodsListBrandA(inputA);
				} else if ( sessionA == 2) {
					outputA = goodsService.getGoodsListBrandB(inputA);
				} else if ( sessionA == 3) {
					outputA = goodsService.getGoodsListBrandC(inputA);
				} else if ( sessionA == 4){
					outputA = goodsService.getGoodsListBrandD(inputA);
				} else {
					outputA = goodsService.getGoodsListBrand(inputA);
				}
				
			} catch (Exception e) {
				return webHelper.redirect(null, e.getLocalizedMessage());
			}
	
		
		model.addAttribute("outputA",outputA);
		
		if(detailB != null) {
			model.addAttribute("detailB",detailB);
		}
		if(g_brand != null) {
			model.addAttribute("g_brand",g_brand);
		}
		if(min_price != 0) {
			model.addAttribute("min_price",min_price);
		}
		if(max_price != 0) {
			model.addAttribute("max_price",max_price);
		}
		if(minsale != 0) {
			model.addAttribute("minsale",minsale);
		}
		if(maxsale != 0) {
			model.addAttribute("maxsale",maxsale);
		}
		if(sessionA != 0) {
			model.addAttribute("sessionA",sessionA);
		}
		model.addAttribute("pageData",pageData);
		
		String AA = "";
		
		if( sessionA  == 1) {
			AA = "인기순";
		}else if ( sessionA == 2) {
			AA = "최신순";
		}else if ( sessionA == 3) {
			AA = "가격낮은순";
		}else{
			AA = "가격높은순";
		}

	    session.setAttribute("key", key);
		return new ModelAndView("pjh/jsp/brand_brand");
	}
	
	@RequestMapping(value = "/pjh/jsp/brand_brandB.do", method = RequestMethod.GET)
	public ModelAndView viewB(Model model,
			 HttpServletRequest request,
			 @RequestParam(value="page" ,defaultValue = "1") int nowPage,
			 @RequestParam(value = "detailB" , required = false) String detailB,
			 @RequestParam(value = "g_brand" , required = false) String g_brand,
			 @RequestParam(value = "min_price" , defaultValue = "0") int min_price,
			 @RequestParam(value = "max_price" , defaultValue = "0") int max_price,
			 @RequestParam(value="minsale" ,defaultValue = "0") int minsale,
			 @RequestParam(value="maxsale" ,defaultValue = "0") int maxsale,
			 @RequestParam(value="sessionA" , defaultValue = "0") int sessionA) {
		
		HttpSession session  = request.getSession();
		Members key = (Members) session.getAttribute("key");
		
		Goods inputA = new Goods();
		inputA.setG_detail_a("여성");
		inputA.setG_detail_b(detailB);
		inputA.setG_brand(g_brand);
		inputA.setMin_price(min_price);
		inputA.setMax_price(max_price);
		
		List<Goods> outputA = null;
		
		int totalCount = 0;
		int listCount = 16;
		int pageCount = 5;
		PageData pageData = null;
		
		if( minsale == 0 && maxsale == 0 && sessionA == 0 || ( min_price != 0 || max_price != 0)  ) {
			try {
				
				totalCount = goodsService.getGoodsCountBrand(inputA);
				
				pageData = new PageData(nowPage, totalCount, listCount, pageCount);
				
				Goods.setOffset(pageData.getOffset());
				Goods.setListCount(pageData.getListCount());
				
				outputA = goodsService.getGoodsListBrand(inputA);
				
			} catch (Exception e) {
				return webHelper.redirect(null, e.getLocalizedMessage());
			}
		}
		
		if( sessionA != 0  ) {

			try {
				totalCount = goodsService.getGoodsCountBrand(inputA);
				
				pageData = new PageData(nowPage, totalCount, listCount, pageCount);
				
				Goods.setOffset(pageData.getOffset());
				Goods.setListCount(pageData.getListCount());
				if(sessionA==1) {
					outputA = goodsService.getGoodsListBrandA(inputA);
				} else if ( sessionA==2) {
					outputA = goodsService.getGoodsListBrandB(inputA);
				} else if ( sessionA ==3) {
					outputA = goodsService.getGoodsListBrandC(inputA);
				} else if ( sessionA ==4){
					outputA = goodsService.getGoodsListBrandD(inputA);
				} else {
					outputA = goodsService.getGoodsListBrand(inputA);
				}
				
			} catch (Exception e) {
				return webHelper.redirect(null, e.getLocalizedMessage());
			}
		}
		
		List<Goods> outputB = null;
		
		if(maxsale != 0 || minsale != 0) {
			try {

				outputB = goodsService.getGoodsHalInListBrand(inputA);
			
			} catch (Exception e) {
				return webHelper.redirect(null, e.getLocalizedMessage());
			}
			
			List<Integer> numberList = new ArrayList<Integer>();
			
			for (int i = 0;i< outputB.size(); i++ ) {
				String B = (String) outputB.get(i).getG_discount().substring(1, 3);
				int C = Integer.parseInt(B);
				if( maxsale == 0 && minsale != 0 ) {
					if( C <= minsale) {
						int D = (Integer) outputB.get(i).getId();
						numberList.add(D);
					}
				}else if(minsale == 0 && maxsale != 0) {
					if( C >= maxsale) {
						int D = (Integer) outputB.get(i).getId();
						numberList.add(D);
					}
				}else if(minsale != 0 && maxsale != 0){
					if( C >= minsale && C <= maxsale) {
						int D = (Integer) outputB.get(i).getId();
						numberList.add(D);
					}
				}
			}
			
			Goods inputB = new Goods();
			inputB.setNumberListA(numberList);
		
			try {
				totalCount = goodsService.getGoodsCountHalIn(numberList);
				
				pageData = new PageData(nowPage, totalCount, listCount, pageCount);
				
				Goods.setOffset(pageData.getOffset());
				Goods.setListCount(pageData.getListCount());

				outputA = goodsService.getGoodsHalIn(inputB);
			
			} catch (Exception e) {
				return webHelper.redirect(null, e.getLocalizedMessage());
			}
		}
		
		
		
		model.addAttribute("outputA",outputA);
		model.addAttribute("detailB",detailB);
		model.addAttribute("g_brand",g_brand);
		model.addAttribute("min_price",min_price);
		model.addAttribute("max_price",max_price);
		model.addAttribute("minsale",minsale);
		model.addAttribute("maxsale",maxsale);
		model.addAttribute("sessionA",sessionA);
		model.addAttribute("pageData",pageData);
		
	    session.setAttribute("key", key);
	    
		return new ModelAndView("pjh/jsp/brand_brand");
	}
	
	@RequestMapping(value = "/pjh/jsp/brand_brandF.do", method = RequestMethod.POST)
	public ModelAndView viewF(Model model,
			 HttpServletRequest request,
			 @RequestParam(value="page" ,defaultValue = "1") int nowPage,
			 @RequestParam(value = "detailB" , required = false) String detailB,
			 @RequestParam(value = "g_brand" , required = false) String g_brand,
			 @RequestParam(value = "min_price" , defaultValue = "0") int min_price,
			 @RequestParam(value = "max_price" , defaultValue = "0") int max_price,
			 @RequestParam(value="minsale" ,defaultValue = "0") int minsale,
			 @RequestParam(value="maxsale" ,defaultValue = "0") int maxsale,
			 @RequestParam(value="sessionA" , defaultValue = "0") int sessionA) {
		
		HttpSession session  = request.getSession();
		Members key = (Members) session.getAttribute("key");
		
		Goods inputA = new Goods();
		inputA.setG_detail_b(detailB);
		inputA.setG_brand(g_brand);
		inputA.setMin_price(min_price);
		inputA.setMax_price(max_price);
		
		List<Goods> outputA = null;
		
		int totalCount = 0;
		int listCount = 16;
		int pageCount = 5;
		PageData pageData = null;
		
		if( minsale == 0 && maxsale == 0 && sessionA == 0 || ( min_price != 0 || max_price != 0)  ) {
			try {
				
				totalCount = goodsService.getGoodsCountBrand(inputA);
				
				pageData = new PageData(nowPage, totalCount, listCount, pageCount);
				
				Goods.setOffset(pageData.getOffset());
				Goods.setListCount(pageData.getListCount());
				
				outputA = goodsService.getGoodsListBrand(inputA);
				
			} catch (Exception e) {
				return webHelper.redirect(null, e.getLocalizedMessage());
			}
		}
		
		if( sessionA != 0  ) {

			try {
				totalCount = goodsService.getGoodsCountBrand(inputA);
				
				pageData = new PageData(nowPage, totalCount, listCount, pageCount);
				
				Goods.setOffset(pageData.getOffset());
				Goods.setListCount(pageData.getListCount());
				if(sessionA==1) {
					outputA = goodsService.getGoodsListBrandA(inputA);
				} else if ( sessionA==2) {
					outputA = goodsService.getGoodsListBrandB(inputA);
				} else if ( sessionA ==3) {
					outputA = goodsService.getGoodsListBrandC(inputA);
				} else if ( sessionA ==4){
					outputA = goodsService.getGoodsListBrandD(inputA);
				} else {
					outputA = goodsService.getGoodsListBrand(inputA);
				}
				
			} catch (Exception e) {
				return webHelper.redirect(null, e.getLocalizedMessage());
			}
		}
		
		List<Goods> outputB = null;
		
		if(maxsale != 0 || minsale != 0) {
			try {

				outputB = goodsService.getGoodsHalInListBrand(inputA);
			
			} catch (Exception e) {
				return webHelper.redirect(null, e.getLocalizedMessage());
			}
			
			List<Integer> numberList = new ArrayList<Integer>();
			
			for (int i = 0;i< outputB.size(); i++ ) {
				String B = (String) outputB.get(i).getG_discount().substring(1, 3);
				int C = Integer.parseInt(B);
				if( maxsale == 0 && minsale != 0 ) {
					if( C <= minsale) {
						int D = (Integer) outputB.get(i).getId();
						numberList.add(D);
					}
				}else if(minsale == 0 && maxsale != 0) {
					if( C >= maxsale) {
						int D = (Integer) outputB.get(i).getId();
						numberList.add(D);
					}
				}else if(minsale != 0 && maxsale != 0){
					if( C >= minsale && C <= maxsale) {
						int D = (Integer) outputB.get(i).getId();
						numberList.add(D);
					}
				}
			}
			
			Goods inputB = new Goods();
			inputB.setNumberListA(numberList);
		
			try {
				totalCount = goodsService.getGoodsCountHalIn(numberList);
				
				pageData = new PageData(nowPage, totalCount, listCount, pageCount);
				
				Goods.setOffset(pageData.getOffset());
				Goods.setListCount(pageData.getListCount());

				outputA = goodsService.getGoodsHalIn(inputB);
			
			} catch (Exception e) {
				return webHelper.redirect(null, e.getLocalizedMessage());
			}
		}
		
		model.addAttribute("outputA",outputA);
		model.addAttribute("detailB",detailB);
		model.addAttribute("g_brand",g_brand);
		model.addAttribute("min_price",min_price);
		model.addAttribute("max_price",max_price);
		model.addAttribute("minsale",minsale);
		model.addAttribute("maxsale",maxsale);
		model.addAttribute("sessionA",sessionA);
		model.addAttribute("pageData",pageData);

	    session.setAttribute("key", key);
	    
		return new ModelAndView("pjh/jsp/brand_brand");
	}
}
