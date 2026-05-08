package com.green.menus.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.green.menus.dto.MenuDTO;
import com.green.menus.mapper.MenuMapper;

@Controller
public class MenuController {
	// @Autowired : String Container 에 미리 new 된 Component 를 찾아서 
	// menuMapper 변수에 저장해라
	// @Autowired() : 객체 타입으로 찾아서 연결
	// @Qulified() : 객체 이름으로 찾아서 연결
	@Autowired
	private  MenuMapper  menuMapper;
	
	// 메뉴 목록 조회  http://localhost:9090/Menus/List
	@RequestMapping("/Menus/List")   
	public   String   list(Model model) {
		// 조회한결과를 ArrayList 로 돌려준디
		List<MenuDTO> menuList = menuMapper.getMenuList(); // ArrayList 결과를 받는다
		System.out.println(menuList);
		
		model.addAttribute("msg", "하하");
		model.addAttribute("menuList", menuList);
		
		return "menus/list"; //WEB-INF/views/ menus/list .jsp
	}
	// 새 메뉴 추가 /Menus/WriteForm
	@RequestMapping("/Menus/WriteForm")
	public String writeForm() {
		return "menus/write"; // write.jsp 로 이동
	}
	// Menus/Write
	// http://localhost:8080/Menus/Write?menu_id=MENU07&menu_name=GIT&menu_seq=7
	//String menu_id, String menu_name, int menu_seq
	@RequestMapping("/Menus/Write")
	public String write(MenuDTO dto, Model model) {
		// 넘어온 값
		String menu_id = dto.getMenu_id();
		String menu_name = dto.getMenu_name();
		int menu_seq = dto.getMenu_seq();
		
		System.out.println("menu_id=" + menu_id);
		System.out.println("menu_name=" + menu_name);
		System.out.println("menu_seq=" + menu_seq);
		
		// DB 에 저장
		// menuMapper.getMenuList 에 추가할 값들을 넣어 줌
		menuMapper.insertMenu(dto);
		
		// 다시 조회 -> menuList
		List<MenuDTO> menuList = menuMapper.getMenuList();
		model.addAttribute("menuList", menuList);
		
		return "redirect:/Menus/List";
	}
	// 메뉴 삭제 /Menus/DeleteForm
	@RequestMapping("/Menus/DeleteForm") 
	public String deleteForm() {
		return "menus/delete"; //delete.jsp 로 이동
	}
	//@RequestParam("menu_id") String menu_id
	@RequestMapping("/Menus/Delete")
	public String delete(String menu_id, Model model) {
		System.out.println("menu_id=" + menu_id);	
		//model.addAttribute("menu_id" + menu_id);
		 
		//dto 에 menu_id 만 받아서 저장
		MenuDTO dto = new MenuDTO(menu_id, null, 0);
		
		menuMapper.deleteMenu(dto); // mybatis mapper 에는 DTO 전달
				
		return "redirect:/Menus/List";
	}
	// 메뉴 수정 - getMenu : 목록에서 수정 버튼을 누른 후 실행
	@RequestMapping("/Menus/UpdateForm")
	public String updateForm(MenuDTO dto, Model model) {
		System.out.println("넘어온 DTO : " + dto);
		// 수정할 자료 db 에서 검색 : 수정할 정보가 담긴 조회된 menu
		MenuDTO menu = menuMapper.getMenu(dto);
		model.addAttribute("menu", menu);
		System.out.println("조회한 menuDTO : " + menu);
		
		return "menus/update"; // update.jsp 로 이동
	}
	@RequestMapping("/Menus/Update")
	public String update(MenuDTO dto) {
		
		//넘어온 정보로 수정 db 를 수정한다
		// sqlsession 코드
		menuMapper.updateMenu(dto);
		
		return "redirect:/Menus/List";
	}
	// /Menus/WriteForm2 - 메뉴 이름으로만 추가하기
	@RequestMapping("/Menus/WriteForm2")
	public String writeForm2() {
		return "menus/write2";
	}
	@RequestMapping("/Menus/Write2")
	public String write2(MenuDTO dto) {
		
		menuMapper.insertMenu2(dto);
		
		return "redirect:/Menus/List";
	}
}














