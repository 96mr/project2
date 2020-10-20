package com.spring.ex03.dao;

import java.util.List;

import com.spring.ex03.vo.CategoryVO;
import com.spring.ex03.vo.NoticeBoardVO;

public interface NoticeBoardDao {
	public void insertBoard(NoticeBoardVO vo);
	public List<CategoryVO> listCategory();
}
