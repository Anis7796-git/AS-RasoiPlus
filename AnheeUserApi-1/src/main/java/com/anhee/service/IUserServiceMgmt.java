package com.anhee.service;

import org.springframework.web.multipart.MultipartFile;

import com.anhee.dto.ChefEntityDto;
import com.anhee.dto.LoginDto;
import com.anhee.dto.ProfileUpdateDto;
import com.anhee.dto.RegisterDto;

public interface IUserServiceMgmt {

	String register(RegisterDto registerDto);

	String login(LoginDto loginDto);

	String profileUpdateDto(ProfileUpdateDto profileUpdateDto);

	String registerChef(ChefEntityDto entity, MultipartFile profile);

}
