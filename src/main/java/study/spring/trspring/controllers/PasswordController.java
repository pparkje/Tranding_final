package study.spring.trspring.controllers;

import java.text.SimpleDateFormat;
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
import study.spring.trspring.model.Email;
import study.spring.trspring.model.Goods;
import study.spring.trspring.model.Members;
import study.spring.trspring.model.News;
import study.spring.trspring.service.EmailService;
import study.spring.trspring.service.GoodsService;
import study.spring.trspring.service.MembersService;
import study.spring.trspring.service.NewsService;

@Controller
public class PasswordController {
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
	@Autowired
	EmailService emailService;
	@Autowired
	MailHelper mailhelper;
	
	@Value("#{servletContext.contextPath}")
	String contextPath;
	

	@RequestMapping(value = "/pjh/jsp/passChange.do", method = RequestMethod.GET)
	public ModelAndView view(Model model,
			@RequestParam(value="id", defaultValue = "0") int id,
			@RequestParam(value = "m_id" , required = false) String m_id,
			 HttpServletRequest request) {
		
		
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
		
		return new ModelAndView("pjh/jsp/passChange");
	}
	
	@RequestMapping(value = "/pjh/jsp/passChange_ok.do", method = RequestMethod.GET)
	public ModelAndView passChange_ok(Model model,
			@RequestParam(value="id", defaultValue = "0") int id,
			@RequestParam(value = "m_id" , required = false) String m_id,
			@RequestParam(value = "m_pw" , required = false) String m_pw,
			@RequestParam(value = "now_m_pw" , required = false) String now_m_pw,
			@RequestParam(value = "new_m_pw" , required = false) String new_m_pw,
			 HttpServletRequest request) {
		
		String pwA = (String)m_pw;
		String pwB = (String)now_m_pw;
		
		if(!(pwA.equals(pwB))) 						{ return webHelper.redirect(null, "비밀번호를 확인해주세요."); }
		
		
		Members input = new Members();
		input.setId(id);
		input.setM_id(m_id);
		input.setM_pw(new_m_pw);
		
		Members output = null;
		
		try {
			
			membersService.editMembersBibun(input);
			
			output = membersService.getMembersItem(input);
			
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		model.addAttribute("output",output);
		
		String redirectUrl = contextPath + "/pjh/jsp/Mypage.do";
		return webHelper.redirect(redirectUrl, "비밀번호가 수정 되었습니다.");
	}
	
	@RequestMapping(value = "/pjh/jsp/no_id_passChange.do", method = RequestMethod.GET)
	public ModelAndView no_id_passChange(Model model,
			 HttpServletRequest request) {
		
		return new ModelAndView("pjh/jsp/no_id_passChange");
	}
	
	@RequestMapping(value = "/pjh/jsp/no_id_passChange_ok.do", method = RequestMethod.POST)
	public ModelAndView no_id_passChange_ok(Model model,
			@RequestParam(value = "m_id" , required = false) String m_id,
			 HttpServletRequest request) {
		
		HttpSession session  = request.getSession();
		
		if(m_id == null) {
			return webHelper.redirect(null, "아이디를 입력해주세요.");
		}
		
		Members input = new Members();
		input.setM_id(m_id);
		int output = 0;
		Members outputA = null;
		
		try {
			
			output = membersService.passwordCountA(input);
			
			if(output == 0 ) {
				return webHelper.redirect(null, "회원가입되지 않은 아이디 입니다.");
			}else {
				outputA = membersService.getMembersItemPoint(input);
			}
			
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		
		int count = 8;
		String[] outcode ={ "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", 
				"K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", 
                "Y", "Z", "1", "2", "3", "4", "5", "6", "7", "8", "9", "0" };
		
		String maincode = "";
		
		Random random = new Random(System.currentTimeMillis());
		int besize = outcode.length;
		
		for(int i = 0; i < count; i++) {
			maincode += outcode[random.nextInt(besize)];
		}
		
		String to =  outputA.getM_email();
		String subject = "비밀번호 인증키";
		String content = "인증번호 8자리를 비밀번호 재설정 2번 페이지에 입력해주세요. 인증번호 = " + maincode;
		
		try {
			
			mailhelper.sendMail(to, subject, content);
			
		} catch (Exception e) {
			return webHelper.redirect(null, "메일 발송에 실패 했습니다.");
		}
		
		SimpleDateFormat format1 = new SimpleDateFormat ( "yyyy-MM-dd HH:mm:ss");
		Date time = new Date();
		String time1 = format1.format(time);
		
		Email inputA = new Email();
		inputA.setE_sub(subject);
		inputA.setE_cont(content);
		inputA.setE_wdate(time1);
		inputA.setE_sdate(time1);
		inputA.setE_men(outputA.getM_id());
		inputA.setE_passcode(maincode);
		
		try {
			
			emailService.addEmail(inputA);
			
		} catch (Exception e) {
			return webHelper.redirect(null, "인증번호키 관련 오류 입니다. 관리자에게 문의 하세요.");
		}
		
		session.setAttribute("key", outputA);
		session.setAttribute("email_id", inputA);
		
		String redirectUrl = contextPath + "/pjh/jsp/no_id_passChange_A.do";
		return webHelper.redirect(redirectUrl, "회원 아이디가 확인되었습니다. 메일주소로 인증번호 8자리를 발송했습니다.");
	}
	
	@RequestMapping(value = "/pjh/jsp/no_id_passChange_A.do", method = RequestMethod.GET)
	public ModelAndView no_id_passChange_A(Model model,
			 HttpServletRequest request) {
		
		HttpSession session  = request.getSession();
		Members key = (Members) session.getAttribute("key");
		Email email_id = (Email) session.getAttribute("email_id");
		
		session.setAttribute("key", key);
		session.setAttribute("email_id", email_id);
		
		return new ModelAndView("pjh/jsp/no_id_passChange_A");
	}
	
	@RequestMapping(value = "/pjh/jsp/no_id_passChange_ok_A.do", method = RequestMethod.POST)
	public ModelAndView no_id_passChange_ok_A(Model model,
			@RequestParam(value = "passcode" , required = false) String passcode,
			 HttpServletRequest request) {
		
		HttpSession session  = request.getSession();
		Members key = (Members) session.getAttribute("key");
		Email email_id = (Email) session.getAttribute("email_id");
		
		Email input = new Email();
		input.setId(email_id.getId());
		Email output = null;
		
		try {
			
			output = emailService.getEmailItem(input);
			String A = String.valueOf((output.getE_passcode()).trim());
			String B = String.valueOf(passcode.trim());
			if(!(A.equals(B))) {
				return webHelper.redirect((output.getE_passcode()).trim(), "인증번호키를 확인 후 다시 입력해 주세요.");
			}
			
		} catch (Exception e) {
			return webHelper.redirect(output.e_passcode, e.getLocalizedMessage());
		}
		
		
		session.setAttribute("key", key);
		
		String redirectUrl = contextPath + "/pjh/jsp/no_id_passChange_B.do";
		return webHelper.redirect(redirectUrl, "인증키가 확인되었습니다. 비밀번호 재설정 페이지로 이동합니다.");
	}
	@RequestMapping(value = "/pjh/jsp/no_id_passChange_B.do", method = RequestMethod.GET)
	public ModelAndView no_id_passChange_B(Model model,
			 HttpServletRequest request) {
		
		HttpSession session  = request.getSession();
		Members key = (Members) session.getAttribute("key");
		
		Members input = new Members();
		input.setId(key.getId());
		Members output = null;
		
		try {
			
			output = membersService.getMembersItem(input);
			
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		model.addAttribute("output",output);
		session.setAttribute("key", key);
		
		return new ModelAndView("pjh/jsp/passChangeA");
	}
	@RequestMapping(value = "/pjh/jsp/passChange_ok_A.do", method = RequestMethod.GET)
	public ModelAndView passChange_ok_A(Model model,
			@RequestParam(value="id", defaultValue = "0") int id,
			@RequestParam(value = "m_id" , required = false) String m_id,
			@RequestParam(value = "new_m_pw_A" , required = false) String new_m_pw_A,
			@RequestParam(value = "new_m_pw_B" , required = false) String new_m_pw_B,
			 HttpServletRequest request) {
		
		String pwA = (String)new_m_pw_A;
		String pwB = (String)new_m_pw_B;
		
		if(!(pwA.equals(pwB))) 						{ return webHelper.redirect(null, "비밀번호를 확인해주세요."); }
		
		Members input = new Members();
		input.setId(id);
		input.setM_id(m_id);
		input.setM_pw(new_m_pw_B);
		
		
		try {
			
			membersService.editMembersBibun(input);
			
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		String redirectUrl = contextPath + "/pjh/jsp/login.do";
		return webHelper.redirect(redirectUrl, "비밀번호가 재설정 되었습니다.");
	}
}
