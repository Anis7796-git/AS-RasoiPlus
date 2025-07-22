package com.anhee.mvcTestcontroller;

import org.springframework.security.web.csrf.CsrfToken;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import jakarta.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/customer")
public class CustomerController {

    @PostMapping("/editprofile")
    public String editProfile(@RequestParam Long customerId,
                            @RequestParam String email
                            ) {
        
    	System.err.println("CustomerController.editProfile()");
        return "redirect:/dashboard";
    }
    
    
    @GetMapping("/bookChef")
    public String bookchef() {
    	System.err.println("CustomerController.bookchef()");
    	return "redirect:/dashboard";
    }
    
    
    
    @GetMapping("/orderHistory")
    public String orderHistory(){
    	System.err.println("order history");
    	return "redirect:/dashboard";
    }
    
    @GetMapping("/csrf-token")
    @ResponseBody
    public String getCsrfToken(HttpServletRequest request) {
        CsrfToken token = (CsrfToken) request.getAttribute("_csrf");
        return "Token: " + token.getToken() + "\nHeader: " + token.getHeaderName() + 
               "\nParameter: " + token.getParameterName();
    }
    
    
    
    
    
}