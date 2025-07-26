package com.anhee.mvcTestcontroller;

import java.util.Base64;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.anhee.dto.KitchenAndMenuListDto;
import com.anhee.entity.ChefEntity;
import com.anhee.entity.CustomerEntity;
import com.anhee.entity.DilveryBoyEntity;
import com.anhee.entity.kitchenEntity;
import com.anhee.service.FetchData;
import com.anhee.service.IserviceMgmt;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/api")
public class DashboardController {
	
	@Autowired IserviceMgmt service;
	
	@Autowired FetchData fetchData;

    @GetMapping("/chef/dashboard")
    public String chefDashboard(HttpSession session) {
    	System.out.println("DashboardController.chefDashboard(=====================================)");
    	Authentication auth = SecurityContextHolder.getContext().getAuthentication();
      
    	 ChefEntity chef=service.findChefBYEmail(auth.getName());
    	 
    	
    	 chef.setPassword("Protected");
    	 System.out.println(chef.toString());
    	 session.setAttribute("chef", chef);
    	 
        return "chefDashboard";
    }

    @GetMapping("/customer/dashboard")
    public String customerDashboard(HttpSession session) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        CustomerEntity customer = service.findcustomerBYEmail(auth.getName());
        
        customer.setPassword("Protected");
        
        // Convert byte array to Base64
        if(customer.getProfileImage() != null && customer.getProfileImage().length > 0) {
            String base64Image = Base64.getEncoder().encodeToString(customer.getProfileImage());
            session.setAttribute("profileImageBase64", base64Image);
        }
        
        session.setAttribute("customer", customer);
        
        return "customerDashboard";
    }

    @GetMapping("/kitchen/dashboard")
    public String kitchenDashboard(HttpSession session,Model model) {
    	
    	
    	Authentication auth = SecurityContextHolder.getContext().getAuthentication();
    
    	
    	kitchenEntity	kitchen=service.findkitchenBYEmail(auth.getName());
    
    	
        
    	kitchen.setPassword("Protected");
    	
    	System.out.println("DashboardController.kitchenDashboard()========================================");
    	
    	if(kitchen.getKitchenImage()!=null&& kitchen.getKitchenImage().length>0) {
    	//don't trust any one because  every one are selfish 	
    		String base64Image= Base64.getEncoder().encodeToString(kitchen.getKitchenImage());
    		
    		session.setAttribute("profileImageBase64", base64Image);
    	}
    	
//    	KitchenAndMenuListDto kitchenAndMenuList=fetchData.getKitchns();
    	
    	session.setAttribute("kitchen", kitchen);
        return "kitchenDashboard";
    }

    @GetMapping("/deliveryboy/dashboard")
    public String deliveryBoyDashboard(HttpSession session) {
    	
    	Authentication auth = SecurityContextHolder.getContext().getAuthentication();
    	
    	DilveryBoyEntity deliveryboy=service.finddeliveryboyBYEmail(auth.getName());
    	
       deliveryboy.setPassword("Protected");
       
       if(deliveryboy.getImage()!=null&& deliveryboy.getImage().length>0) {
    	   
   		String base64Image= Base64.getEncoder().encodeToString(deliveryboy.getImage());
   		
   		session.setAttribute("profileImageBase64", base64Image);
   	}
       
       session.setAttribute("deliveryboy", deliveryboy);
       
        return "deliveryboyDashboard";
    }
    
    
    
    
    @PostMapping("/customer/editprofile")
    public String showEditProfileForm(@RequestParam(required = false) Long customerId, 
                                     @RequestParam(required = false) String email,
                                     HttpSession session,
                                     Model model) {
        
//        // If parameters are not provided, get from session
//        if (customerId == null || email == null) {
//            CustomerEntity customer = (CustomerEntity) session.getAttribute("customer");
//            customerId = customer.getCustomerId();
//            email = customer.getEmail();
//        }
//        
//        // Get customer data from service
//      //  CustomerEntity customer = service.findCustomerById(customerId);
//        model.addAttribute("customer", customer);
//        
    	
    	
    	System.out.println("DashboardController.showEditProfileForm()+==================called with cookie token ");
    	
        return "editProfileForm"; // Your edit profile form view name
    }
    
}