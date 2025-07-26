package com.anhee.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.anhee.entity.ItemsEntity;

public interface ItemRepository extends JpaRepository<ItemsEntity, Long> {

	List<ItemsEntity> findAllByKitchenId(Long kitchenId);

}
