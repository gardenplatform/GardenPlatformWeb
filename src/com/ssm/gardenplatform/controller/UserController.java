package com.ssm.gardenplatform.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONException;
import org.json.JSONObject;
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
		
		String result = null;
		
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		
		String url = RestInfo.restURL+"/users";
		
		MultiValueMap<String, Object> vars = new LinkedMultiValueMap<String, Object>();
		vars.add("username", id);
		vars.add("password", pwd);
		vars.add("email", email);
		vars.add("phone", phone);	
		
		result = restMgr.post(url, vars);
		
		JSONObject obj = new JSONObject();
		
		try {
			obj.put("status", "200");
		} catch (JSONException e) {
			e.printStackTrace();
		}
		
		PrintWriter writer = response.getWriter();
		writer.write(obj.toString());
	}
	
	@RequestMapping(value = "/signin.do", method = RequestMethod.POST)
	public void postSignin(HttpServletRequest request, HttpServletResponse response) throws IOException{

		logMgr.printLog(request);
		
		String result = null;
		
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		
		System.out.println(id + " " + pwd); 
		
		String url = RestInfo.restURL+"/tokens";
		
		MultiValueMap<String, Object> vars = new LinkedMultiValueMap<String, Object>();
		vars.add("username", id);
		vars.add("password", pwd);
		
		result = restMgr.post(url, vars);
		
		HttpSession session = request.getSession();
		User user = new User();
		user.setId(id);
		
		// user token 정보를 session에 저장
		JSONObject jsonObj;
		try {
			jsonObj = new JSONObject(result);
			user.setToken(jsonObj.get("token")+"");
		} catch (JSONException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		session.setAttribute("user",user);
		
		JSONObject obj = new JSONObject();
		
		try {
			obj.put("status", "200");
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
}