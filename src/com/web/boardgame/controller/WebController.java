package com.web.boardgame.controller;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.database.model.Game;
import com.database.model.User;
import com.database.util.CustomException;
import com.web.boardgame.service.GameService;
import com.web.boardgame.service.UserService;

@Controller
public class WebController {
	//---선언--------------------------------------//
	@Autowired
	UserService userService;
	GameService gameService;
	//--------------------------------------------//

	//---여정--------------------------------------//



	//---성은--------------------------------------//
//	@RequestMapping(value="introduce.do", method=RequestMethod.GET)
//	public String getGameInfo(Model model, HttpServletRequest request,
//			@RequestParam(value="game_no", required=true) String game_no) throws CustomException {
////		Game game = null;
////		
////		game = gameService.detail(game_no);
//		
//		List<Game> list = gameService.list();
//		
//		model.addAttribute("game", list);
//		
//		return "game-introduce";
//	}


	//---정욱--------------------------------------//
	@RequestMapping(value="test.do", method=RequestMethod.GET)
	public String getUserInfo(Model model) {
		User user = null;

		try {
			user = userService.getUser("test1@gmail.com");
			System.out.println("user : " + user.getEmail());
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}catch (CustomException e) {
			e.printStackTrace();
		} 

		model.addAttribute("user", user);

		return "test";
	}

}
