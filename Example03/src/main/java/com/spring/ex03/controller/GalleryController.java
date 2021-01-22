package com.spring.ex03.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.ex03.service.GalleryService;
import com.spring.ex03.vo.GalleryVO;
import com.spring.ex03.vo.MemberVO;

@Controller
public class GalleryController {
	
	private static final Logger logger = LoggerFactory.getLogger(GalleryController.class);
	
	@Autowired
	private GalleryService service;
	
	@RequestMapping(value = "/gallery/upload", method = RequestMethod.GET)
	public String gallery_upload_get(HttpSession session, Model model) throws Exception {
		logger.info("GET gallery upload");		
		return "gallery_write";
	}
	
	@RequestMapping(value = "/gallery/upload", method = RequestMethod.POST)
	public String gallery_upload(@RequestParam(value="title") String title, 
								@RequestParam(value="file") List<MultipartFile> file, HttpSession session,
							  Model model, RedirectAttributes rttr) throws Exception {
		logger.info("POST gallery upload");		
		if(title.trim().isEmpty() || file.isEmpty()) { //공백여부
			return "gallery_write";
		}
		MemberVO user = (MemberVO) session.getAttribute("sessionID");
		GalleryVO vo = new GalleryVO();
		vo.setTitle(title);
		vo.setWriter(user.getId());
		service.insert(vo, file);
		return "redirect:/gallery/list";
	}
	
	@RequestMapping(value = "/gallery/list", method = RequestMethod.GET)
	public String gallery_list(@RequestParam(value= "page", required = false) String page, Model model) throws Exception {
		logger.info("gallery list");
		Map<String, Object> map = service.list(page == null? "1":page);
		System.out.println(map.get("list"));
		model.addAttribute("list", map.get("list"))
			 .addAttribute("paging", map.get("paging"))
			 .addAttribute("page", page);
		return "gallery";
	}

	
}
