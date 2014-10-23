package com.ssm.gardenplatform.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.ssm.gardenplatform.log.LogManager;
import com.ssm.gardenplatform.rest.RestInfo;
import com.ssm.gardenplatform.rest.RestManager;


@Controller
public class MyAppsController {
	
	LogManager logMgr = new LogManager();
	RestManager restMgr = new RestManager();
	
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
	
	@RequestMapping(value = "/my_apps/setting.do", method = RequestMethod.GET)
	public ModelAndView getMyapps_Setting(HttpServletRequest request, HttpServletResponse response) throws IOException{
		
		logMgr.printLog(request);
		
		ModelAndView mav = new ModelAndView("/my_apps/setting");
		mav.addObject("msg", "Garden Platform");
		return mav;
	}
	
	/**
	POST /clients
	header :
	{
		token
	}
	body :
	{
		name	(app 이름)
		url	(app rul)
		redirect_uri	(로그인 성공시 리다이렉트 되는 uri)
		client_type	(native or webapp -> 1, 0으로 표시)	
	}
	return :
	{
		client_id
		client_secret
		client_type
		(만들어진것)
	}
	*/
	@RequestMapping(value = "/webRegister.do", method = RequestMethod.POST)
	public ModelAndView postClient(HttpServletRequest request, HttpServletResponse response) throws IOException{
		
		logMgr.printLog(request);
		
		String appName = request.getParameter("appName");
		String appUrl = request.getParameter("appUrl");
		String appRedirectUrl = request.getParameter("appRedirectUrl");
		String appType = "0";
		
		System.out.println(appName);
		System.out.println(appUrl);
		System.out.println(appRedirectUrl);
		System.out.println(appType);
		
		Map<Object, Object> result = null;
		
		HttpSession session = request.getSession(false);
		String token = session.getAttribute("token").toString();
		
		String url = RestInfo.restURL+"/clients";
		
		MultiValueMap<Object, Object> vars = new LinkedMultiValueMap<Object, Object>();

		vars.add("name", appName);
		vars.add("url", appUrl);
		vars.add("redirect_uri", appRedirectUrl);
		vars.add("client_type", 0);

		HttpHeaders headers = new HttpHeaders();
		headers.set("Authorization","token "+token);
		headers.setContentType(MediaType.APPLICATION_JSON);

		result = restMgr.postWithHeader(url, vars, headers);
		
		ModelAndView mav = new ModelAndView("/my_apps/apps_detail");
		mav.addObject("msg", "Garden Platform");
		
		return mav;
	}
	
}