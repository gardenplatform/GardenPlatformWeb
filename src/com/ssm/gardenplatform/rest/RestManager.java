package com.ssm.gardenplatform.rest;

import java.util.HashMap;
import java.util.Map;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

import com.google.gson.GsonBuilder;
import com.google.gson.JsonParser;

public class RestManager {
	
	private RestTemplate restTemplate;
	
	public RestManager() {
		restTemplate = new RestTemplate();
	}
	
	public Map<String, Object> get(String url) {
		
		Map<String, Object> result = new HashMap<>();
		String resultString = null; 
		
		try{
			resultString = restTemplate.getForObject(url, String.class);
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
	
	public Map<String, Object> getWithHeader(String url, MultiValueMap<String, Object> vars, HttpHeaders headers) {
		
		Map<String, Object> result = new HashMap<>();
		String resultString = null; 
		HttpEntity<?> entity = new HttpEntity<Object>(vars, headers);
		try{
			ResponseEntity<byte[]> responseEntity = restTemplate.exchange(url, HttpMethod.GET, entity, byte[].class);
			resultString = new String(responseEntity.getBody(), "UTF-8");
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
	
	public Map<String, Object> putWithHeader(String url, MultiValueMap<String, Object> vars, HttpHeaders headers) {
		
		Map<String, Object> result = new HashMap<>();
		String resultString = null; 
		HttpEntity<?> entity = new HttpEntity<Object>(vars, headers);
		try{
			ResponseEntity<byte[]> responseEntity = restTemplate.exchange(url, HttpMethod.PUT, entity, byte[].class);
			resultString = new String(responseEntity.getBody(), "UTF-8");
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
	
	public Map<String, Object> postWithHeader(String url, MultiValueMap<String, Object> vars, HttpHeaders headers) {
		
		Map<String, Object> result = new HashMap<>();
		String resultString = null; 
		HttpEntity<?> entity = new HttpEntity<Object>(vars, headers);
		try{
			ResponseEntity<byte[]> responseEntity = restTemplate.exchange(url, HttpMethod.POST, entity, byte[].class);
			resultString = new String(responseEntity.getBody(), "UTF-8");
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
