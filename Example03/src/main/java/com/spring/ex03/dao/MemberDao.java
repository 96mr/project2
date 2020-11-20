package com.spring.ex03.dao;

import java.util.List;
import java.util.Map;

import com.spring.ex03.vo.MemberVO;

public interface MemberDao {
	public void register(MemberVO vo);
	public void authMember(String id) throws Exception;
	public MemberVO login(String id) throws Exception;
	public Map<String, String> selectMember(String id) throws Exception;
	public List<MemberVO> reqAuthMember() throws Exception;
	public List<MemberVO> memberList() throws Exception;
}
