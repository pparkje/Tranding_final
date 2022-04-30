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
import study.spring.trspring.model.Members;
import study.spring.trspring.service.MembersService;

@Controller
public class MypageController {
	@Autowired
	WebHelper webHelper;
	@Autowired
	RegexHelper regexHelper;
	@Autowired
	MembersService membersService;

	@Value("#{servletContext.contextPath}")
	String contextPath;
	
	@RequestMapping(value = "/pjh/jsp/Mypage.do", method = RequestMethod.GET)
	public ModelAndView view(Model model,
			HttpServletRequest request) {

		HttpSession session  = request.getSession();
		Members key = (Members) session.getAttribute("key");
		int A = key.getId();

		if(A == 0) {
			return webHelper.redirect(null, "개발자에게 문의하세요.");
		}
		
		Members input = new Members();
		input.setId(A);

		Members output = null;

		try {
			output = membersService.getMembersItem(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		model.addAttribute("output",output);
		session.setAttribute("key", key);
		
		return new ModelAndView("pjh/jsp/Mypage");
	}
	
}
