package com.spring.ex03.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.spring.ex03.vo.MemberVO;

public class adminInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
	
		//세션 여부 
		HttpSession session = request.getSession();
		MemberVO user = (MemberVO) session.getAttribute("sessionID");
		if(user == null) {
			response.sendRedirect(request.getContextPath()+"/login");
			return false;
		}	
		if(user.getVerify() != 9) {
			response.sendRedirect(request.getContextPath()+"/home");
			return false;
		}
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
	}


}
