package com.ssm.gardenplatform.controller;

import java.io.IOException;
import java.io.PrintWriter;
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
import com.ssm.gardenplatform.model.User;
import com.ssm.gardenplatform.rest.RestInfo;
import com.ssm.gardenplatform.rest.RestManager;

@Controller
public class UserController {

	LogManager logMgr = new LogManager();
	RestManager restMgr = new RestManager();
	
	@RequestMapping(value = "/signup.do", method = RequestMethod.POST)
	public void postSignup(HttpServletRequest request, HttpServletResponse response) throws IOException{

		logMgr.printLog(request);
		
		Map<String, Object> result = null;
		
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String classNum = request.getParameter("classNum");
		String gender = request.getParameter("gender");
		
		String url = RestInfo.restURL+"/users";
		
		MultiValueMap<String, Object> vars = new LinkedMultiValueMap<String, Object>();
		vars.add("username", id);
		vars.add("password", pwd);
		vars.add("real_name", name);
		vars.add("email", email);
		vars.add("phone", phone);	
		vars.add("class_num", classNum);	
		vars.add("gender", gender);	
	
		result = restMgr.post(url, vars);
		
		JSONObject obj = new JSONObject();

		try {		
			if(result.get("status").toString().equals("success")) {
				obj.put("status", "success");
				obj.put("msg", "Sign up Success");
			}
			else{
				obj.put("status", "error");
				obj.put("msg", result.get("msg"));
			}
			
		} catch (JSONException e) {
			e.printStackTrace();
		}
		
		PrintWriter writer = response.getWriter();
		writer.write(obj.toString());
	}
	
	@RequestMapping(value = "/signin.do", method = RequestMethod.POST)
	public void postSignin(HttpServletRequest request, HttpServletResponse response) throws IOException{

		logMgr.printLog(request);

		Map<String, Object> result = null;
		
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		
		String url = RestInfo.restURL+"/tokens";
		
		MultiValueMap<String, Object> vars = new LinkedMultiValueMap<String, Object>();
		vars.add("username", id);
		vars.add("password", pwd);
		
		result = restMgr.post(url, vars);
		
		JSONObject obj = new JSONObject();
		try {
			if(result.get("status").toString().equals("success")) {
				
				HttpSession session = request.getSession();
				User user = new User();
				user.setId(id);
				
				// user token ��������� session��� ������
				JSONObject jsonObj;
				try {
					jsonObj = new JSONObject(result.get("result").toString());
					user.setToken(jsonObj.get("token")+"");
				} catch (JSONException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
				
				session.setAttribute("user",user);
				
				obj.put("status", "success");
				obj.put("msg", "Sign in Success");
			}
			else{
				obj.put("status", "error");
				obj.put("msg", result.get("msg"));
			}
		} catch (JSONException e) {
			e.printStackTrace();
		}
		
		PrintWriter writer = response.getWriter();
		writer.write(obj.toString());
	}
	
	@RequestMapping(value = "/signout.do", method = RequestMethod.GET)
	public ModelAndView getSignout(HttpServletRequest request, HttpServletResponse response) throws IOException{

		logMgr.printLog(request);
		
		HttpSession session = request.getSession(false);
		if (session != null) {
		    session.invalidate();
		}
		
		ModelAndView mav = new ModelAndView();
		mav.setView(new RedirectView("main.do"));

		return mav;
	}
	
	
	@RequestMapping(value = "/user/profile.do", method = RequestMethod.GET)
	public ModelAndView getProfile(HttpServletRequest request, HttpServletResponse response) throws IOException{

		logMgr.printLog(request);

		/*
		Map<String, Object> result = null;
		
		HttpSession session = request.getSession(false);
		User user = new User();
		user = (User) session.getAttribute("user");
		
		String url = RestInfo.restURL+"/users/"+user.getId();
		
		MultiValueMap<String, Object> vars = new LinkedMultiValueMap<String, Object>();
		
		HttpHeaders headers = new HttpHeaders();
		headers.set("Authorization","token "+user.getToken());
		headers.setContentType(MediaType.APPLICATION_JSON);
		
		result = restMgr.getWithHeader(url, vars, headers);
		*/

		ModelAndView mav = new ModelAndView("/user/profile");

		return mav;
	}
}