package com.rasoikart.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rasoikart.Repository.OrderHistoryRepository;
import com.rasoikart.entity.OrderHistory;
import com.rasoikart.exception.ResourceNotFoundException;

@Service
public class OrderHistoryServiceImpl implements IOrderHistoryService {

	@Autowired
	private OrderHistoryRepository repo;
	@Override
	public List<OrderHistory> getAllOrderHistory() {
	
		return repo.findAll();
	}

	@Override
	public OrderHistory getOrderHistoryById(Long id) {
		
		return repo.findById(id).orElseThrow(()-> new ResourceNotFoundException("Order history not found with ID: "+id));
	}

	@Override
	public String saveOrderHistory(OrderHistory orderHistory) {
		OrderHistory saved=repo.save(orderHistory);
		return "Order History saved with ID: "+saved.getOrderId();
	}

	@Override
	public String deleteOrderHistory(Long id) {
		OrderHistory existing=repo.findById(id).orElseThrow(()-> new ResourceNotFoundException("Order history not found for deletion with ID: "+id));
		repo.delete(existing);
		return "Order history deleted with ID: "+id;
	}

}
