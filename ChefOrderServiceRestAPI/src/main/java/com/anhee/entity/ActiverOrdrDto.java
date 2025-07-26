package com.anhee.entity;

import java.time.LocalDateTime;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ActiverOrdrDto {
	
	private Long chefId;
    private Long customerid;
    private String recipe;
    private int people;
    private LocalDateTime deadline;
    private String location;
    private Long customerNumber;
    private Double price;

}
