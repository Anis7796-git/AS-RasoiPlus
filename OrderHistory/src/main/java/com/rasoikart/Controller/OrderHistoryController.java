package com.rasoikart.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.rasoikart.Service.IOrderHistoryService;
import com.rasoikart.entity.OrderHistory;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import io.swagger.v3.oas.annotations.tags.Tag;


@RestController
@RequestMapping("/order-history")
@Tag(name = "Order History Controller", description = "Operations related to order history tracking")
public class OrderHistoryController {

    @Autowired
    private IOrderHistoryService service;

    @Operation(summary = "Get all order history records")
    @ApiResponses({
        @ApiResponse(responseCode = "200", description = "Fetched all order history successfully")
    })
    @GetMapping
    public ResponseEntity<List<OrderHistory>> getAllHistory() {
        return new ResponseEntity<>(service.getAllOrderHistory(), HttpStatus.OK);
    }

    @Operation(summary = "Get a specific order history by ID")
    @ApiResponses({
        @ApiResponse(responseCode = "200", description = "Order history found"),
        @ApiResponse(responseCode = "404", description = "Order history not found")
    })
    @GetMapping("/{id}")
    public ResponseEntity<OrderHistory> getHistoryById(@PathVariable Long id) {
        return new ResponseEntity<>(service.getOrderHistoryById(id), HttpStatus.OK);
    }

    @Operation(summary = "Save a new order history record")
    @ApiResponses({
        @ApiResponse(responseCode = "201", description = "Order history saved successfully")
    })
    @PostMapping
    public ResponseEntity<String> saveHistory(@RequestBody OrderHistory history) {
        String msg = service.saveOrderHistory(history);
        return new ResponseEntity<>(msg, HttpStatus.CREATED);
    }

    @Operation(summary = "Delete order history by ID")
    @ApiResponses({
        @ApiResponse(responseCode = "200", description = "Order history deleted successfully"),
        @ApiResponse(responseCode = "404", description = "Order history not found")
    })
    @DeleteMapping("/{id}")
    public ResponseEntity<String> deleteHistory(@PathVariable Long id) {
        String msg = service.deleteOrderHistory(id);
        return new ResponseEntity<>(msg, HttpStatus.OK);
    }
}

