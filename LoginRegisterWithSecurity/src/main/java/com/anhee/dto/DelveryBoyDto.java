package com.anhee.dto;

import java.util.Date;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@AllArgsConstructor
@NoArgsConstructor

@Data
public class DelveryBoyDto {
	
	
	
	
	
		private String fullName;
		private String email;
		private String password;
		private String role;
		
		
		private Date dateofBirth;
		
		private Long phonenumber;
		
		private String address;
		
		
		

}
