package com.web.boardgame.service;

import java.sql.SQLException;

import org.springframework.stereotype.Service;

import com.database.controller.DBController;
import com.database.model.User;
import com.database.util.CustomException;


@Service
public class UserService {
	//---선언--------------------------------------//
	//--------------------------------------------//

	//---여정--------------------------------------//



	//---성은--------------------------------------//



	//---정욱--------------------------------------//
	public User getUser(String email) throws CustomException, ClassNotFoundException, SQLException {
		return DBController.Instance().selectUser(email);
	}
}
