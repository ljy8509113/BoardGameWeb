package com.web.boardgame.service;

import java.util.List;

import com.database.common.Common;
import com.database.controller.DBController;
import com.database.model.Game;

public class GameService {
		
	public GameService() {}
	
//	public Game detail(String game_no) {
//		//return 
//	}

	public List<Game> list() {
		return DBController.Instance().selectAllGame(Common.DIVINCHICODE_GAME_CODE+"");
	}
}
