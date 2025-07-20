package com.anhee.feign;

import java.util.List;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;

import com.anhee.dto.Menu;

;

@FeignClient(name = "ChefOrderServiceRestAPI")
public interface IfeingConnector {

	 @GetMapping("/getAllMenu")
	    public ResponseEntity<List<Menu>> getAllMenu();
	
	
}





