package com.ssm.gardenplatform.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.ssm.gardenplatform.log.LogManager;
import com.ssm.gardenplatform.model.User;

@Controller
public class ErrorController {
	
	LogManager logMgr = new LogManager();

	@RequestMapping(value = "/error.do", method = RequestMethod.GET)
	public ModelAndView getError(HttpServletRequest request, HttpServletResponse response) throws IOException{
		
		logMgr.printLog(request);

		String statusStr = request.getParameter("status");
		
		int status = Integer.parseInt(statusStr);
		String type=null;
		String title=null;
		String content=null;
		
		if(status >= 400 && status < 500)
			type = "Client Error";
		else if(status >= 500 && status < 600)
			type = "Server Error";
		
		switch(status) {
		case 400 :
			title = "Bad Request";
			content = "The request cannot be fulfilled due to bad syntax.";
			break;
		case 401 : 
			title = "Unauthorized";
			content = "The request was a legal request, but the server is refusing to respond to it. "
					+ "For use when authentication is possible but has failed or not yet been provided";
			break;
		case 402 :
			title = "Payment Required";
			content = "Reserved for future use";
			break;
		case 403 :
			title = "Forbidden";
			content = "The request was a legal request, but the server is refusing to respond to it";		
			break;
		case 404 :
			title = "Not Found";
			content = "The requested page could not be found but may be available again in the future";
			break;
		case 405 :
			title = "Method Not Allowed";
			content = "A request was made of a page using a request method not supported by that page";
			break;
		case 406 :
			title = "Not Acceptable";
			content = "The server can only generate a response that is not accepted by the client";
			break;
		case 407 :
			title = "Proxy Authentication Required";
			content = "The client must first authenticate itself with the proxy";
			break;
		case 408 :
			title = "Request Timeout";
			content = "The server timed out waiting for the request";
			break;
		case 409 :
			title = "Conflict";
			content = "The request could not be completed because of a conflict in the request";
			break;
		case 410 :
			title = "Gone";
			content = "The requested page is no longer available";
			break;
		case 411 :
			title = "Length Required";
			content = "The Content-Length is not defined. The server will not accept the request without it";
			break;
		case 412 :
			title = "Precondition Failed";
			content = "The precondition given in the request evaluated to false by the server";
			break;
		case 413 :
			title = "Request Entity Too Large";
			content = "The server will not accept the request, because the request entity is too large";
			break;
		case 414 :
			title = "Request-URI Too Long";
			content = "The server will not accept the request, because the URL is too long. "
					+ "Occurs when you convert a POST request to a GET request with a long query information";
			break;
		case 415 :
			title = "Unsupported Media Type";
			content = "The server will not accept the request, because the media type is not supported";
			break;
		case 416 :
			title = "Requested Range Not Satisfiable";
			content = "The client has asked for a portion of the file, but the server cannot supply that portion";
			break;
		case 417 :
			title = "Expectation Failed";
			content = "The server cannot meet the requirements of the Expect request-header field";
			break;
		case 500 :
			title = "Internal Server Error";
			content = "A generic error message, given when no more specific message is suitable";
			break;
		case 501 :
			title = "Not Implemented";
			content = "The server either does not recognize the request method, or it lacks the ability to fulfill the request";
			break;
		case 502 :
			title = "Bad Gateway";
			content = "The server was acting as a gateway or proxy and received an invalid response from the upstream server";
			break;
		case 503 :
			title = "Service Unavailable";
			content = "The server is currently unavailable (overloaded or down)";
			break;
		case 504 :
			title = "Gateway Timeout";
			content = "The server was acting as a gateway or proxy and did not receive a timely response from the upstream server";
			break;
		case 505 :
			title = "HTTP Version Not Supported";
			content = "The server does not support the HTTP protocol version used in the request";
			break;
		case 511 :
			title = "Network Authentication Required";
			content = "The client needs to authenticate to gain network access";
			break;
		default :
			break;
		}
		
		ModelAndView mav = new ModelAndView("error");
		mav.addObject("status", status);
		mav.addObject("type", type);
		mav.addObject("title", title);
		mav.addObject("content", content);
		
		return mav;
	}
}