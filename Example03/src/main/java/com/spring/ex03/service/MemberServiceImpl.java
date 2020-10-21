package com.spring.ex03.service;

import java.util.HashMap;
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
	public int register(MemberVO vo) throws Exception {
		MemberVO member = dao.login(vo.getId());
		//존재하는 아이디 여부
		if(member == null) {
			vo.setPassword(passwordEncoder.encode(vo.getPassword()));
			dao.register(vo);
			System.out.println("회원가입성공!");
			return 1;
		}else {
			return 0;
		}
	}

	@Override
	public Map<String, Object> login(String id, String password) throws Exception {
		Map<String, Object> map = new HashMap<>();
		MemberVO vo = dao.login(id);
		map.put("result", 0);
		if(vo !=null) {
			if(passwordEncoder.matches(password, vo.getPassword())) {
				map.put("result",1);
				map.put("member", vo);
			}
		}
		return map;
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
