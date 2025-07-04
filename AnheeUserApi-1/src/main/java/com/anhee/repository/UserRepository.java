package com.anhee.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.anhee.entity.User;

public interface UserRepository extends JpaRepository<User, Long> {
	

}
