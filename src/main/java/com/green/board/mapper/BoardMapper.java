package com.green.board.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;

import com.green.board.dto.BoardDto;
import com.green.board.dto.BoardDto2;
import com.green.menus.dto.MenuDTO;

@Mapper
public interface BoardMapper {

	List<BoardDto2> getBoardList(MenuDTO mto);

	BoardDto getBoard(BoardDto bto);

	void incHit(BoardDto bto);

	void insertBoard(BoardDto bto);

	void updateBoard(BoardDto bto);

	void deleteBoard(BoardDto bto);	
	
}
