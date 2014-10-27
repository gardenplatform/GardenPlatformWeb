package com.ssm.gardenplatform.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.LinkedList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

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

		String appName = request.getParameter("appName");
		
		System.out.println(appName);
		
		Map<String, Object> result = null;
		
		HttpSession session = request.getSession(false);
		String token = session.getAttribute("token").toString();
		
		String url = RestInfo.restURL+"/clients/"+appName;
		
		MultiValueMap<String, Object> vars = new LinkedMultiValueMap<String, Object>();

		HttpHeaders headers = new HttpHeaders();
		headers.set("Authorization","token "+token);
		headers.setContentType(MediaType.APPLICATION_JSON);

		result = restMgr.getWithHeader(url, vars, headers);
		
		ModelAndView mav = new ModelAndView();
		if(result.get("status").equals("error")){
			mav.setView(new RedirectView("/GardenPlatformWeb/error.do?status=500"));
		}
		else {
			mav.setViewName("/my_apps/index");
			try {
				JSONObject jsonObj = new JSONObject(result.get("result").toString());
				mav.addObject("appName", jsonObj.get("name"));
				mav.addObject("appUrl", jsonObj.get("url"));
				mav.addObject("appRedirectUrl", jsonObj.get("redirect_uri"));
				mav.addObject("appID", jsonObj.get("client_id"));
				mav.addObject("appSecret", jsonObj.get("client_secret"));
				
				if(jsonObj.get("client_type").toString().equals("0"))
					mav.addObject("appType", "Web");
				else if(jsonObj.get("client_type").toString().equals("1"))
					mav.addObject("appType", "Native");
				
			} catch (JSONException e) {
				e.printStackTrace();
			}
			
		}
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
	
	@RequestMapping(value = "/my_apps/roles.do", method = RequestMethod.GET)
	public ModelAndView getMyapps_Roles(HttpServletRequest request, HttpServletResponse response) throws IOException{
		
		logMgr.printLog(request);
		
		ModelAndView mav = new ModelAndView("/my_apps/roles");
		mav.addObject("msg", "Garden Platform");
		return mav;
	}
	
	@RequestMapping(value = "/webRegister.do", method = RequestMethod.POST)
	public void postClient(HttpServletRequest request, HttpServletResponse response) throws IOException{
		
		logMgr.printLog(request);
		
		String appName = request.getParameter("appName");
		String appUrl = request.getParameter("appUrl");
		String appRedirectUrl = request.getParameter("appRedirectUrl");
		String appType = "0";
		
		Map<String, Object> result = null;
		
		HttpSession session = request.getSession(false);
		String token = session.getAttribute("token").toString();
		
		String url = RestInfo.restURL+"/clients";
		
		MultiValueMap<String, Object> vars = new LinkedMultiValueMap<String, Object>();

		vars.add("name", appName);
		vars.add("url", appUrl);
		vars.add("redirect_uri", appRedirectUrl);
		vars.add("client_type", appType);

		HttpHeaders headers = new HttpHeaders();
		headers.set("Authorization","token "+token);
		headers.setContentType(MediaType.APPLICATION_JSON);

		result = restMgr.postWithHeader(url, vars, headers);
		
		JSONObject obj = new JSONObject();
		try {
			if(result.get("status").toString().equals("success")) {

				JSONObject jsonObj = new JSONObject(result.get("result").toString());
				obj.put("status", "success");
				obj.put("msg", "Can use ID");
			}
			else{
				if(result.get("msg").toString().equals("409 CONFLICT")) {
					obj.put("status", "conflict");
					obj.put("msg", "App Name is already taken");
				}
				else {
					obj.put("status", "error");
					obj.put("msg", result.get("msg"));
				}
			}
		} catch (JSONException e) {
			e.printStackTrace();
		}
		
		PrintWriter writer = response.getWriter();
		writer.write(obj.toString());
	}
	
}