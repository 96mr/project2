package com.spring.ex03.dao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.ex03.mapper.MemberMapper;
import com.spring.ex03.vo.MemberVO;

@Repository
public class MemberDaoImpl implements MemberDao {

	@Autowired
	private MemberMapper mapper;
	
	@Override
	public void register(MemberVO vo) throws Exception {
		mapper.register(vo);
		mapper.insertMemberImage(vo.getId());
	}
	
	@Override
	public List<MemberVO> reqAuthMember() throws Exception {
		return mapper.reqAuthMember();
	}

	@Override
	public void authMember(String id) throws Exception {
		mapper.authMember(id);
	}

	@Override
	public MemberVO login(String id) throws Exception {
		return mapper.login(id);
	}

	@Override
	public Map<String, String> selectMember(String id) throws Exception {
		return mapper.selectMember(id);
	}

}
