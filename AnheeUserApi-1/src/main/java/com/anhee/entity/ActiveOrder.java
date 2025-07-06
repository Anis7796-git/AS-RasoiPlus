package com.anhee.entity;

import java.time.LocalDateTime;

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
public class ActiveOrder {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long activeId;
    
    @ManyToOne
    @JoinColumn(name = "chef_id", nullable = false)
    private ChefEntity chef;
    
    private String recipe;
    private int people;
    private LocalDateTime deadline;
    private String location;
    private Long customerNumber;
    private Double price;

}






















//
//import java.time.LocalDateTime;
//
//import jakarta.persistence.Entity;
//import jakarta.persistence.GeneratedValue;
//import jakarta.persistence.GenerationType;
//import jakarta.persistence.Id;
//import lombok.AllArgsConstructor;
//import lombok.Data;
//import lombok.NoArgsConstructor;
//
//@Data
//@Entity
//@AllArgsConstructor
//@NoArgsConstructor
//public class ActiveOrder {
//
//	
//	
//	@Id
//	@GeneratedValue(strategy = GenerationType.IDENTITY)
//	private Long ActiveId;
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
//	
//	
//}
