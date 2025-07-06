package com.anhee.service;

import java.io.IOException;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.anhee.dto.ChefEntityDto;
import com.anhee.dto.LoginDto;
import com.anhee.dto.ProfileUpdateDto;
import com.anhee.dto.RegisterDto;
import com.anhee.entity.ChefEntity;
import com.anhee.exceptions.ProfileImageException;
import com.anhee.repository.ChefRepo;
import com.anhee.repository.UserRepository;


@Service
public class UserServiceMgmt implements IUserServiceMgmt {

	
	@Autowired private UserRepository repo; 
	
	@Autowired private ChefRepo chefRepo;
	
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

	@Override
	public String registerChef(ChefEntityDto dto, MultipartFile profile) {
		
		ChefEntity entity= new ChefEntity();
		
		BeanUtils.copyProperties(dto, entity);
		
		try {
			entity.setProfileImage(profile.getBytes());
		} catch (IOException e) {
			throw new ProfileImageException("profileImage problem please report the admin");
		}
		
		Long chefId = chefRepo.save(entity).getChefId();
		
		return "Chef register Successfully "+chefId;
	}

}
