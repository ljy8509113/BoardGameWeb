package com.web.boardgame.controller;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.database.model.User;
import com.database.util.CustomException;
import com.web.boardgame.service.UserService;

@Controller
public class WebController {
	//---선언--------------------------------------//
	@Autowired
	UserService userService;
	//--------------------------------------------//

	//---여정--------------------------------------//



	//---성은--------------------------------------//



	//---정욱--------------------------------------//
	@RequestMapping(value="test.do", method=RequestMethod.GET)
	public String getUserInfo(Model model) {
		User user = null;

		try {
			user = userService.getUser("test5@gmail.com");
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
