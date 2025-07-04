package com.anhee.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import com.anhee.exceptions.LoginDtooNullPointerException;
import com.anhee.exceptions.ProfileUpdateDtoNullPointerException;
import com.anhee.exceptions.RegisterDtoNullPointerException;

@ControllerAdvice
public class ExceptionController {
	
	@ExceptionHandler(RegisterDtoNullPointerException.class)
	public ResponseEntity<String> registerDtoNullPointerException(RuntimeException ex) {
        return new ResponseEntity<>("Error: " + ex.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
    
	}

	
	
	@ExceptionHandler(LoginDtooNullPointerException.class)
	public ResponseEntity<String> loginDtooNullPointerException(RuntimeException ex) {
        return new ResponseEntity<>("Error: " + ex.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
    
	}@ExceptionHandler(ProfileUpdateDtoNullPointerException.class)
	public ResponseEntity<String> profileUpdateDtoNullPointerException(RuntimeException ex) {
        return new ResponseEntity<>("Error: " + ex.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
    
	}
}
