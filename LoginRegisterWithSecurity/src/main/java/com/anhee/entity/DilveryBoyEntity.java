package com.anhee.entity;

import java.time.LocalDate;
import java.time.LocalDateTime;
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

@Entity
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "delivery_boy")  // Fixed table name spelling
@Data
public class DilveryBoyEntity {  // Fixed class name spelling
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long deliveryBoyId;  // Fixed field name spelling
    
    private String fullName;
    private String email;
    private String password;
    private String role;
    
    @Lob
    @Column(length = 26777215)  // Corrected max length for MEDIUMBLOB
    private byte[] image;
    
    @Column  // Removed columnDefinition to avoid MySQL version issues
    private LocalDate dateOfBirth;
    
    private Long number;
    
    private String address;
}