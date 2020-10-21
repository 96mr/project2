package com.spring.ex03.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.spring.ex03.vo.CategoryVO;
import com.spring.ex03.vo.NoticeBoardVO;

public interface NoticeBoardDao {
	public void insertBoard(NoticeBoardVO vo)throws Exception;
	public List<CategoryVO> listCategory() throws Exception;
	public List<Map<String,Object>> listNotice(Map<String, Object> map) throws Exception;
	public int boardCnt() throws Exception;
	public HashMap<String, Object> detailNotice(int id) throws Exception;
}
