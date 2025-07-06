package com.anhee.dto;

import jakarta.persistence.Column;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data

@AllArgsConstructor
@NoArgsConstructor
public class ChefEntityDto {

	

	
	
	    private String email;

	
	    private String password;


	    

	    
	    private String fullName;
	  
	    
	    private String specialityCuisine;
	    private int experienceYears;
	    private double averageRating;
	    private String city;
	    private String approxLocation;
	    private String languagesSpoken;
	    private String availability;  // e.g. "9am-9pm"
	    private String hygieneScore;
	    private String certifications;
	    
	    
	    @Column(name = "order_count")
	    private int orderCount;

	    
	    
	    
	    
	    
	   
	

	
}
