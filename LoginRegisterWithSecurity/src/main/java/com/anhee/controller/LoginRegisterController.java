package com.anhee.controller;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.anhee.dto.ChefDto;
import com.anhee.dto.CustomerDto;
import com.anhee.dto.DelveryBoyDto;
import com.anhee.dto.kitchenDto;
import com.anhee.exception.RegistrationException;
import com.anhee.repository.IChefRepo;
import com.anhee.repository.IDelveryBoyRepo;
import com.anhee.repository.IcustomerRepo;
import com.anhee.repository.IkitchenRepo;
import com.anhee.service.IserviceMgmt;
import com.anhee.service.JwtService;

import java.util.Collections;  // Add this line

@RestController
@RequestMapping("/api/auth")
public class LoginRegisterController {

    @Autowired
    private IserviceMgmt authService;
    
    @Autowired
    private JwtService jwtService;

    @Autowired 
    private AuthenticationManager authManager;
    
    @Autowired
    private IcustomerRepo customerRepo;
    
    @Autowired
    private IChefRepo chefRepo;
    
    @Autowired
    private IkitchenRepo kitchenRepo;
    
    @Autowired
    private IDelveryBoyRepo deliveryBoyRepo;
    
    @PostMapping("/login")
    public ResponseEntity<String> loginUser(@RequestParam String email, @RequestParam String password) {
        UsernamePasswordAuthenticationToken token = 
                new UsernamePasswordAuthenticationToken(email, password);
        
        Authentication authenticate = authManager.authenticate(token);
        
        boolean status = authenticate.isAuthenticated();
        
        if(status) {
            // Find user details to get ID and role
            UserDetails userDetails = authService.loadUserByUsername(email);
            String role = userDetails.getAuthorities().stream()
                    .findFirst()
                    .map(GrantedAuthority::getAuthority)
                    .orElse("USER");
            
            Long userId = getUserIdByEmailAndRole(email, role);
            
            String jwtToken = jwtService.generateToken(email, userId, role);
            
            Map<String, String> response = new HashMap<>();
            response.put("token", jwtToken);
//            response.put("role", role);
//            response.put("userId", userId.toString());
//            
            return new ResponseEntity<>(jwtToken,HttpStatus.OK);
        } else {
            return new ResponseEntity<>("error Invalid credentials",HttpStatus.UNAUTHORIZED);
        }
    }
    
    private Long getUserIdByEmailAndRole(String email, String role) {
    	System.out.println("LoginRegisterController.getUserIdByEmailAndRole()"+role+"=============================================");
        switch (role.toUpperCase()) {
            case "ROLE_CUSTOMER":
                return customerRepo.findByEmail(email).getCustomerId();
            case "ROLE_CHEF":
                return chefRepo.findByEmail(email).getChefId();
            case "ROLE_KITCHEN":
            	System.out.println("LoginRegisterController.getUserIdByEmailAndRole()"+"kitchen case exicuted ==========");
                return kitchenRepo.findByEmail(email).getKitchenId();
            case "ROLE_DELIVERY_BOY":
                return deliveryBoyRepo.findByEmail(email).getDilveryBoyId();
            default:
                throw new IllegalArgumentException("Unknown role: " + role);
        }
    }

    
    
    
    
    
    
//    // Login endpoint
//    @PostMapping("/login")
//    public ResponseEntity<?> loginUser(@RequestParam String email, 
//                                      @RequestParam String password) {
//        try {
//            // In a real application, you would use Spring Security here
//            // This is just a placeholder for the login logic
//            return ResponseEntity.ok().body("Login successful for email: " + email);
//        } catch (Exception e) {
//            throw new RegistrationException("Login failed: " + e.getMessage());
//        }
//    }

    // Customer registration endpoint
    @PostMapping(value = "/register/customer",consumes =MediaType.MULTIPART_FORM_DATA_VALUE)
    public ResponseEntity<?> registerCustomer(
            @RequestParam String fullname,
            @RequestParam String email,
            @RequestParam String password,
            @RequestParam String role,
            @RequestParam String mobile,
            @RequestParam String address,
            @RequestParam Double latitude,
            @RequestParam Double longitude,
            @RequestParam("profile_image") MultipartFile profileImage) {
        System.err.println("LoginRegisterController.registerCustomer()");
        try {
            CustomerDto customerDto = new CustomerDto();
            customerDto.setFullname(fullname);
            customerDto.setEmail(email);
            customerDto.setPassword(password);
            customerDto.setRole(role);
            customerDto.setMobileNumber(mobile);
            customerDto.setAddress(address);
            customerDto.setLatitude(latitude);
            customerDto.setLongitude(longitude);

            String result = authService.SaveCustomer(customerDto, profileImage.getBytes());
            return ResponseEntity.ok().body("Customer registration successful: " + result);
        } catch (IOException e) {
            throw new RegistrationException("Failed to process profile image: " + e.getMessage());
        } catch (Exception e) {
            throw new RegistrationException("Customer registration failed: " + e.getMessage());
        }
    }

    // Chef registration endpoint
    @PostMapping(value = "/register/chef", consumes =MediaType.MULTIPART_FORM_DATA_VALUE)
    public ResponseEntity<?> registerChef(
            @RequestParam String fullname,
            @RequestParam String email,
            @RequestParam String password,
            @RequestParam String role,
            @RequestParam String speciality,
            @RequestParam Integer experience,
            @RequestParam String city,
            @RequestParam String location,
            @RequestParam String languages,
            @RequestParam String availability,
            @RequestParam Double hygiene_score,
            @RequestParam String certifications,
            @RequestParam Double latitude,
            @RequestParam Double longitude,
            @RequestParam("profile_image") MultipartFile profileImage) {
        System.err.println("LoginRegisterController.registerChef()");
        try {
            ChefDto chefDto = new ChefDto();
 chefDto.setFullName(fullname);
            chefDto.setEmail(email);
            chefDto.setPassword(password);
            
            chefDto.setSpecialityCuisine(speciality);
            chefDto.setExperienceYears(experience);
            chefDto.setCity(city);
            chefDto.setApproxLocation(location);
            chefDto.setLanguagesSpoken(languages);
            chefDto.setAvailability(availability);
            chefDto.setHygieneScore(hygiene_score);
            chefDto.setCertifications(certifications);
            chefDto.setLatitude(latitude);
            chefDto.setLongitude(longitude);

            String result = authService.SaveChef(chefDto, profileImage.getBytes());
            return ResponseEntity.ok().body("Chef registration successful: " + result);
        } catch (IOException e) {
            throw new RegistrationException("Failed to process profile image: " + e.getMessage());
        } catch (Exception e) {
            throw new RegistrationException("Chef registration failed: " + e.getMessage());
        }
    }

    // Kitchen registration endpoint
    @PostMapping(value="/register/kitchen",consumes =MediaType.MULTIPART_FORM_DATA_VALUE)
    public ResponseEntity<?> registerKitchen(
            @RequestParam String fullname,
            @RequestParam String email,
            @RequestParam String password,
            @RequestParam String role,
            @RequestParam String kitchen_name,
            @RequestParam String address,
            @RequestParam Long phone,
            @RequestParam Double rating,
            @RequestParam Double latitude,
            @RequestParam Double longitude,
            @RequestParam("kitchen_image") MultipartFile kitchenImage) {
        System.err.println("LoginRegisterController.registerKitchen()");
        try {
            kitchenDto kitchenDto = new kitchenDto();
            kitchenDto.setFullname(fullname);
            kitchenDto.setEmail(email);
            kitchenDto.setPassword(password);
            kitchenDto.setRole(role);
            kitchenDto.setKitchenName(kitchen_name);
            kitchenDto.setAddress(address);
            kitchenDto.setPhonenumber(phone);
            kitchenDto.setRating(rating);
            kitchenDto.setLatitude(latitude);
            kitchenDto.setLongitude(longitude);

            String result = authService.SaveKitchen(kitchenDto, kitchenImage.getBytes());
            return ResponseEntity.ok().body("Kitchen registration successful: " + result);
        } catch (IOException e) {
            throw new RegistrationException("Failed to process kitchen image: " + e.getMessage());
        } catch (Exception e) {
            throw new RegistrationException("Kitchen registration failed: " + e.getMessage());
        }
    }

    // Delivery boy registration endpoint
    @PostMapping(value="/register/delivery",consumes =MediaType.MULTIPART_FORM_DATA_VALUE)
    public ResponseEntity<?> registerDeliveryBoy(
            @RequestParam String fullname,
            @RequestParam String email,
            @RequestParam String password,
            @RequestParam Date dob,
            @RequestParam Long mobile,
            @RequestParam String address,
            @RequestParam("profile_image") MultipartFile profileImage) {
        System.err.println("LoginRegisterController.registerDeliveryBoy()");
        try {
            DelveryBoyDto deliveryDto = new DelveryBoyDto();
            deliveryDto.setFullName(fullname);
            deliveryDto.setEmail(email);
            deliveryDto.setPassword(password);
            deliveryDto.setDateofBirth(dob);
            deliveryDto.setPhonenumber(mobile);
            deliveryDto.setAddress(address);

            String result = authService.SaveDilveryBoy(deliveryDto, profileImage.getBytes());
            return ResponseEntity.ok().body("dilvery Boy registration successful: " + result);
        } catch (IOException e) {
            throw new RegistrationException("Failed to process profile image: " + e.getMessage());
        } catch (Exception e) {
            throw new RegistrationException("Delivery boy registration failed: " + e.getMessage());
        }
    }

   
}