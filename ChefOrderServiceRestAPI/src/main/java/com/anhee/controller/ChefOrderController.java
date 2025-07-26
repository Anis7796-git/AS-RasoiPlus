package com.anhee.controller;

import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.anhee.entity.AcceptOrder;
import com.anhee.entity.ActiveOrder;
import com.anhee.entity.ActiverOrdrDto;
import com.anhee.entity.ChefEntity;
import com.anhee.service.IChefOrderServiceMGT;

import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;



@RestController
@Tag(description = "", name = "")
public class ChefOrderController {

	@Autowired
	private IChefOrderServiceMGT service;
	
	
	@PostMapping("/chefRegister")
	public String register(@RequestBody ChefEntity entity) {
		
		
		String msg=service.registerChef(entity);
		
		return msg;
	}
	
	@PostMapping("/saveacceptOrder")
	public ResponseEntity<String> saveacceptOrder(@RequestBody AcceptOrder entity) {
		
		
		String msg=service.saveacceptOrder(entity);
		
		return new ResponseEntity<>(msg,HttpStatus.OK);
	}
	
	
	
	

	@GetMapping("/activeOrder")
	public ResponseEntity<List<ActiveOrder>> getActiveOrders(@RequestParam Long chefId) {

		List<ActiveOrder> activeOrders = service.getActiveOrderList(chefId);

		return new ResponseEntity<>(activeOrders, HttpStatus.OK);
	}

	
	
	
	@GetMapping("/acceptOrder")
	public ResponseEntity<List<AcceptOrder>> acceptOrder(@RequestParam String accept) {

		List<AcceptOrder> activeOrders = service.getAcceptOrder(accept);

		return new ResponseEntity<>(activeOrders, HttpStatus.OK);
	}
	
	
	@PutMapping("/changeStatus")
	public ResponseEntity<String> updateStatusAcceptOrder(@RequestBody AcceptOrder entity) {
		
		String msg= service.updateStatus(entity);
		
		return new  ResponseEntity<>(msg,HttpStatus.OK);
	}
	
	
	
	@PostMapping("/activeOrderSave")
	public ResponseEntity<String> chefBooking(@RequestBody ActiverOrdrDto dto) {
		
		String msg = service.setActiveOrder(dto);
		
		
		
		return ResponseEntity.ok().build();
	}
	
	
	
	
	
	
	
	
	

}
