package com.anhee.service;

import com.anhee.dto.LoginDto;
import com.anhee.dto.ProfileUpdateDto;
import com.anhee.dto.RegisterDto;

public interface IUserServiceMgmt {

	String register(RegisterDto registerDto);

	String login(LoginDto loginDto);

	String profileUpdateDto(ProfileUpdateDto profileUpdateDto);

}
