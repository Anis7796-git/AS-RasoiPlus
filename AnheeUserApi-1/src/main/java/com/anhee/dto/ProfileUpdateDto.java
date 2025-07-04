package com.anhee.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ProfileUpdateDto {

   
    private String email;


    private String password;

   

  
    private String role; 

   
   
    private byte[] profileImage;

   
 
   
}
