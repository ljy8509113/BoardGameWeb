package com.web.boardgame.user.controller;

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
import com.database.util.CustomException;
import com.web.boardgame.service.GameService;
import com.web.boardgame.service.NoticeService;

@Controller
public class WebController {
	//---선언--------------------------------------//
	@Autowired
	GameService gameService;
	
	@Autowired
	NoticeService noticeService;
	//--------------------------------------------//

	//---여정--------------------------------------//



	//---성은--------------------------------------//
	@RequestMapping(value="game-introduce.do", method=RequestMethod.GET)
	public String getGameInfo(Model model) {
		
		try {
			List<Game> list = gameService.allGame();

			model.addAttribute("gamelist", list);
			
		} catch (CustomException e) {
			//e.printStackTrace();
		}
		
		return "user/game-introduce";
	}
	
	@RequestMapping(value="game-notice.do", method=RequestMethod.GET)
	public String getNoticeInfo(Model model, @RequestParam(value="gameNo", required=true) Integer gameNo) throws CustomException{
		try {
			
			List<Notice> list = noticeService.selectAll(gameNo);
			
			model.addAttribute("noticelist", list);
		} catch (CustomException e) {
			e.printStackTrace();
		}
		
		return "user/game-notice";
	}
	
	@RequestMapping(value="game-notice-detail", method=RequestMethod.GET)
	public String noticeDetail(Model model, HttpServletRequest request,
			@RequestParam(value="no", required=true) int no) throws CustomException{
		Notice notice = null;
		
		try {
			notice = noticeService.select(no);
		} catch (CustomException e) {
			e.printStackTrace();
		}
		model.addAttribute("notice", notice);
		
		return "user/game-notice-detail";
	}

	

}
