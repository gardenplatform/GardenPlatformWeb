package com.ssm.gardenplatform.controller;

import java.io.IOException;
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
		
		logMgr.printLog(request);

		Map<String, Object> result = null;
		
		HttpSession session = request.getSession(false);
		String token = session.getAttribute("token").toString();

		String url = RestInfo.restURL+"/stores";

		if(request.getParameter("category") != null) 
			url += "?category="+request.getParameter("category").toString();
		
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
			mav.setViewName("/store/index");
			try {
				JSONArray jsonArr = new JSONArray(result.get("result").toString());
				LinkedList<Map<String, String>> appList = new LinkedList<Map<String, String>>();
				for(int i=0; i<jsonArr.length(); i++) {
					JSONObject jsonObj = new JSONObject(jsonArr.getJSONObject(i).toString());
					
					Map<String, String> app = new HashMap<String, String>();
					app.put("displayName", jsonObj.get("display_name").toString());
					app.put("category", jsonObj.get("category").toString());
					
					appList.add(app);
				}
				mav.addObject("appList", appList);
			} catch (JSONException e) {
				e.printStackTrace();
			}
			
		}
		return mav;
	}
}