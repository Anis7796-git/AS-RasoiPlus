package com.anhee.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.anhee.entity.ChefEntity;

@Repository
public interface ChefRepo extends JpaRepository<ChefEntity, Long> {

}
