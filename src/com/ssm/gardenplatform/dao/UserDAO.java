package com.ssm.gardenplatform.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.ssm.gardenplatform.dbconfig.SqlSessionManager;
import com.ssm.gardenplatform.mapper.UserMapper;
import com.ssm.gardenplatform.model.Board;
import com.ssm.gardenplatform.model.User;



public class UserDAO {
	public static SqlSessionFactory sqlSessionFactory = SqlSessionManager.getInstance();
	
	
	public User selectUser(String userID){
		SqlSession session = sqlSessionFactory.openSession();
		User user=null;
		try{
			UserMapper mapper = session.getMapper(UserMapper.class);
			user = mapper.selectUser(userID);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			session.close();
		}
		return user;
	}
	
	public List<User> selectAllUser(){
		SqlSession session = sqlSessionFactory.openSession();
		List<User> list=null;
		try{
			UserMapper mapper = session.getMapper(UserMapper.class);
			list = mapper.selectAllUser();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			session.close();
		}

		return list;
	}
	
	public List<User> selectSSMUser(){
		SqlSession session = sqlSessionFactory.openSession();
		List<User> list=null;
		try{
			UserMapper mapper = session.getMapper(UserMapper.class);
			list = mapper.selectSSMUser();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			session.close();
		}

		return list;
	}

}
