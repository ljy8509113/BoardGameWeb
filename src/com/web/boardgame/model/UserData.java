package com.web.boardgame.model;

import java.util.Date;

import com.database.model.User;

public class UserData extends User {
	private static final long serialVersionUID = 1L;
	
	public UserData() {		
	}
	
	public UserData(String email, String password, String nickName, Date birthday) {
		super(email, password, nickName, birthday);
	}
	
	public UserData(Integer userNo, String email, String password, String nickName, Date birthday, Date joinDate, Integer failCount) {
		super(userNo, email, password, nickName, birthday, joinDate, failCount);		
	}
	
}
