package com.ssm.gardenplatform.rest;

import java.util.HashMap;
import java.util.Map;

import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import com.google.gson.GsonBuilder;
import com.google.gson.JsonParser;

public class RestManager {
	
	private RestTemplate restTemplate;
	
	public RestManager() {
		restTemplate = new RestTemplate();
	}
	
	public Map<String, Object> post(String url, MultiValueMap<String, Object> vars) {
		
		Map<String, Object> result = new HashMap<>();
		String resultString = null; 
		
		try{
			resultString = restTemplate.postForObject(url, vars, String.class);
			System.out.println(new GsonBuilder().setPrettyPrinting().create().toJson(new JsonParser().parse(resultString)));

			result.put("status", "success");
			result.put("result", resultString);
		}catch(Exception e){
			System.out.println(e+"");
			result.put("status", "error");
			result.put("msg", e.getMessage()+"");
		}
		
		return result;
	}
}
