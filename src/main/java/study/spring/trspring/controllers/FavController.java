package study.spring.trspring.controllers;

import java.util.List;
import java.util.Map;

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
import study.spring.trspring.model.Jjim;
import study.spring.trspring.model.Members;
import study.spring.trspring.service.GoodsService;
import study.spring.trspring.service.JjimService;
import study.spring.trspring.service.MembersService;
import uap_clj.java.api.Browser;
import uap_clj.java.api.Device;
import uap_clj.java.api.OS;

@Controller
public class FavController {
	@Autowired
	WebHelper webHelper;
	@Autowired
	RegexHelper regexHelper;
	@Autowired
	GoodsService goodsService;
	@Autowired
	JjimService jjimService;

	@Value("#{servletContext.contextPath}")
	String contextPath;
	
	@RequestMapping(value = "/pjh/jsp/favPagejsp.do", method = RequestMethod.GET)
	public ModelAndView favPagejsp(Model model,
			HttpServletRequest request) {

		HttpSession session  = request.getSession();
		
		Members members = (Members) session.getAttribute("key");
		
		String ua = request.getHeader("User-Agent");

		Map<String, String> browser = Browser.lookup(ua);

		Map<String, String> os = (Map<String, String>) OS.lookup(ua);

		Map<String, String> device = (Map<String, String>) Device.lookup(ua);

		String browserStr = String.format("family=%s, patch=%s, major=%s, minor=%s", 
				browser.get("family"), browser.get("patch"),browser.get("major"),browser.get("minor"));

		String osStr = String.format("family=%s, patch=%s, patch_minor=%s, major=%s, minor=%s", 
				os.get("family"), os.get("patch"),os.get("patch_minor"),os.get("major"),os.get("minor"));

		String deviceStr = String.format("family=%s, model=%s, brand=%s", 
				device.get("family"), device.get("model"),device.get("brand"));

		Jjim input = new Jjim();
		input.setF_user_agent(ua);
		input.setF_browser(browserStr);
		input.setF_os(osStr);
		input.setF_device(deviceStr);

		List<Jjim> output = null;

		try {
			output =  jjimService.getJjimList(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		model.addAttribute("output",output);
		model.addAttribute("key",members);
		session.setAttribute("key", members); 
		
		return new ModelAndView("pjh/jsp/favPagejsp");
	}
	
	@RequestMapping(value = "/pjh/jsp/favdelete.do", method = RequestMethod.POST)
	public ModelAndView favdelete(Model model,
			@RequestParam(value="id" ,defaultValue = "0") int id,
			HttpServletRequest request) {

		if(id == 0) {
			return webHelper.redirect(null, "찜목록관련 오류입니다. 관리자에게 문의하세요");
		}
		
		
		Jjim input = new Jjim();
		input.setId(id);

		try {
			jjimService.deleteJjim(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		String redirectUrl = contextPath + "/pjh/jsp/favPagejsp.do";
		
		return webHelper.redirect(redirectUrl, "찜목록이 삭제 되었습니다.");	
	}
}
