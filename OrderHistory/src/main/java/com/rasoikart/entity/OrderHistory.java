package com.rasoikart.entity;

import java.time.LocalDateTime;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Entity
@Table(name="orderHistory")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class OrderHistory 
{
    
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long orderId;
	private Long custId;
	@Column(nullable = false)
	private LocalDateTime orderDateTime;
	@Column(nullable = false)
	private String kitchenName;
	@Column(nullable = false,length=500)
	private String itemsOrdered;
	@Column(nullable = false)
	private Double totalAmt;
	@Column(nullable = false)
	private String status;
	private boolean paymentMode;
	private String diliveryAdds;
	
}
