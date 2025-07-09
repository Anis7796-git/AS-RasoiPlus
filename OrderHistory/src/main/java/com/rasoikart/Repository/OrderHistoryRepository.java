package com.rasoikart.Repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.rasoikart.entity.OrderHistory;

public interface OrderHistoryRepository extends JpaRepository<OrderHistory, Long>
{

}
