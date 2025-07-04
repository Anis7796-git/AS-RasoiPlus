package com.rasoikart.entity;

import java.time.LocalDateTime;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name="ORDERS")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Order
{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long orderId;
	private Long userId;
    private Long kitchenId;
    private Long deliveryBoyId;
    
    private String orderItems;
    private Double totalAmount;
    private String paymentMode;
    
    private String orderStatus;
    private LocalDateTime orderTime;
    private LocalDateTime deliveryTime;
    
   private String deliveryAddress;
   private String contactNumber;
   
   private Boolean isCancelled=false;
}
