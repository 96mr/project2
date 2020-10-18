package com.spring.ex03.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = {"/", "/home"}, method = RequestMethod.GET)
	public String home(Model model) {
		logger.info("home");
		return "home";
	}
	
	@RequestMapping(value = "/notice", method = RequestMethod.GET)
	public String notice(@RequestParam(value= "page", required = false)String page, Model model) {
		logger.info("notice");
		//Map<String, Object> map =  service.newsList();
		//model.addAttribute("noticeList", 글);
		//model.addAttribute("page", 페이지번호);
		return "notice";
	}
	
	@RequestMapping(value = {"/notice/{board}"}, method = RequestMethod.GET)
	public String notice_detail(@PathVariable("board") int board, Model model) {
		logger.info("notice");
		//Map<String, Object> map =  service.newsList();
		//model.addAttribute("board", 글);
		return "detail";
	}
	
	@RequestMapping(value = "/gallery", method = RequestMethod.GET)
	public String gallery(Model model) {
		logger.info("gallery");
		return "gallery";
	}
	
}
