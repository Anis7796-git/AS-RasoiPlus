package com.rasoikart.Service;

import java.util.List;

import com.rasoikart.entity.OrderHistory;

public interface IOrderHistoryService 
{
	List<OrderHistory> getAllOrderHistory();

    OrderHistory getOrderHistoryById(Long id);

    String saveOrderHistory(OrderHistory orderHistory);

    String deleteOrderHistory(Long id);
}
