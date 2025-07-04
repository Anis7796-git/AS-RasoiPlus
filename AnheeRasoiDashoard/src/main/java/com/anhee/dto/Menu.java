package com.anhee.dto;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Menu {
	
	private Long id;
	
	
	   private String itemName;        

	    private Double price;           

	    private String description;     

	   
	    private byte[] image;     

	    private boolean available;      
	
	
}
