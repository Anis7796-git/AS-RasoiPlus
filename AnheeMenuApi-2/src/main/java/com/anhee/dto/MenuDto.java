package com.anhee.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MenuDto {

	   private String itemName;        

	    private Double price;           

	    private String description;     

	        

	    private boolean available;      
	

}
