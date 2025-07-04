package com.anhee.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.anhee.dto.MenuDto;
import com.anhee.dto.UpdateMenuDto;
import com.anhee.entity.Menu;

public interface IServiceMgmt {

	String addMenu(MenuDto menu, MultipartFile image);

	String UpdateMenu(UpdateMenuDto updatemenu);

	
	List<Menu> getAllMenu();

	Menu getItemById(Long id);

	
	String deleteItem(Long id);

}
