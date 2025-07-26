package com.anhee.feign;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.anhee.dto.ChefBookDto;
;

@FeignClient(name = "ChefOrderServiceRestAPI")
public interface ICustomerFeignClient {
	
	@PostMapping("/activeOrderSave")
	public ResponseEntity<String> chefBooking(@RequestBody ChefBookDto dto);
	

	

}
