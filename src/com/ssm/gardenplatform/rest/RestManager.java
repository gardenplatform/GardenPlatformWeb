package com.ssm.gardenplatform.rest;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Map;

import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.entity.ContentType;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.DefaultHttpClient;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.client.HttpServerErrorException;
import org.springframework.web.client.RestTemplate;

import com.google.gson.GsonBuilder;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

public class RestManager{

	private RestTemplate restTemplate;
	private HttpDeleteWithBody httpDelete;

	public RestManager() {
		restTemplate = new RestTemplate();
		httpDelete = new HttpDeleteWithBody();
	}

	public Map<String, Object> get(String url) {

		Map<String, Object> result = new HashMap<>();
		String resultString = null; 

		try{
			resultString = restTemplate.getForObject(url, String.class);
			System.out.println(new GsonBuilder().setPrettyPrinting().create().toJson(new JsonParser().parse(resultString)));

			result.put("status", "success");
			result.put("result", resultString);

		}catch(HttpClientErrorException  e1) {

			System.out.println(e1+"");
			System.out.println(e1.getResponseBodyAsString());

			if(e1.getMessage().equals("409 CONFLICT"))
				result.put("status", "conflict");
			else
				result.put("status", "error");

			JSONObject jsonObj;
			try {
				jsonObj = new JSONObject(e1.getResponseBodyAsString());
				result.put("msg", jsonObj.get("error").toString());
			} catch (JSONException e) {
				e.printStackTrace();
			}

		}catch(Exception e2){
			System.out.println(e2+"");
			result.put("status", "error");
			result.put("msg", e2.getMessage()+"");
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

		}catch(HttpClientErrorException  e1) {

			System.out.println(e1+"");
			System.out.println(e1.getResponseBodyAsString());

			if(e1.getMessage().equals("409 CONFLICT"))
				result.put("status", "conflict");
			else
				result.put("status", "error");

			JSONObject jsonObj;
			try {
				jsonObj = new JSONObject(e1.getResponseBodyAsString());
				result.put("msg", jsonObj.get("error").toString());
			} catch (JSONException e) {
				e.printStackTrace();
			}

		}catch(Exception e2){
			System.out.println(e2+"");
			result.put("status", "error");
			result.put("msg", e2.getMessage()+"");
		}

		return result;
	}

	public Map<String, Object> exchangeWithHeader(String url, MultiValueMap<String, Object> vars, HttpHeaders headers, HttpMethod method) {

		Map<String, Object> result = new HashMap<>();
		String resultString = null; 
		HttpEntity<?> entity = new HttpEntity<Object>(vars, headers);
		try{
			ResponseEntity<byte[]> responseEntity = restTemplate.exchange(url, method, entity, byte[].class);

			result.put("status", "success");
			result.put("result", "");

			if(responseEntity.getBody()!=null){
				resultString = new String(responseEntity.getBody(), "UTF-8");
				result.put("result", resultString);
				System.out.println(new GsonBuilder().setPrettyPrinting().create().toJson(new JsonParser().parse(resultString)));
			}

		}catch(HttpClientErrorException  e1) {

			System.out.println(e1+"");
			System.out.println(e1.getResponseBodyAsString());

			if(e1.getMessage().equals("409 CONFLICT"))
				result.put("status", "conflict");
			else
				result.put("status", "error");

			JSONObject jsonObj;
			try {
				jsonObj = new JSONObject(e1.getResponseBodyAsString());
				result.put("msg", jsonObj.get("error").toString());
			} catch (JSONException e) {
				e.printStackTrace();
			}

		}catch(HttpServerErrorException e2){
			System.out.println(e2.getMessage()+"");
			System.out.println(e2.getResponseBodyAsString());
			result.put("status", "error");
			result.put("msg", e2.getResponseBodyAsString());
		}
		catch(Exception e3){
			System.out.println(e3+"");
			result.put("status", "error");
			result.put("msg", e3.getMessage()+"");
		}

		return result;
	}


	public void exchangeDeleteWithJsonValue(String url, JSONObject jsonObj) {

		try {
			StringEntity entity = new StringEntity(jsonObj.toString(), ContentType.APPLICATION_JSON);
			HttpClient httpClient = new DefaultHttpClient();
			HttpDeleteWithBody httpDeleteWithBody = new HttpDeleteWithBody(url);
			httpDeleteWithBody.setEntity(entity);
			httpClient.execute(httpDeleteWithBody);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (ClientProtocolException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
