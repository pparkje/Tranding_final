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
import study.spring.trspring.model.Payment;
import study.spring.trspring.model.Point;
import study.spring.trspring.service.AdminsService;
import study.spring.trspring.service.EmailService;
import study.spring.trspring.service.MembersService;
import study.spring.trspring.service.PaymentService;
import study.spring.trspring.service.PointService;

@Controller
public class PaymentController {
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
	@Autowired
	PaymentService paymentService;

	@Value("#{servletContext.contextPath}")
	String contextPath;
	
	@RequestMapping(value = "/pjh/members/cash_list.do", method = RequestMethod.GET)
	public ModelAndView cash_list(
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
		
		Payment input = new Payment();
		input.setP_pay_name(keyword);
		
		List<Payment> output = null;
		PageData pageData = null;
		
		try {
			totalCount = paymentService.getPaymentCount(input);
			
			pageData = new PageData(nowPage, totalCount, listCount, pageCount);
			
			Payment.setOffset(pageData.getOffset());
			Payment.setListCount(pageData.getListCount());
			
			output = paymentService.getPaymentList(input);
			
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		model.addAttribute("keyword",keyword);
		model.addAttribute("output",output);
		model.addAttribute("pageData",pageData);
		
		return new ModelAndView("pjh/members/master_members_cash");
	}
	
	@RequestMapping(value = "/pjh/members/cash_view.do", method = RequestMethod.GET)
	public ModelAndView admin_view(
			@RequestParam(value="id", defaultValue = "0") int id,
			Model model,
			HttpServletRequest request) {
		
		HttpSession session  = request.getSession();
		
		Admins key = (Admins) session.getAttribute("keyA");
		
		model.addAttribute("outputZ",key);
		
		session.setAttribute("keyA", key); 
		
		if(id == 0) {
			return webHelper.redirect(null, "결제내역 id번호가 없습니다.");
		}
		
		Payment input = new Payment();
		input.setId(id);
		Payment output = null;
		
		try {
			
			output = paymentService.getPaymentItem(input);
			
		} catch (Exception e) {
			return webHelper.redirect(null, "결제내역 검색에 실패 했습니다.");
		}
		
		model.addAttribute("output",output);
		
		return new ModelAndView("pjh/members/master_members_cash_view");
	}
	
	@RequestMapping(value = "/pjh/members/master_cash_edit_ok.do", method = RequestMethod.POST)
	public ModelAndView master_cash_edit_ok(
			Model model,
			HttpServletRequest request,
			@RequestParam(value="id", defaultValue = "0") int id,
			@RequestParam(value="p_num" ,required = false) String p_num,
			@RequestParam(value="p_inputdate" ,required = false) String p_inputdate,
			@RequestParam(value="p_point_a", defaultValue = "0") int p_point_a,
			@RequestParam(value="p_cancle_money", defaultValue = "0") int p_cancle_money,
			@RequestParam(value="p_smoney", defaultValue = "0") int p_smoney,
			@RequestParam(value="p_memo" ,required = false) String p_memo,
			@RequestParam(value="p_bank" ,required = false) String p_bank,
			@RequestParam(value="p_pay" ,required = false) String p_pay,
			@RequestParam(value="p_pay_name" ,required = false) String p_pay_name,
			@RequestParam(value="p_all_money", defaultValue = "0") int p_all_money,
			@RequestParam(value="p_pay_yes" ,required = false) String p_pay_yes,
			@RequestParam(value="p_cancle" ,required = false) String p_cancle,
			@RequestParam(value="p_o_id", defaultValue = "0") int p_o_id,
			@RequestParam(value="p_m_id" ,required = false) String p_m_id,
			@RequestParam(value="p_g_id" ,required = false) String p_g_id) {
		
		HttpSession session  = request.getSession();
		
		Admins key = (Admins) session.getAttribute("keyA");
		
		model.addAttribute("outputZ",key);
		
		session.setAttribute("keyA", key); 
		
		if(id == 0) 				{ return webHelper.redirect(null, "관리자 id값 오류 입니다."); }
		
		int A = (int) (p_all_money * 0.9);
		int B = (int) (p_all_money * 0.1);
		
		Payment input = new Payment();
		input.setId(id);
		input.setP_num(p_num);
		input.setP_inputdate(p_inputdate);
		input.setP_money_a(A);
		input.setP_money_b(B);
		input.setP_point_a(p_point_a);
		input.setP_cancle_money(p_cancle_money);
		input.setP_smoney(p_smoney);
		input.setP_memo(p_memo);
		input.setP_bank(p_bank);
		input.setP_pay(p_pay);
		input.setP_pay_name(p_pay_name);
		input.setP_all_money(p_all_money);
		input.setP_m_id(p_m_id);
		input.setP_pay_yes(p_pay_yes);
		input.setP_g_id(p_g_id);
		input.setP_cancle(p_cancle);
		input.setP_o_id(p_o_id);
		
		try {
			
			 paymentService.editPayment(input);
			
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		String redirectUrl = contextPath + "/pjh/members/cash_list.do";
		
		return webHelper.redirect(redirectUrl, "결제정보가 수정 되었습니다.");
		
	}
	@RequestMapping(value = "/pjh/members/cash_delete.do", method = RequestMethod.GET)
	public ModelAndView cash_delete(Model model,
			@RequestParam(value="id", defaultValue = "0") int id,
			 HttpServletRequest request) {
		
		HttpSession session  = request.getSession();
		
		Admins key = (Admins) session.getAttribute("keyA");
		
		model.addAttribute("outputZ",key);
		
		session.setAttribute("keyA", key); 
		
		if(id == 0) {
			return webHelper.redirect(null, "결제내역 id번호가 없습니다.");
		}
		
		Payment input = new Payment();
		input.setId(id);
		
		try {
			
			paymentService.deletePayment(input);
			
		} catch (Exception e) {
			return webHelper.redirect(null, "결제내역 삭제에 실패 했습니다.");
		}
		
		String redirectUrl = contextPath + "/pjh/members/cash_list.do";
		
		return webHelper.redirect(redirectUrl, "결제내역이 삭제 되었습니다.");
	}
}
