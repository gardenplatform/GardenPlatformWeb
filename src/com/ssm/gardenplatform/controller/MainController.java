package com.ssm.gardenplatform.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class MainController {
	
	@RequestMapping(value = "/test.do", method = RequestMethod.GET)
	public ModelAndView getMain(HttpServletRequest request, HttpServletResponse response) throws IOException{
		
		System.out.println("\ntest");
		printLog(request);
		
		ModelAndView mav = new ModelAndView("test");
		mav.addObject("msg", "Garden Platform");
		return mav;
	}
	
	@RequestMapping(value = "/main.do", method = RequestMethod.GET)
	public ModelAndView getSample(HttpServletRequest request, HttpServletResponse response) throws IOException{
		
		System.out.println("\nmain");
		printLog(request);
		
		ModelAndView mav = new ModelAndView("main");
		return mav;
	}
	
	public void printLog(HttpServletRequest request) {
		
		Date dt = new Date();
		System.out.println(dt.toString());
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd, hh:mm:ss a"); 
		System.out.println(sdf.format(dt).toString()); 
		
		String clientIp = request.getHeader("HTTP_X_FORWARDED_FOR");
		if(null == clientIp || clientIp.length() == 0 || clientIp.toLowerCase().equals("unknown"))
			clientIp = request.getHeader("REMOTE_ADDR");
		 
		if(null == clientIp || clientIp.length() == 0  || clientIp.toLowerCase().equals("unknown"))
			clientIp = request.getRemoteAddr();
		System.out.println(clientIp);
		
	}
	
}