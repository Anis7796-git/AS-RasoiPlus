package com.anhee.mvcTestcontroller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;



@Controller
@RequestMapping("/front")
public class FrontController {
    
    @GetMapping("/login")
    public String showLoginPage(
        @RequestParam(value = "error", required = false) String error,
        @RequestParam(value = "logout", required = false) String logout,
        Model model) {
        
        if (error != null) {
            model.addAttribute("error", "Invalid credentials");
        }
        if (logout != null) {
            model.addAttribute("message", "Logged out successfully");
        }
        System.out.println("======================================");
        System.err.println("FrontController.showLoginPage()");
        System.out.println("======================================");
        
        return "loginRegister";
    }
    
    @GetMapping("/success")
    public String success(
        @RequestParam String msg,
        Model model) {
        
    	 model.addAttribute("successMessage", msg);
        
        return "loginRegister";
    }
    
    
    
}