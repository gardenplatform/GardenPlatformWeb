package com.ssm.gardenplatform.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
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
import org.springframework.web.servlet.view.RedirectView;

import com.ssm.gardenplatform.dao.UserDAO;
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

		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
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
		
		System.out.println(vars.toString());

		result = restMgr.post(url, vars);
		
		JSONObject obj = new JSONObject();

		try {		
			if(result.get("status").toString().equals("success")) {
				obj.put("status", result.get("status").toString());
				obj.put("msg", "Sign up Success");
			}
			else{
				obj.put("status", result.get("status").toString());
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

		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		logMgr.printLog(request);

		Map<String, Object> result = null;
		
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		
		String url = RestInfo.restURL+"/tokens";
		
		MultiValueMap<String, Object> vars = new LinkedMultiValueMap<String, Object>();
		vars.add("username", id);
		vars.add("password", pwd);
		
		System.out.println(vars.toString());
		
		result = restMgr.post(url, vars);
		
		JSONObject obj = new JSONObject();
		try {
			if(result.get("status").toString().equals("success")) {
				
				HttpSession session = request.getSession();
				session.setAttribute("userID", id);
				
				// user token & session
				JSONObject jsonObj;
				try {
					jsonObj = new JSONObject(result.get("result").toString());
					session.setAttribute("token", jsonObj.get("token").toString());
				} catch (JSONException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}

				obj.put("status", result.get("status").toString());
				obj.put("msg", "Sign in Success");
			}
			else{
				obj.put("status", result.get("status").toString());
				obj.put("msg", result.get("msg"));
			}
		} catch (JSONException e) {
			e.printStackTrace();
		}
		
		PrintWriter writer = response.getWriter();
		writer.write(obj.toString());
	}
	
	@RequestMapping(value = "/checkID.do", method = RequestMethod.POST)
	public void checkID(HttpServletRequest request, HttpServletResponse response) throws IOException{

		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		logMgr.printLog(request);

		Map<String, Object> result = null;
		
		String id = request.getParameter("id");
		
		String url = RestInfo.restURL+"/users?username="+id;
		result = restMgr.get(url);
		
		JSONObject obj = new JSONObject();
		try {
			if(result.get("status").toString().equals("success")) {
				obj.put("status", result.get("status").toString());
				obj.put("msg", "Can use ID");
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
	
	@RequestMapping(value = "/signout.do", method = RequestMethod.GET)
	public ModelAndView getSignout(HttpServletRequest request, HttpServletResponse response) throws IOException{

		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
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

		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		logMgr.printLog(request);

		Map<String, Object> result = null;
		
		HttpSession session = request.getSession(false);
		
		String userID = session.getAttribute("userID").toString();
		String token = session.getAttribute("token").toString();
		
		
		String url = RestInfo.restURL+"/users/"+userID;
		
		MultiValueMap<String, Object> vars = new LinkedMultiValueMap<String, Object>();
		
		HttpHeaders headers = new HttpHeaders();
		headers.set("Authorization","token "+token);
		headers.setContentType(MediaType.APPLICATION_JSON);

		result = restMgr.exchangeWithHeader(url, vars, headers, HttpMethod.GET);
		
		ModelAndView mav = new ModelAndView();
		if(result.get("status").equals("success")){
			mav.setViewName("/user/profile");
			try {
				JSONObject jsonObj = new JSONObject(result.get("result").toString());
				mav.addObject("id", jsonObj.get("username"));
				mav.addObject("email", jsonObj.get("email"));
				mav.addObject("phone", jsonObj.get("phone"));
				mav.addObject("name", jsonObj.get("real_name"));
				mav.addObject("class_num", jsonObj.get("class_num"));
				mav.addObject("gender", jsonObj.get("gender"));
				
				mav.addObject("profileImg", RestInfo.restURL+jsonObj.get("profile_img"));
			} catch (JSONException e) {
				e.printStackTrace();
			}
		}
		else {
			mav.setView(new RedirectView("/GardenPlatformWeb/error.do?status=500"));			
		}
		
		url = RestInfo.restURL+"/clients";
		
		result = restMgr.exchangeWithHeader(url, vars, headers, HttpMethod.GET);
			
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
		
		
		return mav;
	}
	
	@RequestMapping(value="/postProfileImg.do", method=RequestMethod.POST )
    public @ResponseBody ModelAndView postProfileImg(HttpServletRequest request, HttpServletResponse response,
    		@RequestParam("imgFile") final MultipartFile imgFile) throws IOException{

		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		logMgr.printLog(request);
    	
    	Map<String, Object> result = null;
		
		HttpSession session = request.getSession(false);

		String userID = session.getAttribute("userID").toString();
		String token = session.getAttribute("token").toString();

		String url = RestInfo.restURL+"/users/"+userID+"/icons";
		
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
		
		System.out.println(imgFile);
		System.out.println(imgFile.getOriginalFilename());
		System.out.println(imgFile.getSize());

		result = restMgr.exchangeWithHeader(url, vars, headers, HttpMethod.POST);

		ModelAndView mav = new ModelAndView();
		if(result.get("status").equals("error")){
			mav.setView(new RedirectView("/GardenPlatformWeb/error.do?status=500"));
		}
		else {
			mav.setView(new RedirectView("/GardenPlatformWeb/user/profile.do"));
		}
		
		return mav;
		
    }
	

	@RequestMapping(value = "/updateUser.do", method = RequestMethod.POST)
	public void updateUser(HttpServletRequest request, HttpServletResponse response) throws IOException{

		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		logMgr.printLog(request);

		Map<String, Object> result = null;
		HttpSession session = request.getSession(false);
		
		String token = session.getAttribute("token").toString();
		String userID = session.getAttribute("userID").toString();
		
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String newPwd = request.getParameter("newPwd");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		
		String url = RestInfo.restURL+"/tokens";
		
		MultiValueMap<String, Object> vars = new LinkedMultiValueMap<String, Object>();
		vars.add("username", id);
		vars.add("password", pwd);
		
		HttpHeaders headers = new HttpHeaders();
		headers.set("Authorization","token "+token);
		headers.setContentType(MediaType.APPLICATION_JSON);
		
		System.out.println(vars.toString());
		
		// 아이디 비밀번호 확인
		result = restMgr.post(url, vars);
		
		JSONObject obj = new JSONObject();
		try {
			// 비밀번호가 맞으면 프로필 업데이트
			if(result.get("status").toString().equals("success")) {
				url = RestInfo.restURL+"/users/"+userID;
				
				vars.clear();
				vars.add("email", email);
				vars.add("phone", phone);
				if(newPwd == null) 
					vars.add("password", pwd);
				else
					vars.add("password", newPwd);

				System.out.println(vars.toString());
				result = restMgr.exchangeWithHeader(url, vars, headers, HttpMethod.PUT);
				
				if(result.get("status").toString().equals("success")) {
					obj.put("status", result.get("status").toString());
					obj.put("msg", "Profile update success");
				}
				else {
					obj.put("status", result.get("status").toString());
					obj.put("msg", result.get("msg").toString());
				}
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
	
	@RequestMapping(value = "/userInfo.do", method = RequestMethod.GET)
	public void getUserInfo(HttpServletRequest request, HttpServletResponse response) throws IOException{

		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		logMgr.printLog(request);

		Map<String, Object> result = null;
		HttpSession session = request.getSession(false);
		
		String token = session.getAttribute("token").toString();
		String userID = request.getParameter("userID");
		
		String url = RestInfo.restURL+"/users/"+userID;
		
		System.out.println(url);
		
		MultiValueMap<String, Object> vars = new LinkedMultiValueMap<String, Object>();
		
		HttpHeaders headers = new HttpHeaders();
		headers.set("Authorization","token "+token);
		headers.setContentType(MediaType.APPLICATION_JSON);
		
		result = restMgr.exchangeWithHeader(url, vars, headers, HttpMethod.GET);
		
		JSONObject obj = new JSONObject();
		try {
			if(result.get("status").toString().equals("success")) {
				obj.put("status", result.get("status").toString());
				obj.put("msg", "get UserInfo success");
				
				JSONObject jsonObj = new JSONObject(result.get("result").toString());
				obj.put("username", jsonObj.get("username").toString());
				obj.put("email", jsonObj.get("email").toString());
				obj.put("phone", jsonObj.get("phone").toString());
				obj.put("real_name", jsonObj.get("real_name").toString());
				obj.put("class_num", jsonObj.get("class_num").toString());
				obj.put("gender", jsonObj.get("gender").toString());
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
	
	@RequestMapping(value = "/searchUser.do", method = RequestMethod.GET)
	public void getSearchUser(HttpServletRequest request, HttpServletResponse response) throws IOException{

		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		logMgr.printLog(request);
		
		Map<String, Object> result = null;
		
		String search = request.getParameter("search");
		String mode = request.getParameter("mode").trim();
		
		HttpSession session = request.getSession(false);
		String token = session.getAttribute("token").toString();

		String url = RestInfo.restURL+"/search";
		System.out.println(url);
		if(mode.equals("이름")) {
			url += "?real_name="+search;
		}
		else if(mode.equals("아이디")) {
			url += "?username="+search;
		}
		
		MultiValueMap<String, Object> vars = new LinkedMultiValueMap<String, Object>();

		HttpHeaders headers = new HttpHeaders();
		headers.set("Authorization","token "+token);
		headers.setContentType(MediaType.APPLICATION_JSON);
		
		result = restMgr.exchangeWithHeader(url, vars, headers, HttpMethod.GET);
		
		System.out.println(result);
		
		JSONObject obj = new JSONObject();
		try {
			
			if(result.get("status").toString().equals("success")) {
				obj.put("status", result.get("status").toString());
				obj.put("msg", "get UserInfo success");
				
				JSONObject jsonObj = new JSONObject(result.get("result").toString());
				JSONArray userList = new JSONArray(jsonObj.get("user_list").toString());
				
				for(int i=0;i<userList.length();i++) {
					JSONObject temp = (JSONObject)userList.get(i);
					temp.put("profile_img", RestInfo.restURL+temp.get("profile_img").toString());
				}
				obj.put("userList", userList);
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
	
	
	
	/*
	@RequestMapping(value = "/setSSMUserPwd.do", method = RequestMethod.GET)
	public void setSSMUserPwd(HttpServletRequest request, HttpServletResponse response) throws IOException{

		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		logMgr.printLog(request);
		
		UserDAO userDao = new UserDAO();
		List<User> userList = userDao.selectSSMUser();
		
		for(User user : userList) {
			Map<String, Object> result = null;
			
			String url = RestInfo.restURL+"/password";
			
			MultiValueMap<String, Object> vars = new LinkedMultiValueMap<String, Object>();
			vars.add("username", user.getUsername());
			vars.add("password", user.getPassword());
			
			result = restMgr.post(url, vars);
			System.out.println(user.getUsername()+ " "+user.getReal_name()+ " "+user.getPassword());
		}
	}
	*/
}