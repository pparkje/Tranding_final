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

import study.spring.trspring.helper.PageData;
import study.spring.trspring.helper.RegexHelper;
import study.spring.trspring.helper.UploadItem;
import study.spring.trspring.helper.WebHelper;
import study.spring.trspring.model.Admins;
import study.spring.trspring.model.Goods;
import study.spring.trspring.model.News;
import study.spring.trspring.model.Qna;
import study.spring.trspring.service.NewsService;
import study.spring.trspring.service.QnaService;

@Controller
public class QnaNewsController {
	
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
	QnaService qnaService;
	
	@Autowired
	NewsService newsService;

	/** "/프로젝트이름" 에 해당하는 ContextPath 변수 주입 */
	// --> import org.springframework.beans.factory.annotation.Value;
	@Value("#{servletContext.contextPath}")
	String contextPath;
	
	// 문의, 소식관련===============================
	/** 상품문의 페이지 확인 */
	@RequestMapping(value="/tranding/master_product_question.do", method=RequestMethod.GET)
	public ModelAndView a8(Model model,
			// 검색어
			HttpServletRequest request,
			@RequestParam(value="p_detail", required=false) String p_detail,
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
		Qna input = new Qna();
		// 들어온값이 상품명인지 닉네임인지에 따라 Beans에 담는 변수가 달라짐
		if(!(p_detail == null)) {
			if(p_detail.equals("A")) {
				input.setQ_pname(keyword);
			}else if(p_detail.equals("B")) {
				input.setM_username(keyword);
			}else {
				input.setQ_pname(keyword);
				input.setM_username(keyword);
			}
		}
		
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
			output = qnaService.getQnaJoinList(input);
			
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		/** 3) View 처리 */
		model.addAttribute("keyword", keyword);
		model.addAttribute("output", output);
		model.addAttribute("totalCount", totalCount);				// 전체 게시물 수
		model.addAttribute("p_detail", p_detail);					// 분류 값
		model.addAttribute("pageData", pageData);
		
		return new ModelAndView("lkh/master/master_product_question");
	}
	
	/** 상품문의등록 페이지 확인 */
	@RequestMapping(value="/tranding/master_product_question_insert.do", method=RequestMethod.GET)
	public ModelAndView a7(Model model,
			HttpServletRequest request,
			@RequestParam(value="m_username", required=false) String m_username,
			@RequestParam(value="m_email", required=false) String m_email,
			@RequestParam(value="m_phone", required=false) String m_phone,
			@RequestParam(value="id", defaultValue="0") int id) {
		
HttpSession session  = request.getSession();
		
		Admins key = (Admins) session.getAttribute("keyA");
		
		model.addAttribute("outputZ",key);
		
		session.setAttribute("keyA", key); 
		
		// 전화번호를 000-0000-0000 형식으로 변경
		m_phone = m_phone.substring(0, 3) + "-" + m_phone.substring(3, 7) + "-" + m_phone.substring(7);
		
		Qna input = new Qna();
		input.setId(id);
		
		Qna output = new Qna();
		
		try {
			// 상품 문의 조회
			output = qnaService.getQnaItem(input);
			
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		model.addAttribute("m_username", m_username);
		model.addAttribute("m_email", m_email);
		model.addAttribute("m_phone", m_phone);
		model.addAttribute("output", output);
		
		
		return new ModelAndView("lkh/master/master_product_question_insert");
	}
	
	/** 상품문의등록 action 페이지 */
	@RequestMapping(value="/tranding/master_product_question_insert_ok.do", method=RequestMethod.POST)
	public ModelAndView a19(Model model,
			HttpServletRequest request,
			@RequestParam(value="q_subject", required=false) String q_subject,
			@RequestParam(value="q_answer", required=false) String q_answer,
			@RequestParam(value="q_cont", required=false) String q_cont,
			@RequestParam(value="id", defaultValue="0") int id,
			@RequestParam(value="q_answer_ch", required=false) String q_answer_ch,
			@RequestParam(value="q_pname", required=false) String q_pname,
			@RequestParam(value="q_image", required=false) String q_image) {
		
		HttpSession session  = request.getSession();
		
		Admins key = (Admins) session.getAttribute("keyA");
		
		model.addAttribute("outputZ",key);
		
		session.setAttribute("keyA", key); 
		
		// 답변에 내용이 있다면 Y 답변이 ""공백이라면 N
		if(!q_answer.trim().equals("")) {
			q_answer_ch = "Y";
		}else if(q_answer.trim().equals("")) {
			q_answer_ch = "N";
		}
		
		if(q_image.equals("")) {
			q_image = "NULL";
		}

		Qna input = new Qna();
		input.setQ_subject(q_subject);
		input.setQ_answer(q_answer);
		input.setQ_cont(q_cont);
		input.setId(id);
		input.setQ_pname(q_pname);
		input.setQ_answer_ch(q_answer_ch);
		input.setQ_image(q_image);
		
		try {
			
			// 상품 문의 수정
			qnaService.editQna(input);
			
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		/** 3) 페이지 이동 */
		// 확인할 대상이 삭제된 상태이므로 목록 페이지로 이동
		return webHelper.redirect(contextPath + "/tranding/master_product_question.do", "수정되었습니다.");
		//return new ModelAndView("lkh/master/master_product_question_insert");
	}
	
	/** 상품문의삭제 action 페이지 확인 */
	@RequestMapping(value="/tranding/master_product_question_delete_ok.do", method=RequestMethod.GET)
	public ModelAndView a18(Model model,
			HttpServletRequest request,
			@RequestParam(value="id", defaultValue="0") int id) {
		
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
		Qna input = new Qna();
		input.setId(id);
		
		try {
			qnaService.deleteQna(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		/** 3) 페이지 이동 */
		// 확인할 대상이 삭제된 상태이므로 목록 페이지로 이동
		return webHelper.redirect(contextPath + "/tranding/master_product_question.do", "삭제되었습니다.");
	}
	
	
	/** 소식 페이지 확인 */
	@RequestMapping(value="/tranding/master_question_news.do", method=RequestMethod.GET)
	public ModelAndView a17(Model model,
			// 검색어
			HttpServletRequest request,
			@RequestParam(value="keyword", required=false) String keyword,
			@RequestParam(value="n_group", required=false) String n_group,
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
		News input = new News();
		input.setN_subject(keyword);
		input.setN_group(n_group);
		
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
		model.addAttribute("totalCount", totalCount);				// 전체 게시물 수
		model.addAttribute("n_group", n_group);						// 분류
		model.addAttribute("pageData", pageData);
		
		return new ModelAndView("lkh/master/master_question_news");
	}
	
	/** 소식 입력 페이지 확인 */
	@RequestMapping(value="/tranding/master_question_news_insert.do", method=RequestMethod.GET)
	public String a17(Model model,
			HttpServletRequest request) {
		
HttpSession session  = request.getSession();
		
		Admins key = (Admins) session.getAttribute("keyA");
		
		model.addAttribute("outputZ",key);
		
		session.setAttribute("keyA", key); 
		
		return "lkh/master/master_question_news_insert";
	}
	
	/** 소식 입력 action 페이지 */
	@RequestMapping(value="/tranding/master_question_news_insert_ok.do", method=RequestMethod.POST)
	public ModelAndView a19(Model model,
			HttpServletRequest request,
			@RequestParam(value="n_group", required=false) String n_group,
			@RequestParam(value="n_term1", required=false) String n_term1,
			@RequestParam(value="n_term2", required=false) String n_term2,
			@RequestParam(value="n_subject", required=false) String n_subject,
			@RequestParam(value="n_cont", required=false) String n_cont,
			@RequestParam(required=false) MultipartFile n_image) {
		
HttpSession session  = request.getSession();
		
		Admins key = (Admins) session.getAttribute("keyA");
		
		model.addAttribute("outputZ",key);
		
		session.setAttribute("keyA", key); 
		
		// 일반 문자열 입력 컬럼 --> String으로 파라미터가 선언되어 있는 경우는 값이 입력되지 않으면 빈 문자열로 처리된다.
		// webHelper.redirect 페이지 강제이동인데 null은 이전페이지로 되돌리고 뒤 문자열은 alret으로 뿌려준다.
		if (n_subject.equals("")) 									{ return webHelper.redirect(null, "제목을 입력하세요."); }
		if (n_cont.equals("")) 										{ return webHelper.redirect(null, "내용을 입력하세요."); }
		
		
		/** 이미지 경로를 string으로 담을 변수 */
		String a = null;
		String img1 = null;

		
		/** 1) 업로드 파일 저장하기 */
		if(!n_image.getOriginalFilename().isEmpty()) {
			// 업로드 결과가 저장된 Beans를 리턴받는다.
	        UploadItem item1 = null;
	        try {
	            item1 = webHelper.saveMultipartFile(n_image);
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
        	img1 = "NULL";
        }
		
		// 기간 입력이 둘 중 하나라도 빈문자열이면 "무기한"으로 입력되게 함.
		if(n_term1.equals("") || n_term2.equals("")) {
			n_term1 = "무기한";
			n_term2 = "무기한";
		}
		
		
		/** 2) 데이터 저장하기 */
		// 저장할 값들을 Beans에 담는다.
		News input = new News();
		input.setN_subject(n_subject);
		input.setN_cont(n_cont);
		input.setN_group(n_group);
		input.setN_term1(n_term1);
		input.setN_term2(n_term2);
		input.setN_image(img1);
		
		
		List<News> output = null;		// 조회결과가 저장될 객체
		
		
		try {
			// 데이터 저장
			// --> 데이터 저장에 성공하면 파라미터로 전달하는 input 객체에 PK값이 저장된다.
			// webHelper.redirect 페이지 강제이동인데 null은 이전페이지로 되돌리고 뒤 문자열은 alret으로 뿌려준다.
			newsService.addNews(input);
			
			// 데이터 조회하기
			output = newsService.getNewsList(input);

		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

        /** 4) View 처리 */
        // 업로드 정보를 View로 전달한다.
        model.addAttribute("output", output);
        
		return webHelper.redirect(contextPath + "/tranding/master_question_news.do", "입력되었습니다.");
	}
	
	/** 소식 수정 페이지 확인 */
	@RequestMapping(value="/tranding/master_question_news_update.do", method=RequestMethod.GET)
	public ModelAndView a19(Model model,
			HttpServletRequest request,
			@RequestParam(value="id", defaultValue="0") int id) {
		
HttpSession session  = request.getSession();
		
		Admins key = (Admins) session.getAttribute("keyA");
		
		model.addAttribute("outputZ",key);
		
		session.setAttribute("keyA", key); 
		
		News input = new News();
		input.setId(id);
		
		News output = null;
		
		try {
			// 데이터 조회하기
			output = newsService.getNewsItem(input);

		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		if(output.getN_term1().equals("무기한")) {
			output.setN_term1("");
		}else if(output.getN_term2().equals("무기한")) {
			output.setN_term2("");
		}
		
		/** 4) View 처리 */
        // 업로드 정보를 View로 전달한다.
        model.addAttribute("output", output);
		
		return new ModelAndView("lkh/master/master_question_news_update");
	}
	
	/** 소식 수정 action 페이지 */
	@RequestMapping(value="/tranding/master_question_news_update_ok.do", method=RequestMethod.POST)
	public ModelAndView a20(Model model,
			HttpServletRequest request,
			@RequestParam(value="id", defaultValue="0") int id,
			@RequestParam(value="bf_img", required=false) String bf_img,
			@RequestParam(value="n_group", required=false) String n_group,
			@RequestParam(value="n_term1", required=false) String n_term1,
			@RequestParam(value="n_term2", required=false) String n_term2,
			@RequestParam(value="n_subject", required=false) String n_subject,
			@RequestParam(value="n_cont", required=false) String n_cont,
			@RequestParam(required=false) MultipartFile n_image) {
		
HttpSession session  = request.getSession();
		
		Admins key = (Admins) session.getAttribute("keyA");
		
		model.addAttribute("outputZ",key);
		
		session.setAttribute("keyA", key); 
		
		// 일반 문자열 입력 컬럼 --> String으로 파라미터가 선언되어 있는 경우는 값이 입력되지 않으면 빈 문자열로 처리된다.
		// webHelper.redirect 페이지 강제이동인데 null은 이전페이지로 되돌리고 뒤 문자열은 alret으로 뿌려준다.
		if (n_subject.equals("")) 						{ return webHelper.redirect(null, "제목을 입력하세요."); }
		if (n_cont.equals("")) 							{ return webHelper.redirect(null, "내용을 입력하세요."); }
		
		
		/** 이미지 경로를 string으로 담을 변수 */
		String a = null;
		String img1 = null;

		
		/** 1) 업로드 파일 저장하기 */
		if(!n_image.getOriginalFilename().isEmpty()) {
			// 업로드 결과가 저장된 Beans를 리턴받는다.
	        UploadItem item1 = null;
	        try {
	            item1 = webHelper.saveMultipartFile(n_image);
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
        	img1 = bf_img;
        }
		
		// 기간 입력이 둘 중 하나라도 빈문자열이면 "무기한"으로 입력되게 함.
		if(n_term1.equals("") || n_term2.equals("")) {
			n_term1 = "무기한";
			n_term2 = "무기한";
		}
		
		
		/** 2) 데이터 저장하기 */
		// 저장할 값들을 Beans에 담는다.
		News input = new News();
		input.setId(id);
		input.setN_subject(n_subject);
		input.setN_cont(n_cont);
		input.setN_group(n_group);
		input.setN_term1(n_term1);
		input.setN_term2(n_term2);
		input.setN_image(img1);
		
		
		try {
			// 데이터 수정
			newsService.editNews(input);

		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		return webHelper.redirect(contextPath + "/tranding/master_question_news.do", "수정되었습니다.");
	}
	
	/** 소식삭제 action 페이지 확인 */
	@RequestMapping(value="/tranding/master_question_news_delete_ok.do", method=RequestMethod.GET)
	public ModelAndView a35(Model model,
			HttpServletRequest request,
			@RequestParam(value="id", defaultValue="0") int id) {
		
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
		News input = new News();
		input.setId(id);
		
		try {
			newsService.deleteNews(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		/** 3) 페이지 이동 */
		// 확인할 대상이 삭제된 상태이므로 목록 페이지로 이동
		return webHelper.redirect(contextPath + "/tranding/master_question_news.do", "삭제되었습니다.");
	}
		
	
}
