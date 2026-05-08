package com.green.menus.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.green.menus.dto.MenuDTO;

@Mapper
public interface MenuMapper {

	List<MenuDTO> getMenuList();

	void insertMenu(MenuDTO dto);

	void deleteMenu(MenuDTO dto);

	MenuDTO getMenu(MenuDTO mto);

	void updateMenu(MenuDTO dto);

	void insertMenu2(MenuDTO dto);

	String getMenuName(String menu_id);	
}




