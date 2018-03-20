package com.web.boardgame.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.database.common.Common;
import com.database.controller.DBController;
import com.database.dao.NoticeDao;
import com.database.model.Notice;

@Service
public class NoticeService {
	
	public NoticeService() {}
	
	public Notice select(Integer no) {
		return  DBController.Instance().selectNotice(no);
	}
	
	public List<Notice> list() {
		return DBController.Instance().selectAllNotice(Common.DIVINCHICODE_GAME_CODE);
	}
}
