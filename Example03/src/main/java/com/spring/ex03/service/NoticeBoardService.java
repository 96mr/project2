package com.spring.ex03.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.spring.ex03.vo.CategoryVO;
import com.spring.ex03.vo.NoticeBoardVO;

public interface NoticeBoardService {
	public void insertBoard(NoticeBoardVO vo) throws Exception;
	public void modifyBoard(NoticeBoardVO vo) throws Exception;
	public List<CategoryVO> listCategory() throws Exception;
	public Map<String, Object> listNotice(String page, String category) throws Exception;
	public Map<String,Object> detailNotice(int id) throws Exception;
}
