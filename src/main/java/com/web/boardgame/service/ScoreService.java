package com.web.boardgame.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.database.common.Common;
import com.database.dao.ScoreDao;
import com.database.model.Score;
import com.database.util.CustomException;

@Service
public class ScoreService {
	
	ScoreDao dao;
	
	public ScoreService() {
		dao = new ScoreDao();
	}
	
	public List<Score> list() throws CustomException{
		return dao.selectGameRank(Common.DIVINCHICODE_GAME_CODE);
	}
}
