package com.green.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.green.board.dto.BoardDto;
import com.green.board.dto.BoardDto2;
import com.green.board.mapper.BoardMapper;
import com.green.menus.dto.MenuDTO;
import com.green.menus.mapper.MenuMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j 
@Controller
@RequestMapping("/Board")
public class BoardController {
	@Autowired
	private MenuMapper menuMapper;
	@Autowired
	private BoardMapper boardMapper;
	// menuList 전역변수
	
	// /Board/List?menu_id=MENU01
	@RequestMapping("/List")
	public ModelAndView list(MenuDTO mto) {
		// 메뉴 전체 목록 조회 - menus.jsp
		List<MenuDTO> mList = menuMapper.getMenuList();
		log.info("menuList:" + mList);
		
		// 게시물 목록 조회 - list.jsp(menu_id=MENU01)
		//List<BoardDto> boardList = boardMapper.getBoardList2("MENU01");
		List<BoardDto2> bList = boardMapper.getBoardList(mto);
		log.info("boardList:" + bList);
		
		//넘어온 menu_id (=넘겨줄 menu_id)
		String menu_id = mto.getMenu_id();
		MenuDTO menu = menuMapper.getMenu(mto);
		String menu_name = mto.getMenu_name();
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("board/list");
		mv.addObject("mList", mList);
		mv.addObject("bList", bList);
		mv.addObject("menu_id", menu_id); // 현재 메뉴정보
		mv.addObject("menu", menu); // 현재 메뉴 전체 정보()
		mv.addObject("menu_name", menu_name);
		return mv;
	}
	//http://localhost:8080/Board/View?idx=1&menu_id=MENU01
	@RequestMapping("/View")
	public ModelAndView view(BoardDto bto) {
		
		//전체 메뉴 목록 조회
		List<MenuDTO> mList = menuMapper.getMenuList();
		
		//idx 글의 조회수를 1 증가
		boardMapper.incHit(bto);
		
		//idx 로 조회한 게시글
		BoardDto board = boardMapper.getBoard(bto);
		
		//[BoardDto [idx=2, menu_id=MENU02, title=JSP Hello, content=null, writer=JSP, regdate=2026-05-06, hit=0]
		log.debug("board:" + board);
		// content 안에 있는 엔더 \n 를 <br> 변경 -> content
		if(board != null && board.getContent() != null)
			board.setContent(board.getContent().replace("\n", "<br>"));
		
		String menu_id = bto.getMenu_id();
		String menu_name = menuMapper.getMenuName(menu_id);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("board/view");
		mv.addObject("board", board);
		mv.addObject("mList", mList);
		mv.addObject("menu_id", menu_id);
		mv.addObject("menu_name", menu_name);
		return mv;
	}
	//http://localhost:8080/Board/WriteForm
	@RequestMapping("/WriteForm")
	public ModelAndView writeform(BoardDto bto) {
		
		// 메뉴목록
		List<MenuDTO> mList = menuMapper.getMenuList();
		
		System.out.println("/Board/WriteForm boardDto: " + bto);

		String menu_id = bto.getMenu_id();		
		String menu_name = menuMapper.getMenuName(menu_id);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("board/write");
		mv.addObject("menu_id", menu_id);
		mv.addObject("menu_name", menu_name);
		mv.addObject("mList", mList);
		return mv;
	}
	// /Board/Write?menu_id=?title=?content=?writer=
	@RequestMapping("/Write")
	public ModelAndView write(BoardDto bto) {
		
		// DB 저장 - return 값 필요 없음
		boardMapper.insertBoard(bto);
		//BoardDto(idx=0, menu_id=MENU03, title=aaa, content=aaa, writer=aaa, regdate=null, hit=0)
		System.out.println("Write Dto: " + bto );
		String menu_id = bto.getMenu_id();
		// 페이지 이동		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/Board/List?menu_id=" + menu_id);
		return mv;
	}
	// 게시물 수정
	//http://localhost:8080/Board/UpdateForm?idx=5&menu_id=MENU01
	@RequestMapping("/UpdateForm")
	public ModelAndView updateform(BoardDto bto) {
		
		List<MenuDTO> mList = menuMapper.getMenuList();
		System.out.println("/Board/UpdateForm Dto: " + bto);
		
		BoardDto board = boardMapper.getBoard(bto);
		
		String menu_id = bto.getMenu_id();
		String menu_name = menuMapper.getMenuName(menu_id);
		int idx = bto.getIdx();
				
		ModelAndView mv = new ModelAndView();
		mv.setViewName("board/update");
		mv.addObject("idx", idx);
		mv.addObject("menu_id", menu_id);
		mv.addObject("menu_name", menu_name);
		mv.addObject("board", board);
		mv.addObject("mList", mList);
		return mv;
	}
	@RequestMapping("/Update")
	public ModelAndView update(BoardDto bto) {
		// DB 저장
		boardMapper.updateBoard(bto);
		
		// 수정할 정보 조회
		// Board/UpdateForm Dto: 
		// BoardDto(idx=5, menu_id=MENU01, title=null, content=null, writer=null, regdate=null, hit=0)
		System.out.println("Update Dto: " + bto);		
		int idx = bto.getIdx();	
		
		// 페이지 이동
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/Board/View?idx=" + idx);
		return mv;
	}
	// 게시물 삭제
	@RequestMapping("/Delete")
	public ModelAndView delete(BoardDto bto) {
		// DB 저장
		boardMapper.deleteBoard(bto);
		// 삭제할 정보 조회
		// Board/Delete dto:
		System.out.println("Delete Dto: " + bto);
		// 넘어온 menu_id
		String menu_id = bto.getMenu_id();
		// 페이지 이동
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/Board/List?menu_id=" + menu_id);
		return mv;
	}
	
}




















