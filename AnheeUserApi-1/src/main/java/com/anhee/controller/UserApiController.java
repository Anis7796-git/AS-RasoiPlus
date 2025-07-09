package com.anhee.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.anhee.dto.ChefEntityDto;
import com.anhee.dto.LoginDto;
import com.anhee.dto.ProfileUpdateDto;
import com.anhee.dto.RegisterDto;
import com.anhee.exceptions.LoginDtooNullPointerException;
import com.anhee.exceptions.ProfileUpdateDtoNullPointerException;
import com.anhee.exceptions.RegisterDtoNullPointerException;
import com.anhee.service.IUserServiceMgmt;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.persistence.Column;

@RestController
@Tag(name = "User API", description = "Handles user related operations (Register , Login , Profile Update")
public class UserApiController {

	@Autowired
	private IUserServiceMgmt service;

	@Operation(summary = "Register User ")
	@ApiResponses(value = { @ApiResponse(responseCode = "200", description = "User Registred successfully"),
			@ApiResponse(responseCode = "404", description = "User not Register"),
			@ApiResponse(responseCode = "500", description = "Internal server error") })
	@PostMapping("/register")
	public ResponseEntity<String> userRegister(@RequestBody RegisterDto registerDto) {

		if (registerDto != null) {

			String msg = service.register(registerDto);

			return new ResponseEntity<String>(msg, HttpStatus.OK);
		} else
			throw new RegisterDtoNullPointerException("Please Enter Complete Details  for Registering ");

	}
	
	
	
	@Operation(summary = "login User ")
	@ApiResponses(value = { @ApiResponse(responseCode = "200", description = "User Found successfully"),
			@ApiResponse(responseCode = "404", description = "User not found"),
			@ApiResponse(responseCode = "500", description = "Internal server error") })
	@PostMapping("/login")
	public ResponseEntity<String> Login(@RequestBody LoginDto loginDto) {

		if (loginDto != null) {

			String msg = service.login(loginDto);

			return new ResponseEntity<String>(msg, HttpStatus.OK);
		} else
			throw new LoginDtooNullPointerException("Please Enter Complete Details  for Registering ");

	}
	
	
	
	
	
	@Operation(summary = " Profile Update ")
	@ApiResponses(value = { @ApiResponse(responseCode = "200", description = "User Profile Update successfully"),
			@ApiResponse(responseCode = "404", description = "Somthing is wrong Please try After sometime ... "),
			@ApiResponse(responseCode = "500", description = "Internal server error") })
	@PostMapping("/profileUpdate")
	public ResponseEntity<String> profileUpdate(@RequestBody ProfileUpdateDto profileUpdateDto) {

		if (profileUpdateDto != null) {

			String msg = service.profileUpdateDto(profileUpdateDto);

			return new ResponseEntity<String>(msg, HttpStatus.OK);
		} else
			throw new ProfileUpdateDtoNullPointerException("Please Enter Complete Details  for profile Update... ");

	}
	
	
	
	
//	
//	@PostMapping(value = "/chefRegister", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
//	public String chefRegister(@RequestBody ChefEntityDto entity,MultipartFile profile) {
//		
//		
//		String msg= service.registerChef(entity,profile);
//		
//		return msg;
//	}
	
	@PostMapping(value = "/chefRegister", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
	public String chefRegister(
			
			
			 @RequestParam String email,

				


			    

			    
			  
			    
			 @RequestParam String password,
			    @RequestParam String fullName,
			    @RequestParam String specialityCuisine,
			    @RequestParam Integer experienceYears,
			    @RequestParam Double averageRating,
			    @RequestParam String city,
			    @RequestParam String approxLocation,
			    @RequestParam String languagesSpoken,
			    @RequestParam String availability,  // e.g. "9am-9pm"
			    @RequestParam String hygieneScore,
			    @RequestParam String certifications,
			    @RequestParam int orderCount,
			    @RequestParam("profileImage") MultipartFile profile) {
			    
			    ChefEntityDto dto = new ChefEntityDto(email, password, fullName, specialityCuisine, orderCount, orderCount, city, approxLocation, languagesSpoken, availability, hygieneScore, certifications, orderCount);
		
		System.out.println(dto.toString());
		
		
	    return service.registerChef(dto, profile);
	}

	

	


	
	
}
