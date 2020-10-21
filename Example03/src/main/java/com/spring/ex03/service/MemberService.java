package com.spring.ex03.service;

import java.util.List;
import java.util.Map;

import com.spring.ex03.vo.MemberVO;

public interface MemberService {
	public int register(MemberVO vo) throws Exception;
	public void authMember(String id) throws Exception;
	public Map<String, Object> login(String id, String password) throws Exception;
	public Map<String, String> selectMember(String id) throws Exception;
	public List<MemberVO> reqAuthMember() throws Exception;
	public List<MemberVO> memberList() throws Exception;
}
