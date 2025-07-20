package com.anhee.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@AllArgsConstructor
@NoArgsConstructor
	
@Data
public class ChefDto {

	  
	    
	
	
	private String fullName;
	
	    private String email;

	 
	    private String password;


	    

	    
	  
	    
	    private String specialityCuisine;
	    private int experienceYears;
	    private double averageRating;
	    private String city;
	    private String approxLocation;
	    private String languagesSpoken;
	    private String availability;  
	    private Double hygieneScore;
	    private String certifications;
	    
	    private Double latitude;
		
		private Double longitude;
	    private Long PhoneNumber;
	    
	    
	   
	    
	    
	    
	    
	   
	   
	
	    
}
