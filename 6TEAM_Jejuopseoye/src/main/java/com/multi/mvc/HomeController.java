package com.multi.mvc;

import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.multi.mvc.board.model.service.BoardService;
import com.multi.mvc.common.util.PageInfo;
import com.multi.mvc.common.weather.api.WeatherParsing;
import com.multi.mvc.common.weather.vo.WeatherValue;
import com.multi.mvc.member.model.service.MemberService;

@Controller
public class HomeController {
	
	@Autowired
	private BoardService service;
	
	@Autowired
	private MemberService memberService;
	
	private WeatherParsing weather;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model, HttpSession session) {
		logger.info("Welcome home! The client locale is {}.", locale);
//		Member loginMember = memberService.login("admin", "1234");
//		session.setAttribute("loginMember", loginMember);
//		test();
		
		WeatherValue weateherValue = weather.parsing().get(0);
		
		int temperatures = weateherValue.getTa();
		int pattern = weateherValue.getRnYn();
		String cloud = weateherValue.getWfCd();
		
		model.addAttribute("temperatures", temperatures);
		model.addAttribute("pattern", pattern);
		model.addAttribute("cloud", cloud);
		
		return "index";
	}
	
	public void test() {
		Map<String, String> map = new HashMap<>();
		PageInfo info = new PageInfo(1, 10, service.getBoardCount(map), 10);
		logger.info("board List : " + service.getBoardList(info, map));
	}
	
	@RequestMapping("/common/not_implemented")
	public String not_implemented() {
		return "/common/not_implemented";
	}
	
	
	@RequestMapping("/menu/recommendation")
	public String recommendationView(Model model) {
		
		WeatherValue weateherValue = weather.parsing().get(0);
		
		int temperatures = weateherValue.getTa();
		int pattern = weateherValue.getRnYn();
		String cloud = weateherValue.getWfCd();
		
		model.addAttribute("temperatures", temperatures);
		model.addAttribute("pattern", pattern);
		model.addAttribute("cloud", cloud);
		
		return "/menu/recommendation";
	}
	
	
	@RequestMapping("/menu/mypage")
	public String mypage(Model model) {
		
		WeatherValue weateherValue = weather.parsing().get(0);
		
		int temperatures = weateherValue.getTa();
		int pattern = weateherValue.getRnYn();
		String cloud = weateherValue.getWfCd();
		
		model.addAttribute("temperatures", temperatures);
		model.addAttribute("pattern", pattern);
		model.addAttribute("cloud", cloud);
		
		return "/menu/mypage";
	}
	
	@RequestMapping("/member/loginview")
	public String login() {
		return "/member/loginview";
	}
	
	@RequestMapping("/member/reservation-list")
	public String loginView(Model model) {
		
		WeatherValue weateherValue = weather.parsing().get(0);
		
		int temperatures = weateherValue.getTa();
		int pattern = weateherValue.getRnYn();
		String cloud = weateherValue.getWfCd();
		
		model.addAttribute("temperatures", temperatures);
		model.addAttribute("pattern", pattern);
		model.addAttribute("cloud", cloud);
		
		return "/member/reservation-list";
	}
	
	@RequestMapping("/member/pick-list")
	public String pcikList(Model model) {
		
		WeatherValue weateherValue = weather.parsing().get(0);
		
		int temperatures = weateherValue.getTa();
		int pattern = weateherValue.getRnYn();
		String cloud = weateherValue.getWfCd();
		
		model.addAttribute("temperatures", temperatures);
		model.addAttribute("pattern", pattern);
		model.addAttribute("cloud", cloud);
		
		
		return "/member/pick-list";
	}
	

	
	
	
}
