package com.spring.ex03.dao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.spring.ex03.mapper.MemberMapper;
import com.spring.ex03.vo.MemberVO;

@Repository
public class MemberDaoImpl implements MemberDao {

	@Autowired
	private MemberMapper mapper;
	
	@Override
	public void register(MemberVO vo) {
		try {
			mapper.register(vo);
			mapper.insertMemberImage(vo.getId());
		}catch(DataAccessException e) {
			e.printStackTrace();
		}
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
	public List<MemberVO> memberList() throws Exception {
		return mapper.memberList();
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
