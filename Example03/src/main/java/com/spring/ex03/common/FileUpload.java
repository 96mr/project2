package com.spring.ex03.common;

import java.io.File;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import com.spring.ex03.vo.NoticeFileVO;

@Component("fileUpload")
public class FileUpload {
	
	public List<Object> parseFileInfo(int id, String what, List<MultipartFile> file){
		List<Object> list = new ArrayList<>();
				
		String path = "E:\\dev\\ex03\\file\\";
		File target = new File(path);
		if(!target.exists()) {
			target.mkdirs();
		}
		
		Iterator<MultipartFile> iterator = file.iterator();
		MultipartFile f = null;
		while(iterator.hasNext()) {
			f = iterator.next();
			String orgFileName = f.getOriginalFilename();
			String orgFileExtension = orgFileName.substring(orgFileName.lastIndexOf("."));
			String saveFileName = UUID.randomUUID().toString().replaceAll("-", "") + orgFileExtension;
			int saveFileSize = (int) f.getSize();
			
			if("notice".equals(what)) {
				NoticeFileVO vo = new NoticeFileVO();
				vo.setNotice_id(id);
				vo.setOrg_name(orgFileName);
				vo.setSave_name(saveFileName);
				vo.setFile_size(saveFileSize);
				vo.setFile_type(f.getContentType());
				list.add(vo);
			}else {
			
			}
			
		}
		
		return list;
	}

}
