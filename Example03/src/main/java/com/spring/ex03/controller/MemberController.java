package com.spring.ex03.controller;

import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.ex03.common.MemberValidator;
import com.spring.ex03.service.MemberService;
import com.spring.ex03.vo.MemberVO;

@Controller
public class MemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Resource(name="MemberService")
	private MemberService service;
	
	@InitBinder
	protected void initbinder(WebDataBinder binder) {
		// TODO Auto-generated method stub
		binder.addValidators(new MemberValidator());
	}	
	
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String register(Model model) {
		logger.info("register");
		model.addAttribute("member",new MemberVO());
		return "register";
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String register(@Valid @ModelAttribute("member")MemberVO member, BindingResult binding, RedirectAttributes rttr) throws Exception {
		logger.info("register");
		if(binding.hasErrors()) {	//유효성검사
			return "register";
		}
		
		int result = service.register(member);
		if(result == 1) {
			rttr.addFlashAttribute("msg", "성공적으로 가입되었습니다!");
			return "redirect:/login";
		}else {
			rttr.addFlashAttribute("msg", "이미 존재하는 회원입니다");
			return "redirect:/register";
		}
	}
	
	@ResponseBody
	@RequestMapping(value = "/idCheck", method = RequestMethod.POST)
	public int idChk(String id) throws Exception {
		String idReg = "^[a-zA-Z0-9]{4,20}$";
		Pattern p = Pattern.compile(idReg);
		Matcher m = p.matcher(id);
		if(!m.matches())	//정규식 x
			return 0;
		
		Map<String, String> map = service.selectMember(id);
		if(map == null)	//사용가능(아이디 중복x)
			return 1;
		else
			return -1;	//사용불가능(아이디 중복o)
	}
	
	@ResponseBody
	@RequestMapping(value = "/pwCheck", method = RequestMethod.POST)
	public int pwChk(String pw) throws Exception {
		String pwReg = "^[a-zA-Z0-9]{8,20}$";
		Pattern p = Pattern.compile(pwReg);
		Matcher m = p.matcher(pw);
		if(!m.matches())	//정규식 x
			return 0;
		else
			return 1;
	}
	
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		logger.info("login");
		return "login";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(HttpServletRequest request, RedirectAttributes rttr) throws Exception {
		logger.info("login");
		//로그인 성공, 실패	
		String id = request.getParameter("id");
		String pw = request.getParameter("password");
		if(id.trim().isEmpty() || pw.trim().isEmpty()) {
			rttr.addFlashAttribute("msg", "아이디와 비밀번호를 입력해주세요");
			return "redirect:/login";
		}
		MemberVO login = service.login(id, pw);
		if(login != null) {
			HttpSession session = request.getSession();
			session.setAttribute("sessionID", login);		
			String prev_url = (String) session.getAttribute("prev_url"); //이전 페이지가 있는가?(인터셉터)
			if(prev_url == null) return "redirect:/home";						 //없다면 home으로
			return "redirect:"+prev_url;
		}else {
			rttr.addFlashAttribute("msg", "아이디나 비밀번호가 일치하지 않습니다");
			return "redirect:/login";
		}
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session, Model model) {
		logger.info("logout");
		session.invalidate();
		return "redirect:/";
	}
	
	@RequestMapping(value = "/profile", method = RequestMethod.GET)
	public String profile( Model model) {
		//프로필화
		return "profile";
	}
	
	@RequestMapping(value = "/admin/register", method = RequestMethod.GET)
	public String adminRegister(Model model) throws Exception {
		logger.info("admin register");
		
		List<MemberVO> reqAuth = service.reqAuthMember();
		List<MemberVO> memberList = service.memberList();
		model.addAttribute("reqAuthList", reqAuth);
		model.addAttribute("memberList", memberList);
		return "admin/register_auth";
	}

	@RequestMapping(value = "/admin/authMember", method = RequestMethod.POST)
	public String authMember(String id, RedirectAttributes rttr) throws Exception {
		logger.info("authMember");

		service.authMember(id);
		rttr.addFlashAttribute("msg", "가입을 허락하였습니다!");
		return "redirect:/admin/register";
	}
	
}
