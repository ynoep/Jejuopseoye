package com.multi.mvc.board.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.multi.mvc.board.model.service.BoardService;
import com.multi.mvc.board.model.vo.Board;
import com.multi.mvc.board.model.vo.Reply;
import com.multi.mvc.common.util.PageInfo;
import com.multi.mvc.common.weather.api.WeatherParsing;
import com.multi.mvc.common.weather.vo.WeatherValue;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class MyBoardReplyController {
	
	@Autowired
	private BoardService service;
	
	private WeatherParsing weather;
	
	@GetMapping("/member/my-board-reply")
	public String myBoardReplyList(Model model, @RequestParam Map<String, String> param) {
		log.info("리스트 요청, param : " + param);
		int page = 1;
		Map<String, String> searchMap = new HashMap<String, String>();
		try {
			String no = param.get("no");
			searchMap.put("no", no);
			String searchValue = param.get("searchValue");
			if(searchValue != null && searchValue.length()>0) {
				String searchType = param.get("searchType");
				searchMap.put(searchType, searchValue);
			}
			page=Integer.parseInt(param.get("page"));
		} catch (Exception e) {}
		
		int boardCount = service.getBoardCount(searchMap);
		int replyCount = service.getReplyCount(searchMap);
		PageInfo boardPageInfo = new PageInfo(page, 5, boardCount, 5);
		PageInfo replyPageInfo = new PageInfo(page, 5, replyCount, 5);
		List<Board> boardList = service.getBoardList(boardPageInfo, searchMap);
		List<Reply> replyList = service.getReplyList(replyPageInfo, searchMap);
		
		model.addAttribute("boardList",boardList);
		model.addAttribute("replyList",replyList);
		model.addAttribute("param",param);
		model.addAttribute("boardPageInfo",boardPageInfo);
		model.addAttribute("replyPageInfo",replyPageInfo);
		
		WeatherValue weateherValue = weather.parsing().get(0);
		
		int temperatures = weateherValue.getTa();
		int pattern = weateherValue.getRnYn();
		String cloud = weateherValue.getWfCd();
		
		model.addAttribute("temperatures", temperatures);
		model.addAttribute("pattern", pattern);
		model.addAttribute("cloud", cloud);
		
		
		return "/member/my-board-reply";
	}

}
