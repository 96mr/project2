package com.spring.ex03.mapper;

import java.util.List;
import java.util.Map;

import com.spring.ex03.vo.MemberVO;

public interface MemberMapper {
	public void register(MemberVO vo);
	public void insertMemberImage(String id);
	public void authMember(String id);
	public MemberVO login(String id);
	public Map<String, String> selectMember(String id);
	public List<MemberVO> reqAuthMember();
	public List<MemberVO> memberList();
} 
