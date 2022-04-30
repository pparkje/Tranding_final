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
import study.spring.trspring.model.News;
import study.spring.trspring.service.GoodsService;
import study.spring.trspring.service.MembersService;
import study.spring.trspring.service.NewsService;

@Controller
public class EventController {
	@Autowired
	WebHelper webHelper;
	@Autowired
	RegexHelper regexHelper;
	@Autowired
	MembersService membersService;
	@Autowired
	GoodsService goodsService;
	@Autowired
	NewsService newsService;
	
	@Value("#{servletContext.contextPath}")
	String contextPath;
	

	@RequestMapping(value = "/pjh/jsp/event.do", method = RequestMethod.GET)
	public ModelAndView view(Model model,
			@RequestParam(value = "n_group" , required = false) String n_group,
			@RequestParam(value="keyword", required=false) String keyword,
			@RequestParam(value="page", defaultValue="1") int nowPage,
			 HttpServletRequest request) {
		
		int totalCount = 0;			// 전체 게시글 수
		int listCount = 20;			// 한 페이지당 표시할 목록 수
		int pageCount = 5;			// 한 그룹당 표시할 페이지 번호 수
		
		News input = new News();
		
		PageData pageData = null;			// 페이지 번호를 계산한 결과가 저장될 객체
		
		if(n_group != null) {
			input.setN_group(n_group);
		}
		
		List<News> output = null;
		
		try {
			
			totalCount = newsService.getNewsCount(input);
			// 페이지 번호 계산 --> 계산결과가 로그로 출력될 것이다.
			pageData = new PageData(nowPage, totalCount, listCount, pageCount);
			
			// SQL의 LIMIT절에서 사용될 값을 Beans의 static 변수에 저장
			News.setOffset(pageData.getOffset());
			News.setListCount(pageData.getListCount());
			
			output = newsService.getNewsListEvent(input);
			
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		model.addAttribute("keyword", keyword);
		model.addAttribute("output", output);
		model.addAttribute("pageData", pageData);
		
		return new ModelAndView("pjh/jsp/event");
	}
	
	@RequestMapping(value = "/pjh/jsp/event_contents.do", method = RequestMethod.GET)
	public ModelAndView viewA(Model model,
			@RequestParam(value = "id", defaultValue = "0") int id,
			 HttpServletRequest request) {
		
		News input = new News();
		input.setId(id);
		
		News output = null;
		
		try {
			
			output = newsService.getNewsItem(input);
			
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		model.addAttribute("output", output);
		
		return new ModelAndView("pjh/jsp/eventcontents");
	}
	
}
