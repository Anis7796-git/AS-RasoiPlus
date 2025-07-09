package com.rasoikart.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.rasoikart.entity.KitchenEntity;

public interface IKichenRepo extends JpaRepository<KitchenEntity, Long> {

}
