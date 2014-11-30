package com.ssm.gardenplatform.session;


import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebFilter(filterName="LoginCheck",urlPatterns={"/*"})
public class SessionFilter implements Filter {

	public SessionFilter() {
		System.out.println("Create Session Filter");
	}

	public void destroy() {
		System.out.println("Destroy Session Filter");
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		
		HttpServletRequest httpRequest = (HttpServletRequest) request;
		HttpServletResponse httpResponse = (HttpServletResponse) response;
		HttpSession session = httpRequest.getSession(false);
		
		boolean login = false;
		if(session != null){
			if(session.getAttribute("token") != null){
				login = true;
			}
		}
		String uri = httpRequest.getRequestURI().toString().trim();
		if((uri.equals("/GardenPlatformWeb/") || uri.startsWith("/GardenPlatformWeb/main.do")) && login){
			httpResponse.sendRedirect("/GardenPlatformWeb/home.do");
		}
		
		if(excludeUrl(httpRequest)) {
			chain.doFilter(request, response);
			return;
		}
		
		if(login){
			chain.doFilter(request, response);
			return;
		}
		else{
			//System.out.println("Session Expired");
			httpResponse.sendRedirect("/GardenPlatformWeb/main.do");
			return;
		}
	}

	public void init(FilterConfig fConfig) throws ServletException {
		System.out.println("Init Session Filter");
	}

	private boolean excludeUrl(HttpServletRequest request) {
		String uri = request.getRequestURI().toString().trim();
		
		if(uri.startsWith("/GardenPlatformWeb/main.do")){
			return true;
		}
		else if(uri.startsWith("/GardenPlatformWeb/signin.do")){
			return true;
		}
		else if(uri.startsWith("/GardenPlatformWeb/checkID.do")){
			return true;
		}
		else if(uri.startsWith("/GardenPlatformWeb/signup.do")){
			return true;
		}
		else if(uri.startsWith("/GardenPlatformWeb/error.do")){
			return true;
		}
		else if(uri.startsWith("/GardenPlatformWeb/resource/")){
			return true;
		}
		else{
			return false;
		}
	}

}
