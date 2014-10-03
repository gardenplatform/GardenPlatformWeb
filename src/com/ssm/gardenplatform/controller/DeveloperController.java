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
public class DeveloperController {
	
	LogManager logMgr = new LogManager();
	
	//start developer pages
	@RequestMapping(value = "/developer/index.do", method = RequestMethod.GET)
	public ModelAndView getDeveloper_Index(HttpServletRequest request, HttpServletResponse response) throws IOException{
		
		logMgr.printLog(request);
		
		ModelAndView mav = new ModelAndView("/developer/index");
		mav.addObject("msg", "Garden Platform");
		return mav;
	}
	
}