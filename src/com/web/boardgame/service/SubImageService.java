package com.web.boardgame.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.database.dao.SubImageDao;
import com.database.model.SubImage;
import com.database.util.CustomException;

@Service
public class SubImageService {
	SubImageDao dao;
	
	public SubImageService() {
		dao = new SubImageDao();
	}
	
	public void addSubImage(SubImage image) throws CustomException {
		dao.insert(image);
	}
	
	public List<SubImage> getImageList(int gameNo) throws CustomException{
		return dao.select(gameNo);
	}
	
	public List<SubImage> modify(List<SubImage> list, int gameNo) throws CustomException {
		List<SubImage> removeList = dao.select(gameNo);
		
		for(SubImage img : removeList) {
			dao.delete(gameNo, img.getNo());
		}
		
		for(SubImage img : list)
			dao.insert(img);
		
		return removeList;
	}
	
	public void remove(int gameNo, int no) throws CustomException {
		dao.delete(gameNo, no);
	}
}
