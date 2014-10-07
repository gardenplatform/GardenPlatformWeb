package com.ssm.gardenplatform.mapper;

import java.util.List;

import com.ssm.gardenplatform.model.Board;


public interface BoardMapper {
	void insertBoard(Board board);
	Board selectBoard(int bid);
	List<Board> selectAllBoard();
}