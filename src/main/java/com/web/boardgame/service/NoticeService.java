package com.web.boardgame.service;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Service;

import com.database.dao.NoticeDao;
import com.database.model.Notice;
import com.database.util.CustomException;

@Service
public class NoticeService {

	NoticeDao dao;
	public NoticeService() {
		dao = new NoticeDao();
	}
	
	public List<Notice> selectAll(Integer gameNo) throws CustomException {
		return dao.selectAll(gameNo);
	}
	
	public Notice select(Integer no) throws CustomException {
		Notice notice = dao.select(no);
		return notice;
	}
	
	public void add(Notice notice) throws CustomException {
		dao.insert(notice);
	}
	
	public void modify(Notice notice) throws CustomException {
		dao.update(notice);
	}
	
	public void delete(Integer no) throws CustomException {
		dao.delete(no);
	}
}
