package com.web.boardgame.admin.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.database.model.Admin;
import com.database.model.Game;
import com.database.model.SubImage;
import com.database.util.AdminException;
import com.database.util.CustomException;
import com.database.util.FileException;
import com.web.boardgame.service.AdminService;
import com.web.boardgame.service.FileService;
import com.web.boardgame.service.GameService;
import com.web.boardgame.service.SubImageService;

@Controller
@RequestMapping("/admin")
public class GameWebController {

	@Autowired
	private AdminService adminService;

	@Autowired
	private FileService fileService;

	@Autowired
	private GameService gameService;

	@Autowired
	private SubImageService subImageService;

	// 게임리스트
	@RequestMapping(value="/gameList.do", method=RequestMethod.GET)
	public String gameList(Model model, HttpServletRequest request) {
		String uploadPath = null;

		List<Game> list = null;
		try {
			list = gameService.allGame();
		} catch (CustomException e) {
			model.addAttribute("error", "server");
		}

		uploadPath = fileService.getUploadPath();

		model.addAttribute("list", list);
		model.addAttribute("uploadpath", uploadPath);

		return "admin/gameList";
	}

	// 게임리스트 상세화면 
	@RequestMapping(value="/gameListDetail.do", method=RequestMethod.GET)
	public String gameListDetail(Model model, HttpServletRequest request,
			@RequestParam(value="gameNo", required=true) Integer gameNo)  {
		Game game = null;
		String filename = null;
		//String imgPath = null;
		String uploadPath = null;
		List<SubImage> subImages = null;
		
		try {
			game = gameService.detailGame(gameNo); //DBController.Instance().selectGameDetail(gameNo);

			filename = game.getCoverImage();

			if(filename != null && !filename.trim().isEmpty()) {
				filename = URLDecoder.decode(filename, "UTF-8");
			} 

			//imgPath = filename;//fileService.getImgPath(filename);
			uploadPath = fileService.getUploadPath();
			
			subImages = subImageService.getImageList(gameNo);
			
			System.out.println("uploadPath : " + uploadPath);
			
			for(SubImage image : subImages) {
				String fd = URLDecoder.decode(image.getPath(), "UTF-8");
				image.setPath(fd);
				System.out.println("getPath : " + image.getPath());
				System.out.println("fd : " + fd);
			}
			
		} catch (UnsupportedEncodingException e) {
			System.out.println(e.getMessage());
			model.addAttribute("error", "encoding");
		} catch (CustomException e) {

			e.printStackTrace();
		}

		model.addAttribute("game", game);
		if(filename != null && !filename.equals(""))
			model.addAttribute("filename", filename);

//		if(imgPath != null && !imgPath.trim().isEmpty()) {
//			model.addAttribute("imgPath", imgPath);
//		}

		model.addAttribute("uploadpath", uploadPath);
		
		if(subImages != null)
			model.addAttribute("subImages", subImages);

		return "admin/gameListDetail";
	}

	// 게임리스트 작성화면
	@RequestMapping(value="/gameListAdd.do", method=RequestMethod.GET)
	public String gameadd(Model model) {

		String id = adminService.getPrincipal().getUsername();
		model.addAttribute("id", id);

		try {
			Admin admin = adminService.detailId(id);
			admin.setPassword(null);
			model.addAttribute("admin", admin);

		} catch (AdminException e) {
			System.out.println(e.getMessage());
			model.addAttribute("error", "server");
		}

		return "admin/gameListAdd";
	}


	// 게임리스트 추가 후 게임리스트 목록으로 이동
	//	@RequestMapping(value="/gameListAdd.do", method=RequestMethod.POST)
	//	public String add(HttpServletRequest request,
	//			String title,
	//			String description,
	//			String state,
	//			String version,
	//			String fileName,
	//			@RequestParam("coverImage") MultipartFile coverImage) {
	@RequestMapping(value="/gameListAdd.do", method=RequestMethod.POST)
	public String add(MultipartHttpServletRequest req) { 	
		Game game = new Game();
		game.setTitle(req.getParameter("title"));
		game.setDescription(req.getParameter("description"));
		game.setState(req.getParameter("state"));
		game.setVersion(req.getParameter("version"));
		game.setFileName("");

		System.out.println("title : " + req.getParameter("title"));
		System.out.println("description : " + req.getParameter("description"));

		Iterator<String> files = req.getFileNames();
		MultipartFile coverImage = req.getFile("coverImage");

		try {
			String filename = fileService.add(coverImage);
			game.setCoverImage(filename);
			gameService.add(game);
			
			int gameNo = gameService.getLastInsertGameNo();
			int index = 0;
			while(files.hasNext()){
				String uploadFile = files.next();
				if(!uploadFile.equals("coverImage")) {
					MultipartFile mFile = req.getFile(uploadFile);
					String name = fileService.add(mFile);
					
					SubImage subImage = new SubImage(index, name, gameNo);
					subImageService.addSubImage(subImage);
					index++;
				}
				
			}
			
		} catch (CustomException e) {
			req.setAttribute("error", "server");
		} catch (FileException e) {
			req.setAttribute("error", "file");
		}

		return "redirect:gameList.do";

	}

	// 서브이미지 추가 화면 이동
	@RequestMapping(value="/subimage.do", method=RequestMethod.GET)
	public String subImage(Model model) {
		return "admin/subimage";
	}

	// 게임리스트 수정 화면
	@RequestMapping(value="/gameListModify.do", method=RequestMethod.GET)
	public String modify(Model model, @RequestParam(value="gameNo", required=true) Integer gameNo) {
		Game game = null;

		try {
			String id = adminService.getPrincipal().getUsername();
			model.addAttribute("id", id);

			Admin admin = adminService.detailId(id);
			admin.setPassword(null);
			model.addAttribute("admin", admin);

			game = gameService.detailGame(gameNo);
			model.addAttribute("game", game);

			
		} catch (AdminException e) {
			System.out.println(e.getMessage());
		} catch (CustomException e) {

		}

		return "admin/gameListModify";
	}

	// 수정 후 게임 목록으로 이동
	@RequestMapping(value="/gameListModify.do", method=RequestMethod.POST)
	public String modify(HttpServletRequest request,
			Integer gameNo,
			String title,
			String description,
			String state,
			String version,
			String fileName,
			@RequestParam("coverImage") MultipartFile coverImage) {

		Game game = new Game();
		game.setGameNo(gameNo);
		game.setTitle(title);
		game.setDescription(description);
		game.setState(state);
		game.setVersion(version);
		game.setFileName(fileName);

		try {
			String filename = fileService.add(coverImage);
			game.setCoverImage(filename);

			String toDeleteFilename = gameService.modify(game);

			fileService.remove(toDeleteFilename);

		} catch (FileException e) {
			System.out.println(e.getMessage());
			request.setAttribute("error", "file");
		} catch (CustomException e) {
			System.out.println(e.getMessage());
		}

		return "redirect:gameList.do";
	}

}



















