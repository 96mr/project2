package com.spring.ex03.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.spring.ex03.vo.CategoryVO;
import com.spring.ex03.vo.NoticeBoardVO;
import com.spring.ex03.vo.NoticeFileVO;

public interface NoticeBoardDao {
	public int insertBoard(NoticeBoardVO vo)throws Exception;
	public void insertFile(NoticeFileVO file) throws Exception;
	public void modifyBoard(NoticeBoardVO vo) throws Exception;
	public List<CategoryVO> listCategory() throws Exception;
	public List<Map<String,Object>> listNotice(Map<String, Object> map) throws Exception;
	public int boardCnt(String category) throws Exception;
	public HashMap<String, Object> detailNotice(int id) throws Exception;
}
