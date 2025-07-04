package com.anhee.entity;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, unique = true)
    private String email;

    @Column(nullable = false)
    private String password;

    @Transient
    private String repeatPassword; 

    @Column(nullable = false)
    private String role; 

   
    @Lob
    private byte[] profileImage;

   
    @Transient
    private String profileImageBase64;
}
