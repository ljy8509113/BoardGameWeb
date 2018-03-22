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
	
	public void modify(SubImage image) throws CustomException {
		dao.update(image);
	}
	
	public void remove(int gameNo, int no) throws CustomException {
		dao.delete(gameNo, no);
	}
}
