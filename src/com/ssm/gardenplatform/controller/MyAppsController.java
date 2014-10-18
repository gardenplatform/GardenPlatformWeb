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
import com.ssm.gardenplatform.model.User;
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
	@RequestMapping(value = "/postClient.do", method = RequestMethod.GET)
	public ModelAndView postClient(HttpServletRequest request, HttpServletResponse response) throws IOException{
		
		logMgr.printLog(request);
		
		String appName = request.getParameter("appName");
		String appUrl = request.getParameter("appUrl");
		String appRedirect = request.getParameter("appRedirect");
		String appType = request.getParameter("appType");
		
		Map<String, Object> result = null;
		
		HttpSession session = request.getSession(false);
		User user = new User();
		user = (User) session.getAttribute("user");
		
		String url = RestInfo.restURL+"/users/"+user.getId();
		
		MultiValueMap<String, Object> vars = new LinkedMultiValueMap<String, Object>();
		
		HttpHeaders headers = new HttpHeaders();
		headers.set("Authorization","token "+user.getToken());
		headers.setContentType(MediaType.APPLICATION_JSON);
		
		vars.add("name", appName);
		vars.add("url", appUrl);
		vars.add("redirect_uri", appRedirect);
		vars.add("client_type", appType);
		
		result = restMgr.postWithHeader(url, vars, headers);
		
		
		ModelAndView mav = new ModelAndView("/my_apps/apps_detail");
		mav.addObject("msg", "Garden Platform");
		
		return mav;
	}
	
}