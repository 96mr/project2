package com.spring.ex03.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.spring.ex03.vo.CategoryVO;
import com.spring.ex03.vo.NoticeBoardVO;
import com.spring.ex03.vo.NoticeFileVO;

public interface NoticeBoardMapper {
	public int insertBoard(NoticeBoardVO vo);
	public List<CategoryVO> listCategory();
	public List<Map<String, Object>> listNotice(Map<String, Object> map);
	public int boardCnt(String category);
	public HashMap<String,Object> detailNotice(int id);
	public void hit(int id);
	public void insertFile(NoticeFileVO file);
}
