package com.ssm.gardenplatform.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.ssm.gardenplatform.log.LogManager;
import com.ssm.gardenplatform.model.User;


@Controller
public class MainController {
	
	LogManager logMgr = new LogManager();
	
	// main page
	@RequestMapping(value = "/main.do", method = RequestMethod.GET)
	public ModelAndView getMain(HttpServletRequest request, HttpServletResponse response) throws IOException{
		
		logMgr.printLog(request);
		
		ModelAndView mav = new ModelAndView("main");
		return mav;
	}
	
	@RequestMapping(value = "/home.do", method = RequestMethod.GET)
	public ModelAndView getHome(HttpServletRequest request, HttpServletResponse response) throws IOException{
		
		logMgr.printLog(request);

//		HttpSession session = request.getSession();
//		User user = (User)session.getAttribute("user");
		
		ModelAndView mav = new ModelAndView("home");
		mav.addObject("id", "test123");
//		mav.addObject("id", user.getId());
		
		return mav;
	}
	
	// test page
	@RequestMapping(value = "/test.do", method = RequestMethod.GET)
	public ModelAndView getTest(HttpServletRequest request, HttpServletResponse response) throws IOException{
		
		logMgr.printLog(request);
		
		ModelAndView mav = new ModelAndView("test");
		return mav;
	}
	
}