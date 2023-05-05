package com.multi.mvc.content.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.multi.mvc.board.model.vo.Board;
import com.multi.mvc.common.util.PageInfo;
import com.multi.mvc.common.weather.api.WeatherParsing;
import com.multi.mvc.common.weather.vo.WeatherValue;
import com.multi.mvc.content.model.vo.Content;
import com.multi.mvc.content.model.vo.ContentReply;
import com.multi.mvc.content.service.ContentService;
import com.multi.mvc.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ContentController {
	
	@Autowired
	private ContentService service;
	
	private WeatherParsing weather;
	
	
	@GetMapping("/board/content/attraction")
	public String content3List(Model model, @RequestParam Map<String, String> param) {
		log.info("리스트 요청, param : " + param);
		int page = 1;
		Map<String, String> searchMap = new HashMap<String, String>();
		try {
			String option = param.get("option");
			searchMap.put("option", option);
			String id = param.get("id");
			searchMap.put("id", id);
			String searchValue = param.get("searchValue");
			if(searchValue != null && searchValue.length()>0) {
				String searchType = param.get("searchType");
				searchMap.put(searchType, searchValue);
			}
			page=Integer.parseInt(param.get("page"));
		} catch (Exception e) {}
		
		int boardCount = service.getContentCount(searchMap);
		PageInfo pageInfo = new PageInfo(page, 10, boardCount, 9);
		List<Content> list = service.getContentList(pageInfo, searchMap);
		
		model.addAttribute("list",list);
		model.addAttribute("param",param);
		model.addAttribute("pageInfo",pageInfo);
		
		WeatherValue weateherValue = weather.parsing().get(0);
		
		int temperatures = weateherValue.getTa();
		int pattern = weateherValue.getRnYn();
		String cloud = weateherValue.getWfCd();
		
		model.addAttribute("temperatures", temperatures);
		model.addAttribute("pattern", pattern);
		model.addAttribute("cloud", cloud);
		
		return "/board/content/attraction";
	}
	
	
	
	@RequestMapping("/board/content/board-detail")
	public String contentView(Model model, @RequestParam Map<String, String> param) {
		Map<String, String> searchMap = new HashMap<String, String>();
		try {
			String id = param.get("id");
			searchMap.put("id", id);
			String no = param.get("no");
			searchMap.put("no", no);
			
			Content content = service.findByNo(searchMap);
			if(content == null) {
				return "redirect:error";
			}
			
			model.addAttribute("content",content);
			model.addAttribute("replyList",content.getReplies());
		} catch (Exception e) {	}
		
		
		WeatherValue weateherValue = weather.parsing().get(0);
		
		int temperatures = weateherValue.getTa();
		int pattern = weateherValue.getRnYn();
		String cloud = weateherValue.getWfCd();
		
		model.addAttribute("temperatures", temperatures);
		model.addAttribute("pattern", pattern);
		model.addAttribute("cloud", cloud);
		
		return "/board/content/board-detail";
	}
	
	@PostMapping("/board/content/reply")
	public String contentWriteReply(Model model,
			@SessionAttribute(name = "loginMember", required = false) Member loginMember,
			@ModelAttribute ContentReply reply) {
		reply.setWriterNo(loginMember.getNo());
		log.info("리플 작성 요청 Reply : " + reply);
		
		int result = service.saveContentReply(reply);
		
		if(result > 0) {
			model.addAttribute("msg", "리플이 등록되었습니다.");
		}else {
			model.addAttribute("msg", "리플 등록에 실패하였습니다.");
		}
		model.addAttribute("location", "/board/content/board-detail?no="+reply.getContentNo());
		
		return "/common/msg";
	}
	
	@RequestMapping("/board/content/replyDel")
	public String freeDeleteReply(Model model, 
			@SessionAttribute(name = "loginMember", required = false) Member loginMember,
			int replyNo, int boardNo
			){
		log.info("리플 삭제 요청");
		
		int result = service.deleteContentReply(replyNo);
		
		
		if(result > 0) {
			model.addAttribute("msg", "리플 삭제가 정상적으로 완료되었습니다.");
		}else {
			model.addAttribute("msg", "리플 삭제에 실패하였습니다.");
		}
		model.addAttribute("location", "/board/content/board-detail?no=" + boardNo);
		return "/common/msg";
	}
	
	

}
