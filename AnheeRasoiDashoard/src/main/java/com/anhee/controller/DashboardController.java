package com.anhee.controller;

import java.util.Base64;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.anhee.dto.Menu;
import com.anhee.dto.TopMenuDto;
import com.anhee.feign.IfeingConnector;

@Controller
public class DashboardController {

	
	
	@Autowired private IfeingConnector feing;
	
	
	
    @GetMapping("/")
    public String root(Model model) {
    	
    	
//    	ResponseEntity<List<Menu>> allMenu = feing.getAllMenu();
//    	 List<Menu> menuList = allMenu.getBody();
//    	
//    	List<TopMenuDto> menuDtoList= menuList.stream().map(
//    			menu -> new TopMenuDto(
//    					menu.getId(),
//    					menu.getItemName(),
//    					Base64.getEncoder().encodeToString(menu.getImage())
//    					)
//    			
//    			).toList();
//    	
//    	 model.addAttribute("menu", menuDtoList);
    	
        return "dashboard";
    }

    
}
