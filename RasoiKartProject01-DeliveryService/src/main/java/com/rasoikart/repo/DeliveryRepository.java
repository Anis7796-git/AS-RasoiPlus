package com.rasoikart.repo;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.rasoikart.entity.Delivery;

public interface DeliveryRepository extends JpaRepository<Delivery, Long>
{
    List<Delivery> findByDeliveryBoyId(Long deliveryBoyId);
    
}
