package com.ssm.gardenplatform.log;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

public class LogManager {
	public void printLog(HttpServletRequest request) {
		
		Date dt = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd, hh:mm:ss a"); 
		System.out.println("\n" + sdf.format(dt).toString()); 
		
		String clientIp = request.getHeader("HTTP_X_FORWARDED_FOR");
		if(null == clientIp || clientIp.length() == 0 || clientIp.toLowerCase().equals("unknown"))
			clientIp = request.getHeader("REMOTE_ADDR");
		 
		if(null == clientIp || clientIp.length() == 0  || clientIp.toLowerCase().equals("unknown"))
			clientIp = request.getRemoteAddr();
		
		System.out.println(clientIp + " : " +request.getMethod() + ", " + request.getServletPath());
		
		
	}
}
