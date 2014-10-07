package com.ssm.gardenplatform.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class Board implements Serializable{

	private String b_id;
	private String b_title;
	private String b_content;
	private String b_time;
	private String b_user;
	
	public Board(){}

	public String getB_id() {
		return b_id;
	}

	public void setB_id(String b_id) {
		this.b_id = b_id;
	}

	public String getB_title() {
		return b_title;
	}

	public void setB_title(String b_title) {
		this.b_title = b_title;
	}

	public String getB_content() {
		return b_content;
	}

	public void setB_content(String b_content) {
		this.b_content = b_content;
	}

	public String getB_time() {
		return b_time;
	}

	public void setB_time(String b_time) {
		this.b_time = b_time;
	}

	public String getB_user() {
		return b_user;
	}

	public void setB_user(String b_user) {
		this.b_user = b_user;
	}


}
