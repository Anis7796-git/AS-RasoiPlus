package com.anhee.mvcTestcontroller;


import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/kitchen")
public class KitchenController {

    @GetMapping("/kitchendashboard")
    public String kitchenDashboard() {
        return "Welcome Kitchen Staff!";
    }
}