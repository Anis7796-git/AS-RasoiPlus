package com.anhee.entity;

import java.time.LocalDateTime;
import java.util.Date;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Entity
@AllArgsConstructor
@NoArgsConstructor
public class AcceptOrder {

	
	
	
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long acceptOrderId;
    
    private Long chefId;
    private Long customerId;
    private String recipe;
    private int people;
    private String location;
    private Double price;
    private Long customerNumber;
    private LocalDateTime deadline;
    private String instrument;
    private String ingredients;
    private String orderStatus;
    private String stutusAcceptOrRejected;
    private Date Completiondate;
	
	
    
    
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
