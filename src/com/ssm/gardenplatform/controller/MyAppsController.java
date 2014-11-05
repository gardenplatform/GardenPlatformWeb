package com.ssm.gardenplatform.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.LinkedList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
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
	
	@RequestMapping(value = "/my_apps/index.do", method = RequestMethod.GET)
	public ModelAndView getMyapps_Index(HttpServletRequest request, HttpServletResponse response) throws IOException{
		
		logMgr.printLog(request);

		String appName = request.getParameter("appName");
		
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
	
	@RequestMapping(value = "/updateClient.do", method = RequestMethod.POST)
	public void updateClient(HttpServletRequest request, HttpServletResponse response) throws IOException{
		
		logMgr.printLog(request);

		String appName = request.getParameter("appName");
		String appUrl = request.getParameter("appUrl");
		String appRedirectUrl = request.getParameter("appRedirectUrl");
		
		Map<String, Object> result = null;
		
		HttpSession session = request.getSession(false);
		String token = session.getAttribute("token").toString();

		String url = RestInfo.restURL+"/clients/"+appName;
		
		MultiValueMap<String, Object> vars = new LinkedMultiValueMap<String, Object>();

		vars.add("appUrl", appUrl);
		vars.add("appRedirectUrl", appRedirectUrl);
		
		HttpHeaders headers = new HttpHeaders();
		headers.set("Authorization","token "+token);
		headers.setContentType(MediaType.APPLICATION_JSON);

		result = restMgr.putWithHeader(url, vars, headers);
		
		JSONObject obj = new JSONObject();
		try {
			if(result.get("status").toString().equals("success")) {

				JSONObject jsonObj = new JSONObject(result.get("result").toString());
				obj.put("status", result.get("status").toString());
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
	
	
	
	
	@RequestMapping(value = "/my_apps/apps_detail.do", method = RequestMethod.GET)
	public ModelAndView getMyapps_Apps_Detail(HttpServletRequest request, HttpServletResponse response) throws IOException{
		
		logMgr.printLog(request);

		String appName = request.getParameter("appName");
		
		Map<String, Object> result = null;
		
		HttpSession session = request.getSession(false);
		String token = session.getAttribute("token").toString();
		
		String url = RestInfo.restURL+"/clients/"+appName+"/details";
		
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
			mav.setViewName("/my_apps/apps_detail");
			try {
				JSONObject jsonObj = new JSONObject(result.get("result").toString());
				mav.addObject("appName", appName);
				mav.addObject("tag1", jsonObj.get("tag1"));
				mav.addObject("tag2", jsonObj.get("tag2"));
				mav.addObject("tag3", jsonObj.get("tag3"));
				mav.addObject("category", jsonObj.get("category"));
				mav.addObject("short_description", jsonObj.get("short_description"));
				mav.addObject("long_description", jsonObj.get("long_description"));
				mav.addObject("permission_explanation", jsonObj.get("permission_explanation"));
				
			} catch (JSONException e) {
				e.printStackTrace();
			}
			
		}
		return mav;
	}
	

	@RequestMapping(value = "/postAppDetail.do", method = RequestMethod.POST)
	public void postAppDetail(HttpServletRequest request, HttpServletResponse response) throws IOException{
		
		logMgr.printLog(request);

		String appName = request.getParameter("appName");
		String tag1 = request.getParameter("tag1");
		String tag2 = request.getParameter("tag2");
		String tag3 = request.getParameter("tag3");
		String short_description = request.getParameter("short_description");
		String long_description = request.getParameter("long_description");
		String category = request.getParameter("category");
		String permission_explanation = request.getParameter("permission_explanation");
		
		Map<String, Object> result = null;
		
		HttpSession session = request.getSession(false);
		String token = session.getAttribute("token").toString();

		String url = RestInfo.restURL+"/clients/"+appName+"/details";
		
		MultiValueMap<String, Object> vars = new LinkedMultiValueMap<String, Object>();

		vars.add("tag1", tag1);
		vars.add("tag2", tag2);
		vars.add("tag3", tag3);
		vars.add("short_description", short_description);
		vars.add("long_description", long_description);
		vars.add("category", category);
		vars.add("permission_explanation", permission_explanation);
		
		HttpHeaders headers = new HttpHeaders();
		headers.set("Authorization","token "+token);
		headers.setContentType(MediaType.APPLICATION_JSON);

		result = restMgr.postWithHeader(url, vars, headers);
		
		JSONObject obj = new JSONObject();
		try {
			if(result.get("status").toString().equals("success")) {

				JSONObject jsonObj = new JSONObject(result.get("result").toString());
				obj.put("status", result.get("status").toString());
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
	
	
	@RequestMapping(value = "/my_apps/roles.do", method = RequestMethod.GET)
	public ModelAndView getMyapps_Roles(HttpServletRequest request, HttpServletResponse response) throws IOException{
		
		logMgr.printLog(request);

		String appName = request.getParameter("appName");
		
		Map<String, Object> result = null;
		
		HttpSession session = request.getSession(false);
		String token = session.getAttribute("token").toString();
		
		String url = RestInfo.restURL+"/teams/"+appName+"/members";
		
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
			mav.setViewName("/my_apps/roles");
			mav.addObject("appName", appName);
			try {
				JSONArray jsonArr = new JSONArray(result.get("result").toString());
				LinkedList<String> developerList = new LinkedList<>();
				for(int i=0; i<jsonArr.length(); i++) {
					JSONObject jsonObj = new JSONObject(jsonArr.getJSONObject(i).toString());
					if(jsonObj.get("is_owner").toString().equals("true")){
						mav.addObject("owner", jsonObj.get("member"));
					}
					else {
						developerList.add(jsonObj.get("member").toString());
					}
				}
				mav.addObject("developerList", developerList);
				
			} catch (JSONException e) {
				e.printStackTrace();
			}
			
		}
		return mav;
	}
	
	
	@RequestMapping(value = "/addMember.do", method = RequestMethod.POST)
	public void addMember(HttpServletRequest request, HttpServletResponse response) throws IOException{
		
		logMgr.printLog(request);
		
		String appName = request.getParameter("appName");
		String memberID = request.getParameter("memberID");
		
		Map<String, Object> result = null;
		
		HttpSession session = request.getSession(false);
		String token = session.getAttribute("token").toString();

		String url = RestInfo.restURL+"/teams/"+appName+"/members";
		
		MultiValueMap<String, Object> vars = new LinkedMultiValueMap<String, Object>();

		vars.add("member", memberID);

		HttpHeaders headers = new HttpHeaders();
		headers.set("Authorization","token "+token);
		headers.setContentType(MediaType.APPLICATION_JSON);

		result = restMgr.postWithHeader(url, vars, headers);
		
		JSONObject obj = new JSONObject();
		try {
			if(result.get("status").toString().equals("success")) {

				JSONObject jsonObj = new JSONObject(result.get("result").toString());
				obj.put("status", result.get("status").toString());
				obj.put("msg", "Member add success");
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
	
	
	@RequestMapping(value = "/my_apps/setting.do", method = RequestMethod.GET)
	public ModelAndView getMyapps_Setting(HttpServletRequest request, HttpServletResponse response) throws IOException{
		
		logMgr.printLog(request);

		String appName = request.getParameter("appName");
		
		ModelAndView mav = new ModelAndView("/my_apps/setting");
		mav.addObject("appName", appName);
		return mav;
	}
	
	
	

	@RequestMapping(value = "/updateSetting.do", method = RequestMethod.POST)
	public void updateSetting(HttpServletRequest request, HttpServletResponse response) throws IOException{
		
		logMgr.printLog(request);

		String appName = request.getParameter("appName");
		String displayName = request.getParameter("displayName");
		String contactEmail = request.getParameter("contactEmail");
		String publish = request.getParameter("publish");
		
		Map<String, Object> result = null;
		
		HttpSession session = request.getSession(false);
		String token = session.getAttribute("token").toString();

		String url = RestInfo.restURL+"/clients/"+appName+"/setting";
		
		System.out.println(url);
		
		MultiValueMap<String, Object> vars = new LinkedMultiValueMap<String, Object>();

		vars.add("displayname", displayName);
		vars.add("contact_email", contactEmail);
		vars.add("publish", true);
		
		System.out.println(vars.toString());
		
		HttpHeaders headers = new HttpHeaders();
		headers.set("Authorization","token "+token);
		headers.setContentType(MediaType.APPLICATION_JSON);

		result = restMgr.postWithHeader(url, vars, headers);
		
		JSONObject obj = new JSONObject();
		try {
			if(result.get("status").toString().equals("success")) {

				JSONObject jsonObj = new JSONObject(result.get("result").toString());
				obj.put("status", result.get("status").toString());
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