package com.web.boardgame.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.database.controller.DBController;
import com.database.model.Game;

@Service
public class GameService {
		
	public GameService() {}
	
//	public Game detail(String game_no) {
//		//return 
//	}

	public List<Game> list() {
		/*DBController controller = new DBController();
		controller.selectAllGame();*/
		
		// return controller.selectAllGame();
		return DBController.Instance().selectAllGame();
	}
}
