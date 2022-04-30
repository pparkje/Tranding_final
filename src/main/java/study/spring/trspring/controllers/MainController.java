package study.spring.trspring.controllers;

import java.util.List;

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
import study.spring.trspring.model.ModelA;
import study.spring.trspring.service.GoodsService;
import study.spring.trspring.service.MembersService;

@Controller
public class MainController {
	@Autowired
	WebHelper webHelper;
	@Autowired
	RegexHelper regexHelper;
	@Autowired
	GoodsService goodsService;


	@Value("#{servletContext.contextPath}")
	String contextPath;


	@RequestMapping(value = "/main.do", method = RequestMethod.GET)
	public ModelAndView list(Model model) {
		
		List<Goods> outputA = null;
		
		try {
			outputA = goodsService.getGoodsListC();
			
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		model.addAttribute("outputA",outputA);
		
		return new ModelAndView("main");
	}

}
