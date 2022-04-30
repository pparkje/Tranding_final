package study.spring.trspring.controllers;

import java.util.List;

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
import study.spring.trspring.model.News;
import study.spring.trspring.model.Qna;
import study.spring.trspring.service.GoodsService;
import study.spring.trspring.service.NewsService;
import study.spring.trspring.service.QnaService;

@Controller
public class LkhUserController {
	
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
	QnaService qnaService;
	
	@Autowired
	NewsService newsService;
	
	/** "/프로젝트이름" 에 해당하는 ContextPath 변수 주입 */
	// --> import org.springframework.beans.factory.annotation.Value;
	@Value("#{servletContext.contextPath}")
	String contextPath;
	
	// 사용자 페이지 ====================================================================
	
	/** 랭크 페이지 확인 */
	@RequestMapping(value="/tranding/rank_page.do", method=RequestMethod.GET)
	public ModelAndView a1(Model model,
			@RequestParam(value="g_detail_a1", required=false) String g_detail_a1,
			@RequestParam(value="g_detail_a2", required=false) String g_detail_a2) {
		
		/** 2) 데이터 조회하기 */
		// 조회에 필요한 조건값(검색어)를 Beans에 담는다.
		Goods input1 = new Goods();
		input1.setG_detail_a(g_detail_a1);
		
		Goods input2 = new Goods();
		input2.setG_detail_a(g_detail_a2);
		
		List<Goods> output1 = null;		        // 조회결과가 저장될 객체1
		List<Goods> output2 = null;		        // 조회결과가 저장될 객체2
		
		try {
			// 데이터 조회하기
			output1 = goodsService.getGoodsList(input1);
			output2 = goodsService.getGcount(input2);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		
		/** 3) View 처리 */
		model.addAttribute("output1", output1);
		model.addAttribute("output2", output2);
		model.addAttribute("g_detail_a1", g_detail_a1);
		model.addAttribute("g_detail_a2", g_detail_a2);
		
		return new ModelAndView("lkh/rank/rank_page");
	}
	
	/** 베스트상품 페이지 확인 */
	@RequestMapping(value="/tranding/rank_best_product.do", method=RequestMethod.GET)
	public ModelAndView a2(Model model,
			@RequestParam(value="g_detail_a", required=false) String g_detail_a) {
		
		/** 2) 데이터 조회하기 */
		// 조회에 필요한 조건값(검색어)를 Beans에 담는다.
		Goods input = new Goods();
		input.setG_detail_a(g_detail_a);
		input.setListCount(0);					// static으로 설정되어있어 다른페이지에서 10개 항목조회했을 때 고정으로 입력되어있기 때문에 초기화해주는 셋팅
		
		List<Goods> output = null;		        // 조회결과가 저장될 객체1
		
		try {
			// 데이터 조회하기
			output = goodsService.getGoodsList(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		/** 3) View 처리 */
		model.addAttribute("output", output);
		model.addAttribute("g_detail_a", g_detail_a);
		
		return new ModelAndView("lkh/rank/rank_best_product");
	}
	
	/** 고객센터 공지사항 페이지 확인 */
	@RequestMapping(value="/tranding/customer_service_notice.do", method=RequestMethod.GET)
	public ModelAndView a4(Model model,
			// 검색어
			@RequestParam(value="n_subject", required=false) String n_subject,
			@RequestParam(value="n_cont", required=false) String n_cont,
			@RequestParam(value="keyword", required=false) String keyword,
			// 페이지 구현에서 사용할 현재 페이지 번호
			@RequestParam(value="page", defaultValue="1") int nowPage) {
		
		/** 1) 페이지 구현에 필요한 변수값 생성 */
		int totalCount = 0;			// 전체 게시글 수
		int listCount = 5;			// 한 페이지당 표시할 목록 수
		int pageCount = 5;			// 한 그룹당 표시할 페이지 번호 수
		
		/** 2) 데이터 조회하기 */
		// 조회에 필요한 조건값(검색어)를 Beans에 담는다.
		News input = new News();
		input.setN_subject(n_subject);
		input.setN_cont(n_cont);
		input.setN_cont(keyword);
		input.setN_subject(keyword);
		
		List<News> output = null;		        // 조회결과가 저장될 객체
		// --> import study.spring.trspring.helper.PageData;
		PageData pageData = null;			// 페이지 번호를 계산한 결과가 저장될 객체
		
		try {
			// 전체 게시글 수 조회
			totalCount = newsService.getNewsCount(input);
			// 페이지 번호 계산 --> 계산결과가 로그로 출력될 것이다.
			pageData = new PageData(nowPage, totalCount, listCount, pageCount);
			
			// SQL의 LIMIT절에서 사용될 값을 Beans의 static 변수에 저장
			News.setOffset(pageData.getOffset());
			News.setListCount(pageData.getListCount());
			
			// 데이터 조회하기
			output = newsService.getNewsList(input);
			
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		/** 3) View 처리 */
		model.addAttribute("keyword", keyword);
		model.addAttribute("output", output);
		model.addAttribute("pageData", pageData);
		
		return new ModelAndView("lkh/customer/customer_service_notice");
	}
	
	/** 고객센터 자주묻는질문 페이지 확인 */
	@RequestMapping(value="/tranding/customer_service_question.do", method=RequestMethod.GET)
	public ModelAndView a5(Model model,
			// 검색어
			@RequestParam(value="q_pname", required=false) String q_pname,
			@RequestParam(value="q_cont", required=false) String q_cont,
			@RequestParam(value="keyword", required=false) String keyword,
			// 페이지 구현에서 사용할 현재 페이지 번호
			@RequestParam(value="page", defaultValue="1") int nowPage) {
		
		/** 1) 페이지 구현에 필요한 변수값 생성 */
		int totalCount = 0;			// 전체 게시글 수
		int listCount = 5;			// 한 페이지당 표시할 목록 수
		int pageCount = 5;			// 한 그룹당 표시할 페이지 번호 수
		
		/** 2) 데이터 조회하기 */
		// 조회에 필요한 조건값(검색어)를 Beans에 담는다.
		Qna input = new Qna();
		input.setQ_pname(q_pname);
		input.setQ_cont(q_cont);
		input.setQ_subject(keyword);
		input.setQ_pname(keyword);
		
		List<Qna> output = null;		        // 조회결과가 저장될 객체
		// --> import study.spring.trspring.helper.PageData;
		PageData pageData = null;			// 페이지 번호를 계산한 결과가 저장될 객체
		
		try {
			// 전체 게시글 수 조회
			totalCount = qnaService.getQnaCount(input);
			// 페이지 번호 계산 --> 계산결과가 로그로 출력될 것이다.
			pageData = new PageData(nowPage, totalCount, listCount, pageCount);
			
			// SQL의 LIMIT절에서 사용될 값을 Beans의 static 변수에 저장
			Qna.setOffset(pageData.getOffset());
			Qna.setListCount(pageData.getListCount());
			
			// 데이터 조회하기
			output = qnaService.getQnaList(input);
			
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		/** 3) View 처리 */
		model.addAttribute("keyword", keyword);
		model.addAttribute("output", output);
		model.addAttribute("pageData", pageData);
		
		return new ModelAndView("lkh/customer/customer_service_question");
	}
	
	/** 질문입력 페이지 확인 */
	@RequestMapping(value="/tranding/customer_service_question_insert.do", method=RequestMethod.GET)
	public ModelAndView a6(Model model,
			@RequestParam(value="id", defaultValue="0") int id) {

//			/** 사용자의 id값 들어오는 id가 없는 경우 */
//			if(id == 0) { return webHelper.redirect(null, "글쓰기는 로그인 후 사용가능합니다."); }

		/** 2) 데이터 조회하기 */
		// 조회에 필요한 조건값(검색어)를 Beans에 담는다.
		Qna input = new Qna();
		input.setM_id(id);
		
		List<Qna> output = null;		        // 조회결과가 저장될 객체
		
		try {

			// 데이터 조회하기
			output = qnaService.getQnaJoinList(input);
			
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		model.addAttribute("output", output);
		
		return new ModelAndView("lkh/customer/customer_service_question_insert");
	}
	
	/** 질문입력 action 페이지 확인 */
	@RequestMapping(value="/tranding/customer_service_question_insert_ok.do", method=RequestMethod.POST)
	public ModelAndView a7(Model model,
			@RequestParam(value="q_pname", required=false) String q_pname,
			@RequestParam(value="q_cont", required=false) String q_cont,
			@RequestParam(value="q_subject", required=false) String q_subject,
			@RequestParam(value="m_id", defaultValue="0") int m_id) {
		
		/** 입력할 때 답변 여부를 N으로 저장 */
		String q_answer_ch = "N";
		
		Qna input = new Qna();
		input.setQ_pname(q_pname);
		input.setQ_cont(q_cont);
		input.setQ_subject(q_subject);
		input.setQ_answer_ch(q_answer_ch);
		input.setM_id(m_id);

		try {

			// 데이터 저장하기
			qnaService.addQna(input);
			
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		/** 3) 페이지 이동 */
		// 확인할 대상이 삭제된 상태이므로 목록 페이지로 이동
		return webHelper.redirect(contextPath + "/tranding/customer_service_question.do", "입력되었습니다.");
	}
	
	/** 질문 상세 확인 페이지 */
	@RequestMapping(value="/tranding/customer_service_question_detail.do", method=RequestMethod.GET)
	public ModelAndView a8(Model model,
			@RequestParam(value="id", defaultValue="0") int id) {
		
		/** 2) 데이터 조회하기 */
		// 조회에 필요한 조건값(검색어)를 Beans에 담는다.
		Qna input = new Qna();
		input.setId(id);
		
		Qna output = null;		        // 조회결과가 저장될 객체
		
		try {

			// 데이터 조회하기
			output = qnaService.getQnaJoinItem(input);
			
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		/** 01012345678 형식을 010-1234-5678 로 바꿔주고 저장  */
		String phone = output.getM_phone().substring(0, 3) + "-" + output.getM_phone().substring(3, 7) + "-" + output.getM_phone().substring(7, 11);
		output.setM_phone(phone);
		
		model.addAttribute("output", output);
		
		return new ModelAndView("lkh/customer/customer_service_question_detail");
	}
	
	/** 질문삭제 action 페이지 확인 */
	@RequestMapping(value="/tranding/customer_service_question_detail_ok.do", method=RequestMethod.GET)
	public ModelAndView a9(Model model,
			@RequestParam(value="id", defaultValue="0") int id) {
		
		/** 1) 파라미터 유효성 검사 */
		// 이 값이 존재하지 않는다면 데이터 삭제가 불가능하므로 반드시 필수값으로 처리해야 한다.
		if (id == 0) {
			return webHelper.redirect(null, "문의 번호가 없습니다.");
		}
		
		/** 2) 데이터 삭제하기 */
		// 데이터 삭제에 필요한 조건값을 Beans에 저장하기
		Qna input = new Qna();
		input.setId(id);
		
		try {
			qnaService.deleteQna(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		/** 3) 페이지 이동 */
		// 확인할 대상이 삭제된 상태이므로 목록 페이지로 이동
		return webHelper.redirect(contextPath + "/tranding/customer_service_question.do", "삭제되었습니다.");
	}
	
	/** 질문 수정 페이지 */
	@RequestMapping(value="/tranding/customer_service_question_update.do", method=RequestMethod.GET)
	public ModelAndView a10(Model model,
			@RequestParam(value="id", defaultValue="0") int id) {
		
		/** 2) 데이터 조회하기 */
		// 조회에 필요한 조건값(검색어)를 Beans에 담는다.
		Qna input = new Qna();
		input.setId(id);
		
		Qna output = null;		        // 조회결과가 저장될 객체
		
		try {

			// 데이터 조회하기
			output = qnaService.getQnaJoinItem(input);
			
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		/** 01012345678 형식을 010-1234-5678 로 바꿔주고 저장  */
		String phone = output.getM_phone().substring(0, 3) + "-" + output.getM_phone().substring(3, 7) + "-" + output.getM_phone().substring(7, 11);
		output.setM_phone(phone);
		
		model.addAttribute("output", output);
		
		return new ModelAndView("lkh/customer/customer_service_question_update");
	}
	
	/** 질문입력 action 페이지 확인 */
	@RequestMapping(value="/tranding/customer_service_question_update_ok.do", method=RequestMethod.POST)
	public ModelAndView a11(Model model,
			@RequestParam(value="q_pname", required=false) String q_pname,
			@RequestParam(value="q_cont", required=false) String q_cont,
			@RequestParam(value="q_subject", required=false) String q_subject,
			@RequestParam(value="q_answer_ch", required=false) String q_answer_ch,
			@RequestParam(value="id", defaultValue="0") int id) {
		
		
		Qna input = new Qna();
		input.setQ_pname(q_pname);
		input.setQ_cont(q_cont);
		input.setQ_subject(q_subject);
		input.setQ_answer_ch(q_answer_ch);
		input.setId(id);

		try {

			// 데이터 저장하기
			qnaService.editQna(input);
			
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		/** 3) 페이지 이동 */
		// 확인할 대상이 삭제된 상태이므로 목록 페이지로 이동
		return webHelper.redirect(contextPath + "/tranding/customer_service_question.do", "수정되었습니다.");
	}
	
}
