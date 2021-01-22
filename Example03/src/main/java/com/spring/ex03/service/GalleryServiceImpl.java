package com.spring.ex03.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.spring.ex03.common.FileUpload;
import com.spring.ex03.dao.GalleryDao;
import com.spring.ex03.vo.GalleryVO;
import com.spring.ex03.vo.PagingVO;

@Service
public class GalleryServiceImpl implements GalleryService {

	@Autowired
	private GalleryDao dao;
	
	@Autowired
	private FileUpload fileUpload;
	
	@Override
	public void insert(GalleryVO vo, List<MultipartFile> file) throws Exception{
		List<Object> list = fileUpload.parseFileInfo(0,"gallery",file);
		for(int i = 0; i < list.size(); i++) {
			GalleryVO img = (GalleryVO) list.get(i);
			vo.setOrg_name(img.getOrg_name());
			vo.setSave_name(img.getSave_name());
			vo.setFile_size(img.getFile_size());
			dao.insert(vo);
		}
	}
	
	@Override
	public Map<String, Object> list(String page) throws Exception {
		Map<String, Object> map = new HashMap<>();
	
		PagingVO paging = new PagingVO(dao.count(), Integer.parseInt(page));
		map.put("start_board",paging.getStart_board());
		map.put("last_board",paging.getLast_board());
		
		Map<String, Object> result = new HashMap<>();
		result.put("list",dao.list(map));
		result.put("paging",paging);
		return result;
	}

}
