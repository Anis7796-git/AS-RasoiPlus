package com.rasoikart.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import org.springframework.web.multipart.MultipartFile;

import com.rasoikart.entity.KitchenEntity;
import com.rasoikart.entity.kitchendto;
import com.rasoikart.exception.ResourceNotFoundException;
import com.rasoikart.service.IKitchenServiceMGmt;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import io.swagger.v3.oas.annotations.tags.Tag;

@RestController
//@RequestMapping("/kitchen")
@Tag(name = "Kitchen Management", description = "APIs for managing kitchen operations")
public class KitchenController {

	
    @Autowired
    private IKitchenServiceMGmt service;

    @Operation(summary = "Get all kitchens", description = "Fetch the list of all kitchens available in the system")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "Kitchens fetched successfully"),
            @ApiResponse(responseCode = "500", description = "Internal server error")
    })
    @GetMapping("/getAllKitchenMenu")
    public ResponseEntity<List<KitchenEntity>> getAllKitchens() {
        List<KitchenEntity> list = service.getAllKitchen();
        return new ResponseEntity<>(list, HttpStatus.OK);
    }

    @Operation(summary = "Save new kitchen", description = "Upload and save a new kitchen with image and details")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "Kitchen saved successfully"),
            @ApiResponse(responseCode = "400", description = "Invalid input or missing parameters"),
            @ApiResponse(responseCode = "500", description = "Internal server error")
    })
    @PostMapping(value = "/savekitchen", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public ResponseEntity<String> saveKitchen(
            @RequestParam String kitchenName,
            @RequestParam String address,
            @RequestParam Double latitude,
            @RequestParam Double longitude,
            @RequestParam Double rating,
            @RequestParam Long phonenumber,
            
            @RequestParam MultipartFile image) {

        if (kitchenName == null || address == null || image.isEmpty()) {
            throw new ResourceNotFoundException("Kitchen name, location, or image must not be empty.");
        }

        kitchendto dto = new kitchendto(kitchenName, address, latitude, longitude,rating,phonenumber);
        String msg = service.saveKitchen(dto, image);
        return new ResponseEntity<>(msg, HttpStatus.OK);
    }
}
