package com.anhee.mvcTestcontroller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.anhee.feign.IFeignClientMenu;


@Controller
public class MenuController {

	@Autowired private IFeignClientMenu menu;
	
    @PostMapping("/addMenu")
    public String addMenuItem(
            @RequestParam String category,
            @RequestParam String itemName,
            @RequestParam String description,
            @RequestParam double price,
            @RequestParam MultipartFile itemImage,
            @RequestParam Long kithcenId,
            Model model) {
        
    	
    	
    	
    	
    	try {
    		ResponseEntity<String> saveitem = menu.saveitem(category, itemName, description, price, kithcenId, itemImage);
			
    		
    		 if (saveitem.getStatusCode().is2xxSuccessful()) {
    	            model.addAttribute("menuSaveSuccess", "Menu item added successfully");
    	        } else {
    	      
    	        	
    	        	model.addAttribute("menuSaveError", "Failed to add menu item");
    	        }
    	}
    	
    	
    	catch (Exception e) {
			model.addAttribute("MenuSaveEXception", "Error calling menu service: " + e.getMessage());
			   
		}
        return "redirect:/api/kitchen/dashboard";
 
    }
}