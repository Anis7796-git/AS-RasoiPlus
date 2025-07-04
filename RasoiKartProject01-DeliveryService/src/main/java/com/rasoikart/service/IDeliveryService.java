package com.rasoikart.service;

import java.util.List;

import com.rasoikart.entity.Delivery;

public interface IDeliveryService
{
     public Delivery assignDeliver(Long orderId,Long deliveryBoyId);
     public Delivery updateStatus(Long deliveryId,String status);
     public List<Delivery> getDeliveriesByBoy(Long deliveryBoyId);
     public Delivery getDelivery(Long deliveryId);
}
