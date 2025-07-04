package com.rasoikart.Service;

import java.util.List;

import com.rasoikart.entity.Order;

public interface OrderMgmtService 
{
     public Order placeOrder(Order order);
     public Order getOrderById(Long orderId);
     public List<Order> getOrderByUserId(Long userId);
     public List<Order> getOrdersByKitchenId(Long kitchenId);
     public List<Order> getOrdersByDeliveryBoyId(Long deliveryBoyId);
     public void updateOrderStatus(Long orderId,String newStatus);
     public void cancelOrder(Long orderId);
}
