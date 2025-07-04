package com.rasoikart.repo;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.rasoikart.entity.Order;

public interface OrderRepsitory extends JpaRepository<Order, Long> 
{
    List<Order> findByUserId(Long userId);
    List<Order> findByKitchenId(Long kitchenId);
    List<Order> findByDeliveryBoyId(Long deliveryBoyId);
}
