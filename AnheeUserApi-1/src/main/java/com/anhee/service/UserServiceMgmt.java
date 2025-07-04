package com.anhee.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.anhee.dto.LoginDto;
import com.anhee.dto.ProfileUpdateDto;
import com.anhee.dto.RegisterDto;
import com.anhee.repository.UserRepository;


@Service
public class UserServiceMgmt implements IUserServiceMgmt {

	
	@Autowired private UserRepository repo; 
	
	@Override
	public String register(RegisterDto registerDto) {

	
		
	
		return null;
	}

	@Override
	public String login(LoginDto loginDto) {
		
		
		
		
		return null;
	}

	@Override
	public String profileUpdateDto(ProfileUpdateDto profileUpdateDto) {
		
		return null;
	}

}
