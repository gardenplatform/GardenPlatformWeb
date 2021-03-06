package com.ssm.gardenplatform.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
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
public class MainController {
	
	LogManager logMgr = new LogManager();
	RestManager restMgr = new RestManager();
	
	// main page
	@RequestMapping(value = "/main.do", method = RequestMethod.GET)
	public ModelAndView getMain(HttpServletRequest request, HttpServletResponse response) throws IOException{

		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		logMgr.printLog(request);
		
		ModelAndView mav = new ModelAndView("main");
		return mav;
	}
	
	@RequestMapping(value = "/home.do", method = RequestMethod.GET)
	public ModelAndView getHome(HttpServletRequest request, HttpServletResponse response) throws IOException{

		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		logMgr.printLog(request);
		
		Map<String, Object> result = null;
		
		HttpSession session = request.getSession(false);
		String token = session.getAttribute("token").toString();
		String userID = session.getAttribute("userID").toString();
		
		String url = RestInfo.restURL+"/clients";
		
		MultiValueMap<String, Object> vars = new LinkedMultiValueMap<String, Object>();
		
		HttpHeaders headers = new HttpHeaders();
		
		headers.set("Authorization","token "+token);
		headers.setContentType(MediaType.APPLICATION_JSON);

		result = restMgr.exchangeWithHeader(url, vars, headers, HttpMethod.GET);
			
		ModelAndView mav = new ModelAndView();
		if(result.get("status").equals("success")){
			LinkedList<Map<String, String>> myAppList = new LinkedList<Map<String, String>>();
			try {
				JSONArray jsonArr = new JSONArray(result.get("result").toString());
				for(int i=0; i<jsonArr.length() ;i++) {
					JSONObject item = new JSONObject(jsonArr.get(i).toString());
					Map<String, String> app = new HashMap<String, String>();
					app.put("name", item.get("name").toString());
					app.put("publish", item.get("publish").toString());
					app.put("shortDescription", item.get("short_description").toString());
					
					myAppList.add(app);
				}
			} catch (JSONException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			session.setAttribute("myAppList", myAppList);
		}
		else {
			mav.setView(new RedirectView("/GardenPlatformWeb/error.do?status=500"));			
		}
		
		url = RestInfo.restURL+"/users/"+userID+"/apps";
		result = restMgr.exchangeWithHeader(url, vars, headers, HttpMethod.GET);
		
		if(result.get("status").equals("success")){
			try {
				JSONArray jsonArr = new JSONArray(result.get("result").toString());
				LinkedList<Map<String, String>> bookmarkList = new LinkedList<Map<String, String>>();
				for(int i=0; i<jsonArr.length(); i++) {
					JSONObject jsonObj = new JSONObject(jsonArr.getJSONObject(i).toString());
					
					Map<String, String> app = new HashMap<String, String>();
					app.put("displayName", jsonObj.get("display_name").toString());
					app.put("realName", jsonObj.get("name").toString());
					app.put("url", jsonObj.get("url").toString());
					app.put("appImgUrl", RestInfo.restURL+jsonObj.get("app_icon"));
					app.put("publish", jsonObj.get("publish").toString());
					
					bookmarkList.add(app);
				}
				mav.addObject("bookmarkList", bookmarkList);
				
			} catch (JSONException e) {
				e.printStackTrace();
			}
		}
		else {
			mav.setView(new RedirectView("/GardenPlatformWeb/error.do?status=500"));			
		}
			
		return mav;
	}

	@RequestMapping(value = "/deleteBookmark.do", method = RequestMethod.POST)
	public void deleteBookmark(HttpServletRequest request, HttpServletResponse response) throws IOException{

		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		logMgr.printLog(request);

		String appName = request.getParameter("appName").trim();
		
		Map<String, Object> result = null;
		
		HttpSession session = request.getSession(false);
		String token = session.getAttribute("token").toString();
		String userID = session.getAttribute("userID").toString();

		String url = RestInfo.restURL+"/users/"+userID+"/apps?name="+appName;
		
		MultiValueMap<String, Object> vars = new LinkedMultiValueMap<String, Object>();
		
		HttpHeaders headers = new HttpHeaders();
		headers.set("Authorization","token "+token);
		headers.setContentType(MediaType.APPLICATION_JSON);

		result = restMgr.exchangeWithHeader(url, vars, headers, HttpMethod.DELETE);
		
		JSONObject obj = new JSONObject();
		try {
			if(result.get("status").toString().equals("success")) {
				obj.put("status", "success");
				obj.put("msg", "Update success");
			}
			else {
				obj.put("status", result.get("status").toString());
				obj.put("msg", result.get("msg").toString());
			}
		} catch (JSONException e) {
			e.printStackTrace();
		}
		
		PrintWriter writer = response.getWriter();
		writer.write(obj.toString());
	}

}