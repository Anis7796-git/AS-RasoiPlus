package com.anhee.mvcTestcontroller;


import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/chef")
public class ChefController {

    @GetMapping("/chefdashboard")
    public String chefDashboard() {
        return "Welcome Chef!";
    }
}