package com.anhee.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.anhee.entity.CustomerEntity;
import com.anhee.entity.kitchenEntity;

public interface IcustomerRepo extends JpaRepository<CustomerEntity, Long> {

	public CustomerEntity findByEmail(String email);
}
