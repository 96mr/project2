package com.spring.ex03.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.spring.ex03.vo.GalleryVO;

public interface GalleryService {
	void insert(GalleryVO vo, List<MultipartFile> file) throws Exception;
	Map<String, Object> list(String page) throws Exception;
}
