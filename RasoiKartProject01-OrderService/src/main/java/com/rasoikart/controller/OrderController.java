package com.rasoikart.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import com.rasoikart.Service.OrderMgmtService;
import com.rasoikart.entity.Order;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import io.swagger.v3.oas.annotations.tags.Tag;

@RestController
@RequestMapping("/orders")
@Tag(name = "Order Service", description = "APIs for managing orders in RasoiKart")
public class OrderController {

    @Autowired
    private OrderMgmtService orderService;

    @PostMapping("/save")
    @Operation(summary = "Place a new order")
    @ApiResponses({
        @ApiResponse(responseCode = "201", description = "Order placed successfully"),
        @ApiResponse(responseCode = "400", description = "Invalid order data provided")
    })
    public ResponseEntity<Order> placeOrder(@RequestBody Order order) {
        Order savedOrder = orderService.placeOrder(order);
        return new ResponseEntity<>(savedOrder, HttpStatus.CREATED);
    }

    @GetMapping("getorder")
    @Operation(summary = "Get order details by order ID")
    @ApiResponses({
        @ApiResponse(responseCode = "200", description = "Order found successfully"),
        @ApiResponse(responseCode = "404", description = "Order not found for the given ID")
    })
    public ResponseEntity<Order> getOrder(@RequestParam Long orderId) {
        return ResponseEntity.ok(orderService.getOrderById(orderId));
    }

    @GetMapping("/user/{userId}")
    @Operation(summary = "Get all orders placed by a specific user")
    @ApiResponses({
        @ApiResponse(responseCode = "200", description = "Orders retrieved successfully for user")
    })
    public ResponseEntity<List<Order>> getUserOrders(@PathVariable Long userId) {
        return ResponseEntity.ok(orderService.getOrderByUserId(userId));
    }

    @GetMapping("/kitchen/{kitchenId}")
    @Operation(summary = "Get all orders assigned to a specific kitchen")
    @ApiResponses({
        @ApiResponse(responseCode = "200", description = "Orders retrieved successfully for kitchen")
    })
    public ResponseEntity<List<Order>> getKitchenOrders(@PathVariable Long kitchenId) {
        return ResponseEntity.ok(orderService.getOrdersByKitchenId(kitchenId));
    }

    @GetMapping("/delivery/{deliveryBoyId}")
    @Operation(summary = "Get all orders assigned to a specific delivery boy")
    @ApiResponses({
        @ApiResponse(responseCode = "200", description = "Orders retrieved successfully for delivery boy")
    })
    public ResponseEntity<List<Order>> getDeliveryOrders(@PathVariable Long deliveryBoyId) {
        return ResponseEntity.ok(orderService.getOrdersByDeliveryBoyId(deliveryBoyId));
    }

    @PutMapping("/upadate-status")
    @Operation(summary = "Update the status of an existing order")
    @ApiResponses({
        @ApiResponse(responseCode = "200", description = "Order status updated successfully"),
        @ApiResponse(responseCode = "404", description = "Order not found for update")
    })
    public ResponseEntity<String> updateStatus(
            @RequestParam Long orderId,
            @RequestParam String status) {
        orderService.updateOrderStatus(orderId, status);
        return ResponseEntity.ok("Order status updated to '" + status + "' successfully.");
    }

    @DeleteMapping("/delete")
    @Operation(summary = "Cancel an existing order")
    @ApiResponses({
        @ApiResponse(responseCode = "200", description = "Order cancelled successfully"),
        @ApiResponse(responseCode = "404", description = "Order not found for cancellation")
    })
    public ResponseEntity<String> cancelOrder(@RequestParam Long orderId) {
        orderService.cancelOrder(orderId);
        return ResponseEntity.ok("Order with ID " + orderId + " cancelled successfully.");
    }
}
