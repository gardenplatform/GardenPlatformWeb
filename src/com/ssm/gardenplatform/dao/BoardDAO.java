package com.ssm.gardenplatform.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.ssm.gardenplatform.dbconfig.SqlSessionManager;
import com.ssm.gardenplatform.mapper.BoardMapper;
import com.ssm.gardenplatform.model.Board;



public class BoardDAO {
	public static SqlSessionFactory sqlSessionFactory = SqlSessionManager.getInstance();
	
	public void insertBoard(Board board){
		SqlSession session = sqlSessionFactory.openSession();
		
		try{
			BoardMapper mapper = session.getMapper(BoardMapper.class);
			mapper.insertBoard(board);
			session.commit();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			session.close();
		}
	}
	
	public List<Board> selectAllBoard(){
		SqlSession session = sqlSessionFactory.openSession();
		List<Board> list=null;
		try{
			BoardMapper mapper = session.getMapper(BoardMapper.class);
			list = mapper.selectAllBoard();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			session.close();
		}

		return list;
	}
	
	public Board selectOneBoard(int b_id){
		SqlSession session = sqlSessionFactory.openSession();
		Board Board=null;
		try{
			BoardMapper mapper = session.getMapper(BoardMapper.class);
			Board = mapper.selectBoard(b_id);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			session.close();
		}
		return Board;
	}
}
