package com.ssm.gardenplatform.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.ModelAndView;

import com.ssm.gardenplatform.dao.BoardDAO;
import com.ssm.gardenplatform.log.LogManager;
import com.ssm.gardenplatform.model.Board;


@Controller
public class DeveloperController implements ApplicationContextAware{
	
	LogManager logMgr = new LogManager();
	private WebApplicationContext context = null;
	
	@RequestMapping(value = "/downloadSDK.do", method = RequestMethod.GET)
	public ModelAndView getDownload(HttpServletRequest request, HttpServletResponse response) throws IOException{
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		logMgr.printLog(request);

		File downloadFile = getSDKFile();
		
		ModelAndView mav = new ModelAndView("downloadView");
		mav.addObject("downloadFile", downloadFile);
		
		return mav;
	}

	private File getSDKFile() {
		
		String path = context.getServletContext().getRealPath("/sdk/gardenSDK-1.01.jar");

		return new File(path);
	} 
	
	@Override
	public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
		this.context = (WebApplicationContext) applicationContext;
	}
	
	//start developer pages
	@RequestMapping(value = "/developer/index.do", method = RequestMethod.GET)
	public ModelAndView getDeveloper_Index(HttpServletRequest request, HttpServletResponse response) throws IOException{

		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		logMgr.printLog(request);
		
		ModelAndView mav = new ModelAndView("/developer/index");
		mav.addObject("msg", "Garden Platform");
		return mav;
	}
	
	// test page
	@RequestMapping(value = "/test.do", method = RequestMethod.GET)
	public ModelAndView getTest(HttpServletRequest request, HttpServletResponse response) throws IOException{

		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		logMgr.printLog(request);
		
		BoardDAO boardDao = new BoardDAO();
		List<Board> boardList = boardDao.selectAllBoard();
		
		ModelAndView mav = new ModelAndView("test");
		mav.addObject("boardList", boardList);
		
		return mav;
	}
	
	@RequestMapping(value = "/postBoard.do", method = RequestMethod.POST)
	public String postBoard(HttpServletRequest request, HttpServletResponse response) throws IOException{

		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		logMgr.printLog(request);
		
		Date dt = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd, hh:mm:ss"); 

		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String time = sdf.format(dt).toString();
		String userID = "tempUserID";
		
		BoardDAO boardDao = new BoardDAO();
		Board board = new Board();
		board.setB_title(title);
		board.setB_content(content);
		board.setB_time(time);
		board.setB_user(userID);
		
		boardDao.insertBoard(board);
		
		return "redirect:/test.do"; 

	}
	
}