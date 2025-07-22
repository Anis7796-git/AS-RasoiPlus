package com.anhee.mvcTestcontroller;


import org.springframework.security.web.csrf.CsrfToken;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import jakarta.servlet.http.HttpServletRequest;

@RestController
@RequestMapping("/kitchen")
public class KitchenController {

	  @PostMapping("/editprofile")
	    public String editProfile(@RequestParam Long customerId,
	                            @RequestParam String email
	                            ) {
	        
	    	System.err.println("CustomerController.editProfile()");
	        return "redirect:/dashboard";
	    }
	    
	    
	 
	    
	    
	    
	    @GetMapping("/orders")
	    public String orderHistory(){
	    	System.err.println("order history");
	    	return "redirect:/dashboard";
	    }
	    
	   @GetMapping("/staff")
	   public String getStaffs() {
		   System.err.println("KitchenController.getStaffs()");
	   	return "redirect:/dashboard";
	   }
	   
	    @GetMapping("/menu")
	      public String getMenu(@RequestParam String param) {
	    	
	    	System.err.println("KitchenController.getMenu()");
	    	return "redirect:/dashboard";
	    }
	    
	    
	    
}