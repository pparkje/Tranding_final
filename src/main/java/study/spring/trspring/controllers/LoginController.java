package study.spring.trspring.controllers;

import java.io.Reader;
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
import study.spring.trspring.model.Admins;
import study.spring.trspring.model.Goods;
import study.spring.trspring.model.Members;
import study.spring.trspring.service.AdminsService;
import study.spring.trspring.service.GoodsService;
import study.spring.trspring.service.MembersService;

@Controller
public class LoginController {
	@Autowired
	WebHelper webHelper;
	@Autowired
	RegexHelper regexHelper;
	@Autowired
	MembersService membersService;
	@Autowired
	GoodsService goodsService;
	@Autowired
	AdminsService adminsService;

	@Value("#{servletContext.contextPath}")
	String contextPath;
	
	@RequestMapping(value = "/pjh/jsp/login.do", method = RequestMethod.GET)
	public ModelAndView loginpage(Model model) {
		
		return new ModelAndView("pjh/jsp/login");
	}
	
	@RequestMapping(value = "/pjh/jsp/cartpage_login.do", method = RequestMethod.GET)
	public ModelAndView cartpage_loginpage(Model model) {
		
		return new ModelAndView("pjh/jsp/cartpage_login");
	}
	
	@RequestMapping(value = "/pjh/jsp/looking_cartpage_login.do", method = RequestMethod.GET)
	public ModelAndView looking_cartpage_loginpage(Model model,
			HttpServletRequest request,
			@RequestParam(value = "id", defaultValue = "0") int id) {
		
		HttpSession session  = request.getSession();

		Goods goods = (Goods) session.getAttribute("id");

		session.setAttribute("id", goods);
		
		return new ModelAndView("pjh/jsp/looking_cartpage_login");
	}
	
	@RequestMapping(value = "/pjh/jsp/login_ok.do", method = RequestMethod.POST)
	public ModelAndView login_ok(Model model,
			HttpServletRequest request,
			@RequestParam(value = "m_id" , required = false) String m_id,
			@RequestParam(value = "m_pw" , required = false) String m_pw){
		
		//1) 유효성 검사
		if(m_id == null || m_id.equals("")) 				{ return webHelper.redirect(null, "아이디를 입력하세요."); }
		if(m_pw == null || m_pw.equals("")) 				{ return webHelper.redirect(null, "비밀번호를 입력하세요."); }
		

		//2) 데이터 검사
		Members input = new Members();
		input.setM_id(m_id);
		input.setM_pw(m_pw);
		
		Members output = null;
		HttpSession session  = request.getSession();
		
		try {
			int a = membersService.loginCount(input);
			int b = membersService.getMembersCountTal(input);
			
			if( a == 1 && b == 1 ) {
				output = membersService.idItem(input);
			}else {
				return webHelper.redirect(null,"아이디나 비밀번호가 잘못 되었습니다.");
			}
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		//3) 결과 확인 위한 페이지 이동
		model.addAttribute("key",output);
		session.setAttribute("key", output); 
		
		String redirectUrl = contextPath + "/main.do";
		return webHelper.redirect(redirectUrl, "로그인 되었습니다.");
		
	}
	@RequestMapping(value = "/pjh/jsp/logout.do", method = RequestMethod.GET)
	public ModelAndView logout(Model model,
			HttpServletRequest request) {
		
		HttpSession session  = request.getSession();
		session.invalidate();
		
		List<Goods> outputA = null;
		
		try {
			outputA = goodsService.getGoodsListC();
			
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		model.addAttribute("outputA",outputA);
		
		return new ModelAndView("main");
	}
	@RequestMapping(value = "/pjh/jsp/cartpage_login_ok.do", method = RequestMethod.POST)
	public ModelAndView cartpage_login_ok(Model model,
			HttpServletRequest request,
			@RequestParam(value = "m_id" , required = false) String m_id,
			@RequestParam(value = "m_pw" , required = false) String m_pw){
		
		//1) 유효성 검사
		if(m_id == null || m_id.equals("")) 				{ return webHelper.redirect(null, "아이디를 입력하세요."); }
		if(m_pw == null || m_pw.equals("")) 				{ return webHelper.redirect(null, "비밀번호를 입력하세요."); }
		
		//2) 데이터 검사
		Members input = new Members();
		
		input.setM_id(m_id);
		input.setM_pw(m_pw);
		
		Members output = null;
		HttpSession session  = request.getSession();
		
		try {
			int a = membersService.loginCount(input);
			int b = membersService.getMembersCountTal(input);
			
			if( a == 1 && b == 1 ) {
				output = membersService.idItem(input);
			}else {
				return webHelper.redirect(null,"아이디나 비밀번호가 잘못 되었습니다.");
			}
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		//3) 결과 확인 위한 페이지 이동
		model.addAttribute("output",output);
		session.setAttribute("output", output);
		
		String redirectUrl = contextPath + "/cartPage.do";
		
		return webHelper.redirect(redirectUrl, "로그인 되었습니다.");
		
	}
	@RequestMapping(value = "/pjh/jsp/looking_cartpage_login_ok.do", method = RequestMethod.POST)
	public ModelAndView looking_cartpage_login_ok(Model model,
			HttpServletRequest request,
			@RequestParam(value = "m_id" , required = false) String m_id,
			@RequestParam(value = "m_pw" , required = false) String m_pw){
		
		HttpSession session  = request.getSession();
		Goods id = (Goods) session.getAttribute("id");
		
		//1) 유효성 검사
		if(m_id == null || m_id.equals("")) 				{ return webHelper.redirect(null, "아이디를 입력하세요."); }
		if(m_pw == null || m_pw.equals("")) 				{ return webHelper.redirect(null, "비밀번호를 입력하세요."); }
		
		//2) 데이터 검사
		Goods input = new Goods();		
		input.setId(id.getId());
		
		Members inputA = new Members();
		inputA.setM_id(m_id);
		inputA.setM_pw(m_pw);
		
		Goods output = null;
		Members outputA = null;
		
		try {
			
			int a = membersService.loginCount(inputA);
			int b = membersService.getMembersCountTal(inputA);
			
			if( a == 1 && b == 1 ) {
				outputA = membersService.idItem(inputA);
			}else {
				return webHelper.redirect(null,"아이디나 비밀번호가 잘못 되었습니다.");
			}
			
			output = goodsService.getGoodsItem(input);
			
		} catch (Exception e) {
			
			return webHelper.redirect(null, e.getLocalizedMessage());
			
		}
		
		//3) 결과 확인 위한 페이지 이동
		model.addAttribute("output",output);
		session.setAttribute("output", output);
		session.setAttribute("outputA", outputA);
		session.setAttribute("id", output);
		session.setAttribute("key", outputA);
		
		String redirectUrl = contextPath + "/pjh/jsp/looking_look.do?id=" + output.getId();
		
		return webHelper.redirect(redirectUrl, "로그인 되었습니다.");
		
	}
	/** 찜페이지 전용 로그인 페이지 */
	@RequestMapping(value = "/pjh/jsp/favlogin.do", method = RequestMethod.POST)
	public ModelAndView favlogin(Model model) {
		
		return new ModelAndView("pjh/jsp/favlogin");
	}
	@RequestMapping(value = "/pjh/jsp/fav_login_ok.do", method = RequestMethod.POST)
	public ModelAndView fav_login_ok(
			Model model,
			HttpServletRequest request,
			@RequestParam(value = "m_id" , required = false) String m_id,
			@RequestParam(value = "m_pw" , required = false) String m_pw){
		
		HttpSession session  = request.getSession();
		
		//1) 유효성 검사
		if(m_id == null || m_id.equals("")) 				{ return webHelper.redirect(null, "아이디를 입력하세요."); }
		if(m_pw == null || m_pw.equals("")) 				{ return webHelper.redirect(null, "비밀번호를 입력하세요."); }
		
		//2) 데이터 검사
		Members input = new Members();
		
		input.setM_id(m_id);
		input.setM_pw(m_pw);
		
		Members output = null;
		
		try {
			int a = membersService.loginCount(input);
			int b = membersService.getMembersCountTal(input);
			
			if( a == 1 && b == 1 ) {
				output = membersService.idItem(input);
			}else {
				return webHelper.redirect(null,"아이디나 비밀번호가 잘못 되었습니다.");
			}
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		//3) 결과 확인 위한 페이지 이동
		model.addAttribute("key",output);
		session.setAttribute("key", output); 
		
		String redirectUrl = contextPath + "/pjh/jsp/favPagejsp.do";
		
		return webHelper.redirect(redirectUrl, "로그인 되었습니다.");
		
	}
	@RequestMapping(value = "/pjh/jsp/admin_login.do", method = RequestMethod.GET)
	public ModelAndView admin_login(Model model) {
		
		return new ModelAndView("pjh/jsp/admin_login");
	}
	
	@RequestMapping(value = "/pjh/jsp/admin_login_ok.do", method = RequestMethod.POST)
	public ModelAndView admin_login_ok(Model model,
			HttpServletRequest request,
			@RequestParam(value = "a_id" , required = false) String a_id,
			@RequestParam(value = "a_pw" , required = false) String a_pw){
		
		HttpSession session  = request.getSession();
		
		//1) 유효성 검사
		if(a_id == null || a_id.equals("")) 				{ return webHelper.redirect(null, "아이디를 입력하세요."); }
		if(a_pw == null || a_pw.equals("")) 				{ return webHelper.redirect(null, "비밀번호를 입력하세요."); }
		
		//2) 데이터 검사
		Admins input = new Admins();
		input.setA_id(a_id);
		input.setA_pw(a_pw);
		
		Admins output = null;
		
		try {
			int a = adminsService.getAdminsCount(input);
			
			if( a == 1 ) {
				output = adminsService.getAdminsItemLogin(input);
			}else {
				return webHelper.redirect(null,"아이디나 비밀번호가 잘못 되었습니다.");
			}
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		//3) 결과 확인 위한 페이지 이동
		model.addAttribute("outputZ",output);
		session.setAttribute("keyA", output); 
		
		String redirectUrl = contextPath + "/tranding/master_main.do";
		return webHelper.redirect(redirectUrl, "관리자 로그인 되었습니다.");
		
	}
}
