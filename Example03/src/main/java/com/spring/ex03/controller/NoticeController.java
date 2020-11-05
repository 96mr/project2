package com.spring.ex03.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.ex03.service.NoticeBoardService;
import com.spring.ex03.vo.MemberVO;
import com.spring.ex03.vo.NoticeBoardVO;

@Controller
public class NoticeController {
	
	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);
	
	@Autowired
	private NoticeBoardService service;
	
	@RequestMapping(value = "/notice/write", method = RequestMethod.GET)
	public String notice_write(Model model) throws Exception {
		logger.info("GET notice write");
		NoticeBoardVO vo = new NoticeBoardVO();
		vo.setCategories(service.listCategory());
		model.addAttribute("notice", vo);		
		return "notice/notice_write";
	}
	
	@RequestMapping(value = "/notice/write", method = RequestMethod.POST)
	public String notice_write(@ModelAttribute("notice") NoticeBoardVO vo, HttpSession session,
							  Model model, RedirectAttributes rttr) throws Exception {
		logger.info("POST notice write");
		if(vo.getContent().trim().isEmpty()|| vo.getTitle().trim().isEmpty()) { //공백여부
			vo.setCategories(service.listCategory());
			return "notice/notice_write";
		}
		
		MemberVO user = (MemberVO) session.getAttribute("sessionID");
		vo.setWriter(user.getId());
		System.out.println(vo.getFiles());
		service.insertBoard(vo);
		return "redirect:/notice/list";
	}
	
	@RequestMapping(value = "/notice/list", method = RequestMethod.GET)
	public String notice(@RequestParam(value= "page", required = false) String page,
						 @RequestParam(value="category", required =false) String category, Model model) throws Exception {
		logger.info("notice");
		Map<String, Object> map = service.listNotice(page == null? "1":page, category == null? "":category);
		model.addAttribute("noticeList", map.get("list"))
			 .addAttribute("paging", map.get("paging"))
			 .addAttribute("category", category)
			 .addAttribute("page", page);
		return "notice/notice";
	}
	
	@RequestMapping(value = {"/notice/{board}"}, method = RequestMethod.GET)
	public String notice_detail(@PathVariable("board") int board, Model model) throws Exception {
		logger.info("notice");
		Map<String,Object> map = service.detailNotice(board);
		model.addAttribute("board",map.get("board"));
		model.addAttribute("fileList",map.get("fileList"));
		return "notice/notice_detail";
	}

	@RequestMapping(value = "/notice/modify/{board}", method = RequestMethod.GET)
	public String notice_modify(@PathVariable("board") int board, HttpSession session, 
								RedirectAttributes rttr, Model model) throws Exception {
		logger.info("GET notice modify");
		Map<String, Object> detail = service.detailNotice(board);
		if(detail == null) {
			rttr.addFlashAttribute("msg", "존재하지 않는 게시글입니다");
			return "redirect:/notice/list";
		}
		@SuppressWarnings("unchecked")
		Map<String, Object> map = (Map<String, Object>) detail.get("board");
		String writer = (String) map.get("WRITER");	
		MemberVO user = (MemberVO)session.getAttribute("sessionID");
		if(!user.getId().equals(writer)) {
			rttr.addFlashAttribute("msg", "작성자가 아닙니다!");
			return "redirect:/notice/list";
		}
		NoticeBoardVO vo = new NoticeBoardVO();
		vo.setId(Integer.parseInt(String.valueOf(map.get("ID"))));
		vo.setTitle((String)map.get("TITLE"));
		vo.setCategories(service.listCategory());
		vo.setContent((String)map.get("CONTENT"));
		
		model.addAttribute("notice", vo);		
		return "notice/notice_modify";
	}
	
	@RequestMapping(value = "/notice/modify/{board}", method = RequestMethod.POST)
	public String notice_modify(@ModelAttribute("notice") NoticeBoardVO vo,
							  Model model, RedirectAttributes rttr) throws Exception {
		logger.info("POST notice modify");
		if(vo.getContent().trim().isEmpty()|| vo.getTitle().trim().isEmpty()) { //공백여부
			vo.setCategories(service.listCategory());
			return "notice/notice_write";
		}

		service.modifyBoard(vo);
		return "redirect:/notice/"+ vo.getId();
	}
}
