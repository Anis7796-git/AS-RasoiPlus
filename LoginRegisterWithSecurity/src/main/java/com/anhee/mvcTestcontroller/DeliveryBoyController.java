package com.anhee.mvcTestcontroller;


import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/deliveryboy")
public class DeliveryBoyController {

    @GetMapping("/deliveryboydashboard")
    public String deliveryBoyDashboard() {
        return "Welcome Delivery Boy!";
    }
}