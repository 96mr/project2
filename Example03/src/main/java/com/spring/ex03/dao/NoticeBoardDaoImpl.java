package com.spring.ex03.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.ex03.mapper.NoticeBoardMapper;
import com.spring.ex03.vo.CategoryVO;
import com.spring.ex03.vo.NoticeBoardVO;

@Repository
public class NoticeBoardDaoImpl implements NoticeBoardDao {

	@Autowired
	private NoticeBoardMapper mapper;
	
	@Override
	public void insertBoard(NoticeBoardVO vo) {
		mapper.insertBoard(vo);
	}

	@Override
	public List<CategoryVO> listCategory() {
		return mapper.listCategory();
	}

	@Override
	public List<Map<String,Object>> listNotice(Map<String, Object> map) {
		return mapper.listNotice(map);
	}

	@Override
	public int boardCnt() throws Exception {
		return mapper.boardCnt();
	}

	@Override
	public HashMap<String,Object> detailNotice(int id) throws Exception {
		mapper.hit(id);
		return mapper.detailNotice(id);
	}

}
