package com.anhee.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.http.MediaType;  
import com.anhee.dto.MenuDto;
import com.anhee.dto.UpdateMenuDto;
import com.anhee.entity.Menu;
import com.anhee.exception.DeleteMenuDtoNullPointerException;

import com.anhee.service.IServiceMgmt;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import io.swagger.v3.oas.annotations.tags.Tag;

@RestController
@Tag(name = "Menu Management API", description = "APIs for managing restaurant menu items including CRUD operations")
public class MenuController {
    
    @Autowired 
    private IServiceMgmt service;
    
    @Operation(summary = "Add a new menu item", description = "Creates a new menu item in the system")
    @ApiResponses(value = {
        @ApiResponse(responseCode = "200", description = "Menu item created successfully",
                     content = @Content(schema = @Schema(implementation = String.class))),
        @ApiResponse(responseCode = "400", description = "Invalid input provided"),
        @ApiResponse(responseCode = "500", description = "Internal server error")
    })
    @PostMapping(value = "/addMenu", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public ResponseEntity<String> addMenuItem(
    		  @RequestParam String itemName,
    		    @RequestParam Double price,
    		    @RequestParam String description,
    		    @RequestParam boolean available,
    		    @RequestParam MultipartFile image) {
    	
    	
    	 MenuDto menu = new MenuDto(itemName, price, description, available);
    	
    	
    	 
    	
    	 if (image == null || image.isEmpty()) {
    	        throw new RuntimeException("Image file is required.");
    	    }
        
        System.out.println(menu+"   "+image+" ==================================");
        String msg = service.addMenu(menu,image);
        return new ResponseEntity<>(msg, HttpStatus.OK);
    }
    
    @Operation(summary = "Update existing menu item", description = "Updates details of an existing menu item")
    @ApiResponses(value = {
        @ApiResponse(responseCode = "200", description = "Menu item updated successfully",
                     content = @Content(schema = @Schema(implementation = String.class))),
        @ApiResponse(responseCode = "400", description = "Invalid input provided"),
        @ApiResponse(responseCode = "404", description = "Menu item not found"),
        @ApiResponse(responseCode = "500", description = "Internal server error")
    })
    @PutMapping(value = "/updateMenu", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public ResponseEntity<String> updateMenu(
    		@RequestParam Long itemId,
    		@RequestParam String itemName,
		    @RequestParam Double price,
		    @RequestParam String description,
		    @RequestParam boolean available,
		    @RequestParam MultipartFile image) {
    	
    
    	UpdateMenuDto updateMenu= new UpdateMenuDto(itemId,itemName, price, description, image,available);
    	
       
        String msg = service.UpdateMenu(updateMenu);
        return new ResponseEntity<>(msg, HttpStatus.OK);
        }
    
    
    
    @Operation(summary = "Delete menu item", description = "Removes a menu item from the system")
    @ApiResponses(value = {
        @ApiResponse(responseCode = "200", description = "Menu item deleted successfully",
                     content = @Content(schema = @Schema(implementation = String.class))),
        @ApiResponse(responseCode = "400", description = "Invalid input provided"),
        @ApiResponse(responseCode = "404", description = "Menu item not found"),
        @ApiResponse(responseCode = "500", description = "Internal server error")
    })
    @DeleteMapping("/deleteItem")
    public ResponseEntity<String> deleteItem(@RequestParam  Long id) {
        if (id == null) {
            throw new DeleteMenuDtoNullPointerException("Delete request cannot be empty. Please provide valid deletion criteria.");
        }
        
        String msg = service.deleteItem(id);
        return new ResponseEntity<>(msg, HttpStatus.OK);
    }
    
    @Operation(summary = "Get all menu items", description = "Retrieves a list of all available menu items")
    @ApiResponses(value = {
        @ApiResponse(responseCode = "200", description = "Successfully retrieved menu items",
                     content = @Content(schema = @Schema(implementation = String.class))),
        @ApiResponse(responseCode = "204", description = "No menu items found"),
        @ApiResponse(responseCode = "500", description = "Internal server error")
    })
   
    
    
    
    
    
    @GetMapping("/getAllMenu")
    public ResponseEntity<List<Menu>> getAllMenu() {
        List<Menu> allMenu = service.getAllMenu();
        
        return new ResponseEntity<>(allMenu, HttpStatus.OK);
    }
    
    
    
    
    
    
    @Operation(summary = "Get specific menu item", description = "Retrieves details of a specific menu item by ID")
    @ApiResponses(value = {
        @ApiResponse(responseCode = "200", description = "Successfully retrieved menu item",
                     content = @Content(schema = @Schema(implementation = String.class))),
        @ApiResponse(responseCode = "400", description = "Invalid ID supplied"),
        @ApiResponse(responseCode = "404", description = "Menu item not found"),
        @ApiResponse(responseCode = "500", description = "Internal server error")
    })
    @GetMapping("/getMenu")
    public ResponseEntity<Menu> getMenu(@RequestParam Long id) {
        if (id == null || id <= 0) {
            throw new IllegalArgumentException("Invalid menu ID provided. Please provide a valid positive number.");
        }
        
        Menu itemById = service.getItemById(id);
        
        return new ResponseEntity<>(itemById, HttpStatus.OK);
    }
}