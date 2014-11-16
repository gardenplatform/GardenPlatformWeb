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
		
		logMgr.printLog(request);
		
		ModelAndView mav = new ModelAndView("main");
		return mav;
	}
	
	@RequestMapping(value = "/home.do", method = RequestMethod.GET)
	public ModelAndView getHome(HttpServletRequest request, HttpServletResponse response) throws IOException{
		
		logMgr.printLog(request);
		
		Map<String, Object> result = null;
		
		HttpSession session = request.getSession(false);
		String token = session.getAttribute("token").toString();
		
		String url = RestInfo.restURL+"/clients";
		
		MultiValueMap<String, Object> vars = new LinkedMultiValueMap<String, Object>();
		
		HttpHeaders headers = new HttpHeaders();
		
		headers.set("Authorization","token "+token);
		headers.setContentType(MediaType.APPLICATION_JSON);

		result = restMgr.exchangeWithHeader(url, vars, headers, HttpMethod.GET);
			
		ModelAndView mav = new ModelAndView();
		if(result.get("status").equals("success")){
			LinkedList<String> appList= new LinkedList<>();
			try {
				JSONArray jsonArr = new JSONArray(result.get("result").toString());
				for(int i=0; i<jsonArr.length() ;i++) {
					JSONObject item = new JSONObject(jsonArr.get(i).toString());
					appList.add(item.getString("name"));
				}
			} catch (JSONException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			session.setAttribute("appList", appList);
			
		}
		else {
			mav.setView(new RedirectView("/GardenPlatformWeb/error.do?status=500"));			
		}
			
		return mav;
	}

	@RequestMapping(value = "/webRegister.do", method = RequestMethod.POST)
	public void postClient(HttpServletRequest request, HttpServletResponse response) throws IOException{
		
		logMgr.printLog(request);
		
		String appName = request.getParameter("appName");
		String appUrl = request.getParameter("appUrl");
		String appRedirectUrl = request.getParameter("appRedirectUrl");
		String appType = "confidential";
		// confidential,(web) public(native)
		
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

		result = restMgr.exchangeWithHeader(url, vars, headers, HttpMethod.POST);
		
		JSONObject obj = new JSONObject();
		try {
			if(result.get("status").toString().equals("success")) {

				JSONObject jsonObj = new JSONObject(result.get("result").toString());
				obj.put("status", result.get("status").toString());
				obj.put("msg", "Can use ID");
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
}