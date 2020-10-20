package com.spring.ex03.controller;

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
	public String notice_write(Model model) {
		logger.info("GET notice write");
		NoticeBoardVO vo = new NoticeBoardVO();
		vo.setCategories(service.listCategory());
		model.addAttribute("notice", vo);
		
		return "notice/notice_write";
	}
	
	@RequestMapping(value = "/notice/write", method = RequestMethod.POST)
	public String notice_write(@ModelAttribute("notice") NoticeBoardVO vo, HttpSession session,
								Model model, RedirectAttributes rttr) {
		logger.info("POST notice write");
		if(vo.getContent().trim().isEmpty()|| vo.getTitle().trim().isEmpty()) { //공백여부
			vo.setCategories(service.listCategory());
			return "notice/notice_write";
		}
		
		MemberVO user = (MemberVO) session.getAttribute("sessionID");
		vo.setWriter(user.getId());
		service.insertBoard(vo);
		return "redirect:/notice";
	}
	
	@RequestMapping(value = "/notice", method = RequestMethod.GET)
	public String notice(@RequestParam(value= "page", required = false)String page, Model model) {
		logger.info("notice");
		//Map<String, Object> map =  service.newsList();
		//model.addAttribute("noticeList", 글);
		//model.addAttribute("page", 페이지번호);
		return "notice/notice";
	}
	
	@RequestMapping(value = {"/notice/{board}"}, method = RequestMethod.GET)
	public String notice_detail(@PathVariable("board") int board, Model model) {
		logger.info("notice");
		//Map<String, Object> map =  service.newsList();
		//model.addAttribute("board", 글);
		return "notice_detail";
	}

}
