package com.web.boardgame.service;

import java.sql.SQLException;

import org.springframework.stereotype.Service;

import com.database.dao.UserDao;
import com.database.model.User;
import com.database.util.CustomException;


@Service
public class UserService {
	//---선언--------------------------------------//
	UserDao dao;
	
	public UserService() {
		dao = new UserDao();
	}
	//--------------------------------------------//

	//---여정--------------------------------------//



	//---성은--------------------------------------//



	//---정욱--------------------------------------//
	public User getUser(String email) throws CustomException, ClassNotFoundException, SQLException {
		return dao.selectUser(email); //DBController.Instance().selectUser(email);
	}
}
