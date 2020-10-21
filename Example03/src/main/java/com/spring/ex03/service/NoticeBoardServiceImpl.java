package com.spring.ex03.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.ex03.dao.NoticeBoardDao;
import com.spring.ex03.vo.CategoryVO;
import com.spring.ex03.vo.NoticeBoardVO;
import com.spring.ex03.vo.PagingVO;

@Service
public class NoticeBoardServiceImpl implements NoticeBoardService {

	@Autowired
	private NoticeBoardDao dao;
	
	@Override
	public void insertBoard(NoticeBoardVO vo) throws Exception{
		dao.insertBoard(vo);
	}

	@Override
	public List<CategoryVO> listCategory() throws Exception{
		List<CategoryVO> list = dao.listCategory();
		return list;
	}

	@Override
	public Map<String, Object> listNotice(String page, String category) throws Exception {
		Map<String, Object> map = new HashMap<>();

		PagingVO paging = new PagingVO(dao.boardCnt(), page == null?1:Integer.parseInt(page));
		map.put("start_board",paging.getStart_board());
		map.put("last_board",paging.getLast_board());

		Map<String, Object> result = new HashMap<>();
		result.put("list",dao.listNotice(map));
		result.put("paging",paging);
		return result;
	}

	@Override
	public HashMap<String,Object> detailNotice(int id) throws Exception {
		return dao.detailNotice(id);
	}

}
