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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import study.spring.trspring.helper.UploadItem;
import study.spring.trspring.helper.PageData;
import study.spring.trspring.helper.RegexHelper;
import study.spring.trspring.helper.WebHelper;
import study.spring.trspring.model.Admins;
import study.spring.trspring.model.Goods;
import study.spring.trspring.model.News;
import study.spring.trspring.model.Qna;
import study.spring.trspring.service.GoodsService;
import study.spring.trspring.service.NewsService;

@Controller
public class GoodsController {
	
	/** WebHelper 객체 주입 */
	// --> import org.springframework.beans.factory.annotation.Autowired;
	// --> import study.spring.springhelper.helper.WebHelper;
	// 페이지간에 이동을 할 수 있게 해주는 helper
	@Autowired
	WebHelper webHelper;
	
	/** WebHelper 객체 주입 */
	// --> import study.spring.springhelper.helper.RegexHelper;
	// 형식검사를 하게 해주는 Helper
	@Autowired
	RegexHelper regexHelper;
	
	/** 객체 주입 --> 자동할당 */
	// --> import org.springframework.beans.factory.annotation.Autowired;
	@Autowired
	GoodsService goodsService;
	
	
	@Autowired
	NewsService newsService;
	
	/** "/프로젝트이름" 에 해당하는 ContextPath 변수 주입 */
	// --> import org.springframework.beans.factory.annotation.Value;
	@Value("#{servletContext.contextPath}")
	String contextPath;
	
	// 관리자페이지 ======================================================================
	// 상품관련===============================
	/** 작업내용 확인 페이지 */
	@RequestMapping(value="/tranding/work.do", method=RequestMethod.GET)
	public String a1(Model model) {
		return "lkh/jsp/work";
	}
	
	/** 관리자 메인 페이지 확인 */
	@RequestMapping(value="/tranding/master_main.do", method=RequestMethod.GET)
	public String a2(Model model,
			HttpServletRequest request) {
		
		HttpSession session  = request.getSession();
		
		Admins key = (Admins) session.getAttribute("keyA");
		
		model.addAttribute("outputZ",key);
		
		session.setAttribute("keyA", key); 
		
		return "pjh/admins/master_main";
	}
	
	/** 상품관리 페이지 확인 */
	@RequestMapping(value="/tranding/master_product_manager.do", method=RequestMethod.GET)
	public ModelAndView a3(Model model,
			HttpServletRequest request,
			// 검색어
			@RequestParam(value="g_detail_a", required=false) String g_detail_a,
			@RequestParam(value="g_detail_b", required=false) String g_detail_b,
			@RequestParam(value="keyword", required=false) String keyword,
			// 페이지 구현에서 사용할 현재 페이지 번호
			@RequestParam(value="page", defaultValue="1") int nowPage) {
		
		HttpSession session  = request.getSession();
		
		Admins key = (Admins) session.getAttribute("keyA");
		
		model.addAttribute("outputZ",key);
		
		session.setAttribute("keyA", key); 
		
		/** 1) 페이지 구현에 필요한 변수값 생성 */
		int totalCount = 0;			// 전체 게시글 수
		int listCount = 10;			// 한 페이지당 표시할 목록 수
		int pageCount = 5;			// 한 그룹당 표시할 페이지 번호 수
		
		/** 2) 데이터 조회하기 */
		// 조회에 필요한 조건값(검색어)를 Beans에 담는다.
		Goods input = new Goods();
		input.setG_name(keyword);
		input.setG_detail_a(g_detail_a);
		input.setG_detail_b(g_detail_b);
		
		List<Goods> output = null;		        // 조회결과가 저장될 객체
		List<Goods> g_detail_a_List = null;		// 1차분류 리스트
		List<Goods> g_detail_b_List = null;		// 2차분류 리스트
		// --> import study.spring.trspring.helper.PageData;
		PageData pageData = null;			// 페이지 번호를 계산한 결과가 저장될 객체
		
		try {
			// 전체 게시글 수 조회
			totalCount = goodsService.getGoodsCount(input);
			// 페이지 번호 계산 --> 계산결과가 로그로 출력될 것이다.
			pageData = new PageData(nowPage, totalCount, listCount, pageCount);
			
			// SQL의 LIMIT절에서 사용될 값을 Beans의 static 변수에 저장
			Goods.setOffset(pageData.getOffset());
			Goods.setListCount(pageData.getListCount());
			
			// 데이터 조회하기
			output = goodsService.getGoodsList(input);
			g_detail_a_List = goodsService.getDetailA(input);
			g_detail_b_List = goodsService.getDetailB(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		/** 3) View 처리 */
		model.addAttribute("keyword", keyword);
		model.addAttribute("output", output);
		model.addAttribute("g_detail_a_List", g_detail_a_List);		// 분류1 목록
		model.addAttribute("g_detail_b_List", g_detail_b_List);		// 분류2 목록
		model.addAttribute("g_detail_a", g_detail_a);				// 검색어 분류1
		model.addAttribute("g_detail_b", g_detail_b);				// 검색어 분류2
		model.addAttribute("totalCount", totalCount);				// 전체 게시물 수
		model.addAttribute("pageData", pageData);
		
		return new ModelAndView("lkh/master/master_product_manager");
	}
	
	/** 상품등록 페이지 확인 */
	@RequestMapping(value="/tranding/master_product_insert.do", method=RequestMethod.GET)
	public ModelAndView a4(Model model,HttpServletRequest request) {
		
		HttpSession session  = request.getSession();
		
		Admins key = (Admins) session.getAttribute("keyA");
		
		model.addAttribute("outputZ",key);
		
		session.setAttribute("keyA", key); 
		
		Goods input = new Goods();
		
		List<Goods> g_detail_a_List = null;		// 1차분류 리스트
		List<Goods> g_detail_b_List = null;		// 2차분류 리스트
		
		try {
			// 분류데이터 조회하기
			g_detail_a_List = goodsService.getDetailA(input);
			g_detail_b_List = goodsService.getDetailB(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		/** 4) View 처리 */
        // 업로드 정보를 View로 전달한다.
        model.addAttribute("g_detail_a_List", g_detail_a_List);
		model.addAttribute("g_detail_b_List", g_detail_b_List);
		
		return new ModelAndView("lkh/master/master_product_insert");
	}
	
	/** 상품 등록 action 페이지 */
	@RequestMapping(value="/tranding/master_product_insert_ok.do", method=RequestMethod.POST)
	public ModelAndView a5(Model model,
			HttpServletRequest request,
			@RequestParam(value="g_detail_a", required=false) String g_detail_a,
			@RequestParam(value="g_detail_b", required=false) String g_detail_b,
			@RequestParam(value="g_code", required=false) String g_code,
			@RequestParam(value="g_name", required=false) String g_name,
			@RequestParam(value="g_hit", required=false) String g_hit,
			@RequestParam(value="g_recom", required=false) String g_recom,
			@RequestParam(value="g_new", required=false) String g_new,
			@RequestParam(value="g_popul", required=false) String g_popul,
			@RequestParam(value="g_sale", required=false) String g_sale,
			@RequestParam(value="g_make", required=false) String g_make,
			@RequestParam(value="g_brand", required=false) String g_brand,
			@RequestParam(value="g_sell", required=false) String g_sell,
			@RequestParam(value="g_cont", required=false) String g_cont,
			@RequestParam(value="g_memo", required=false) String g_memo,
			@RequestParam(value="g_price", required=false) String g_price,
			@RequestParam(value="g_inven", defaultValue="0") int g_inven,
			@RequestParam(value="g_option_a", required=false) String g_option_a,
			@RequestParam(value="g_option_b", required=false) String g_option_b,
			@RequestParam(value="g_ori_price", required=false) String g_ori_price,
			@RequestParam(value="g_discount", required=false) String g_discount,
			@RequestParam(value="g_disc_price", required=false) String g_disc_price,
			@RequestParam(required=false) MultipartFile g_image_a,
			@RequestParam(required=false) MultipartFile g_image_b) {
		
		
		
		HttpSession session  = request.getSession();
		
		Admins key = (Admins) session.getAttribute("keyA");
		
		model.addAttribute("outputZ",key);
		
		session.setAttribute("keyA", key); 
		
		/** 데이터 들의 앞뒤 공백을 제거해줌 */
		g_name = g_name.trim();
		g_make = g_make.trim();
		g_brand = g_brand.trim();
		g_price = g_price.trim();
		
		
		
		// 일반 문자열 입력 컬럼 --> String으로 파라미터가 선언되어 있는 경우는 값이 입력되지 않으면 빈 문자열로 처리된다.
		// webHelper.redirect 페이지 강제이동인데 null은 이전페이지로 되돌리고 뒤 문자열은 alret으로 뿌려준다.
		if (g_detail_a.equals("")) 								{ return webHelper.redirect(null, "1차분류를 선택하세요."); }
		if (g_detail_b.equals("")) 								{ return webHelper.redirect(null, "2차분류를 선택하세요."); }
		if (g_code.equals("")) 									{ return webHelper.redirect(null, "상품코드를 입력하세요."); }
		if (Integer.parseInt(g_code) < 0) 						{ return webHelper.redirect(null, "상품코드는 0보다 작을 수 없습니다."); }
		if (g_name.equals("")) 									{ return webHelper.redirect(null, "상품명을 입력하세요."); }
		if (g_make.equals("")) 									{ return webHelper.redirect(null, "제조사를 입력하세요."); }
		if (g_brand.equals("")) 								{ return webHelper.redirect(null, "브랜드를 입력하세요."); }
		if (g_cont.equals("")) 									{ return webHelper.redirect(null, "상품설명을 입력하세요."); }
		if (g_memo.equals("")) 									{ return webHelper.redirect(null, "상점메모를 입력하세요."); }
		if (g_price.equals("")) 								{ return webHelper.redirect(null, "판매가격을 입력하세요."); }
		if (g_inven == 0) 										{ return webHelper.redirect(null, "재고수량을 입력하세요."); }
		if (g_option_a.equals("")) 								{ return webHelper.redirect(null, "상품선택옵션1을 입력하세요."); }
		if (g_option_b.equals("")) 								{ return webHelper.redirect(null, "상품선택옵션2을 입력하세요."); }
		if (g_ori_price.equals("")) 							{ return webHelper.redirect(null, "원가를 입력하세요."); }
		if (g_discount.equals("")) 								{ return webHelper.redirect(null, "할인율를 입력하세요."); }
		if (Integer.parseInt(g_discount) > 0) 					{ return webHelper.redirect(null, "할인율은 0보다 클 수 없습니다."); }
		if (g_disc_price.equals("")) 							{ return webHelper.redirect(null, "결제혜택가를 입력하세요."); }
		if (g_image_a.getOriginalFilename().isEmpty()) 			{ return webHelper.redirect(null, "이미지1을 선택해주세요"); }
		if (g_image_b.getOriginalFilename().isEmpty()) 			{ return webHelper.redirect(null, "이미지2를 선택해주세요."); }
		
		/** checkbox의 기본 데이터를 설정해줌 */
		if (g_hit == null)  				{ g_hit = "N"; }
		if (g_recom == null)  				{ g_recom = "N"; }
		if (g_new == null)  				{ g_new = "N"; }
		if (g_popul == null)  				{ g_popul = "N"; }
		if (g_sale == null)  				{ g_sale = "N"; }
		if (g_sell == null)  				{ g_sell = "N"; }
		
		/** 이미지 경로를 string으로 담을 변수 */
		String a = null;
		String b = null;
		String img1 = null;
		String img2 = null;
		
		/** 할인율 뒤에 % 붙여주는 기능 */
		g_discount = g_discount + "%";
		
		/** 1) 업로드 파일 저장하기 */
		if(!g_image_a.getOriginalFilename().isEmpty()) {
			// 업로드 결과가 저장된 Beans를 리턴받는다.
	        UploadItem item1 = null;
	        try {
	            item1 = webHelper.saveMultipartFile(g_image_a);
	        } catch (NullPointerException e) {
	            e.printStackTrace();
	            return webHelper.redirect(null, "업로드 된 파일이 없습니다.");
	        } catch (Exception e) {
	            e.printStackTrace();
	            return webHelper.redirect(null, "업로드에 실패했습니다.");
	        }
	        
	        a = item1.getFilePath();
	        img1 = a.replace("/", "");

            /** 4) View 처리 */
            // 업로드 정보를 View로 전달한다.
            model.addAttribute("item1", item1);
        }
		
        if(!g_image_b.getOriginalFilename().isEmpty()) {
        	// 업로드 결과가 저장된 Beans를 리턴받는다.
	        UploadItem item2 = null;
	        try {
	            item2 = webHelper.saveMultipartFile(g_image_b);
	        } catch (NullPointerException e) {
	            e.printStackTrace();
	            return webHelper.redirect(null, "업로드 된 파일이 없습니다.");
	        } catch (Exception e) {
	            e.printStackTrace();
	            return webHelper.redirect(null, "업로드에 실패했습니다.");
	        }

	        b = item2.getFilePath();
	        img2 = b.replace("/", "");

            /** 4) View 처리 */
            // 업로드 정보를 View로 전달한다.
            model.addAttribute("item2", item2);
        }
        
        /** 포인트 계산하는 곳 */
        int g_point = (int)(Integer.parseInt(g_price) * 0.1);
		
		/** 2) 데이터 저장하기 */
		// 저장할 값들을 Beans에 담는다.
		Goods input = new Goods();
		input.setG_detail_a(g_detail_a);
		input.setG_detail_b(g_detail_b);
		input.setG_code(g_code);
		input.setG_name(g_name);
		input.setG_hit(g_hit);
		input.setG_recom(g_recom);
		input.setG_new(g_new);
		input.setG_popul(g_popul);
		input.setG_sale(g_sale);
		input.setG_make(g_make);
		input.setG_brand(g_brand);
		input.setG_sell(g_sell);
		input.setG_cont(g_cont);
		input.setG_memo(g_memo);
		input.setG_price(g_price);
		input.setG_point(g_point);
		input.setG_inven(g_inven);
		input.setG_option_a(g_option_a);
		input.setG_option_b(g_option_b);
		input.setG_image_a(img1);
		input.setG_image_b(img2);
		input.setG_ori_price(g_ori_price);
		input.setG_discount(g_discount);
		input.setG_disc_price(g_disc_price);
		
		List<Goods> output = null;		// 조회결과가 저장될 객체
		
		
		try {
			// 데이터 저장
			// --> 데이터 저장에 성공하면 파라미터로 전달하는 input 객체에 PK값이 저장된다.
			// webHelper.redirect 페이지 강제이동인데 null은 이전페이지로 되돌리고 뒤 문자열은 alret으로 뿌려준다.
			goodsService.addGoods(input);
			
			// 데이터 조회하기
			output = goodsService.getGoodsList(input);

		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

        /** 4) View 처리 */
        // 업로드 정보를 View로 전달한다.
        model.addAttribute("output", output);
        
		return webHelper.redirect(contextPath + "/tranding/master_product_manager.do", "입력되었습니다.");
	}
	
	
	/** 상품수정 페이지 확인 */
	@RequestMapping(value="/tranding/master_product_update.do", method=RequestMethod.GET)
	public ModelAndView a6(Model model,
			HttpServletRequest request,
			@RequestParam(value="g_detail_a", required=false) String g_detail_a,
			@RequestParam(value="g_detail_b", required=false) String g_detail_b,
			@RequestParam(value="id", defaultValue="0") int id,
			// way는 수정할 때 전페이지로 되돌려주는 경로를 저장함.
			@RequestParam(value="way", required=false) String way) {

		Goods input = new Goods();
		
		List<Goods> g_detail_a_List = null;		// 1차분류 리스트
		List<Goods> g_detail_b_List = null;		// 2차분류 리스트
		
		Goods input1 = new Goods();
		input1.setId(id);
		
		Goods output = null;
		
		try {
			// 분류데이터 조회하기
			g_detail_a_List = goodsService.getDetailA(input);
			g_detail_b_List = goodsService.getDetailB(input);
			
			output = goodsService.getGoodsItem(input1);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		/** 할인율 %를 제거하여 숫자만 문자형태로 저장 */
		String a = output.getG_discount().replace("%", "");
		output.setG_discount(a);
		
		/** 4) View 처리 */
        // 업로드 정보를 View로 전달한다.
        model.addAttribute("g_detail_a_List", g_detail_a_List);
		model.addAttribute("g_detail_b_List", g_detail_b_List);
		model.addAttribute("id", id);
		model.addAttribute("way", way);
		model.addAttribute("g_detail_a", g_detail_a);
		model.addAttribute("g_detail_b", g_detail_b);
		model.addAttribute("output", output);
		
		return new ModelAndView("lkh/master/master_product_update");
	}
	
	/** 상품수정 action 페이지 */
	@RequestMapping(value="/tranding/master_product_update_ok.do", method=RequestMethod.POST)
	public ModelAndView a7(Model model,
			HttpServletRequest request,
			@RequestParam(value="id", defaultValue="0") int id,
			@RequestParam(value="bf_img1", required=false) String bf_img1,
			@RequestParam(value="bf_img2", required=false) String bf_img2,
			@RequestParam(value="g_detail_a", required=false) String g_detail_a,
			@RequestParam(value="g_detail_b", required=false) String g_detail_b,
			@RequestParam(value="g_code", required=false) String g_code,
			@RequestParam(value="g_name", required=false) String g_name,
			@RequestParam(value="g_hit", required=false) String g_hit,
			@RequestParam(value="g_recom", required=false) String g_recom,
			@RequestParam(value="g_new", required=false) String g_new,
			@RequestParam(value="g_popul", required=false) String g_popul,
			@RequestParam(value="g_sale", required=false) String g_sale,
			@RequestParam(value="g_make", required=false) String g_make,
			@RequestParam(value="g_brand", required=false) String g_brand,
			@RequestParam(value="g_sell", required=false) String g_sell,
			@RequestParam(value="g_cont", required=false) String g_cont,
			@RequestParam(value="g_memo", required=false) String g_memo,
			@RequestParam(value="g_price", required=false) String g_price,
			@RequestParam(value="g_inven", defaultValue="0") int g_inven,
			@RequestParam(value="g_option_a", required=false) String g_option_a,
			@RequestParam(value="g_option_b", required=false) String g_option_b,
			@RequestParam(value="g_ori_price", required=false) String g_ori_price,
			@RequestParam(value="g_discount", required=false) String g_discount,
			@RequestParam(value="g_disc_price", required=false) String g_disc_price,
			@RequestParam(required=false) MultipartFile g_image_a,
			@RequestParam(required=false) MultipartFile g_image_b,
			// way는 수정할 때 전페이지로 되돌려주는 경로를 저장함.
			@RequestParam(value="way", required=false) String way) {
		
		
		HttpSession session  = request.getSession();
		
		Admins key = (Admins) session.getAttribute("keyA");
		
		model.addAttribute("outputZ",key);
		
		session.setAttribute("keyA", key); 
		/** 데이터 들의 앞뒤 공백을 제거해줌 */
		g_name = g_name.trim();
		g_make = g_make.trim();
		g_brand = g_brand.trim();
		g_price = g_price.trim();
		
		// 일반 문자열 입력 컬럼 --> String으로 파라미터가 선언되어 있는 경우는 값이 입력되지 않으면 빈 문자열로 처리된다.
		// webHelper.redirect 페이지 강제이동인데 null은 이전페이지로 되돌리고 뒤 문자열은 alret으로 뿌려준다.
		if (g_detail_a.equals("")) 								{ return webHelper.redirect(null, "1차분류를 선택하세요."); }
		if (g_detail_b.equals("")) 								{ return webHelper.redirect(null, "2차분류를 선택하세요."); }
		if (g_code.equals("")) 									{ return webHelper.redirect(null, "상품코드를 입력하세요."); }
		if (Integer.parseInt(g_code) < 0) 						{ return webHelper.redirect(null, "상품코드는 0보다 작을 수 없습니다."); }
		if (g_name.equals("")) 									{ return webHelper.redirect(null, "상품명을 입력하세요."); }
		if (g_make.equals("")) 									{ return webHelper.redirect(null, "제조사를 입력하세요."); }
		if (g_brand.equals("")) 								{ return webHelper.redirect(null, "브랜드를 입력하세요."); }
		if (g_cont.equals("")) 									{ return webHelper.redirect(null, "상품설명을 입력하세요."); }
		if (g_memo.equals("")) 									{ return webHelper.redirect(null, "상점메모를 입력하세요."); }
		if (g_price.equals("")) 								{ return webHelper.redirect(null, "판매가격을 입력하세요."); }
		if (g_inven == 0) 										{ return webHelper.redirect(null, "재고수량을 입력하세요."); }
		if (g_option_a.equals("")) 								{ return webHelper.redirect(null, "상품선택옵션1을 입력하세요."); }
		if (g_option_b.equals("")) 								{ return webHelper.redirect(null, "상품선택옵션2을 입력하세요."); }
		if (g_ori_price.equals("")) 							{ return webHelper.redirect(null, "원가를 입력하세요."); }
		if (g_discount.equals("")) 								{ return webHelper.redirect(null, "할인율를 입력하세요."); }
		if (Integer.parseInt(g_discount) > 0) 					{ return webHelper.redirect(null, "할인율은 0보다 클 수 없습니다."); }
		if (g_disc_price.equals("")) 							{ return webHelper.redirect(null, "결제혜택가를 입력하세요."); }
	
		
		/** checkbox의 기본 데이터를 설정해줌 */
		if (g_hit == null)  				{ g_hit = "N"; }
		if (g_recom == null)  				{ g_recom = "N"; }
		if (g_new == null)  				{ g_new = "N"; }
		if (g_popul == null)  				{ g_popul = "N"; }
		if (g_sale == null)  				{ g_sale = "N"; }
		if (g_sell == null)  				{ g_sell = "N"; }
		
		/** 이미지 경로를 string으로 담을 변수 */
		String a = null;
		String b = null;
		String img1 = null;
		String img2 = null;
		
		/** 할인율 뒤에 % 붙여주는 기능 */
		g_discount = g_discount + "%";
		
		/** 1) 업로드 파일 저장하기 */
		if(!g_image_a.getOriginalFilename().isEmpty()) {
			// 업로드 결과가 저장된 Beans를 리턴받는다.
	        UploadItem item1 = null;
	        try {
	            item1 = webHelper.saveMultipartFile(g_image_a);
	        } catch (NullPointerException e) {
	            e.printStackTrace();
	            return webHelper.redirect(null, "업로드 된 파일이 없습니다.");
	        } catch (Exception e) {
	            e.printStackTrace();
	            return webHelper.redirect(null, "업로드에 실패했습니다.");
	        }
	        
	        a = item1.getFilePath();
	        img1 = a.replace("/", "");

            /** 4) View 처리 */
            // 업로드 정보를 View로 전달한다.
            model.addAttribute("item1", item1);
        }else {
        	// 등록된 이미지가 없다면 원래 등록된 이미지 사용
        	img1 = bf_img1;
        }
		
        if(!g_image_b.getOriginalFilename().isEmpty()) {
        	// 업로드 결과가 저장된 Beans를 리턴받는다.
	        UploadItem item2 = null;
	        try {
	            item2 = webHelper.saveMultipartFile(g_image_b);
	        } catch (NullPointerException e) {
	            e.printStackTrace();
	            return webHelper.redirect(null, "업로드 된 파일이 없습니다.");
	        } catch (Exception e) {
	            e.printStackTrace();
	            return webHelper.redirect(null, "업로드에 실패했습니다.");
	        }

	        b = item2.getFilePath();
	        img2 = b.replace("/", "");

            /** 4) View 처리 */
            // 업로드 정보를 View로 전달한다.
            model.addAttribute("item2", item2);
        }else {
        	// 등록된 이미지가 없다면 원래 등록된 이미지 사용
        	img2 = bf_img2;
        }
        
        /** 포인트 계산하는 곳 */
        int g_point = (int)(Integer.parseInt(g_price) * 0.1);
		
		/** 2) 데이터 수정하기 */
		// 저장할 값들을 Beans에 담는다.
		Goods input = new Goods();
		// 아이디 값을 설정 후 넘겨줘야 함
		input.setId(id);
		input.setG_detail_a(g_detail_a);
		input.setG_detail_b(g_detail_b);
		input.setG_code(g_code);
		input.setG_name(g_name);
		input.setG_hit(g_hit);
		input.setG_recom(g_recom);
		input.setG_new(g_new);
		input.setG_popul(g_popul);
		input.setG_sale(g_sale);
		input.setG_make(g_make);
		input.setG_brand(g_brand);
		input.setG_sell(g_sell);
		input.setG_cont(g_cont);
		input.setG_memo(g_memo);
		input.setG_price(g_price);
		input.setG_point(g_point);
		input.setG_inven(g_inven);
		input.setG_option_a(g_option_a);
		input.setG_option_b(g_option_b);
		input.setG_image_a(img1);
		input.setG_image_b(img2);
		input.setG_ori_price(g_ori_price);
		input.setG_discount(g_discount);
		input.setG_disc_price(g_disc_price);
		
		List<Goods> output = null;		// 조회결과가 저장될 객체
		
		
		try {
			// 데이터 수정
			// webHelper.redirect 페이지 강제이동인데 null은 이전페이지로 되돌리고 뒤 문자열은 alret으로 뿌려준다.
			goodsService.editGoods(input);
			
			// 데이터 조회하기
			output = goodsService.getGoodsList(input);

		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

        /** 4) View 처리 */
        // 업로드 정보를 View로 전달한다.
        model.addAttribute("output", output);
        
		return webHelper.redirect(contextPath + "/tranding/" + way + ".do", "수정되었습니다.");
	}
	
	
	/** 상품삭제 action 페이지 확인 */
	@RequestMapping(value="/tranding/master_product_delete_ok.do", method=RequestMethod.GET)
	public ModelAndView a8(Model model,
			@RequestParam(value="id", defaultValue="0") int id,
			HttpServletRequest request) {
		
		HttpSession session  = request.getSession();
		
		Admins key = (Admins) session.getAttribute("keyA");
		
		model.addAttribute("outputZ",key);
		
		session.setAttribute("keyA", key); 
		
		/** 1) 파라미터 유효성 검사 */
		// 이 값이 존재하지 않는다면 데이터 삭제가 불가능하므로 반드시 필수값으로 처리해야 한다.
		if (id == 0) {
			return webHelper.redirect(null, "상품 번호가 없습니다.");
		}
		
		/** 2) 데이터 삭제하기 */
		// 데이터 삭제에 필요한 조건값을 Beans에 저장하기
		Goods input = new Goods();
		input.setId(id);
		
		try {
			goodsService.deleteGoods(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		/** 3) 페이지 이동 */
		// 확인할 대상이 삭제된 상태이므로 목록 페이지로 이동
		return webHelper.redirect(contextPath + "/tranding/master_product_manager.do", "삭제되었습니다.");
	}
	
	
	/** 상품재고 페이지 확인 */
	@RequestMapping(value="/tranding/master_product_inventory.do", method=RequestMethod.GET)
	public ModelAndView a9(Model model,
			// 검색어
			HttpServletRequest request,
			@RequestParam(value="g_detail_a", required=false) String g_detail_a,
			@RequestParam(value="g_detail_b", required=false) String g_detail_b,
			@RequestParam(value="keyword", required=false) String keyword,
			// 페이지 구현에서 사용할 현재 페이지 번호
			@RequestParam(value="page", defaultValue="1") int nowPage) {
		
		HttpSession session  = request.getSession();
		
		Admins key = (Admins) session.getAttribute("keyA");
		
		model.addAttribute("outputZ",key);
		
		session.setAttribute("keyA", key); 
		
		/** 1) 페이지 구현에 필요한 변수값 생성 */
		int totalCount = 0;			// 전체 게시글 수
		int listCount = 10;			// 한 페이지당 표시할 목록 수
		int pageCount = 5;			// 한 그룹당 표시할 페이지 번호 수
		
		/** 2) 데이터 조회하기 */
		// 조회에 필요한 조건값(검색어)를 Beans에 담는다.
		Goods input = new Goods();
		input.setG_name(keyword);
		input.setG_detail_a(g_detail_a);
		input.setG_detail_b(g_detail_b);
		
		List<Goods> output = null;		        // 조회결과가 저장될 객체
		List<Goods> g_detail_a_List = null;		// 1차분류 리스트
		List<Goods> g_detail_b_List = null;		// 2차분류 리스트
		// --> import study.spring.trspring.helper.PageData;
		PageData pageData = null;			// 페이지 번호를 계산한 결과가 저장될 객체
		
		try {
			// 전체 게시글 수 조회
			totalCount = goodsService.getGoodsCount(input);
			// 페이지 번호 계산 --> 계산결과가 로그로 출력될 것이다.
			pageData = new PageData(nowPage, totalCount, listCount, pageCount);
			
			// SQL의 LIMIT절에서 사용될 값을 Beans의 static 변수에 저장
			Goods.setOffset(pageData.getOffset());
			Goods.setListCount(pageData.getListCount());
			
			// 데이터 조회하기
			output = goodsService.getGoodsList(input);
			g_detail_a_List = goodsService.getDetailA(input);
			g_detail_b_List = goodsService.getDetailB(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		/** 3) View 처리 */
		model.addAttribute("keyword", keyword);
		model.addAttribute("output", output);
		model.addAttribute("g_detail_a_List", g_detail_a_List);		// 분류1 목록
		model.addAttribute("g_detail_b_List", g_detail_b_List);		// 분류2 목록
		model.addAttribute("g_detail_a", g_detail_a);				// 검색어 분류1
		model.addAttribute("g_detail_b", g_detail_b);				// 검색어 분류2
		model.addAttribute("totalCount", totalCount);				// 전체 게시물 수
		model.addAttribute("pageData", pageData);
		
		return new ModelAndView("lkh/master/master_product_inventory");
	}
	
	/** 상품재고옵션 페이지 확인 */
	@RequestMapping(value="/tranding/master_product_inventoryoption.do", method=RequestMethod.GET)
	public ModelAndView a10(Model model,
			// 검색어
			HttpServletRequest request,
			@RequestParam(value="g_detail_a", required=false) String g_detail_a,
			@RequestParam(value="g_detail_b", required=false) String g_detail_b,
			@RequestParam(value="keyword", required=false) String keyword,
			// 페이지 구현에서 사용할 현재 페이지 번호
			@RequestParam(value="page", defaultValue="1") int nowPage) {
		
		HttpSession session  = request.getSession();
		
		Admins key = (Admins) session.getAttribute("keyA");
		
		model.addAttribute("outputZ",key);
		
		session.setAttribute("keyA", key); 
		
		/** 1) 페이지 구현에 필요한 변수값 생성 */
		int totalCount = 0;			// 전체 게시글 수
		int listCount = 10;			// 한 페이지당 표시할 목록 수
		int pageCount = 5;			// 한 그룹당 표시할 페이지 번호 수
		
		/** 2) 데이터 조회하기 */
		// 조회에 필요한 조건값(검색어)를 Beans에 담는다.
		Goods input = new Goods();
		input.setG_name(keyword);
		input.setG_detail_a(g_detail_a);
		input.setG_detail_b(g_detail_b);
		
		List<Goods> output = null;		        // 조회결과가 저장될 객체
		List<Goods> g_detail_a_List = null;		// 1차분류 리스트
		List<Goods> g_detail_b_List = null;		// 2차분류 리스트
		// --> import study.spring.trspring.helper.PageData;
		PageData pageData = null;			// 페이지 번호를 계산한 결과가 저장될 객체
		
		try {
			// 전체 게시글 수 조회
			totalCount = goodsService.getGoodsCount(input);
			// 페이지 번호 계산 --> 계산결과가 로그로 출력될 것이다.
			pageData = new PageData(nowPage, totalCount, listCount, pageCount);
			
			// SQL의 LIMIT절에서 사용될 값을 Beans의 static 변수에 저장
			Goods.setOffset(pageData.getOffset());
			Goods.setListCount(pageData.getListCount());
			
			// 데이터 조회하기
			output = goodsService.getGoodsList(input);
			g_detail_a_List = goodsService.getDetailA(input);
			g_detail_b_List = goodsService.getDetailB(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		/** 3) View 처리 */
		model.addAttribute("keyword", keyword);
		model.addAttribute("output", output);
		model.addAttribute("g_detail_a_List", g_detail_a_List);		// 분류1 목록
		model.addAttribute("g_detail_b_List", g_detail_b_List);		// 분류2 목록
		model.addAttribute("g_detail_a", g_detail_a);				// 검색어 분류1
		model.addAttribute("g_detail_b", g_detail_b);				// 검색어 분류2
		model.addAttribute("totalCount", totalCount);				// 전체 게시물 수
		model.addAttribute("pageData", pageData);
		
		return new ModelAndView("lkh/master/master_product_inventoryoption");
	}
	
	/** 상품유형관리 페이지 확인 */
	@RequestMapping(value="/tranding/master_product_type.do", method=RequestMethod.GET)
	public ModelAndView a11(Model model,
			// 검색어
			HttpServletRequest request,
			@RequestParam(value="g_detail_a", required=false) String g_detail_a,
			@RequestParam(value="g_detail_b", required=false) String g_detail_b,
			@RequestParam(value="keyword", required=false) String keyword,
			// 페이지 구현에서 사용할 현재 페이지 번호
			@RequestParam(value="page", defaultValue="1") int nowPage) {
		
		HttpSession session  = request.getSession();
		
		Admins key = (Admins) session.getAttribute("keyA");
		
		model.addAttribute("outputZ",key);
		
		session.setAttribute("keyA", key); 
		
		/** 1) 페이지 구현에 필요한 변수값 생성 */
		int totalCount = 0;			// 전체 게시글 수
		int listCount = 10;			// 한 페이지당 표시할 목록 수
		int pageCount = 5;			// 한 그룹당 표시할 페이지 번호 수
		
		/** 2) 데이터 조회하기 */
		// 조회에 필요한 조건값(검색어)를 Beans에 담는다.
		Goods input = new Goods();
		input.setG_name(keyword);
		input.setG_detail_a(g_detail_a);
		input.setG_detail_b(g_detail_b);
		
		List<Goods> output = null;		        // 조회결과가 저장될 객체
		List<Goods> g_detail_a_List = null;		// 1차분류 리스트
		List<Goods> g_detail_b_List = null;		// 2차분류 리스트
		// --> import study.spring.trspring.helper.PageData;
		PageData pageData = null;			// 페이지 번호를 계산한 결과가 저장될 객체
		
		try {
			// 전체 게시글 수 조회
			totalCount = goodsService.getGoodsCount(input);
			// 페이지 번호 계산 --> 계산결과가 로그로 출력될 것이다.
			pageData = new PageData(nowPage, totalCount, listCount, pageCount);
			
			// SQL의 LIMIT절에서 사용될 값을 Beans의 static 변수에 저장
			Goods.setOffset(pageData.getOffset());
			Goods.setListCount(pageData.getListCount());
			
			// 데이터 조회하기
			output = goodsService.getGoodsList(input);
			g_detail_a_List = goodsService.getDetailA(input);
			g_detail_b_List = goodsService.getDetailB(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		/** 3) View 처리 */
		model.addAttribute("keyword", keyword);
		model.addAttribute("output", output);
		model.addAttribute("g_detail_a_List", g_detail_a_List);		// 분류1 목록
		model.addAttribute("g_detail_b_List", g_detail_b_List);		// 분류2 목록
		model.addAttribute("g_detail_a", g_detail_a);				// 검색어 분류1
		model.addAttribute("g_detail_b", g_detail_b);				// 검색어 분류2
		model.addAttribute("totalCount", totalCount);				// 전체 게시물 수
		model.addAttribute("pageData", pageData);
		
		return new ModelAndView("lkh/master/master_product_type");
	}
	
	/** 상품판매순위 페이지 확인 */
	@RequestMapping(value="/tranding/master_product_salerank.do", method=RequestMethod.GET)
	public ModelAndView a12(Model model,
			// 검색어
			HttpServletRequest request,
			@RequestParam(value="keyword", required=false) String keyword,
			// 페이지 구현에서 사용할 현재 페이지 번호
			@RequestParam(value="page", defaultValue="1") int nowPage) {
		
		HttpSession session  = request.getSession();
		
		Admins key = (Admins) session.getAttribute("keyA");
		
		model.addAttribute("outputZ",key);
		
		session.setAttribute("keyA", key); 
		
		/** 1) 페이지 구현에 필요한 변수값 생성 */
		int totalCount = 0;			// 전체 게시글 수
		int listCount = 10;			// 한 페이지당 표시할 목록 수
		int pageCount = 5;			// 한 그룹당 표시할 페이지 번호 수
		
		/** 2) 데이터 조회하기 */
		// 조회에 필요한 조건값(검색어)를 Beans에 담는다.
		Goods input = new Goods();
		input.setG_name(keyword);
		
		List<Goods> output = null;		// 조회결과가 저장될 객체
		// --> import study.spring.trspring.helper.PageData;
		PageData pageData = null;			// 페이지 번호를 계산한 결과가 저장될 객체
		
		try {
			// 전체 게시글 수 조회
			totalCount = goodsService.getGoodsCount(input);
			// 페이지 번호 계산 --> 계산결과가 로그로 출력될 것이다.
			pageData = new PageData(nowPage, totalCount, listCount, pageCount);
			
			// SQL의 LIMIT절에서 사용될 값을 Beans의 static 변수에 저장
			Goods.setOffset(pageData.getOffset());
			Goods.setListCount(pageData.getListCount());
			
			// 데이터 조회하기
			output = goodsService.getGoodsList(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		/** 3) View 처리 */
		model.addAttribute("keyword", keyword);
		model.addAttribute("output", output);
		model.addAttribute("pageData", pageData);
		
		return new ModelAndView("lkh/master/master_product_salerank");
	}
	

}
