package com.anhee.feign;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@FeignClient(name = "MenuListRestApi")
public interface IFeignClientMenu {
	
	@GetMapping("/getAllList")
	public ResponseEntity<?> getAllItems(@RequestParam(required = false) Long kitchenId);

	
	@PostMapping(value = "saveitem", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)

	public ResponseEntity<String> saveitem(

			@RequestParam String category,

			@RequestParam String itemName,

			@RequestParam String description,

			@RequestParam Double price,

			@RequestParam Long kitchenId,

			MultipartFile itemImage);
	
	
}
