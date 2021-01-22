package com.spring.ex03.dao;

import java.util.List;
import java.util.Map;

import com.spring.ex03.vo.GalleryVO;

public interface GalleryDao {
	public void insert(GalleryVO vo) throws Exception;
	public List<Map<String,Object>> list(Map<String, Object> map) throws Exception;
	public int count() throws Exception;
}
