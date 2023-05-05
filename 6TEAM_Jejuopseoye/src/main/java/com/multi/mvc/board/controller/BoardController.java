package com.multi.mvc.board.controller;

import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;

import com.multi.mvc.board.model.service.BoardService;
import com.multi.mvc.board.model.vo.Board;
import com.multi.mvc.board.model.vo.Reply;
import com.multi.mvc.common.util.PageInfo;
import com.multi.mvc.common.weather.api.WeatherParsing;
import com.multi.mvc.common.weather.vo.WeatherValue;
import com.multi.mvc.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/board") // 요청 url의 상위 url을 모두 처리할 때 사용
@Controller
public class BoardController {
	
	@Autowired
	private BoardService service;
	
	@Autowired
	private ResourceLoader resourceLoader; // 파일 다운로드 기능시 활용하는 loader
	
	private WeatherParsing weather;
	
//	@GetMapping("/board/list") // class 상단의 @RequestMapping로 인하여 /board 생략해야함
	@GetMapping("/free/board")
	public String freeList(Model model, @RequestParam Map<String, String> param) {
		log.info("리스트 요청, param : " + param);
		int page = 1;
		Map<String, String> searchMap = new HashMap<String, String>();
		try {
			String type = param.get("type");
			searchMap.put("type", type);
			String searchValue = param.get("searchValue");
			if(searchValue != null && searchValue.length()>0) {
				String searchType = param.get("searchType");
				searchMap.put(searchType, searchValue);
			}
			page=Integer.parseInt(param.get("page"));
		} catch (Exception e) {}
		
		int boardCount = service.getBoardCount(searchMap);
		PageInfo pageInfo = new PageInfo(page, 10, boardCount, 10);
		List<Board> list = service.getBoardList(pageInfo, searchMap);
		
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
		
		
		return "/board/free/board";
	}
	
	
	
//	@RequestMapping("/board/view")
	@RequestMapping("/free/board-detail")
	public String freeView(Model model, @RequestParam("no") int no) {
		Board board = service.findByNo(no);
		if(board == null) {
			return "redirect:error";
		}
		WeatherValue weateherValue = weather.parsing().get(0);
		
		// 줄바꿈
		board.setContent(board.getContent().replace("\r\n", "<br/>"));
		
		int temperatures = weateherValue.getTa();
		int pattern = weateherValue.getRnYn();
		String cloud = weateherValue.getWfCd();
		
		model.addAttribute("temperatures", temperatures);
		model.addAttribute("pattern", pattern);
		model.addAttribute("cloud", cloud);
		
		model.addAttribute("board",board);
		model.addAttribute("replyList",board.getReplies());
		return "/board/free/board-detail";
	}
	
	
	@GetMapping("/free/board-write")
	public String freeWriteView(Model model) {
		WeatherValue weateherValue = weather.parsing().get(0);
		
		int temperatures = weateherValue.getTa();
		int pattern = weateherValue.getRnYn();
		String cloud = weateherValue.getWfCd();
		
		model.addAttribute("temperatures", temperatures);
		model.addAttribute("pattern", pattern);
		model.addAttribute("cloud", cloud);
		return "board/free/board-write";
	}
	
	@PostMapping("/free/board-write")
	public String freeWriteBoard(Model model, HttpSession session,
			@SessionAttribute(name = "loginMember", required = false) Member loginMember,
			@ModelAttribute Board board,
			@RequestParam("upfile") MultipartFile upfile) {
		log.info("게시글 작성 요청");
		
		// 보안상의 코드라 프로젝트때는 없어도 된다. 잘못된 접근 체킹하는 예시
		if(loginMember.getNickName().equals(board.getNickName()) == false) {
			model.addAttribute("msg","잘못된 접근입니다.");
			model.addAttribute("location","/board/free/board?type=free");
			return "common/msg";
		}
		
		board.setWriterNo(loginMember.getNo());
		
		// 파일 저장 로직
		if(upfile != null && upfile.isEmpty()==false) {
			String rootPath = session.getServletContext().getRealPath("resources");
			String savePath = rootPath + "/upload/board";
			String renameFileName = service.saveFile(upfile, savePath); // 실제 파일 저장하는 로직
			
			if(renameFileName != null) {
				board.setOriginalFileName(upfile.getOriginalFilename());
				board.setRenamedFileName(renameFileName);
			}
		}
		log.debug("board : " + board);
		int result = service.saveBoard(board);

		if(result > 0) {
			model.addAttribute("msg", "게시글 작성이 정상적으로 완료되었습니다.");
			model.addAttribute("location", "/board/free/board?type=free");
		}else {
			model.addAttribute("msg", "게시글 작성에 실패하였습니다.");
			model.addAttribute("location", "/board/free/board?type=free");
		}
		
		return "common/msg";
	}
	
	
	@PostMapping("/free/reply")
	public String freeWriteReply(Model model,
			@SessionAttribute(name = "loginMember", required = false) Member loginMember,
			@ModelAttribute Reply reply) {
		reply.setWriterNo(loginMember.getNo());
		log.info("리플 작성 요청 Reply : " + reply);
		
		int result = service.saveReply(reply);
		
		if(result > 0) {
			model.addAttribute("msg", "리플이 등록되었습니다.");
		}else {
			model.addAttribute("msg", "리플 등록에 실패하였습니다.");
		}
		model.addAttribute("location", "/board/free/board-detail?no="+reply.getBoardNo());
		
		return "/common/msg";
	}
	
	
	@RequestMapping("/free/delete")
	public String freeDeleteBoard(Model model, HttpSession session,
			@SessionAttribute(name = "loginMember", required = false) Member loginMember,
			int boardNo) {
		log.info("게시글 삭제 요청 boardNo : " + boardNo);
		String rootPath = session.getServletContext().getRealPath("resources");
		String savePath = rootPath + "/upload/board";
		int result = service.deleteBoard(boardNo, savePath);
		
		if(result > 0) {
			model.addAttribute("msg", "게시글 삭제가 정상적으로 완료되었습니다.");
		}else {
			model.addAttribute("msg", "게시글 삭제에 실패하였습니다.");
		}
		model.addAttribute("location", "/board/free/board?type=free");
		
		return "/common/msg";
	}
	
	@RequestMapping("/free/replyDel")
	public String freeDeleteReply(Model model, 
			@SessionAttribute(name = "loginMember", required = false) Member loginMember,
			int replyNo, int boardNo
			){
		log.info("리플 삭제 요청");
		
		int result = service.deleteReply(replyNo);
		
		
		if(result > 0) {
			model.addAttribute("msg", "리플 삭제가 정상적으로 완료되었습니다.");
		}else {
			model.addAttribute("msg", "리플 삭제에 실패하였습니다.");
		}
		model.addAttribute("location", "/board/free/board-detail?no=" + boardNo);
		return "/common/msg";
	}
	
	@GetMapping("/free/board-update")
	public String freeUpdateView(Model model,
			@SessionAttribute(name = "loginMember", required = false) Member loginMember,
			@RequestParam("no") int no) {
		Board board = service.findByNo(no);
		model.addAttribute("board",board);
		
		WeatherValue weateherValue = weather.parsing().get(0);
		
		int temperatures = weateherValue.getTa();
		int pattern = weateherValue.getRnYn();
		String cloud = weateherValue.getWfCd();
		
		model.addAttribute("temperatures", temperatures);
		model.addAttribute("pattern", pattern);
		model.addAttribute("cloud", cloud);
		
		
		return "/board/free/board-update";
	}
//	@GetMapping("/update")
//	public String updateView(Model model,
//			@SessionAttribute(name = "loginMember", required = false) Member loginMember,
//			@RequestParam("no") int boardNo
//			) {
//		Board board = service.findByNo(boardNo);
//		
//		if(loginMember.getNo() == board.getWriterNo()) {
//			model.addAttribute("board", board);
//			return "board/update";
//		}else {
//			model.addAttribute("msg", "잘못된 접근입니다.");
//			model.addAttribute("location", "/board/list");
//			return "common/msg";
//		}
//	}
	
	
	@PostMapping("/free/update")
	public String freeUpdateBoard(Model model, HttpSession session,
			@SessionAttribute(name = "loginMember", required = false) Member loginMember,
			@ModelAttribute Board board,
			@RequestParam("reloadFile") MultipartFile reloadFile
			) {
		log.info("게시글 수정 요청");
		
		// 보안상의 코드라 프로젝트때는 없어도 된다. 잘못된 접근 체킹하는 예시
		if(loginMember.getNickName().equals(board.getNickName()) == false) {
			model.addAttribute("msg", "잘못된 접근입니다.");
			model.addAttribute("location", "/");
			return "common/msg";
		}
		
		board.setWriterNo(loginMember.getNo());
		
		// 파일 저장 로직
		if(reloadFile != null && reloadFile.isEmpty() == false) {
			String rootPath = session.getServletContext().getRealPath("resources");
			String savePath = rootPath +"/upload/board";
			
			// 기존 파일이 있는 경우 삭제
			if(board.getRenamedFileName() != null) {
				service.deleteFile(savePath + "/" +board.getRenamedFileName());
			}
			
			String renameFileName = service.saveFile(reloadFile, savePath); // 실제 파일 저장하는 로직
			
			if(renameFileName != null) {
				board.setOriginalFileName(reloadFile.getOriginalFilename());
				board.setRenamedFileName(renameFileName);
			}
		}
		
		log.debug("board : " + board);
		int result = service.saveBoard(board);

		if(result > 0) {
			model.addAttribute("msg", "게시글이 수정 되었습니다.");
			model.addAttribute("location", "/board/free/board?type=free");
		}else {
			model.addAttribute("msg", "게시글 수정에 실패하였습니다.");
			model.addAttribute("location", "/board/free/board?type=free");
		}
		
		return "common/msg";
	}
	
	
	@GetMapping("/notice/board")
	public String noticeList(Model model, @RequestParam Map<String, String> param) {
		log.info("리스트 요청, param : " + param);
		int page = 1;
		Map<String, String> searchMap = new HashMap<String, String>();
		try {
			String type = param.get("type");
			searchMap.put("type", type);
			String searchValue = param.get("searchValue");
			if(searchValue != null && searchValue.length()>0) {
				String searchType = param.get("searchType");
				searchMap.put(searchType, searchValue);
			}
			page=Integer.parseInt(param.get("page"));
		} catch (Exception e) {}
		
		int boardCount = service.getBoardCount(searchMap);
		PageInfo pageInfo = new PageInfo(page, 10, boardCount, 10);
		List<Board> list = service.getBoardList(pageInfo, searchMap);
		
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
		
		return "/board/notice/board";
	}
	
//	@RequestMapping("/board/view")
	@RequestMapping("/notice/board-detail")
	public String noticeView(Model model, @RequestParam("no") int no) {
		Board board = service.findByNo(no);
		if(board == null) {
			return "redirect:error";
		}
		
		WeatherValue weateherValue = weather.parsing().get(0);
		
		// 줄바꿈
		board.setContent(board.getContent().replace("\r\n", "<br/>"));
		
		int temperatures = weateherValue.getTa();
		int pattern = weateherValue.getRnYn();
		String cloud = weateherValue.getWfCd();
		
		model.addAttribute("temperatures", temperatures);
		model.addAttribute("pattern", pattern);
		model.addAttribute("cloud", cloud);
		
		model.addAttribute("board",board);
		model.addAttribute("replyList",board.getReplies());
		return "/board/notice/board-detail";
	}
	
	
	
	@GetMapping("/notice/board-write")
	public String noticeWriteView(Model model) {
		
		WeatherValue weateherValue = weather.parsing().get(0);
		
		int temperatures = weateherValue.getTa();
		int pattern = weateherValue.getRnYn();
		String cloud = weateherValue.getWfCd();
		
		model.addAttribute("temperatures", temperatures);
		model.addAttribute("pattern", pattern);
		model.addAttribute("cloud", cloud);
		
		return "board/notice/board-write";
	}
	
	@PostMapping("/notice/board-write")
	public String noticeWriteBoard(Model model, HttpSession session,
			@SessionAttribute(name = "loginMember", required = false) Member loginMember,
			@ModelAttribute Board board,
			@RequestParam("upfile") MultipartFile upfile) {
		log.info("게시글 작성 요청");
		
		// 보안상의 코드라 프로젝트때는 없어도 된다. 잘못된 접근 체킹하는 예시
		if(loginMember.getNickName().equals(board.getNickName()) == false) {
			model.addAttribute("msg","잘못된 접근입니다.");
			model.addAttribute("location","/board/notice/board?type=notice");
			return "common/msg";
		}
		
		board.setWriterNo(loginMember.getNo());
		
		// 파일 저장 로직
		if(upfile != null && upfile.isEmpty()==false) {
			String rootPath = session.getServletContext().getRealPath("resources");
			String savePath = rootPath + "/upload/board";
			String renameFileName = service.saveFile(upfile, savePath); // 실제 파일 저장하는 로직
			
			if(renameFileName != null) {
				board.setOriginalFileName(upfile.getOriginalFilename());
				board.setRenamedFileName(renameFileName);
			}
		}
		log.debug("board : " + board);
		int result = service.saveBoard(board);

		if(result > 0) {
			model.addAttribute("msg", "게시글 작성이 정상적으로 완료되었습니다.");
			model.addAttribute("location", "/board/notice/board?type=notice");
		}else {
			model.addAttribute("msg", "게시글 작성에 실패하였습니다.");
			model.addAttribute("location", "/board/notice/board?type=notice");
		}
		
		return "common/msg";
	}
	
	
	@PostMapping("/notice/reply")
	public String noticeWriteReply(Model model,
			@SessionAttribute(name = "loginMember", required = false) Member loginMember,
			@ModelAttribute Reply reply) {
		reply.setWriterNo(loginMember.getNo());
		log.info("리플 작성 요청 Reply : " + reply);
		
		int result = service.saveReply(reply);
		
		if(result > 0) {
			model.addAttribute("msg", "리플이 등록되었습니다.");
		}else {
			model.addAttribute("msg", "리플 등록에 실패하였습니다.");
		}
		model.addAttribute("location", "/board/notice/board-detail?no="+reply.getBoardNo());
		
		return "/common/msg";
	}
	
	
	@RequestMapping("/notice/delete")
	public String noticeDeleteBoard(Model model, HttpSession session,
			@SessionAttribute(name = "loginMember", required = false) Member loginMember,
			int boardNo) {
		log.info("게시글 삭제 요청 boardNo : " + boardNo);
		String rootPath = session.getServletContext().getRealPath("resources");
		String savePath = rootPath + "/upload/board";
		int result = service.deleteBoard(boardNo, savePath);
		
		if(result > 0) {
			model.addAttribute("msg", "게시글 삭제가 정상적으로 완료되었습니다.");
		}else {
			model.addAttribute("msg", "게시글 삭제에 실패하였습니다.");
		}
		model.addAttribute("location", "/board/notice/board?type=notice");
		
		return "/common/msg";
	}
	
	@RequestMapping("/notice/replyDel")
	public String noticeDeleteReply(Model model, 
			@SessionAttribute(name = "loginMember", required = false) Member loginMember,
			int replyNo, int boardNo
			){
		log.info("리플 삭제 요청");
		
		int result = service.deleteReply(replyNo);
		
		
		if(result > 0) {
			model.addAttribute("msg", "리플 삭제가 정상적으로 완료되었습니다.");
		}else {
			model.addAttribute("msg", "리플 삭제에 실패하였습니다.");
		}
		model.addAttribute("location", "/board/notice/board-detail?no=" + boardNo);
		return "/common/msg";
	}
	
	@GetMapping("/notice/board-update")
	public String noticeUpdateView(Model model,
			@SessionAttribute(name = "loginMember", required = false) Member loginMember,
			@RequestParam("no") int no) {
		Board board = service.findByNo(no);
		model.addAttribute("board",board);
		
		WeatherValue weateherValue = weather.parsing().get(0);
		
		int temperatures = weateherValue.getTa();
		int pattern = weateherValue.getRnYn();
		String cloud = weateherValue.getWfCd();
		
		model.addAttribute("temperatures", temperatures);
		model.addAttribute("pattern", pattern);
		model.addAttribute("cloud", cloud);
		
		return "/board/notice/board-update";
	}
//	@GetMapping("/update")
//	public String updateView(Model model,
//			@SessionAttribute(name = "loginMember", required = false) Member loginMember,
//			@RequestParam("no") int boardNo
//			) {
//		Board board = service.findByNo(boardNo);
//		
//		if(loginMember.getNo() == board.getWriterNo()) {
//			model.addAttribute("board", board);
//			return "board/update";
//		}else {
//			model.addAttribute("msg", "잘못된 접근입니다.");
//			model.addAttribute("location", "/board/list");
//			return "common/msg";
//		}
//	}
	
	
	@PostMapping("/notice/update")
	public String noticeUpdateBoard(Model model, HttpSession session,
			@SessionAttribute(name = "loginMember", required = false) Member loginMember,
			@ModelAttribute Board board,
			@RequestParam("reloadFile") MultipartFile reloadFile
			) {
		log.info("게시글 수정 요청");
		
		// 보안상의 코드라 프로젝트때는 없어도 된다. 잘못된 접근 체킹하는 예시
		if(loginMember.getNickName().equals(board.getNickName()) == false) {
			model.addAttribute("msg", "잘못된 접근입니다.");
			model.addAttribute("location", "/");
			return "common/msg";
		}
		
		board.setWriterNo(loginMember.getNo());
		
		// 파일 저장 로직
		if(reloadFile != null && reloadFile.isEmpty() == false) {
			String rootPath = session.getServletContext().getRealPath("resources");
			String savePath = rootPath +"/upload/board";
			
			// 기존 파일이 있는 경우 삭제
			if(board.getRenamedFileName() != null) {
				service.deleteFile(savePath + "/" +board.getRenamedFileName());
			}
			
			String renameFileName = service.saveFile(reloadFile, savePath); // 실제 파일 저장하는 로직
			
			if(renameFileName != null) {
				board.setOriginalFileName(reloadFile.getOriginalFilename());
				board.setRenamedFileName(renameFileName);
			}
		}
		
		log.debug("board : " + board);
		int result = service.saveBoard(board);

		if(result > 0) {
			model.addAttribute("msg", "게시글이 수정 되었습니다.");
			model.addAttribute("location", "/board/notice/board?type=notice");
		}else {
			model.addAttribute("msg", "게시글 수정에 실패하였습니다.");
			model.addAttribute("location", "/board/notice/board?type=notice");
		}
		
		return "common/msg";
	}
	
	
	@GetMapping("/travel-review/board")
	public String reviewList(Model model, @RequestParam Map<String, String> param) {
		log.info("리스트 요청, param : " + param);
		int page = 1;
		Map<String, String> searchMap = new HashMap<String, String>();
		try {
			String type = param.get("type");
			searchMap.put("type", type);
			String searchValue = param.get("searchValue");
			if(searchValue != null && searchValue.length()>0) {
				String searchType = param.get("searchType");
				searchMap.put(searchType, searchValue);
			}
			page=Integer.parseInt(param.get("page"));
		} catch (Exception e) {}
		
		int boardCount = service.getBoardCount(searchMap);
		PageInfo pageInfo = new PageInfo(page, 10, boardCount, 9);
		List<Board> list = service.getBoardList(pageInfo, searchMap);
		
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
		
		return "/board/travel-review/board";
	}
	
//	@RequestMapping("/board/view")
	@RequestMapping("/travel-review/board-detail")
	public String reviewView(Model model, @RequestParam("no") int no) {
		Board board = service.findByNo(no);
		if(board == null) {
			return "redirect:error";
		}
		
		// 줄바꿈
		board.setContent(board.getContent().replace("\r\n", "<br/>"));
		
		model.addAttribute("board",board);
		model.addAttribute("replyList",board.getReplies());
		
		WeatherValue weateherValue = weather.parsing().get(0);
		
		int temperatures = weateherValue.getTa();
		int pattern = weateherValue.getRnYn();
		String cloud = weateherValue.getWfCd();
		
		model.addAttribute("temperatures", temperatures);
		model.addAttribute("pattern", pattern);
		model.addAttribute("cloud", cloud);
		
		return "/board/travel-review/board-detail";
	}
	
	
	
	@GetMapping("/travel-review/board-write")
	public String reviewWriteView(Model model) {
		
		WeatherValue weateherValue = weather.parsing().get(0);
		
		int temperatures = weateherValue.getTa();
		int pattern = weateherValue.getRnYn();
		String cloud = weateherValue.getWfCd();
		
		model.addAttribute("temperatures", temperatures);
		model.addAttribute("pattern", pattern);
		model.addAttribute("cloud", cloud);
		
		return "board/travel-review/board-write";
	}
	
	@PostMapping("/travel-review/board-write")
	public String reviewWriteBoard(Model model, HttpSession session,
			@SessionAttribute(name = "loginMember", required = false) Member loginMember,
			@ModelAttribute Board board,
			@RequestParam("upfile") MultipartFile upfile) {
		log.info("게시글 작성 요청");
		
		// 보안상의 코드라 프로젝트때는 없어도 된다. 잘못된 접근 체킹하는 예시
		if(loginMember.getNickName().equals(board.getNickName()) == false) {
			model.addAttribute("msg","잘못된 접근입니다.");
			model.addAttribute("location","/board/travel-review/board?type=review");
			return "common/msg";
		}
		
		board.setWriterNo(loginMember.getNo());
		
		// 파일 저장 로직
		if(upfile != null && upfile.isEmpty()==false) {
			String rootPath = session.getServletContext().getRealPath("resources");
			String savePath = rootPath + "/upload/board";
			String renameFileName = service.saveFile(upfile, savePath); // 실제 파일 저장하는 로직
			
			if(renameFileName != null) {
				board.setOriginalFileName(upfile.getOriginalFilename());
				board.setRenamedFileName(renameFileName);
			}
		}
		log.debug("board : " + board);
		int result = service.saveBoard(board);

		if(result > 0) {
			model.addAttribute("msg", "게시글 작성이 정상적으로 완료되었습니다.");
			model.addAttribute("location", "/board/travel-review/board?type=review");
		}else {
			model.addAttribute("msg", "게시글 작성에 실패하였습니다.");
			model.addAttribute("location", "/board/travel-review/board?type=review");
		}
		
		return "common/msg";
	}
	
	
	@PostMapping("/travel-review/reply")
	public String reviewWriteReply(Model model,
			@SessionAttribute(name = "loginMember", required = false) Member loginMember,
			@ModelAttribute Reply reply) {
		reply.setWriterNo(loginMember.getNo());
		log.info("리플 작성 요청 Reply : " + reply);
		
		int result = service.saveReply(reply);
		
		if(result > 0) {
			model.addAttribute("msg", "리플이 등록되었습니다.");
		}else {
			model.addAttribute("msg", "리플 등록에 실패하였습니다.");
		}
		model.addAttribute("location", "/board/travel-review/board-detail?no="+reply.getBoardNo());
		
		return "/common/msg";
	}
	
	
	@RequestMapping("/travel-review/delete")
	public String reviewDeleteBoard(Model model, HttpSession session,
			@SessionAttribute(name = "loginMember", required = false) Member loginMember,
			int boardNo) {
		log.info("게시글 삭제 요청 boardNo : " + boardNo);
		String rootPath = session.getServletContext().getRealPath("resources");
		String savePath = rootPath + "/upload/board";
		int result = service.deleteBoard(boardNo, savePath);
		
		if(result > 0) {
			model.addAttribute("msg", "게시글 삭제가 정상적으로 완료되었습니다.");
		}else {
			model.addAttribute("msg", "게시글 삭제에 실패하였습니다.");
		}
		model.addAttribute("location", "/board/travel-review/board?type=review");
		
		return "/common/msg";
	}
	
	@RequestMapping("/travel-review/replyDel")
	public String reviewDeleteReply(Model model, 
			@SessionAttribute(name = "loginMember", required = false) Member loginMember,
			int replyNo, int boardNo
			){
		log.info("리플 삭제 요청");
		
		int result = service.deleteReply(replyNo);
		
		
		if(result > 0) {
			model.addAttribute("msg", "리플 삭제가 정상적으로 완료되었습니다.");
		}else {
			model.addAttribute("msg", "리플 삭제에 실패하였습니다.");
		}
		model.addAttribute("location", "/board/travel-review/board-detail?no=" + boardNo);
		return "/common/msg";
	}
	
	@GetMapping("/travel-review/board-update")
	public String reviewUpdateView(Model model,
			@SessionAttribute(name = "loginMember", required = false) Member loginMember,
			@RequestParam("no") int no) {
		Board board = service.findByNo(no);
		model.addAttribute("board",board);
		
		WeatherValue weateherValue = weather.parsing().get(0);
		
		int temperatures = weateherValue.getTa();
		int pattern = weateherValue.getRnYn();
		String cloud = weateherValue.getWfCd();
		
		model.addAttribute("temperatures", temperatures);
		model.addAttribute("pattern", pattern);
		model.addAttribute("cloud", cloud);
		
		return "/board/travel-review/board-update";
	}
//	@GetMapping("/update")
//	public String updateView(Model model,
//			@SessionAttribute(name = "loginMember", required = false) Member loginMember,
//			@RequestParam("no") int boardNo
//			) {
//		Board board = service.findByNo(boardNo);
//		
//		if(loginMember.getNo() == board.getWriterNo()) {
//			model.addAttribute("board", board);
//			return "board/update";
//		}else {
//			model.addAttribute("msg", "잘못된 접근입니다.");
//			model.addAttribute("location", "/board/list");
//			return "common/msg";
//		}
//	}
	
	
	@PostMapping("/travel-review/update")
	public String reviewUpdateBoard(Model model, HttpSession session,
			@SessionAttribute(name = "loginMember", required = false) Member loginMember,
			@ModelAttribute Board board,
			@RequestParam("reloadFile") MultipartFile reloadFile
			) {
		log.info("게시글 수정 요청");
		
		// 보안상의 코드라 프로젝트때는 없어도 된다. 잘못된 접근 체킹하는 예시
		if(loginMember.getNickName().equals(board.getNickName()) == false) {
			model.addAttribute("msg", "잘못된 접근입니다.");
			model.addAttribute("location", "/");
			return "common/msg";
		}
		
		board.setWriterNo(loginMember.getNo());
		
		// 파일 저장 로직
		if(reloadFile != null && reloadFile.isEmpty() == false) {
			String rootPath = session.getServletContext().getRealPath("resources");
			String savePath = rootPath +"/upload/board";
			
			// 기존 파일이 있는 경우 삭제
			if(board.getRenamedFileName() != null) {
				service.deleteFile(savePath + "/" +board.getRenamedFileName());
			}
			
			String renameFileName = service.saveFile(reloadFile, savePath); // 실제 파일 저장하는 로직
			
			if(renameFileName != null) {
				board.setOriginalFileName(reloadFile.getOriginalFilename());
				board.setRenamedFileName(renameFileName);
			}
		}
		
		log.debug("board : " + board);
		int result = service.saveBoard(board);

		if(result > 0) {
			model.addAttribute("msg", "게시글이 수정 되었습니다.");
			model.addAttribute("location", "/board/travel-review/board?type=review");
		}else {
			model.addAttribute("msg", "게시글 수정에 실패하였습니다.");
			model.addAttribute("location", "/board/travel-review/board?type=review");
		}
		
		return "common/msg";
	}
	
	
	
	
	
	


	@GetMapping("/error")
	public String error() {
		return "/common/error.jsp";
	}
	
	
	
	@RequestMapping("/fileDown")
	public ResponseEntity<Resource> fileDown(
			@RequestParam("oriname") String oriname,
			@RequestParam("rename") String rename,
			@RequestHeader(name= "user-agent") String userAgent){
		try {
			Resource resource = resourceLoader.getResource("resources/upload/board/" + rename);
			String downName = null;
			
			// 인터넷 익스플로러 인 경우
			boolean isMSIE = userAgent.indexOf("MSIE") != -1 || userAgent.indexOf("Trident") != -1;

			if (isMSIE) { // 익스플로러 처리하는 방법
				downName = URLEncoder.encode(oriname, "UTF-8").replaceAll("\\+", "%20");
			} else {    		
				downName = new String(oriname.getBytes("UTF-8"), "ISO-8859-1"); // 크롬
			}
			
			return ResponseEntity.ok()
					.header(HttpHeaders.CONTENT_DISPOSITION, "attachment;filename=\"" + downName + "\"")
					.header(HttpHeaders.CONTENT_LENGTH, String.valueOf(resource.contentLength()))
					.header(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_OCTET_STREAM.toString())
					.body(resource);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build(); // 실패했을 경우
	}

}
