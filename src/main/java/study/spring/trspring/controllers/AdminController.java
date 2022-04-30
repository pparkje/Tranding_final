package study.spring.trspring.controllers;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

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

import study.spring.trspring.helper.MailHelper;
import study.spring.trspring.helper.PageData;
import study.spring.trspring.helper.RegexHelper;
import study.spring.trspring.helper.WebHelper;
import study.spring.trspring.model.Admins;
import study.spring.trspring.model.Email;
import study.spring.trspring.model.Goods;
import study.spring.trspring.model.Members;
import study.spring.trspring.model.Point;
import study.spring.trspring.service.AdminsService;
import study.spring.trspring.service.EmailService;
import study.spring.trspring.service.MembersService;
import study.spring.trspring.service.PointService;

@Controller
public class AdminController {
	@Autowired
	WebHelper webHelper;
	@Autowired
	RegexHelper regexHelper;
	@Autowired
	MailHelper mailhelper;
	@Autowired
	MembersService membersService;
	@Autowired
	PointService pointService;
	@Autowired
	EmailService emailService;
	@Autowired
	AdminsService adminService;

	@Value("#{servletContext.contextPath}")
	String contextPath;
	
	@RequestMapping(value = "/pjh/members/admin_list.do", method = RequestMethod.GET)
	public ModelAndView admin_list(
			Model model,
			HttpServletRequest request,
			@RequestParam(value="keyword" ,required = false) String keyword,
			@RequestParam(value="page" ,defaultValue = "1") int nowPage) {
		
		HttpSession session  = request.getSession();
		
		Admins key = (Admins) session.getAttribute("keyA");
		
		model.addAttribute("outputZ",key);
		
		session.setAttribute("keyA", key); 
		
		int totalCount = 0;
		int listCount = 10;
		int pageCount = 5;
		
		Admins input = new Admins();
		input.setA_id(keyword);
		
		List<Admins> output = null;
		PageData pageData = null;
		
		try {
			totalCount = adminService.getAdminsCount(input);
			
			pageData = new PageData(nowPage, totalCount, listCount, pageCount);
			
			Admins.setOffset(pageData.getOffset());
			Admins.setListCount(pageData.getListCount());
			
			output = adminService.getAdminsList(input);
			
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		model.addAttribute("keyword",keyword);
		model.addAttribute("output",output);
		model.addAttribute("pageData",pageData);
		
		return new ModelAndView("pjh/members/master_members_admin_A");
	}
	
	@RequestMapping(value = "/pjh/members/admin_list_add.do", method = RequestMethod.GET)
	public ModelAndView admin_list_add(
			Model model,
			HttpServletRequest request) {
		
		HttpSession session  = request.getSession();
		
		Admins key = (Admins) session.getAttribute("keyA");
		
		model.addAttribute("outputZ",key);
		
		session.setAttribute("keyA", key); 
		
		return new ModelAndView("pjh/members/master_members_admin_add");
	}
	@RequestMapping(value = "/pjh/members/master_admin_add_ok.do", method = RequestMethod.POST)
	public ModelAndView master_admin_add_ok(
			Model model,
			HttpServletRequest request,
			@RequestParam(value="a_name" ,required = false) String a_name,
			@RequestParam(value="a_id" ,required = false) String a_id,
			@RequestParam(value="a_pw" ,required = false) String a_pw,
			@RequestParam(value="a_email" ,required = false) String a_email) {
		
		HttpSession session  = request.getSession();
		
		Admins key = (Admins) session.getAttribute("keyA");
		
		model.addAttribute("outputZ",key);
		
		session.setAttribute("keyA", key); 
		
		if(a_id.equals("")) 				{ return webHelper.redirect(null, "아이디를 입력하세요."); }
		if(!regexHelper.isEngNum(a_id)) 	{ return webHelper.redirect(null, "아이디는 영어와 숫자로만 가능합니다."); }
		
		if(a_pw.equals("")) 				{ return webHelper.redirect(null, "비밀번호를 입력하세요."); }
		if(!regexHelper.isEngNum(a_pw)) 	{ return webHelper.redirect(null, "비밀번호는 영어와 숫자로만 가능합니다."); }
		
		if(a_name.equals("")) 				{ return webHelper.redirect(null, "이름을 입력하세요."); }
		if(!regexHelper.isKor(a_name)) 		{ return webHelper.redirect(null, "이름은 한글만 가능합니다."); }
		
		if(a_email.equals("")) 				{ return webHelper.redirect(null, "이메일을 입력하세요."); }
		if(!regexHelper.isEmail(a_email)) 	{ return webHelper.redirect(null, "이메일 형식에 맞게 입력해 주세요."); }
		
		Admins input = new Admins();
		input.setA_email(a_email);
		input.setA_id(a_id);
		input.setA_pw(a_pw);
		input.setA_name(a_name);
		
		try {
			
			adminService.addAdmins(input);
			
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		String redirectUrl = contextPath + "/pjh/members/admin_list.do";
		
		return webHelper.redirect(redirectUrl, "관리자가 추가 되었습니다.");
		
	}
	
	@RequestMapping(value = "/pjh/members/admin_view.do", method = RequestMethod.GET)
	public ModelAndView admin_view(
			@RequestParam(value="id", defaultValue = "0") int id,
			Model model,
			HttpServletRequest request) {
		
		HttpSession session  = request.getSession();
		
		Admins key = (Admins) session.getAttribute("keyA");
		
		model.addAttribute("outputZ",key);
		
		session.setAttribute("keyA", key); 
		
		if(id == 0) {
			return webHelper.redirect(null, "관리자 id번호가 없습니다.");
		}
		
		Admins input = new Admins();
		input.setId(id);
		Admins output = null;
		
		try {
			
			output = adminService.getAdminsItem(input);
			
		} catch (Exception e) {
			return webHelper.redirect(null, "관리자 검색에 실패 했습니다.");
		}
		
		model.addAttribute("output",output);
		
		return new ModelAndView("pjh/members/master_members_admin_sujung");
	}
	
	@RequestMapping(value = "/pjh/members/master_admin_edit_ok.do", method = RequestMethod.POST)
	public ModelAndView master_admin_edit_ok(
			Model model,
			HttpServletRequest request,
			@RequestParam(value="id", defaultValue = "0") int id,
			@RequestParam(value="a_name" ,required = false) String a_name,
			@RequestParam(value="a_id" ,required = false) String a_id,
			@RequestParam(value="a_id_A" ,required = false) String a_id_A,
			@RequestParam(value="a_pw" ,required = false) String a_pw,
			@RequestParam(value="a_email" ,required = false) String a_email) {
		
		HttpSession session  = request.getSession();
		
		Admins key = (Admins) session.getAttribute("keyA");
		
		model.addAttribute("outputZ",key);
		
		session.setAttribute("keyA", key); 
		
		if(id == 0) 				{ return webHelper.redirect(null, "관리자 id값 오류 입니다."); }
		
		if(a_id.equals("")) 				{ return webHelper.redirect(null, "아이디를 입력하세요."); }
		if(!regexHelper.isEngNum(a_id)) 	{ return webHelper.redirect(null, "아이디는 영어와 숫자로만 가능합니다."); }
		
		if(a_pw.equals("")) 				{ return webHelper.redirect(null, "비밀번호를 입력하세요."); }
		if(!regexHelper.isEngNum(a_pw)) 	{ return webHelper.redirect(null, "비밀번호는 영어와 숫자로만 가능합니다."); }
		
		if(a_name.equals("")) 				{ return webHelper.redirect(null, "이름을 입력하세요."); }
		if(!regexHelper.isKor(a_name)) 		{ return webHelper.redirect(null, "이름은 한글만 가능합니다."); }
		
		if(a_email.equals("")) 				{ return webHelper.redirect(null, "이메일을 입력하세요."); }
		if(!regexHelper.isEmail(a_email)) 	{ return webHelper.redirect(null, "이메일 형식에 맞게 입력해 주세요."); }
		
		Admins input = new Admins();
		input.setA_id(a_id_A);
		input.setA_pw(a_pw);
		int output = 0;
		
		try {
			
			output = adminService.getAdminsCount(input);
			
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		if(output != 0) {
			
			Admins inputA = new Admins();
			inputA.setId(id);
			inputA.setA_email(a_email);
			inputA.setA_id(a_id);
			inputA.setA_pw(a_pw);
			inputA.setA_name(a_name);
			
			try {
				
				adminService.editAdmins(inputA);
				
			} catch (Exception e) {
				return webHelper.redirect(null, e.getLocalizedMessage());
			}
			
			
		}else {
			return webHelper.redirect(null, "비밀번호를 다시 입력해주세요.");
		}
		
		String redirectUrl = contextPath + "/pjh/members/admin_list.do";
		
		return webHelper.redirect(redirectUrl, "관리자가 수정 되었습니다.");
		
	}
	@RequestMapping(value = "/pjh/members/admin_delete.do", method = RequestMethod.GET)
	public ModelAndView email_delete(Model model,
			@RequestParam(value="id", defaultValue = "0") int id,
			 HttpServletRequest request) {
		
		HttpSession session  = request.getSession();
		
		Admins key = (Admins) session.getAttribute("keyA");
		
		model.addAttribute("outputZ",key);
		
		session.setAttribute("keyA", key); 
		
		if(id == 0) {
			return webHelper.redirect(null, "관리자 id번호가 없습니다.");
		}
		
		Admins input = new Admins();
		input.setId(id);
		
		try {
			
			adminService.deleteAdmins(input);
			
		} catch (Exception e) {
			return webHelper.redirect(null, "관리자 삭제에 실패 했습니다.");
		}
		
		String redirectUrl = contextPath + "/pjh/members/admin_list.do";
		
		return webHelper.redirect(redirectUrl, "관리자가 삭제 되었습니다.");
	}
}
