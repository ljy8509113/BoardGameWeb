package com.web.boardgame.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.database.common.Common;
import com.database.dao.NoticeDao;
import com.database.model.Notice;
import com.database.util.CustomException;

@Service
public class NoticeService {
	
	NoticeDao dao;
	
	public NoticeService() {
		dao = new NoticeDao();		
	}
	
	public Notice select(Integer no) throws CustomException {
		return  dao.select(no); //DBController.Instance().selectNotice(no);
	}
	
	public List<Notice> list() throws CustomException {
		return dao.selectAll(Common.DIVINCHICODE_GAME_CODE); //DBController.Instance().selectAllNotice(Common.DIVINCHICODE_GAME_CODE);
	}
}
