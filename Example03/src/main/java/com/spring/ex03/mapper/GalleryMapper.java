package com.spring.ex03.mapper;

import java.util.List;
import java.util.Map;

import com.spring.ex03.vo.GalleryVO;

public interface GalleryMapper {
	public void insert(GalleryVO vo);
	public List<Map<String,Object>> list(Map<String, Object> map);
	public int count();
}
