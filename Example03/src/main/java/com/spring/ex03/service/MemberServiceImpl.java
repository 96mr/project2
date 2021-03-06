package com.spring.ex03.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.spring.ex03.dao.MemberDao;
import com.spring.ex03.vo.MemberVO;

@Service("MemberService")
public class MemberServiceImpl implements MemberService{
	@Autowired
	private MemberDao dao;

	@Inject
	BCryptPasswordEncoder passwordEncoder;
	
	@Override
	public int register(MemberVO vo) {
		MemberVO member;
		int result = 0;
		try {
			member = dao.login(vo.getId());
			if(member == null) {
				vo.setPassword(passwordEncoder.encode(vo.getPassword()));
				dao.register(vo);
				result = 1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public MemberVO login(String id, String password) throws Exception {
		MemberVO result = null;
		MemberVO vo = dao.login(id);
		if(passwordEncoder.matches(password, vo.getPassword())) {
			vo.setPassword(null);
			result = vo;
			return result;
		}
		return result;
	}
		
	@Override
	public List<MemberVO> reqAuthMember() throws Exception {
		return dao.reqAuthMember();
	}

	@Override
	public void authMember(String id) throws Exception {
		dao.authMember(id);
	}

	@Override
	public List<MemberVO> memberList() throws Exception {
		return dao.memberList();
	}

	@Override
	public Map<String, String> selectMember(String id) throws Exception {
		return dao.selectMember(id);
	}
	
}
