package com.anhee.dto;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@AllArgsConstructor
@NoArgsConstructor

@Data
public class CustomerDto {
	
	
	
	
	
	
	private String fullname;
	private String email;
	private String password;
	
	private String role;
	private String mobileNumber;
	

	private String address;
	
	private Double latitude;
	
	private Double longitude;
	
}
