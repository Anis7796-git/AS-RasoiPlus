package com.anhee.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Lob;
import jakarta.persistence.Transient;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Entity
@AllArgsConstructor
@NoArgsConstructor

public class ChefEntity {

	
	   @Id
	    @GeneratedValue(strategy = GenerationType.IDENTITY)
	    private Long chefId;
	    
	
	
	
	 @Column(nullable = false, unique = true)
	    private String email;

	    @Column(nullable = false)
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

	    
	    
	    
	    
	    
	    @Lob
	    private byte[] profileImage;
	    
	   
	    @Transient
	    private String profileImageBase64;
	
	
	    
	    
}
