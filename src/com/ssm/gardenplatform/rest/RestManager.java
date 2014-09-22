package com.ssm.gardenplatform.rest;

import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import com.google.gson.GsonBuilder;
import com.google.gson.JsonParser;

public class RestManager {
	
	private RestTemplate restTemplate;
	
	public RestManager() {
		restTemplate = new RestTemplate();
	}
	
	public String post(String url, MultiValueMap<String, Object> vars) {
		
		String result = null;
		
		try{
			result = restTemplate.postForObject(url, vars, String.class);
			System.out.println(new GsonBuilder().setPrettyPrinting().create().toJson(new JsonParser().parse(result)));
		}catch(Exception e){
			System.out.println(e);
		}
		
		return result;
	}
}
