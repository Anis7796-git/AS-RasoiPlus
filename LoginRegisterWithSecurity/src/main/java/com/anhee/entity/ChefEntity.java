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

@Entity
@AllArgsConstructor
@NoArgsConstructor
	
@Data
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
	    private Double hygieneScore;
	    private String certifications;
	    
	    
	    private Double latitude;
		
		private Double longitude;
		 private Long PhoneNumber;
	    
		 @Lob
		    @Column(length = 46777215)
	    private byte[] profileImage;
	    
	   
	    @Transient
	    private String profileImageBase64;
	
	
	    
}
