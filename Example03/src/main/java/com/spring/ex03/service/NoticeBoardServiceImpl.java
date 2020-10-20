package com.spring.ex03.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.ex03.dao.NoticeBoardDao;
import com.spring.ex03.vo.CategoryVO;
import com.spring.ex03.vo.NoticeBoardVO;

@Service
public class NoticeBoardServiceImpl implements NoticeBoardService {

	@Autowired
	private NoticeBoardDao dao;
	
	@Override
	public void insertBoard(NoticeBoardVO vo) {
		dao.insertBoard(vo);
	}

	@Override
	public List<CategoryVO> listCategory() {
		return dao.listCategory();
	}

}
