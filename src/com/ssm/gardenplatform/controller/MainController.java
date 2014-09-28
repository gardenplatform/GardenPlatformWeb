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
	
	//start Store pages
	@RequestMapping(value = "/store/index.do", method = RequestMethod.GET)
	public ModelAndView getStore_Index(HttpServletRequest request, HttpServletResponse response) throws IOException{
		
		logMgr.printLog(request);
		
		ModelAndView mav = new ModelAndView("/store/index");
		mav.addObject("msg", "Garden Platform");
		return mav;
	}
	
	//start developer pages
	@RequestMapping(value = "/developer/index.do", method = RequestMethod.GET)
	public ModelAndView getDeveloper_Index(HttpServletRequest request, HttpServletResponse response) throws IOException{
		
		logMgr.printLog(request);
		
		ModelAndView mav = new ModelAndView("/developer/index");
		mav.addObject("msg", "Garden Platform");
		return mav;
	}
	
	//start my_apps pages
	@RequestMapping(value = "/my_apps/index.do", method = RequestMethod.GET)
	public ModelAndView getMyapps_Index(HttpServletRequest request, HttpServletResponse response) throws IOException{
		
		logMgr.printLog(request);
		
		ModelAndView mav = new ModelAndView("/my_apps/index");
		mav.addObject("msg", "Garden Platform");
		return mav;
	}
	
	@RequestMapping(value = "/my_apps/apps_detail.do", method = RequestMethod.GET)
	public ModelAndView getMyapps_Apps_Detail(HttpServletRequest request, HttpServletResponse response) throws IOException{
		
		logMgr.printLog(request);
		
		ModelAndView mav = new ModelAndView("/my_apps/apps_detail");
		mav.addObject("msg", "Garden Platform");
		return mav;
	}
	
	
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

		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		
		ModelAndView mav = new ModelAndView("main");
		mav.addObject("id", user.getId());
		
		return mav;
	}
	
}