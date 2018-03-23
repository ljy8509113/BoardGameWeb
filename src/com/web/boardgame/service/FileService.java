package com.web.boardgame.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.multipart.MultipartFile;

import com.database.util.FileException;

public interface FileService<T> {
	
	// 파일 추가
	public String add(MultipartFile coverImage) throws FileException;
	
	// 파일 삭제
	public void remove(String filename) throws FileException;
	
	// 파일 다운로드
	public void download(HttpServletRequest request, HttpServletResponse response, String filename);
	
	// 파일 저장 경로 가져오기 + 이미지 파일명
	public String getImgPath(String filename);
	
	// 파일 저장 폴더 경로 가져오기(ContextPath + /upload)
	public String getUploadPath();
	
	//이미지 저장 폴더 절대경로
	public String getRelaPath();
}
