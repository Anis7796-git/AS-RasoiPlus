package com.anhee.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

import com.anhee.entity.ActiveOrder;

public interface ActiveRepo extends JpaRepository<ActiveOrder, Long> {

	List<ActiveOrder> findAllByChefId(Long chefId);
  
}
