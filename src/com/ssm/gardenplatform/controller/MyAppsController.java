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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

import com.ssm.gardenplatform.log.LogManager;
import com.ssm.gardenplatform.rest.RestInfo;
import com.ssm.gardenplatform.rest.RestManager;


@Controller
public class MyAppsController {
	
	LogManager logMgr = new LogManager();
	RestManager restMgr = new RestManager();
	
	@RequestMapping(value = "/webRegister.do", method = RequestMethod.POST)
	public void postClient(HttpServletRequest request, HttpServletResponse response) throws IOException{

		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		logMgr.printLog(request);
		
		String appName = request.getParameter("appName");
		String appUrl = request.getParameter("appUrl");
		String appRedirectUrl = request.getParameter("appRedirectUrl");
		String appType = "confidential";
		String appPermission = request.getParameter("appPermission");
		// confidential,(web) public(native)
		
		Map<String, Object> result = null;
		
		HttpSession session = request.getSession(false);
		String token = session.getAttribute("token").toString();
		
		String url = RestInfo.restURL+"/clients";
		
		MultiValueMap<String, Object> vars = new LinkedMultiValueMap<String, Object>();

		vars.add("name", appName);
		vars.add("url", appUrl);
		vars.add("redirect_uris", appRedirectUrl);
		vars.add("client_type", appType);
		vars.add("authorization_grant_type", appPermission);

		HttpHeaders headers = new HttpHeaders();
		headers.set("Authorization","token "+token);
		headers.setContentType(MediaType.APPLICATION_JSON);

		result = restMgr.exchangeWithHeader(url, vars, headers, HttpMethod.POST);
		
		JSONObject obj = new JSONObject();
		try {
			if(result.get("status").toString().equals("success")) {

				obj.put("status", result.get("status").toString());
				obj.put("msg", "App Register Success");
			}
			else{
				obj.put("status", result.get("status").toString());
				obj.put("msg", result.get("msg").toString());
			}
		} catch (JSONException e) {
			e.printStackTrace();
		}
		
		PrintWriter writer = response.getWriter();
		writer.write(obj.toString());
	}
	
	@RequestMapping(value = "/my_apps/index.do", method = RequestMethod.GET)
	public ModelAndView getMyapps_Index(HttpServletRequest request, HttpServletResponse response) throws IOException{

		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		logMgr.printLog(request);

		String appName = request.getParameter("appName").trim();
		
		Map<String, Object> result = null;
		
		HttpSession session = request.getSession(false);
		String token = session.getAttribute("token").toString();

		String url = RestInfo.restURL+"/clients/"+appName;
		
		MultiValueMap<String, Object> vars = new LinkedMultiValueMap<String, Object>();

		HttpHeaders headers = new HttpHeaders();
		headers.set("Authorization","token "+token);
		headers.setContentType(MediaType.APPLICATION_JSON);

		result = restMgr.exchangeWithHeader(url, vars, headers, HttpMethod.GET);
		
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
				mav.addObject("appRedirectUrl", jsonObj.get("redirect_uris"));
				mav.addObject("appID", jsonObj.get("client_id"));
				mav.addObject("appSecret", jsonObj.get("client_secret"));
				
				if(jsonObj.get("client_type").toString().equals("confidential"))
					mav.addObject("appType", "Web");
				else if(jsonObj.get("client_type").toString().equals("public"))
					mav.addObject("appType", "Native");
				
				mav.addObject("appImgUrl", RestInfo.restURL+jsonObj.get("app_icon"));
				
			} catch (JSONException e) {
				e.printStackTrace();
			}
			
		}
		
		url = RestInfo.restURL+"/clients/"+appName+"/setting";
		result = restMgr.exchangeWithHeader(url, vars, headers, HttpMethod.GET);
		
		if(result.get("status").equals("error")){
			mav.setView(new RedirectView("/GardenPlatformWeb/error.do?status=500"));
		}
		else {
			try {
				JSONObject jsonObj = new JSONObject(result.get("result").toString());
				mav.addObject("appPublish", jsonObj.get("publish"));
			}catch (JSONException e) {
				e.printStackTrace();
			}
		}
		
		return mav;
	}
	
	@RequestMapping(value="/postAppIcon.do", method=RequestMethod.POST )
    public @ResponseBody ModelAndView postAppIcon(HttpServletRequest request, HttpServletResponse response, RedirectAttributes redirectAttributes,
    		@RequestParam("imgFile") final MultipartFile imgFile, @RequestParam("appName") String appName) throws IOException{

		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		logMgr.printLog(request);
		
    	Map<String, Object> result = null;
		
		HttpSession session = request.getSession(false);
		String token = session.getAttribute("token").toString();

		String url = RestInfo.restURL+"/clients/"+appName+"/icons";
		
		MultiValueMap<String, Object> vars = new LinkedMultiValueMap<String, Object>();
		
		vars.add("icon", new org.springframework.core.io.ByteArrayResource(imgFile.getBytes(), imgFile.getOriginalFilename()) {
		    @Override
		    public String getFilename() throws IllegalStateException {
		        return imgFile.getOriginalFilename();
		    }
		});
		
		HttpHeaders headers = new HttpHeaders();
		headers.set("Authorization","token "+token);
		headers.setContentType(MediaType.MULTIPART_FORM_DATA);

		result = restMgr.exchangeWithHeader(url, vars, headers, HttpMethod.POST);

		ModelAndView mav = new ModelAndView();
		if(result.get("status").equals("error")){
			mav.setView(new RedirectView("/GardenPlatformWeb/error.do?status=500"));
		}
		else {
			mav.setView(new RedirectView("/GardenPlatformWeb/my_apps/index.do"));
			redirectAttributes.addAttribute("appName", appName);
		}
		return mav;
		
    }
	
	
	@RequestMapping(value = "/updateClient.do", method = RequestMethod.POST)
	public void updateClient(HttpServletRequest request, HttpServletResponse response) throws IOException{

		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		logMgr.printLog(request);

		String appName = request.getParameter("appName").trim();
		String appUrl = request.getParameter("appUrl");
		String appRedirectUrl = request.getParameter("appRedirectUrl");
		
		Map<String, Object> result = null;
		
		HttpSession session = request.getSession(false);
		String token = session.getAttribute("token").toString();

		String url = RestInfo.restURL+"/clients/"+appName;
		
		MultiValueMap<String, Object> vars = new LinkedMultiValueMap<String, Object>();
		
		vars.add("url", appUrl);
		vars.add("redirect_uris", appRedirectUrl);

		HttpHeaders headers = new HttpHeaders();
		headers.set("Authorization","token "+token);
		headers.setContentType(MediaType.APPLICATION_JSON);

		result = restMgr.exchangeWithHeader(url, vars, headers, HttpMethod.PUT);

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
	
	
	@RequestMapping(value = "/my_apps/apps_detail.do", method = RequestMethod.GET)
	public ModelAndView getMyapps_Apps_Detail(HttpServletRequest request, HttpServletResponse response) throws IOException{

		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		logMgr.printLog(request);

		String appName = request.getParameter("appName").trim();
		
		Map<String, Object> result = null;
		
		HttpSession session = request.getSession(false);
		String token = session.getAttribute("token").toString();
		
		String url = RestInfo.restURL+"/clients/"+appName+"/details";
		
		MultiValueMap<String, Object> vars = new LinkedMultiValueMap<String, Object>();

		HttpHeaders headers = new HttpHeaders();
		headers.set("Authorization","token "+token);
		headers.setContentType(MediaType.APPLICATION_JSON);

		result = restMgr.exchangeWithHeader(url, vars, headers, HttpMethod.GET);
		
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

		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		logMgr.printLog(request);

		String appName = request.getParameter("appName").trim();
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

		result = restMgr.exchangeWithHeader(url, vars, headers, HttpMethod.POST);

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
	
	
	@RequestMapping(value = "/my_apps/roles.do", method = RequestMethod.GET)
	public ModelAndView getMyapps_Roles(HttpServletRequest request, HttpServletResponse response) throws IOException{

		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		logMgr.printLog(request);

		String appName = request.getParameter("appName").trim();
		
		Map<String, Object> result = null;
		
		HttpSession session = request.getSession(false);
		String token = session.getAttribute("token").toString();
		
		String url = RestInfo.restURL+"/teams/"+appName+"/members";
		
		MultiValueMap<String, Object> vars = new LinkedMultiValueMap<String, Object>();

		HttpHeaders headers = new HttpHeaders();
		headers.set("Authorization","token "+token);
		headers.setContentType(MediaType.APPLICATION_JSON);

		result = restMgr.exchangeWithHeader(url, vars, headers, HttpMethod.GET);
		
		ModelAndView mav = new ModelAndView();
		if(result.get("status").equals("error")){
			mav.setView(new RedirectView("/GardenPlatformWeb/error.do?status=500"));
		}
		else {
			mav.setViewName("/my_apps/roles");
			mav.addObject("appName", appName);
			try {
				JSONArray jsonArr = new JSONArray(result.get("result").toString());
				LinkedList<Map<String, String>> developerList = new LinkedList<Map<String, String>>();
				for(int i=0; i<jsonArr.length(); i++) {
					JSONObject jsonObj = new JSONObject(jsonArr.getJSONObject(i).toString());

					if(jsonObj.get("is_owner").toString().equals("true")){
						mav.addObject("ownerID", jsonObj.get("member"));
						mav.addObject("ownerName", jsonObj.get("real_name"));
						mav.addObject("ownerProfileImg", RestInfo.restURL+jsonObj.get("profile_img"));
					}
					else {
						Map<String, String> developer = new HashMap<String, String>();
						developer.put("developerID", jsonObj.get("member").toString());
						developer.put("developerName", jsonObj.get("real_name").toString());
						developer.put("developerProfileImg", RestInfo.restURL+jsonObj.get("profile_img"));
						
						developerList.add(developer);
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

		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		logMgr.printLog(request);
		
		String appName = request.getParameter("appName").trim();
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

		result = restMgr.exchangeWithHeader(url, vars, headers, HttpMethod.POST);
		
		JSONObject obj = new JSONObject();
		try {
			if(result.get("status").toString().equals("success")) {
				obj.put("status", "success");
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
	
	@RequestMapping(value = "/deleteMember.do", method = RequestMethod.POST)
	public void deleteMember(HttpServletRequest request, HttpServletResponse response) throws IOException{

		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		logMgr.printLog(request);
		
		String appName = request.getParameter("appName").trim();
		String memberID = request.getParameter("memberID");
		
		Map<String, Object> result = null;
		
		HttpSession session = request.getSession(false);
		String token = session.getAttribute("token").toString();

		String url = RestInfo.restURL+"/teams/"+appName+"/members?username="+memberID;
		
		MultiValueMap<String, Object> vars = new LinkedMultiValueMap<String, Object>();

		HttpHeaders headers = new HttpHeaders();
		headers.set("Authorization","token "+token);
		headers.setContentType(MediaType.APPLICATION_JSON);

		result = restMgr.exchangeWithHeader(url, vars, headers, HttpMethod.DELETE);
		
		JSONObject obj = new JSONObject();
		try {
			if(result.get("status").toString().equals("success")) {
				obj.put("status", "success");
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

		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		logMgr.printLog(request);

		String appName = request.getParameter("appName").trim();
		
		Map<String, Object> result = null;
		
		HttpSession session = request.getSession(false);
		String token = session.getAttribute("token").toString();
		
		String url = RestInfo.restURL+"/clients/"+appName+"/setting";
		
		MultiValueMap<String, Object> vars = new LinkedMultiValueMap<String, Object>();

		HttpHeaders headers = new HttpHeaders();
		headers.set("Authorization","token "+token);
		headers.setContentType(MediaType.APPLICATION_JSON);

		result = restMgr.exchangeWithHeader(url, vars, headers, HttpMethod.GET);
		
		ModelAndView mav = new ModelAndView();
		if(result.get("status").equals("error")){
			mav.setView(new RedirectView("/GardenPlatformWeb/error.do?status=500"));
		}
		else {
			mav.setViewName("/my_apps/setting");
			try {
				JSONObject jsonObj = new JSONObject(result.get("result").toString());
				mav.addObject("appName", appName);
				mav.addObject("displayName", jsonObj.get("display_name"));
				mav.addObject("contactEmail", jsonObj.get("contact_email"));
				mav.addObject("publish", jsonObj.get("publish"));

				mav.addObject("appImgUrl", RestInfo.restURL+jsonObj.get("app_icon"));
			} catch (JSONException e) {
				e.printStackTrace();
			}
			
		}
		return mav;
	}

	@RequestMapping(value = "/updateSetting.do", method = RequestMethod.POST)
	public void updateSetting(HttpServletRequest request, HttpServletResponse response) throws IOException{

		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		logMgr.printLog(request);

		String appName = request.getParameter("appName").trim();
		String displayName = request.getParameter("displayName");
		String contactEmail = request.getParameter("contactEmail");
		String publish = request.getParameter("publish");
		
		Map<String, Object> result = null;
		
		HttpSession session = request.getSession(false);
		String token = session.getAttribute("token").toString();

		String url = RestInfo.restURL+"/clients/"+appName+"/setting";
		
		MultiValueMap<String, Object> vars = new LinkedMultiValueMap<String, Object>();

		vars.add("display_name", displayName);
		vars.add("contact_email", contactEmail);
		vars.add("publish", publish);
		
		HttpHeaders headers = new HttpHeaders();
		headers.set("Authorization","token "+token);
		headers.setContentType(MediaType.APPLICATION_JSON);

		result = restMgr.exchangeWithHeader(url, vars, headers, HttpMethod.POST);
		
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
	
	@RequestMapping(value = "/deleteClient.do", method = RequestMethod.POST)
	public void deleteClient(HttpServletRequest request, HttpServletResponse response) throws IOException{

		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		logMgr.printLog(request);

		String appName = request.getParameter("appName").trim();
		
		Map<String, Object> result = null;
		
		HttpSession session = request.getSession(false);
		String token = session.getAttribute("token").toString();

		String url = RestInfo.restURL+"/clients/"+appName;
		
		System.out.println(url);
		
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