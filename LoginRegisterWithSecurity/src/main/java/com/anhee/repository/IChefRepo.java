package com.anhee.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.anhee.entity.ChefEntity;
import com.anhee.entity.kitchenEntity;


public interface IChefRepo extends JpaRepository<ChefEntity, Long> {

	
	public ChefEntity findByEmail(String email);
}
