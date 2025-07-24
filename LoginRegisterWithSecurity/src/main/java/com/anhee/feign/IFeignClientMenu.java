package com.anhee.feign;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@FeignClient(name = "MenuListRestApi")
public interface IFeignClientMenu {
	
	@GetMapping("/getAllList")
	public ResponseEntity<?> getAllItems(@RequestParam(required = false) Long kitchenId);

}
