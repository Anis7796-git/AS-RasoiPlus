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
    
    @ManyToOne
    @JoinColumn(name = "chef_id", nullable = false)
    private ChefEntity chef;
    
    private String recipe;
    private int people;
    private LocalDateTime deadline;
    private String location;
    private Long customerNumber;
    private Double price;
    private String instrument;
    private String ingredients;
    private String orderStatus;
    private Date date;
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
//	
//	
//	@Id
//	@GeneratedValue(strategy = GenerationType.IDENTITY)
//	private Long AcceptOrderId;
//	
//	
//	@Id
//	private Long chefId;
//	
//	
//	
//	private String recipe;
//	
//	private int people;
//	private LocalDateTime deadline;
//	private String location;
//	private Long customerNumber;
//	private Double price;
//	
//	
//	private String instrument;
//	
//	
//	
//	private String ingredients;
//	
//	private String OrderStatus;
//	private Date date;
}
