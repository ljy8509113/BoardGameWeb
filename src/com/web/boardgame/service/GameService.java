package com.web.boardgame.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.database.dao.GameDao;
import com.database.model.Game;
import com.database.util.CustomException;

@Service
public class GameService {
	
	GameDao dao;
	
	public GameService() {
		dao = new GameDao();
	}
	
//	public Game detail(String game_no) {
//		//return 
//	}

	public List<Game> list() throws CustomException {
		/*DBController controller = new DBController();
		controller.selectAllGame();*/
		
		// return controller.selectAllGame();
//		return DBController.Instance().selectAllGame();
		
		return dao.selectAll();
	}
}
