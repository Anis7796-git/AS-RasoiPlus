package com.rasoikart.service;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.rasoikart.entity.Delivery;
import com.rasoikart.exception.ResourceNotFoundException;
import com.rasoikart.repo.DeliveryRepository;
@Service
public class DeliveryServiceImpl implements IDeliveryService
{
	@Autowired
	private DeliveryRepository deliveryRepo;
    @Override
    public Delivery assignDeliver(Long orderId, Long deliveryBoyId) {
    	Delivery d=new Delivery();
    	d.setOrderId(orderId);
    	d.setDeliveryBoyId(deliveryBoyId);
    	d.setDeliveryStatus("ASSIGNED");
    	d.setAssignedTime(LocalDateTime.now());
    	return deliveryRepo.save(d);
    }
    
    @Override
    public Delivery updateStatus(Long deliveryId, String status) {
        Delivery d=deliveryRepo.findById(deliveryId).orElseThrow(()->new ResourceNotFoundException("Delivery not found with ID "+deliveryId));
        d.setDeliveryStatus(status);
        if("DELIVERED".equalsIgnoreCase(status))
        {
        	d.setDeliveredTime(LocalDateTime.now());
        }
    	return deliveryRepo.save(d);
    }
    
    @Override
    public List<Delivery> getDeliveriesByBoy(Long deliveryBoyId) {
    	
    	return deliveryRepo.findByDeliveryBoyId(deliveryBoyId);
    }
    
    @Override
    public Delivery getDelivery(Long deliveryId) {
    	
    	return deliveryRepo.findById(deliveryId).orElseThrow(()->new ResourceNotFoundException("Delivery not found with ID "+deliveryId));
    }
}
