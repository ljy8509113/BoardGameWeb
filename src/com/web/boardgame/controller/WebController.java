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
import com.database.model.Notice;
import com.database.model.User;
import com.database.util.CustomException;
import com.web.boardgame.service.GameService;
import com.web.boardgame.service.NoticeService;
import com.web.boardgame.service.UserService;

@Controller
public class WebController {
	//---선언--------------------------------------//
	@Autowired
	UserService userService;
	
	@Autowired
	GameService gameService;
	
	@Autowired
	NoticeService noticeService;
	//--------------------------------------------//

	//---여정--------------------------------------//



	//---성은--------------------------------------//
	@RequestMapping(value="game-introduce.do", method=RequestMethod.GET)
	public String getGameInfo(Model model) throws CustomException {
		
		try {
			List<Game> list = gameService.list();

			model.addAttribute("gamelist", list);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "game-introduce";
	}
	
	@RequestMapping(value="game-notice.do", method=RequestMethod.GET)
	public String getNoticeInfo(Model model, HttpServletRequest request) throws CustomException{
		try {
			
			List<Notice> list = noticeService.list();
			
			model.addAttribute("noticelist", list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "game-notice";
	}
	
	@RequestMapping(value="game-notice-detail", method=RequestMethod.GET)
	public String noticeDetail(Model model, HttpServletRequest request,
			@RequestParam(value="no", required=true) int no) throws CustomException{
		Notice notice = null;
		
		try {
			notice = noticeService.select(no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("notice", notice);
		
		return "game-notice-detail";
	}

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
