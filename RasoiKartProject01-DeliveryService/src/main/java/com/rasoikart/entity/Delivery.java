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
@Table(name="deliveries")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Delivery
{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long deliveryId;
    @Column(nullable = false)
	private Long orderId;
    @Column(nullable = false)
	private Long deliveryBoyId;
    @Column(nullable = false)
	private String deliveryStatus;
    

    @Column(nullable = false, columnDefinition = "DATETIME")
    private LocalDateTime assignedTime;
    
    @Column(columnDefinition = "DATETIME")
    private LocalDateTime deliveredTime;
    
	private String trackingInfo;
	
}
