package com.anhee.dto;


import java.util.List;

import jakarta.persistence.Lob;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@AllArgsConstructor
@NoArgsConstructor 
public class KitchenAndMenuListDto {
private Long kitchenId;
	
	
	private String kitchenName;
	private String address;     //
	private Double latitude;     // 
	private Double longitude;
	private Double rating;

	private Long phonenumber;
	
	@Lob
	private byte[] kitchenImage;
	
	

}
