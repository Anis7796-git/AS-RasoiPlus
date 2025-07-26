package com.anhee;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.anhee.dto.ChefBookDto;
import com.anhee.feign.ICustomerFeignClient;



@Controller
public class CustomerBookingChefController {

	@Autowired private ICustomerFeignClient feign;
	
	
	@GetMapping("/")
	public String getMethodName() {
		
		
		return "customerChefBooking";
	}
	
	

	
	
	@PostMapping("/bookchef")
	@ResponseBody
	public ResponseEntity<String> bookChef(@RequestBody ChefBookDto dto) {
		System.out.println(dto.toString());
		
		ResponseEntity<String> chefBooking = feign.chefBooking(dto);
			String msg = chefBooking.getBody();
		
		 return  new ResponseEntity<>(msg,HttpStatus.OK);
	}
	
	
	
//	@PostMapping("/customerdhashboard")
//	@ResponseBody
//	public ResponseEntity<String> customerdhashboard() {
//		
//		ResponseEntity<String> chefBooking = feign.chefBooking();
//			String msg = chefBooking.getBody();
//		
//		 return  new ResponseEntity<>(msg,HttpStatus.OK);
//	}
	
	
	
	
}
