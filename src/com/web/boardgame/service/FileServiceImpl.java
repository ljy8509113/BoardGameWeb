package com.web.boardgame.service;

import java.io.File;
import java.net.URLDecoder;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.database.util.FileException;

@Service
public class FileServiceImpl<T> implements FileService<T>{

	/*private static final String UPLOAD_FOLDER = "/upload";*/
	//	private static final String UPLOAD_FOLDER = "C:/upload";
	private static final String IMAGE_MAPPING_NAME = "/saveImage";
	private static final String IMAGE_SAVE_PATH = "C:\\image";

	@Override
	public String add(MultipartFile coverImage) throws FileException {
		try {
			//String path = request.getServletContext().getRealPath(UPLOAD_FOLDER);
			String originalName = coverImage.getOriginalFilename();
			File directory = new File(IMAGE_SAVE_PATH);
			if(!directory.exists()) {
				directory.mkdir();
			}

			if(coverImage != null && !coverImage.isEmpty()) {
				Integer idx = originalName.lastIndexOf(".");
				String name = originalName.substring(0, idx);
				String ext = originalName.substring(idx, originalName.length());
				String uploadFilename = name
						+ Long.toHexString(System.currentTimeMillis())
						+ ext;

				coverImage.transferTo(new File(IMAGE_SAVE_PATH, uploadFilename));
				uploadFilename = URLEncoder.encode(uploadFilename, "UTF-8");

				return uploadFilename;
			} 
		} catch (Exception e) {
			System.out.println(e.getMessage());
			throw new FileException(e.getMessage());
		}
		return null;
	}

	@Override
	public void remove(String filename) throws FileException {
		if(filename != null && !filename.trim().isEmpty()) {
			try {
				// filename 디코딩
				filename = URLDecoder.decode(filename, "UTF-8");
			} catch(Exception e) {
				throw new FileException(e.getMessage());
			}

			// 서버에 저장된 파일을 불러와서 객체화 시킴 
			File file = new File(IMAGE_SAVE_PATH, filename);

			// 만약 파일이 존재하면 파일을 삭제한다
			if(file.exists()) {
				file.delete();
			}
		}

	}

	@Override
	public void download(HttpServletRequest request, HttpServletResponse response, String filename) {
		// TODO Auto-generated method stub

	}

	// 이미지 경로 
	@Override
	public String getImgPath(String filename) {
		//String contextPath = request.getContextPath();

		if(filename != null && !filename.trim().isEmpty()) {
			int idx = filename.lastIndexOf(".");
			String ext = filename.substring(idx, filename.length());

			switch (ext) {
			case ".jpg":
			case ".jpeg":
			case ".png":
				//				return contextPath + UPLOAD_FOLDER + "/" + filename;
				return IMAGE_SAVE_PATH + "\\" + filename;
			}
		}
		return null;
	}

	@Override
	public String getUploadPath() {
		//return request.getContextPath() + UPLOAD_FOLDER;
		return IMAGE_MAPPING_NAME;
	}

	public String getRelaPath() {
		return IMAGE_SAVE_PATH;
	}

}
