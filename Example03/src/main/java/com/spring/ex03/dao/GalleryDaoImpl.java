package com.spring.ex03.dao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.ex03.mapper.GalleryMapper;
import com.spring.ex03.vo.GalleryVO;

@Repository
public class GalleryDaoImpl implements GalleryDao {

	@Autowired
	private GalleryMapper mapper;
	
	@Override
	public void insert(GalleryVO vo) {
		mapper.insert(vo);
	}
	
	@Override
	public List<Map<String,Object>> list(Map<String,Object> map) throws Exception {
		return mapper.list(map);
	}

	@Override
	public int count() throws Exception {
		return mapper.count();
	}


}
