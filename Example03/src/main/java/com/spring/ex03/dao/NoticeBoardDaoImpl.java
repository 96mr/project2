package com.spring.ex03.dao;

import java.util.List;

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

}
