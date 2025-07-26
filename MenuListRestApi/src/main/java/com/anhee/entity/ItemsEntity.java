package com.anhee.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Lob;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;

@Data
@Entity
@AllArgsConstructor


@RequiredArgsConstructor
@Table(name = "Kitchen_ItemList")
public class ItemsEntity {

	

	

	public ItemsEntity(String category, String itemName, String description, Double price, Long kitchenId,
			byte[] bytes) {
		super();
		this.category = category;
		this.itemName = itemName;
		this.description = description;
		this.price = price;
		this.imageData = bytes;
		this.kitchenId = kitchenId;
	}

	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String category;

    private String itemName;

    @Column(length = 5000)
    private String description;

    private Double price;

    @Lob
    private byte[] imageData;

    private Long kitchenId;
	
	
}