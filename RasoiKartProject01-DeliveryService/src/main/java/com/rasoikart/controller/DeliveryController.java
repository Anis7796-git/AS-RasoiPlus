package com.rasoikart.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;


import com.rasoikart.entity.Delivery;
import com.rasoikart.service.IDeliveryService;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import io.swagger.v3.oas.annotations.tags.Tag;

@RestController
@RequestMapping("/delivery")
@Tag(name="Delivery Service", description = " APIs for managing deliveries")
public class DeliveryController
{
	@Autowired
     private IDeliveryService deliveryService;
	
	@PostMapping("/assign")
	@Operation(summary = "Assign a delivery boy to an order")
	@ApiResponses({
		@ApiResponse(responseCode = "201",description = "Delivery boy assigned successfully")
	})
	public ResponseEntity<Delivery> assignDelivery(@RequestParam Long orderId,@RequestParam Long deliveryBoyId)
	{
		Delivery delivery=deliveryService.assignDeliver(orderId, deliveryBoyId);
		return ResponseEntity.status(201).body(delivery);
	}
     
	@GetMapping("/boy/{deliveryBoyId}")
	@Operation(summary = "Get deliveries assigned to delivery boy")
	@ApiResponses({
		@ApiResponse(responseCode = "200",description = "Deliveries fetched successfully")
	})
	public ResponseEntity<List<Delivery>> getDeliveriesByBoy(@PathVariable Long deliveryBoyId)
	{
		List<Delivery> deliveries=deliveryService.getDeliveriesByBoy(deliveryBoyId);
		return ResponseEntity.ok(deliveries);
	}
	
	@PutMapping("/{deliveryId}/status")
	@Operation(summary = "Update the status of a delivery")
	@ApiResponses({
		@ApiResponse(responseCode = "200",description = "Delivery status updated successfully"),
		@ApiResponse(responseCode = "404",description = "Delivery not found")
	})
	public ResponseEntity<String> updateDeliveryStatus(@PathVariable Long deliveryId,@RequestParam String status)
	{
		deliveryService.updateStatus(deliveryId, status);
		return ResponseEntity.ok("Delivery status updated to '"+ status+ "'Successfully.");
	}
	
	@GetMapping("/{deliveryId}")
	@Operation(summary = "Track delivery by delivery ID")
	@ApiResponses({
		@ApiResponse(responseCode = "200",description = "Delivery found successfully"),
		@ApiResponse(responseCode = "404",description = "Delivery not found")
	})
	public ResponseEntity<Delivery> getDeliveryDetails(@PathVariable Long deliveryId)
	{
		Delivery delivery=deliveryService.getDelivery(deliveryId);
		return ResponseEntity.ok(delivery);
	}
}
