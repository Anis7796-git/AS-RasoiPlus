package com.anhee.mvcTestcontroller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.web.bind.annotation.RequestMapping;

import com.anhee.entity.ChefEntity;
import com.anhee.entity.CustomerEntity;
import com.anhee.entity.DilveryBoyEntity;
import com.anhee.entity.kitchenEntity;
import com.anhee.service.IserviceMgmt;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/api")
public class DashboardController {
	
	@Autowired IserviceMgmt service;

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
    	
    	CustomerEntity customer=service.findcustomerBYEmail(auth.getName());
        
    	customer.setPassword("Protected");
    	
    	session.setAttribute("customer", customer);
    	
    	System.out.println("DashboardController.customerDashboard()+==========");
    	
        return "customerDashboard";
    }

    @GetMapping("/kitchen/dashboard")
    public String kitchenDashboard(HttpSession session) {
    	Authentication auth = SecurityContextHolder.getContext().getAuthentication();
    kitchenEntity	kitchen=service.findkitchenBYEmail(auth.getName());
        
    	kitchen.setPassword("Protected");
    	
    	session.setAttribute("kitchen", kitchen);
        return "kitchenDashboard";
    }

    @GetMapping("/deliveryboy/dashboard")
    public String deliveryBoyDashboard(HttpSession session) {
    	Authentication auth = SecurityContextHolder.getContext().getAuthentication();
    	DilveryBoyEntity deliveryboy=service.finddeliveryboyBYEmail(auth.getName());
       deliveryboy.setPassword("Protected");
       
       
       session.setAttribute("deliveryboy", deliveryboy);
        return "deliveryboyDashboard";
    }
}