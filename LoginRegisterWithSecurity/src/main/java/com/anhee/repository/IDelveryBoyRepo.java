package com.anhee.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.anhee.entity.DilveryBoyEntity;
import com.anhee.entity.kitchenEntity;

public interface IDelveryBoyRepo extends JpaRepository<DilveryBoyEntity, Long> {
 
	public DilveryBoyEntity findByEmail(String email);
}
