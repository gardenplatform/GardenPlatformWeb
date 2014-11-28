package com.ssm.gardenplatform.mapper;

import java.util.List;

import com.ssm.gardenplatform.model.Board;
import com.ssm.gardenplatform.model.User;


public interface UserMapper {
	User selectUser(String userID);
	List<User> selectAllUser();
	List<User> selectSSMUser();
}