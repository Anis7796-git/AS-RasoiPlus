package com.anhee.dto;

import java.io.IOException;

import org.springframework.web.multipart.MultipartFile;

import com.anhee.entity.Menu;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UpdateMenuDto {
	
	
	

	


	private Long UpdateItemId;
	
	
	   private String itemName;        

	    private Double price;           

	    private String description;     

	    private MultipartFile image;       

	    private boolean available;

		

		
		 
	    
	    
	    
	    
	    
}
