package com.anhee.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.anhee.entity.CustomerEntity;
import com.anhee.entity.kitchenEntity;

public interface IkitchenRepo extends JpaRepository<kitchenEntity, Long> {

	
	public kitchenEntity findByEmail(String email);
	
}
