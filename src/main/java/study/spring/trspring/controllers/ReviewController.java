package study.spring.trspring.controllers;

import java.io.File;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import study.spring.trspring.helper.UploadItem;
import study.spring.trspring.helper.PageData;
import study.spring.trspring.helper.RegexHelper;
import study.spring.trspring.helper.WebHelper;
import study.spring.trspring.model.Goods;
import study.spring.trspring.model.Members;
import study.spring.trspring.model.Review;
import study.spring.trspring.service.GoodsService;
import study.spring.trspring.service.MembersService;
import study.spring.trspring.service.ReviewService;

@Controller
public class ReviewController {
	@Autowired
	WebHelper webHelper;
	@Autowired
	RegexHelper regexHelper;
	@Autowired
	MembersService membersService;
	@Autowired
	GoodsService goodsService;

	@Autowired
	ReviewService reviewService;
	
	@Value("#{servletContext.contextPath}")
	String contextPath;
	

	@RequestMapping(value = "/pjh/jsp/review_plus.do", method = RequestMethod.GET)
	public ModelAndView review_plus(Model model,
			 HttpServletRequest request ) {
		
		HttpSession session  = request.getSession();
		
		Members members = (Members) session.getAttribute("key");

		Members input = new Members();
		input.setId(members.getId());
		Members output = null;
		try {
			
			output = membersService.getMembersItem(input);
			
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		
		session.setAttribute("key", output);
		model.addAttribute("output",output);
		
		return new ModelAndView("pjh/jsp/review_plus");
	}
	
	@RequestMapping(value = "/pjh/jsp/review_plus_ok.do", method = RequestMethod.POST)
	public ModelAndView review_plus_ok(Model model,
			 HttpServletRequest request,
			 @RequestParam(value = "m_id" , required = false) String m_id,
			 @RequestParam(value = "review_subject" , required = false) String review_subject,
			 @RequestParam(value = "review_name" , required = false) String review_name,
			 @RequestParam(value = "review_brand" , required = false) String review_brand,
			 @RequestParam(value = "review_contents" , required = false) String review_contents,
			 @RequestParam(required = false) MultipartFile picture_review) {
		
		if(m_id == null ) 	{ return webHelper.redirect(null, "아이디 인식 오류입니다."); }
		if(review_subject == null ) 	{ return webHelper.redirect(null, "리뷰 제목을 입력해 주세요."); }
		if(review_name == null ) 	{ return webHelper.redirect(null, "상품 이름을 입력해주세요."); }
		if(review_brand == null ) 	{ return webHelper.redirect(null, "상품 브랜드를 입력해 주세요."); }
		if(review_contents == null ) 	{ return webHelper.redirect(null, "리뷰 내용을 입력해 주세요."); }
		
		HttpSession session  = request.getSession();
		
		UploadItem item = null;
		
		try {
			item = webHelper.saveMultipartFile(picture_review);
		} catch (NullPointerException e) {
			e.printStackTrace();
			return webHelper.redirect(null, "업로드 된 파일이 없습니다.");
		}catch (Exception e) {
			e.printStackTrace();
			return webHelper.redirect(null, "업로드에 실패 했습니다.");
		}
		
		Members members = (Members) session.getAttribute("key");

		Members input = new Members();
		input.setId(members.getId());
		Members output = null;
		
		try {
			output = membersService.getMembersItem(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		String ABC = item.getFilePath();
		int DEF = ABC.lastIndexOf("/");
		String src = ABC.substring(DEF+1);
		Review inputA = new Review();
		inputA.setR_brand(review_brand);
		inputA.setR_m_id(m_id);
		inputA.setR_sub(review_subject);
		inputA.setR_name(review_name);
		inputA.setR_cont(review_contents);
		inputA.setR_img(src);
		int outputA = 0;
		
		try {
			reviewService.addReview(inputA);
			outputA = inputA.getId();
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		session.setAttribute("key", output);
		model.addAttribute("output",output);
		model.addAttribute("outputA",outputA);
		model.addAttribute("item",item);
		
		String redirectUrl = contextPath + "/pjh/jsp/review_info.do?outputA=" + outputA;
		
		return webHelper.redirect(redirectUrl, "리뷰 작성이 완료되었습니다.");
	}
	
	@RequestMapping(value = "/pjh/jsp/review_info.do", method = RequestMethod.GET)
	public ModelAndView review_info(Model model,
			 HttpServletRequest request,
			 @RequestParam(value = "outputA", defaultValue = "0") int outputA) {
		
		HttpSession session  = request.getSession();
		
		Members members = (Members) session.getAttribute("key");
		
		Review input = new Review();
		input.setId(outputA);
		Review output = null;
		try {
			output = reviewService.getReviewItem(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		model.addAttribute("output",output);
		session.setAttribute("key", members);
		
		return new ModelAndView("pjh/jsp/review_info");
	}
	
}
