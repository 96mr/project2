package com.spring.ex03.service;

import java.util.List;

import com.spring.ex03.vo.CategoryVO;
import com.spring.ex03.vo.NoticeBoardVO;

public interface NoticeBoardService {
	public void insertBoard(NoticeBoardVO vo);
	public List<CategoryVO> listCategory();
}
