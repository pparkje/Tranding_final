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
import study.spring.trspring.model.Admins;
import study.spring.trspring.model.Goods;
import study.spring.trspring.model.Members;
import study.spring.trspring.model.Point;
import study.spring.trspring.service.MembersService;
import study.spring.trspring.service.PointService;

@Controller
public class MemberController {
	@Autowired
	WebHelper webHelper;
	@Autowired
	RegexHelper regexHelper;
	@Autowired
	MembersService membersService;
	@Autowired
	PointService pointService;

	@Value("#{servletContext.contextPath}")
	String contextPath;
	
	@RequestMapping(value = "/pjh/members/members_list.do", method = RequestMethod.GET)
	public ModelAndView list(
			Model model,
			HttpServletRequest request,
			@RequestParam(value="keyword" ,required = false) String keyword,
			@RequestParam(value="page" ,defaultValue = "1") int nowPage) {
		
		HttpSession session  = request.getSession();
		Admins key = (Admins) session.getAttribute("keyA");
		
		int totalCount = 0;
		int listCount = 10;
		int pageCount = 5;
		
		Members input = new Members();
		input.setM_name(keyword);

		List<Members> output = null;
		PageData pageData = null;
		
		try {
			totalCount = membersService.getMembersCount(input);
			
			pageData = new PageData(nowPage, totalCount, listCount, pageCount);
			
			Members.setOffset(pageData.getOffset());
			Members.setListCount(pageData.getListCount());
			
			output = membersService.getMembersList(input);
			
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		model.addAttribute("keyword",keyword);
		model.addAttribute("output",output);
		model.addAttribute("pageData",pageData);
		
		model.addAttribute("outputZ",key);
		session.setAttribute("keyA", key); 
		
		return new ModelAndView("pjh/members/members_list");
	}
	
	@RequestMapping(value = "/pjh/members/members_view.do", method = RequestMethod.GET)
	public ModelAndView view(Model model,
			@RequestParam(value="id", defaultValue = "0") int id) {
		
		if(id == 0) {
			return webHelper.redirect(null, "회원 번호가 없습니다.");
		}
		
		Members input = new Members();
		input.setId(id);
		
		Members output = null;
		
		try {
			output = membersService.getMembersItem(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		model.addAttribute("output",output);
		return new ModelAndView("pjh/members/members_view");
	}
	
	@RequestMapping(value = "/pjh/members/members_add.do", method = RequestMethod.GET)
	public ModelAndView add(Model model) {
		
		List<Members> output = null;
		
		try {
			output = membersService.getMembersList(null);
			
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		model.addAttribute("output",output);
		
		return new ModelAndView("pjh/members/members_add");
	}
	
	@RequestMapping(value = "/pjh/members/members_add_ok.do", method = RequestMethod.POST)
	public ModelAndView add_ok(Model model,
			@RequestParam(value = "m_id" , required = false) String m_id,
			@RequestParam(value = "m_pwA" , required = false) String m_pwA,
			@RequestParam(value = "m_pwB" , required = false) String m_pwB,
			@RequestParam(value = "m_name" , required = false) String m_name,
			@RequestParam(value = "m_username" , required = false) String m_username,
			@RequestParam(value = "m_email" , required = false) String m_email,
			@RequestParam(value = "m_phone" , required = false) String m_phone,
			@RequestParam(value = "m_birthday" , required = false) String m_birthday,
			@RequestParam(value = "m_email_agree" , required = false) String m_email_agree,
			@RequestParam(value = "m_address" , required = false) String m_address,
			@RequestParam(value = "m_postcode" , required = false) String m_postcode,
			@RequestParam(value = "m_address_detail" , required = false) String m_address_detail,
			@RequestParam(value = "gender" , required = false) String gender){
		
		//1) 유효성 검사
		if(m_id.equals("")) 				{ return webHelper.redirect(null, "아이디를 입력하세요."); }
		if(!regexHelper.isEngNum(m_id)) 	{ return webHelper.redirect(null, "아이디는 영어와 숫자로만 가능합니다."); }
		
		if(m_pwA.equals("")) 				{ return webHelper.redirect(null, "비밀번호를 입력하세요."); }
		if(!regexHelper.isEngNum(m_pwA)) 	{ return webHelper.redirect(null, "비밀번호는 영어와 숫자로만 가능합니다."); }
		
		String pwA = (String)m_pwA;
		String pwB = (String)m_pwB;
		
		if(!(pwA.equals(pwB))) 						{ return webHelper.redirect(null, "비밀번호를 확인해주세요."); }
		
		if(m_name.equals("")) 				{ return webHelper.redirect(null, "이름을 입력하세요."); }
		if(!regexHelper.isKor(m_name)) 		{ return webHelper.redirect(null, "이름은 한글만 가능합니다."); }
		
		if(m_username.equals("")) 				{ return webHelper.redirect(null, "닉네임을 입력하세요."); }
		if(!regexHelper.isEngNum(m_username)) 	{ return webHelper.redirect(null, "닉네임은 영어와 숫자로만 가능합니다."); }
		
		if(m_email.equals("")) 				{ return webHelper.redirect(null, "이메일을 입력하세요."); }
		if(!regexHelper.isEmail(m_email)) 	{ return webHelper.redirect(null, "이메일 형식에 맞게 입력해 주세요."); }
		
		if(m_phone.equals("")) 						{ return webHelper.redirect(null, "휴대폰번호를 입력하세요."); }
		if(!regexHelper.isCellPhone(m_phone)) 		{ return webHelper.redirect(null, "휴대폰번호를 (-)없이 다시 입력해주세요."); }
		
		if(m_birthday.equals("")) 				{ return webHelper.redirect(null, "생년월일을 입력하세요."); }
		
		if(m_email_agree.equals("")) 				{ return webHelper.redirect(null, "이메일 수신 동의를 해주세요."); }
		
		if(m_address.equals("")) 				{ return webHelper.redirect(null, "주소를 입력해주세요."); }
		if(m_postcode.equals("")) 				{ return webHelper.redirect(null, "우편번호를 입력해주세요."); }
		if(m_address_detail.equals("")) 				{ return webHelper.redirect(null, "상세주소를 입력해주세요."); }
		
		if(gender.equals("")) 				{ return webHelper.redirect(null, "성별을 입력해주세요."); }
		
		String address = m_address + m_address_detail;
		
		String m_pw = "";
		
		if(m_pwA == m_pwB) {
			m_pw = m_pwA;
		}
		
		//2) 데이터 저장
		Members input = new Members();
		input.setM_id(m_id);
		input.setM_pw(m_pw);
		input.setM_name(m_name);
		input.setM_username(m_username);
		input.setM_email(m_email);
		input.setM_phone(m_phone);
		input.setM_birthday(m_birthday);
		input.setM_email_agree(m_email_agree);
		input.setM_address(address);
		input.setM_point(1000);
		input.setM_gender(gender);
		input.setM_postcode(m_postcode);
		
		
		try {
			membersService.addMembers(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		//3) 결과 확인 위한 페이지 이동

		String redirectUrl = contextPath + "/pjh/jsp/login.do";
		return webHelper.redirect(redirectUrl, "회원가입 되었습니다.");
	}
	
	@RequestMapping(value = "/pjh/members/members_edit.do", method = RequestMethod.GET)
	public ModelAndView edit(Model model,
			@RequestParam(value = "id" , defaultValue = "0") int id) {
		
		if(id == 0) {
			return webHelper.redirect(null, "회원번호가 없습니다.");
		}
		
		Members input = new Members();
		input.setId(id);
		
		Members output = null;
		try {
			output = membersService.getMembersItem(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		model.addAttribute("output",output);
		
		return new ModelAndView("pjh/memebers/memebers_edit");
	}

	@RequestMapping(value = "/pjh/memebers/memebers_edit_ok.do", method = RequestMethod.POST)
	public ModelAndView edit_ok(Model model,
			@RequestParam(value = "id" , defaultValue =  "0") int id,
			@RequestParam(value = "m_id" , required = false) String m_id,
			@RequestParam(value = "m_pw" , required = false) String m_pw,
			@RequestParam(value = "m_name" , required = false) String m_name,
			@RequestParam(value = "m_username" , required = false) String m_username,
			@RequestParam(value = "m_email" , required = false) String m_email,
			@RequestParam(value = "m_phone" , required = false) String m_phone,
			@RequestParam(value = "m_birthday" , required = false) String m_birthday,
			@RequestParam(value = "m_email_agree" , required = false) String m_email_agree,
			@RequestParam(value = "m_address" , required = false) String m_address,
			@RequestParam(value = "m_postcode" , required = false) String m_postcode,
			@RequestParam(value = "m_address_detail" , required = false) String m_address_detail,
			@RequestParam(value = "m_modifydate" , required = false) String m_modifydate,
			@RequestParam(value = "m_joindate" , required = false) String m_joindate,
			@RequestParam(value = "m_enddate" , required = false) String m_enddate,
			@RequestParam(value = "m_end" , required = false) String m_end,
			@RequestParam(value = "m_point" , defaultValue =  "0") int m_point) {
		
		//1) 유효성 검사
		
		if(id == 0) {
			return webHelper.redirect(null, "회원번호가 없습니다.");
		}
		
		if(m_id.equals("")) 				{ return webHelper.redirect(null, "아이디를 입력하세요."); }
		if(!regexHelper.isEngNum(m_id)) 	{ return webHelper.redirect(null, "아이디는 영어와 숫자로만 가능합니다."); }
				
		if(m_pw.equals("")) 				{ return webHelper.redirect(null, "비밀번호를 입력하세요."); }
		if(!regexHelper.isEngNum(m_pw)) 	{ return webHelper.redirect(null, "비밀번호는 영어와 숫자로만 가능합니다."); }
				
		if(m_name.equals("")) 				{ return webHelper.redirect(null, "이름을 입력하세요."); }
		if(!regexHelper.isKor(m_name)) 		{ return webHelper.redirect(null, "이름은 한글만 가능합니다."); }
				
		if(m_username.equals("")) 				{ return webHelper.redirect(null, "닉네임을 입력하세요."); }
		if(!regexHelper.isEngNum(m_username)) 	{ return webHelper.redirect(null, "닉네임은 영어와 숫자로만 가능합니다."); }
				
		if(m_email.equals("")) 				{ return webHelper.redirect(null, "이메일을 입력하세요."); }
		if(!regexHelper.isEmail(m_email)) 	{ return webHelper.redirect(null, "이메일 형식에 맞게 입력해 주세요."); }
				
		if(m_phone.equals("")) 						{ return webHelper.redirect(null, "휴대폰번호를 입력하세요."); }
		if(!regexHelper.isCellPhone(m_phone)) 		{ return webHelper.redirect(null, "휴대폰번호를 다시 입력해주세요."); }
				
		if(m_birthday.equals("")) 				{ return webHelper.redirect(null, "생년월일을 입력하세요."); }
		if(!regexHelper.isNum(m_birthday)) 		{ return webHelper.redirect(null, "생년월일을 다시 입력해주세요."); }
				
		if(m_email_agree.equals("")) 				{ return webHelper.redirect(null, "이메일 수신 동의를 해주세요."); }
				
		if(m_address.equals("")) 				{ return webHelper.redirect(null, "주소를 입력해주세요."); }
		if(m_postcode.equals("")) 				{ return webHelper.redirect(null, "우편번호를 입력해주세요."); }
		if(m_address_detail.equals("")) 				{ return webHelper.redirect(null, "상세주소를 입력해주세요."); }


		String address = m_address + m_address_detail;

				
		//2) 데이터 저장
		Members input = new Members();
		input.setId(id);
		input.setM_id(m_id);
		input.setM_pw(m_pw);
		input.setM_name(m_name);
		input.setM_username(m_username);
		input.setM_email(m_email);
		input.setM_phone(m_phone);
		input.setM_birthday(m_birthday);
		input.setM_email_agree(m_email_agree);
		input.setM_address(address);
		input.setM_modifydate(m_modifydate);
		input.setM_joindate(m_joindate);
		input.setM_enddate(m_enddate);
		input.setM_end(m_end);
		input.setM_point(m_point);
		input.setM_postcode(m_postcode);
		
		try {
			membersService.editMembers(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		String redirectUrl = contextPath + "/pjh/members/members_view.do?id=" + input.getId();
		
		return webHelper.redirect(redirectUrl, "수정되었습니다.");
	}

	@RequestMapping(value = "/pjh/members/members_delete_ok.do", method = RequestMethod.GET)
	public ModelAndView delete_ok(Model model,
			@RequestParam(value="id", defaultValue = "0")int id) {
		
		if(id == 0) {
			return webHelper.redirect(null, "회원번호가 없습니다.");
		}
		
		Members input = new Members();
		input.setId(id);
		
		try {
			membersService.deleteMembers(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		return webHelper.redirect(contextPath + "/pjh/members/members_list.do","삭제되었습니다.");
	}
	
	@RequestMapping(value = "/pjh/jsp/deleteAcc.do", method = RequestMethod.GET)
	public ModelAndView deleteAcc(Model model,
			@RequestParam(value="id", defaultValue = "0")int id,
			@RequestParam(value = "m_id" , required = false) String m_id) {
		
		Members input = new Members();
		input.setId(id);
		input.setM_id(m_id);
		
		Members output = null;
		
		try {
			output = membersService.getMembersItem(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		model.addAttribute("output",output);
		
		return new ModelAndView("pjh/jsp/deleteAcc");
	}
	
	@RequestMapping(value = "/pjh/jsp/deleteAcc_ok.do", method = RequestMethod.POST)
	public ModelAndView deleteAcc_ok(Model model,
			@RequestParam(value = "id" , defaultValue =  "0") int id,
			@RequestParam(value = "m_id" , required = false) String m_id,
			@RequestParam(value = "m_pw" , required = false) String m_pw,
			@RequestParam(value = "m_pwA" , required = false) String m_pwA,
			@RequestParam(value = "memo" , required = false) String memo) {
		
		//1) 유효성 검사
		
		if(id == 0) {
			return webHelper.redirect(null, "회원번호가 없습니다.");
		}
		
		if(m_id.equals("")) 				{ return webHelper.redirect(null, "아이디를 입력하세요."); }
		if(!regexHelper.isEngNum(m_id)) 	{ return webHelper.redirect(null, "아이디는 영어와 숫자로만 가능합니다."); }
				
		if(m_pw.equals("")) 				{ return webHelper.redirect(null, "비밀번호를 입력하세요."); }
		if(!regexHelper.isEngNum(m_pw)) 	{ return webHelper.redirect(null, "비밀번호는 영어와 숫자로만 가능합니다."); }
		
		Members inputA = new Members();
		inputA.setM_id(m_id);
		inputA.setM_pw(m_pwA);
		
		int a = 0;
		
		try {
			
			a = membersService.loginCount(inputA);
			
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		if( a != 1 ) 				{ return webHelper.redirect(null, "비밀번호가 다릅니다."); }
		
				
		//2) 데이터 저장
		Members input = new Members();
		input.setId(id);
		input.setM_id(m_id);
		input.setM_pw(m_pwA);
		input.setM_end("Y");
		input.setM_memo(memo);
		
		try {
			membersService.editMembersTal(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		String redirectUrl = contextPath + "/main.do";
		
		return webHelper.redirect(redirectUrl, "탈퇴되었습니다. 그동안 감사했습니다!");
	}
	
	
	@RequestMapping(value = "/pjh/jsp/sujung.do", method = RequestMethod.GET)
	public ModelAndView sujung(Model model,
			HttpServletRequest request) {
		
		HttpSession session  = request.getSession();
		Members key = (Members) session.getAttribute("key");
		int id = key.getId();
		
		Members input = new Members();
		input.setId(id);
		
		Members output = null;
		
		try {
			output = membersService.getMembersItem(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		model.addAttribute("output",output);
		session.setAttribute("key", key);
		
		return new ModelAndView("pjh/jsp/sujung");
	}
	@RequestMapping(value = "/pjh/jsp/sujung_ok.do", method = RequestMethod.POST)
	public ModelAndView sujung_ok(Model model,
			@RequestParam(value="id", defaultValue = "0")int id,
			@RequestParam(value = "m_id" , required = false) String m_id,
			@RequestParam(value = "m_name" , required = false) String m_name,
			@RequestParam(value = "m_username" , required = false) String m_username,
			@RequestParam(value = "m_phone" , required = false) String m_phone,
			@RequestParam(value = "m_email" , required = false) String m_email,
			@RequestParam(value = "m_address" , required = false) String m_address,
			@RequestParam(value = "m_postcode" , required = false) String m_postcode,
			@RequestParam(value = "m_address_detail" , required = false) String m_address_detail,
			@RequestParam(value = "m_birthday" , required = false) String m_birthday,
			@RequestParam(value = "m_gender" , required = false) String m_gender,
			HttpServletRequest request) {
		
		HttpSession session  = request.getSession();
		Members key = (Members) session.getAttribute("key");
		
		if(id == 0) {
			return webHelper.redirect(null, "회원번호가 없습니다.");
		}
		
		if(m_id.equals("")) 				{ return webHelper.redirect(null, "아이디를 입력하세요."); }
		if(!regexHelper.isEngNum(m_id)) 	{ return webHelper.redirect(null, "아이디는 영어와 숫자로만 가능합니다."); }
				
		if(m_name.equals("")) 				{ return webHelper.redirect(null, "이름을 입력하세요."); }
		if(!regexHelper.isKor(m_name)) 		{ return webHelper.redirect(null, "이름은 한글만 가능합니다."); }
				
		if(m_username.equals("")) 				{ return webHelper.redirect(null, "닉네임을 입력하세요."); }
		if(!regexHelper.isEngNum(m_username)) 	{ return webHelper.redirect(null, "닉네임은 영어와 숫자로만 가능합니다."); }
				
		if(m_email.equals("")) 				{ return webHelper.redirect(null, "이메일을 입력하세요."); }
		if(!regexHelper.isEmail(m_email)) 	{ return webHelper.redirect(null, "이메일 형식에 맞게 입력해 주세요."); }
				
		if(m_address.equals("")) 				{ return webHelper.redirect(null, "주소를 입력해주세요."); }
		if(m_postcode.equals("")) 				{ return webHelper.redirect(null, "우편번호를 입력해주세요."); }
		if(m_address_detail.equals("")) 				{ return webHelper.redirect(null, "상세주소를 입력해주세요."); }
		
		if(m_phone.equals("")) 						{ return webHelper.redirect(null, "휴대폰번호를 입력하세요."); }
		if(!regexHelper.isCellPhone(m_phone)) 		{ return webHelper.redirect(null, "휴대폰번호를 다시 입력해주세요."); }
				
		if(m_birthday.equals("")) 				{ return webHelper.redirect(null, "생년월일을 입력하세요."); }
				
		if(m_gender.equals("")) 				{ return webHelper.redirect(null, "성별을 입력해주세요."); }
				
		String address = m_address + m_address_detail;
		
		Members input = new Members();
		input.setId(id);
		input.setM_id(m_id);
		input.setM_name(m_name);
		input.setM_username(m_username);
		input.setM_phone(m_phone);
		input.setM_email(m_email);
		input.setM_address(address);
		input.setM_birthday(m_birthday);
		input.setM_gender(m_gender);
		input.setM_postcode(m_postcode);
		
		Members output = null;
		
		try {
			membersService.editMembersSujung(input);
			
			output = membersService.getMembersItem(input);
			
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		model.addAttribute("output",output);
		session.setAttribute("key", key);
		
		String redirectUrl = contextPath + "/pjh/jsp/Mypage.do";
		
		return webHelper.redirect(redirectUrl, "회원정보가 수정되었습니다.");
	}
	@RequestMapping(value = "/pjh/members/look_cart_add_ok.do", method = RequestMethod.POST)
	public ModelAndView look_cart_add_ok(Model model,
			HttpServletRequest request,
			@RequestParam(value = "m_id" , required = false) String m_id,
			@RequestParam(value = "m_pwA" , required = false) String m_pwA,
			@RequestParam(value = "m_pwB" , required = false) String m_pwB,
			@RequestParam(value = "m_name" , required = false) String m_name,
			@RequestParam(value = "m_username" , required = false) String m_username,
			@RequestParam(value = "m_email" , required = false) String m_email,
			@RequestParam(value = "m_phone" , required = false) String m_phone,
			@RequestParam(value = "m_birthday" , required = false) String m_birthday,
			@RequestParam(value = "m_email_agree" , required = false) String m_email_agree,
			@RequestParam(value = "m_address" , required = false) String m_address,
			@RequestParam(value = "m_postcode" , required = false) String m_postcode,
			@RequestParam(value = "m_address_detail" , required = false) String m_address_detail,
			@RequestParam(value = "gender" , required = false) String gender){
		
		HttpSession session  = request.getSession();

		Goods goods = (Goods) session.getAttribute("id");

		session.setAttribute("id", goods);
		
		//1) 유효성 검사
		if(m_id.equals("")) 				{ return webHelper.redirect(null, "아이디를 입력하세요."); }
		if(!regexHelper.isEngNum(m_id)) 	{ return webHelper.redirect(null, "아이디는 영어와 숫자로만 가능합니다."); }
		
		if(m_pwA.equals("")) 				{ return webHelper.redirect(null, "비밀번호를 입력하세요."); }
		if(!regexHelper.isEngNum(m_pwA)) 	{ return webHelper.redirect(null, "비밀번호는 영어와 숫자로만 가능합니다."); }
		
		String pwA = (String)m_pwA;
		String pwB = (String)m_pwB;
		
		if(!(pwA.equals(pwB))) 						{ return webHelper.redirect(null, "비밀번호를 확인해주세요."); }
		
		if(m_name.equals("")) 				{ return webHelper.redirect(null, "이름을 입력하세요."); }
		if(!regexHelper.isKor(m_name)) 		{ return webHelper.redirect(null, "이름은 한글만 가능합니다."); }
		
		if(m_username.equals("")) 				{ return webHelper.redirect(null, "닉네임을 입력하세요."); }
		if(!regexHelper.isEngNum(m_username)) 	{ return webHelper.redirect(null, "닉네임은 영어와 숫자로만 가능합니다."); }
		
		if(m_email.equals("")) 				{ return webHelper.redirect(null, "이메일을 입력하세요."); }
		if(!regexHelper.isEmail(m_email)) 	{ return webHelper.redirect(null, "이메일 형식에 맞게 입력해 주세요."); }
		
		if(m_phone.equals("")) 						{ return webHelper.redirect(null, "휴대폰번호를 입력하세요."); }
		if(!regexHelper.isCellPhone(m_phone)) 		{ return webHelper.redirect(null, "휴대폰번호를 (-)없이 다시 입력해주세요."); }
		
		if(m_birthday.equals("")) 				{ return webHelper.redirect(null, "생년월일을 입력하세요."); }
		
		if(m_email_agree.equals("")) 				{ return webHelper.redirect(null, "이메일 수신 동의를 해주세요."); }
		
		if(m_address.equals("")) 				{ return webHelper.redirect(null, "주소를 입력해주세요."); }
		if(m_postcode.equals("")) 				{ return webHelper.redirect(null, "우편번호를 입력해주세요."); }
		if(m_address_detail.equals("")) 				{ return webHelper.redirect(null, "상세주소를 입력해주세요."); }
		
		if(gender.equals("")) 				{ return webHelper.redirect(null, "성별을 입력해주세요."); }
		
		String address = m_address + m_address_detail;
		
		String m_pw = "";
		
		if(m_pwA == m_pwB) {
			m_pw = m_pwA;
		}
		
		//2) 데이터 저장
		Members input = new Members();
		input.setM_id(m_id);
		input.setM_pw(m_pw);
		input.setM_name(m_name);
		input.setM_username(m_username);
		input.setM_email(m_email);
		input.setM_phone(m_phone);
		input.setM_birthday(m_birthday);
		input.setM_email_agree(m_email_agree);
		input.setM_address(address);
		input.setM_point(1000);
		input.setM_gender(gender);
		input.setM_postcode(m_postcode);
		
		try {
			membersService.addMembers(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		//3) 결과 확인 위한 페이지 이동

		String redirectUrl = contextPath + "/pjh/jsp/looking_cartpage_login.do";
		
		return webHelper.redirect(redirectUrl, "회원가입 되었습니다.");
	}
	@RequestMapping(value = "/pjh/members/cart_add_ok.do", method = RequestMethod.POST)
	public ModelAndView cart_add_ok(Model model,
			HttpServletRequest request,
			@RequestParam(value = "m_id" , required = false) String m_id,
			@RequestParam(value = "m_pwA" , required = false) String m_pwA,
			@RequestParam(value = "m_pwB" , required = false) String m_pwB,
			@RequestParam(value = "m_name" , required = false) String m_name,
			@RequestParam(value = "m_username" , required = false) String m_username,
			@RequestParam(value = "m_email" , required = false) String m_email,
			@RequestParam(value = "m_phone" , required = false) String m_phone,
			@RequestParam(value = "m_birthday" , required = false) String m_birthday,
			@RequestParam(value = "m_email_agree" , required = false) String m_email_agree,
			@RequestParam(value = "m_address" , required = false) String m_address,
			@RequestParam(value = "m_postcode" , required = false) String m_postcode,
			@RequestParam(value = "m_address_detail" , required = false) String m_address_detail,
			@RequestParam(value = "gender" , required = false) String gender){
		
		HttpSession session  = request.getSession();

		Goods goods = (Goods) session.getAttribute("id");

		session.setAttribute("id", goods);
		
		//1) 유효성 검사
		if(m_id.equals("")) 				{ return webHelper.redirect(null, "아이디를 입력하세요."); }
		if(!regexHelper.isEngNum(m_id)) 	{ return webHelper.redirect(null, "아이디는 영어와 숫자로만 가능합니다."); }
		
		if(m_pwA.equals("")) 				{ return webHelper.redirect(null, "비밀번호를 입력하세요."); }
		if(!regexHelper.isEngNum(m_pwA)) 	{ return webHelper.redirect(null, "비밀번호는 영어와 숫자로만 가능합니다."); }
		
		String pwA = (String)m_pwA;
		String pwB = (String)m_pwB;
		
		if(!(pwA.equals(pwB))) 						{ return webHelper.redirect(null, "비밀번호를 확인해주세요."); }
		
		if(m_name.equals("")) 				{ return webHelper.redirect(null, "이름을 입력하세요."); }
		if(!regexHelper.isKor(m_name)) 		{ return webHelper.redirect(null, "이름은 한글만 가능합니다."); }
		
		if(m_username.equals("")) 				{ return webHelper.redirect(null, "닉네임을 입력하세요."); }
		if(!regexHelper.isEngNum(m_username)) 	{ return webHelper.redirect(null, "닉네임은 영어와 숫자로만 가능합니다."); }
		
		if(m_email.equals("")) 				{ return webHelper.redirect(null, "이메일을 입력하세요."); }
		if(!regexHelper.isEmail(m_email)) 	{ return webHelper.redirect(null, "이메일 형식에 맞게 입력해 주세요."); }
		
		if(m_phone.equals("")) 						{ return webHelper.redirect(null, "휴대폰번호를 입력하세요."); }
		if(!regexHelper.isCellPhone(m_phone)) 		{ return webHelper.redirect(null, "휴대폰번호를 (-)없이 다시 입력해주세요."); }
		
		if(m_birthday.equals("")) 				{ return webHelper.redirect(null, "생년월일을 입력하세요."); }
		
		if(m_email_agree.equals("")) 				{ return webHelper.redirect(null, "이메일 수신 동의를 해주세요."); }
		
		if(m_address.equals("")) 				{ return webHelper.redirect(null, "주소를 입력해주세요."); }
		if(m_postcode.equals("")) 				{ return webHelper.redirect(null, "우편번호를 입력해주세요."); }
		if(m_address_detail.equals("")) 				{ return webHelper.redirect(null, "상세주소를 입력해주세요."); }
		
		if(gender.equals("")) 				{ return webHelper.redirect(null, "성별을 입력해주세요."); }
		
		String address = m_address + m_address_detail;
		
		String m_pw = "";
		
		if(m_pwA == m_pwB) {
			m_pw = m_pwA;
		}
		
		//2) 데이터 저장
		Members input = new Members();
		input.setM_id(m_id);
		input.setM_pw(m_pw);
		input.setM_name(m_name);
		input.setM_username(m_username);
		input.setM_email(m_email);
		input.setM_phone(m_phone);
		input.setM_birthday(m_birthday);
		input.setM_email_agree(m_email_agree);
		input.setM_address(address);
		input.setM_point(1000);
		input.setM_gender(gender);
		input.setM_postcode(m_postcode);
		
		try {
			membersService.addMembers(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		//3) 결과 확인 위한 페이지 이동

		String redirectUrl = contextPath + "/pjh/jsp/cartpage_login.do";
		return webHelper.redirect(redirectUrl, "회원가입 되었습니다.");
	}
	
	
	@RequestMapping(value = "/pjh/members/members_sujung.do", method = RequestMethod.GET)
	public ModelAndView members_sujung(Model model,
			HttpServletRequest request,
			@RequestParam(value="id", defaultValue = "0") int id) {
		
		
		HttpSession session  = request.getSession();
		
		Admins key = (Admins) session.getAttribute("keyA");
		
		model.addAttribute("outputZ",key);
		
		session.setAttribute("keyA", key); 
		
		Members input = new Members();
		input.setId(id);
		
		Members output = null;
		
		try {
			output = membersService.getMembersItem(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		model.addAttribute("output",output);
		
		return new ModelAndView("pjh/members/master_members_sujung");
	}
	
	@RequestMapping(value = "/pjh/jsp/master_sujung_ok.do", method = RequestMethod.POST)
	public ModelAndView master_sujung_ok(Model model,
			@RequestParam(value="id", defaultValue = "0")int id,
			@RequestParam(value = "m_id" , required = false) String m_id,
			@RequestParam(value = "m_name" , required = false) String m_name,
			@RequestParam(value = "m_username" , required = false) String m_username,
			@RequestParam(value = "m_phone" , required = false) String m_phone,
			@RequestParam(value = "m_email" , required = false) String m_email,
			@RequestParam(value = "m_address" , required = false) String m_address,
			@RequestParam(value = "m_postcode" , required = false) String m_postcode,
			@RequestParam(value = "m_address_detail" , required = false) String m_address_detail,
			@RequestParam(value = "m_birthday" , required = false) String m_birthday,
			@RequestParam(value = "m_gender" , required = false) String m_gender,
			HttpServletRequest request) {
		
		
		if(id == 0) {
			return webHelper.redirect(null, "회원번호가 없습니다.");
		}
		
		if(m_id.equals("")) 				{ return webHelper.redirect(null, "아이디를 입력하세요."); }
		if(!regexHelper.isEngNum(m_id)) 	{ return webHelper.redirect(null, "아이디는 영어와 숫자로만 가능합니다."); }
				
		if(m_name.equals("")) 				{ return webHelper.redirect(null, "이름을 입력하세요."); }
		if(!regexHelper.isKor(m_name)) 		{ return webHelper.redirect(null, "이름은 한글만 가능합니다."); }
				
		if(m_username.equals("")) 				{ return webHelper.redirect(null, "닉네임을 입력하세요."); }
		if(!regexHelper.isEngNum(m_username)) 	{ return webHelper.redirect(null, "닉네임은 영어와 숫자로만 가능합니다."); }
				
		if(m_email.equals("")) 				{ return webHelper.redirect(null, "이메일을 입력하세요."); }
		if(!regexHelper.isEmail(m_email)) 	{ return webHelper.redirect(null, "이메일 형식에 맞게 입력해 주세요."); }
				
		if(m_address.equals("")) 				{ return webHelper.redirect(null, "주소를 입력해주세요."); }
		if(m_postcode.equals("")) 				{ return webHelper.redirect(null, "우편번호를 입력해주세요."); }
		if(m_address_detail.equals("")) 				{ return webHelper.redirect(null, "상세주소를 입력해주세요."); }
		
		if(m_phone.equals("")) 						{ return webHelper.redirect(null, "휴대폰번호를 입력하세요."); }
		if(!regexHelper.isCellPhone(m_phone)) 		{ return webHelper.redirect(null, "휴대폰번호를 다시 입력해주세요."); }
				
		if(m_birthday.equals("")) 				{ return webHelper.redirect(null, "생년월일을 입력하세요."); }
				
		if(m_gender.equals("")) 				{ return webHelper.redirect(null, "성별을 입력해주세요."); }
				
		String address = m_address + m_address_detail;
		
		Members input = new Members();
		input.setId(id);
		input.setM_id(m_id);
		input.setM_name(m_name);
		input.setM_username(m_username);
		input.setM_phone(m_phone);
		input.setM_email(m_email);
		input.setM_address(address);
		input.setM_birthday(m_birthday);
		input.setM_gender(m_gender);
		input.setM_postcode(m_postcode);
		
		Members output = null;
		
		try {
			membersService.editMembersSujung(input);
			
			
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		String redirectUrl = contextPath + "/pjh/members/members_list.do";
		
		return webHelper.redirect(redirectUrl, "회원정보가 수정되었습니다.");
	}
	@RequestMapping(value = "/pjh/members/members_point.do", method = RequestMethod.GET)
	public ModelAndView members_point(
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
		
		Point input = new Point();
		input.setP_m_id(keyword);
		
		List<Point> output = null;
		PageData pageData = null;
		
		try {
			
			totalCount = pointService.getPointCount(input);
			
			pageData = new PageData(nowPage, totalCount, listCount, pageCount);
			
			Point.setOffset(pageData.getOffset());
			Point.setListCount(pageData.getListCount());
			
			output = pointService.getPointList(input);
			
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		List<String> inA = new ArrayList<String>();
		for(int i = 0 ; i < output.size(); i++) {
			inA.add(i, output.get(i).getP_m_id());
		}
		Members inputA = new Members();
		inputA.setCheck(inA);
		
		List<Members> outputA = null;
		
		try {
			outputA = membersService.getMembersListPoint(inputA);
			
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		model.addAttribute("keyword",keyword);
		model.addAttribute("output",output);
		model.addAttribute("outputA",outputA);
		model.addAttribute("pageData",pageData);
		
		return new ModelAndView("pjh/members/master_members_point");
	}
	@RequestMapping(value = "/pjh/members/point_plus_minus.do", method = RequestMethod.POST)
	public ModelAndView point_plus_minus(Model model,
			@RequestParam(value = "p_m_id" , required = false) String p_m_id,
			@RequestParam(value = "p_cont" , required = false) String p_cont,
			@RequestParam(value="p_point", defaultValue = "0")int p_point,
			@RequestParam(value = "p_pointdate" , required = false) String p_pointdate,
			HttpServletRequest request) {
		
		HttpSession session  = request.getSession();
		
		Admins key = (Admins) session.getAttribute("keyA");
		
		model.addAttribute("outputZ",key);
		
		session.setAttribute("keyA", key);
		
		if(p_m_id.equals("")) 				{ return webHelper.redirect(null, "아이디를 입력하세요."); }
				
		if(p_cont.equals("")) 				{ return webHelper.redirect(null, "포인트내용을 입력하세요."); }
				
		if(p_point == 0) 				{ return webHelper.redirect(null, "포인트를 입력하세요."); }
				
		if(p_pointdate.equals("")) 				{ return webHelper.redirect(null, "포인트 입력날짜를 입력하세요."); }
				
		Members inputA = new Members();
		inputA.setM_id(p_m_id);
		
		Members output = null;
		
		try {
			
			output = membersService.getMembersItemPoint(inputA);
			
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		int A = output.getM_point() + p_point;
		
		Members inputB = new Members();
		inputB.setM_id(p_m_id);
		inputB.setM_point(A);
		
		try {
			
			membersService.editMembersPoint(inputB);
			
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		Point input = new Point();
		input.setP_m_id(p_m_id);
		input.setP_cont(p_cont);
		input.setP_pointdate(p_pointdate);
		input.setP_point(p_point);
		input.setP_mid(output.getId());
		input.setP_total_point(A);
		
		try {
			
			pointService.addPoint(input);
			
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		

		String redirectUrl = contextPath + "/pjh/members/members_point.do";
		
		return webHelper.redirect(redirectUrl, "회원포인트가 수정되었습니다.");
	}
	
	@RequestMapping(value = "/pjh/members/members_list_add.do", method = RequestMethod.GET)
	public ModelAndView members_list_add(Model model,
			HttpServletRequest request) {
		
		HttpSession session  = request.getSession();
		
		Admins key = (Admins) session.getAttribute("keyA");
		
		model.addAttribute("outputZ",key);
		
		session.setAttribute("keyA", key); 
		
		return new ModelAndView("pjh/members/members_list_add");
	}
	
	@RequestMapping(value = "/pjh/members/members_add_list_ok.do", method = RequestMethod.POST)
	public ModelAndView members_add_list_ok(Model model,
			HttpServletRequest request,
			@RequestParam(value = "m_id" , required = false) String m_id,
			@RequestParam(value = "m_pwA" , required = false) String m_pwA,
			@RequestParam(value = "m_pwB" , required = false) String m_pwB,
			@RequestParam(value = "m_name" , required = false) String m_name,
			@RequestParam(value = "m_username" , required = false) String m_username,
			@RequestParam(value = "m_email" , required = false) String m_email,
			@RequestParam(value = "m_phone" , required = false) String m_phone,
			@RequestParam(value = "m_birthday" , required = false) String m_birthday,
			@RequestParam(value = "m_email_agree" , required = false) String m_email_agree,
			@RequestParam(value = "m_address" , required = false) String m_address,
			@RequestParam(value = "m_postcode" , required = false) String m_postcode,
			@RequestParam(value = "m_address_detail" , required = false) String m_address_detail,
			@RequestParam(value = "gender" , required = false) String gender){
		
		HttpSession session  = request.getSession();
		
		Admins key = (Admins) session.getAttribute("keyA");
		
		model.addAttribute("outputZ",key);
		
		session.setAttribute("keyA", key); 
		
		//1) 유효성 검사
		if(m_id.equals("")) 				{ return webHelper.redirect(null, "아이디를 입력하세요."); }
		if(!regexHelper.isEngNum(m_id)) 	{ return webHelper.redirect(null, "아이디는 영어와 숫자로만 가능합니다."); }
		
		if(m_pwA.equals("")) 				{ return webHelper.redirect(null, "비밀번호를 입력하세요."); }
		if(!regexHelper.isEngNum(m_pwA)) 	{ return webHelper.redirect(null, "비밀번호는 영어와 숫자로만 가능합니다."); }
		
		String pwA = (String)m_pwA;
		String pwB = (String)m_pwB;
		
		if(!(pwA.equals(pwB))) 						{ return webHelper.redirect(null, "비밀번호를 확인해주세요."); }
		
		if(m_name.equals("")) 				{ return webHelper.redirect(null, "이름을 입력하세요."); }
		if(!regexHelper.isKor(m_name)) 		{ return webHelper.redirect(null, "이름은 한글만 가능합니다."); }
		
		if(m_username.equals("")) 				{ return webHelper.redirect(null, "닉네임을 입력하세요."); }
		if(!regexHelper.isEngNum(m_username)) 	{ return webHelper.redirect(null, "닉네임은 영어와 숫자로만 가능합니다."); }
		
		if(m_email.equals("")) 				{ return webHelper.redirect(null, "이메일을 입력하세요."); }
		if(!regexHelper.isEmail(m_email)) 	{ return webHelper.redirect(null, "이메일 형식에 맞게 입력해 주세요."); }
		
		if(m_phone.equals("")) 						{ return webHelper.redirect(null, "휴대폰번호를 입력하세요."); }
		if(!regexHelper.isCellPhone(m_phone)) 		{ return webHelper.redirect(null, "휴대폰번호를 (-)없이 다시 입력해주세요."); }
		
		if(m_birthday.equals("")) 				{ return webHelper.redirect(null, "생년월일을 입력하세요."); }
		
		if(m_email_agree.equals("")) 				{ return webHelper.redirect(null, "이메일 수신 동의를 해주세요."); }
		
		if(m_address.equals("")) 				{ return webHelper.redirect(null, "주소를 입력해주세요."); }
		if(m_postcode.equals("")) 				{ return webHelper.redirect(null, "우편번호를 입력해주세요."); }
		if(m_address_detail.equals("")) 				{ return webHelper.redirect(null, "상세주소를 입력해주세요."); }
		
		if(gender.equals("")) 				{ return webHelper.redirect(null, "성별을 입력해주세요."); }
		
		String address = m_address + m_address_detail;
		
		String m_pw = "";
		
		if(m_pwA == m_pwB) {
			m_pw = m_pwA;
		}
		
		//2) 데이터 저장
		Members input = new Members();
		input.setM_id(m_id);
		input.setM_pw(m_pw);
		input.setM_name(m_name);
		input.setM_username(m_username);
		input.setM_email(m_email);
		input.setM_phone(m_phone);
		input.setM_birthday(m_birthday);
		input.setM_email_agree(m_email_agree);
		input.setM_address(address);
		input.setM_point(1000);
		input.setM_gender(gender);
		input.setM_postcode(m_postcode);
		
		
		try {
			membersService.addMembers(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		//3) 결과 확인 위한 페이지 이동

		String redirectUrl = contextPath + "/pjh/members/members_list.do";
		return webHelper.redirect(redirectUrl, "회원추가 되었습니다.");
	}
	
	@RequestMapping(value = "/pjh/members/members_delete.do", method = RequestMethod.GET)
	public ModelAndView members_delete(Model model,
			HttpServletRequest request,
			@RequestParam(value="id", defaultValue = "0") int id) {
		
		HttpSession session  = request.getSession();
		
		Admins key = (Admins) session.getAttribute("keyA");
		
		model.addAttribute("outputZ",key);
		
		session.setAttribute("keyA", key); 
		
		Members input = new Members();
		input.setId(id);
		
		try {
			membersService.deleteMembers(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		String redirectUrl = contextPath + "/pjh/members/members_list.do";
		return webHelper.redirect(redirectUrl, "회원이 삭제되었습니다.");
	}
}
