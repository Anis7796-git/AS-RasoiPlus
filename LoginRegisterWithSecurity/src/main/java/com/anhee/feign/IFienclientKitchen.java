package com.anhee.feign;

import java.util.List;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;

import com.anhee.dto.KitchenAndMenuListDto;


@FeignClient(name = "KitehenMenuRestAPI")
public interface IFienclientKitchen {
	
	 @GetMapping("/getAllKitchenMenu")
	    public ResponseEntity<List<KitchenAndMenuListDto>> getAllKitchens();

}
