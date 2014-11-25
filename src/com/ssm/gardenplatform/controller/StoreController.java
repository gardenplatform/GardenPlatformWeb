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
public class StoreController {
	
	LogManager logMgr = new LogManager();
	RestManager restMgr = new RestManager();
	
	@RequestMapping(value = "/store/index.do", method = RequestMethod.GET)
	public ModelAndView getStoreIndex(HttpServletRequest request, HttpServletResponse response) throws IOException{

		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		logMgr.printLog(request);
		
		ModelAndView mav = new ModelAndView();

		Map<String, Object> result = null;
		
		HttpSession session = request.getSession(false);
		String token = session.getAttribute("token").toString();

		String url = RestInfo.restURL+"/stores";

		if(request.getParameter("category") != null){ 
			url += "?category="+request.getParameter("category").toString();
		}
		else if(request.getParameter("search") != null) {
			String search = request.getParameter("search");
			String tag = request.getParameter("tag");
			
			search = search.replaceAll(" ", "+");
			url += "?search="+search+"&tag="+tag;
			
			mav.addObject("tag", tag);
			mav.addObject("search", search);
		}
		
		
		MultiValueMap<String, Object> vars = new LinkedMultiValueMap<String, Object>();

		HttpHeaders headers = new HttpHeaders();
		headers.set("Authorization","token "+token);
		headers.setContentType(MediaType.APPLICATION_JSON);

		result = restMgr.exchangeWithHeader(url, vars, headers, HttpMethod.GET);
		
		
		if(result.get("status").equals("error")){
			mav.setView(new RedirectView("/GardenPlatformWeb/error.do?status=500"));
		}
		else {
			mav.setViewName("/store/index");
			try {
				JSONArray jsonArr = new JSONArray(result.get("result").toString());
				LinkedList<Map<String, String>> appList = new LinkedList<Map<String, String>>();
				for(int i=0; i<jsonArr.length(); i++) {
					JSONObject jsonObj = new JSONObject(jsonArr.getJSONObject(i).toString());
					
					Map<String, String> app = new HashMap<String, String>();
					app.put("appName", jsonObj.get("client_name").toString());
					app.put("displayName", jsonObj.get("display_name").toString());
					app.put("category", jsonObj.get("category").toString());
					app.put("appImgUrl", RestInfo.restURL+jsonObj.get("app_icon"));
					
					appList.add(app);
				}
				mav.addObject("appList", appList);
			} catch (JSONException e) {
				e.printStackTrace();
			}
			
		}
		return mav;
	}
	
	@RequestMapping(value = "/getStoreDetail.do", method = RequestMethod.GET)
	public void getStoreDetail(HttpServletRequest request, HttpServletResponse response) throws IOException{

		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		logMgr.printLog(request);

		String appName = request.getParameter("appName").trim();
		
		Map<String, Object> result = null;
		
		HttpSession session = request.getSession(false);
		String token = session.getAttribute("token").toString();

		String url = RestInfo.restURL+"/stores/"+appName;
		
		MultiValueMap<String, Object> vars = new LinkedMultiValueMap<String, Object>();

		HttpHeaders headers = new HttpHeaders();
		headers.set("Authorization","token "+token);
		headers.setContentType(MediaType.APPLICATION_JSON);

		result = restMgr.exchangeWithHeader(url, vars, headers, HttpMethod.GET);
		
		JSONObject obj = new JSONObject();
		try {
			if(result.get("status").toString().equals("success")) {
				obj.put("status", "success");
				
				JSONObject jsonObj = new JSONObject(result.get("result").toString());
				obj.put("displayName", jsonObj.get("display_name").toString());
				obj.put("category",  jsonObj.get("category").toString());
				obj.put("contactEmail", jsonObj.get("contact_email").toString());
				obj.put("shortDescription", jsonObj.get("short_description").toString());
				obj.put("longDescription", jsonObj.get("long_description").toString());
				obj.put("permissionExplanation", jsonObj.get("permission_explanation").toString());
				obj.put("tag1", jsonObj.get("tag1").toString());
				obj.put("tag2", jsonObj.get("tag2").toString());
				obj.put("tag3", jsonObj.get("tag3").toString());
				obj.put("createdAt", jsonObj.get("created_at").toString());
				
				if(obj.get("contactEmail").toString().equals(""))
					obj.put("contactEmail", "없음");
				
				if(obj.get("shortDescription").toString().equals(""))
					obj.put("shortDescription", "없음");

				if(obj.get("longDescription").toString().equals(""))
					obj.put("longDescription", "없음");
				
				if(obj.get("category").toString().equals(""))
					obj.put("category", "없음");
				
				if(obj.get("permissionExplanation").toString().equals(""))
					obj.put("permissionExplanation", "없음");
				
				if(obj.get("tag1").toString().equals(""))
					obj.put("tag1", "없음");
				
				if(obj.get("tag2").toString().equals(""))
					obj.put("tag2", "없음");
				
				if(obj.get("tag3").toString().equals(""))
					obj.put("tag3", "없음");
				
				
				obj.put("appName", appName);
				
				obj.put("appImgUrl", RestInfo.restURL+jsonObj.get("app_icon"));
				
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
	
	
	@RequestMapping(value = "/addApp.do", method = RequestMethod.POST)
	public void addApp(HttpServletRequest request, HttpServletResponse response) throws IOException{

		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		logMgr.printLog(request);

		String appName = request.getParameter("appName").trim();
		
		Map<String, Object> result = null;
		
		HttpSession session = request.getSession(false);
		String token = session.getAttribute("token").toString();
		String userID = session.getAttribute("userID").toString();

		String url = RestInfo.restURL+"/users/"+userID+"/apps";
		
		MultiValueMap<String, Object> vars = new LinkedMultiValueMap<String, Object>();

		vars.add("client_name", appName);
		
		HttpHeaders headers = new HttpHeaders();
		headers.set("Authorization","token "+token);
		headers.setContentType(MediaType.APPLICATION_JSON);

		result = restMgr.exchangeWithHeader(url, vars, headers, HttpMethod.POST);
		
		JSONObject obj = new JSONObject();
		try {
			if(result.get("status").toString().equals("success")) {
				obj.put("status", "success");
				obj.put("msg", "Add success");
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