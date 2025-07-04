package com.rasoikart.Service;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rasoikart.entity.Order;
import com.rasoikart.exception.ResourceNotFoundException;
import com.rasoikart.repo.OrderRepsitory;
@Service
public class OrderMgmtServiceImpl implements OrderMgmtService 
{
	@Autowired
	private OrderRepsitory orderRepo;

	@Override
	public Order placeOrder(Order order) {
		order.setOrderStatus("Placed");
		order.setOrderTime(LocalDateTime.now());
		
		return orderRepo.save(order);
	}
	
	@Override
	public Order getOrderById(Long orderId) {
		
		return orderRepo.findById(orderId).orElseThrow(()-> new ResourceNotFoundException("Order not found with ID:"+orderId));
	}
   
	@Override
	public List<Order> getOrderByUserId(Long userId) {
		List<Order> orders=orderRepo.findByUserId(userId);
		if(orders.isEmpty())
		{
			throw new ResourceNotFoundException("No orders found for user ID:"+userId);
		}
		return orders;
	}
	
	@Override
	public List<Order> getOrdersByKitchenId(Long kitchenId) 
	{
		List<Order> orders=orderRepo.findByKitchenId(kitchenId);
		if(orders.isEmpty())
		{
			throw new ResourceNotFoundException("No Orders found for Kitchen ID: "+kitchenId);
			
		}
		return orders;
	}
	
	@Override
	public List<Order> getOrdersByDeliveryBoyId(Long deliveryBoyId) {
		
		List<Order> orders=orderRepo.findByDeliveryBoyId(deliveryBoyId);
		if(orders.isEmpty())
		{
			throw new ResourceNotFoundException("No orders found for delivery boy ID:"+deliveryBoyId);
			
		
		}
		return orders;
	}
	
	@Override
	public void updateOrderStatus(Long orderId, String newStatus) {
		Order order=getOrderById(orderId);
		order.setOrderStatus(newStatus);
		if("DELIVERED".equalsIgnoreCase(newStatus))
		{
			order.setDeliveryTime(LocalDateTime.now());
		}
		orderRepo.save(order);
		
	}
	
	@Override
	public void cancelOrder(Long orderId) {
	   Order order=getOrderById(orderId);
	   order.setOrderStatus("CANCELLED");
	   order.setIsCancelled(true);
	   orderRepo.save(order);
		
	}
}
