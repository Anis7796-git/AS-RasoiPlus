package com.anhee.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import com.anhee.entity.ItemsEntity;
import com.anhee.exception.ImageException;
import com.anhee.exception.KitchenIdNullPointerException;
import com.anhee.service.IItemServiceMgmt;

import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import io.swagger.v3.oas.annotations.tags.Tag;

@RestController
@Tag(name = "Item APIs", description = "APIs for managing items")
public class ItemListController {

	@Autowired
	private IItemServiceMgmt service;

	@ApiResponses(value = { @ApiResponse(responseCode = "200", description = "Items retrieved successfully"),
			@ApiResponse(responseCode = "400", description = "Invalid kitchenId"),
			@ApiResponse(responseCode = "500", description = "Internal server error") })
	@GetMapping("/getAllList")
	public ResponseEntity<?> getAllItems(@RequestParam(required = false) Long kitchenId) {

		if (kitchenId == null) {
			throw new KitchenIdNullPointerException("kitchenId is required");
		}

		List<ItemsEntity> itemList = service.getAllItems(kitchenId);
		
		
		
		
		
		return ResponseEntity.ok(itemList);
	}

	
	
	
	@ApiResponses(value = { @ApiResponse(responseCode = "200", description = "Items save successfully"),
			@ApiResponse(responseCode = "400", description = "Invalid parameter"),
			@ApiResponse(responseCode = "500", description = "Internal server error") })
	@PostMapping(value = "saveitem", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)

	public ResponseEntity<String> saveitem(

			@RequestParam String category,

			@RequestParam String itemName,

			@RequestParam String description,

			@RequestParam Double price,

			@RequestParam Long kitchenId,

			MultipartFile itemImage) {
		byte[] image;
		try {
			image = itemImage.getBytes();
		} catch (IOException e) {
			throw new ImageException("Failed to read image file");
		}
		ItemsEntity entity = new ItemsEntity(category, itemName, description, price, kitchenId, image);

		String msg = service.saveItem(entity);
		
		
		return new ResponseEntity<>(msg, HttpStatus.OK);
	}

}
