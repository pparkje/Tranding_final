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
import study.spring.trspring.service.EmailService;
import study.spring.trspring.service.MembersService;
import study.spring.trspring.service.PointService;

@Controller
public class EmailController {
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

	@Value("#{servletContext.contextPath}")
	String contextPath;
	
	@RequestMapping(value = "/pjh/members/email_list.do", method = RequestMethod.GET)
	public ModelAndView email_list(
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
		
		Email input = new Email();
		input.setE_men(keyword);
		
		List<Email> output = null;
		PageData pageData = null;
		
		try {
			totalCount = emailService.getEmailCount(input);
			
			pageData = new PageData(nowPage, totalCount, listCount, pageCount);
			
			Email.setOffset(pageData.getOffset());
			Email.setListCount(pageData.getListCount());
			
			output = emailService.getEmailList(input);
			
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		model.addAttribute("keyword",keyword);
		model.addAttribute("output",output);
		model.addAttribute("pageData",pageData);
		
		return new ModelAndView("pjh/members/master_members_email");
	}
	
	@RequestMapping(value = "/pjh/members/email_list_add.do", method = RequestMethod.GET)
	public ModelAndView email_list_add(
			Model model,
			HttpServletRequest request,
			@RequestParam(value="keyword" ,required = false) String keyword,
			@RequestParam(value="page" ,defaultValue = "1") int nowPage) {
		
		HttpSession session  = request.getSession();
		
		Admins key = (Admins) session.getAttribute("keyA");
		
		model.addAttribute("outputZ",key);
		
		session.setAttribute("keyA", key); 
		
		return new ModelAndView("pjh/members/master_members_email_add");
	}
	
	@RequestMapping(value = "/pjh/members/email_list_add_ok.do", method = RequestMethod.POST)
	public ModelAndView email_list_add_ok(Model model,
			@RequestParam(value = "all_or_mid" , required = false) String all_or_mid,
			@RequestParam(value = "email" , required = false) String email,
			@RequestParam(value = "subject" , required = false) String subject,
			@RequestParam(value = "cont" , required = false) String cont,
			 HttpServletRequest request) {
		
		HttpSession session  = request.getSession();
		
		Admins key = (Admins) session.getAttribute("keyA");
		
		model.addAttribute("outputZ",key);
		
		session.setAttribute("keyA", key); 
		
		if(all_or_mid == null) {
			return webHelper.redirect(null, "???????????? ??????????????????.");
		}
		if(email == null) {
			return webHelper.redirect(null, "email??? ??????????????????.");
		}
		if(subject == null) {
			return webHelper.redirect(null, "????????? ??????????????????.");
		}
		if(cont == null) {
			return webHelper.redirect(null, "????????? ??????????????????.");
		}
		
		try {
			
			mailhelper.sendMail(email, subject, cont);
			
		} catch (Exception e) {
			return webHelper.redirect(null, "?????? ????????? ?????? ????????????.");
		}
		
		SimpleDateFormat format1 = new SimpleDateFormat ( "yyyy-MM-dd HH:mm:ss");
		Date time = new Date();
		String time1 = format1.format(time);
		
		Email inputA = new Email();
		inputA.setE_sub(subject);
		inputA.setE_cont(cont);
		inputA.setE_wdate(time1);
		inputA.setE_sdate(time1);
		inputA.setE_men(all_or_mid);
		inputA.setE_passcode(null);
		
		try {
			
			emailService.addEmail(inputA);
			
		} catch (Exception e) {
			return webHelper.redirect(null, "????????? ?????? ?????? ?????????.");
		}
		
		String redirectUrl = contextPath + "/pjh/members/email_list.do";
		
		return webHelper.redirect(redirectUrl, "????????? ?????? ???????????????.");
	}
	
	@RequestMapping(value = "/pjh/members/email_delete.do", method = RequestMethod.GET)
	public ModelAndView email_delete(Model model,
			@RequestParam(value="id", defaultValue = "0") int id,
			 HttpServletRequest request) {
		
		HttpSession session  = request.getSession();
		
		Admins key = (Admins) session.getAttribute("keyA");
		
		model.addAttribute("outputZ",key);
		
		session.setAttribute("keyA", key); 
		
		if(id == 0) {
			return webHelper.redirect(null, "????????? id????????? ????????????.");
		}
		
		Email input = new Email();
		input.setId(id);
		
		try {
			
			emailService.deleteEmail(input);
			
		} catch (Exception e) {
			return webHelper.redirect(null, "??????????????? ????????? ?????? ????????????.");
		}
		
		String redirectUrl = contextPath + "/pjh/members/email_list.do";
		
		return webHelper.redirect(redirectUrl, "??????????????? ?????? ???????????????.");
	}
	
	@RequestMapping(value = "/pjh/members/email_view.do", method = RequestMethod.GET)
	public ModelAndView email_view(Model model,
			@RequestParam(value="id", defaultValue = "0") int id,
			 HttpServletRequest request) {
		
		HttpSession session  = request.getSession();
		
		Admins key = (Admins) session.getAttribute("keyA");
		
		model.addAttribute("outputZ",key);
		
		session.setAttribute("keyA", key); 
		
		if(id == 0) {
			return webHelper.redirect(null, "????????? id????????? ????????????.");
		}
		
		Email input = new Email();
		input.setId(id);
		Email output = null;
		
		try {
			
			output = emailService.getEmailItem(input);
			
		} catch (Exception e) {
			return webHelper.redirect(null, "??????????????? ????????? ?????? ????????????.");
		}
		
		if( !(output.getE_men().equals("all")) ) {
			Members inputA = new Members();
			inputA.setM_id(output.getE_men());
			Members outputA = null;
			
			try {
				
				outputA = membersService.getMembersItem(inputA);
				
			} catch (Exception e) {
				return webHelper.redirect(null, "??????????????? ????????? ?????? ????????????.");
			}
			model.addAttribute("outputA",outputA.getM_email());
		}else {
			String outputA = "???????????? ?????????";
			model.addAttribute("outputA",outputA);
		}
		
		model.addAttribute("output",output);
		
		
		return new ModelAndView("pjh/members/master_members_email_view");
	}
	
	@RequestMapping(value = "/pjh/members/email_list_update_ok.do", method = RequestMethod.POST)
	public ModelAndView email_list_update_ok(Model model,
			@RequestParam(value="id", defaultValue = "0") int id,
			@RequestParam(value = "all_or_mid" , required = false) String all_or_mid,
			@RequestParam(value = "email" , required = false) String email,
			@RequestParam(value = "subject" , required = false) String subject,
			@RequestParam(value = "cont" , required = false) String cont,
			@RequestParam(value = "key_value" , required = false) String key_value,
			 HttpServletRequest request) {
		
		HttpSession session  = request.getSession();
		
		Admins key = (Admins) session.getAttribute("keyA");
		
		model.addAttribute("outputZ",key);
		
		session.setAttribute("keyA", key); 
		
		if(all_or_mid == null) {
			return webHelper.redirect(null, "???????????? ??????????????????.");
		}
		if(email == null) {
			return webHelper.redirect(null, "email??? ??????????????????.");
		}
		if(subject == null) {
			return webHelper.redirect(null, "????????? ??????????????????.");
		}
		if(cont == null) {
			return webHelper.redirect(null, "????????? ??????????????????.");
		}
		if(key_value == null) {
			return webHelper.redirect(null, "???????????? ???????????? ??????????????????. ????????? ??????????????? 'NO'?????? ???????????????.");
		}
		
		if( !(email.equals("all")) ) {
			try {
				
				mailhelper.sendMail(email, subject, cont);
				
			} catch (Exception e) {
				return webHelper.redirect(null, "?????? ????????? ?????? ????????????.");
			}
		}
		
		SimpleDateFormat format1 = new SimpleDateFormat ( "yyyy-MM-dd HH:mm:ss");
		Date time = new Date();
		String time1 = format1.format(time);
		
		Email inputA = new Email();
		inputA.setId(id);
		inputA.setE_sub(subject);
		inputA.setE_cont(cont);
		inputA.setE_wdate(time1);
		inputA.setE_sdate(time1);
		inputA.setE_men(all_or_mid);
		inputA.setE_passcode(key_value);
		
		try {
			
			emailService.editEmail(inputA);
			
		} catch (Exception e) {
			return webHelper.redirect(null, "????????? ?????? ?????? ?????? ?????????.");
		}
		
		String redirectUrl = contextPath + "/pjh/members/email_list.do";
		
		return webHelper.redirect(redirectUrl, "????????? ????????? ???????????? ????????? ?????? ???????????????.");
	}
	
}
