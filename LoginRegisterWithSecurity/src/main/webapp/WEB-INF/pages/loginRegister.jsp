<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login & Registration</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v2.1.9/css/unicons.css">
    <!-- Leaflet CSS -->
    <link rel="stylesheet" href="https://unpkg.com/leaflet@1.7.1/dist/leaflet.css" />
    <style>
@import url('https://fonts.googleapis.com/css?family=Poppins:400,500,600,700,800,900');
body {
  font-family: 'Poppins', sans-serif;
  width: auto;
  height: auto;
  font-weight: 300;
  font-size: 15px;
  line-height: 1.7;
  color: #fff;
  background-image: url('/images/fitness-meal-in-a-diet-box-salmon-and-rice-picjumbo-com.jpeg');

  background-attachment: fixed;
  background-size: cover;
  background-repeat: no-repeat;
  background-position: center center;
  overflow-x: hidden;
  min-height: 100vh;
  display: flex;
  align-items: center;
  justify-content: center;
}

a { cursor: pointer; transition: all 200ms linear; }

a:hover { text-decoration: none; }

.link { color: #fff; }

.link:hover { 
     color: #12f8ad;
}

p { font-weight: 500; font-size: 14px; line-height: 1.7; }

h4 { font-weight: 600; }

h6 span{
    padding: 0 20px;
    text-transform: uppercase;
    font-weight: 700;
}
.section{
    position: relative;
    width: 100%;
    display: block;
}
.full-height{ min-height: 100vh; }

[type="checkbox"]:checked,
[type="checkbox"]:not(:checked){
    position: absolute;
    left: -9999px;
}
.checkbox:checked + label,
.checkbox:not(:checked) + label{
    position: relative;
    display: block;
    text-align: center;
    width: 60px;
    height: 16px;
    border-radius: 8px;
    padding: 0;
    margin: 10px auto;
    cursor: pointer;
    background-color: #ffffff;
}
.checkbox:checked + label:before,
.checkbox:not(:checked) + label:before{
    position: absolute;
    display: block;
    width: 36px;
    height: 36px;
    border-radius: 50%;
    color: #12f8ad;
    background-color: #2a2b38;
    font-family: 'unicons';
    content: '\eb4f';
    z-index: 20;
    top: -10px;
    left: -10px;
    line-height: 36px;
    text-align: center;
    font-size: 24px;
    transition: all 0.5s ease;
}
.checkbox:checked + label:before {
    transform: translateX(44px) rotate(-270deg);
}

/* Main container adjustments */
.card-3d-wrap {
    position: relative;
    width: 440px;
    max-width: 100%;
    height: 500px;
    -webkit-transform-style: preserve-3d;
    transform-style: preserve-3d;
    perspective: 800px;
    margin-top: 40px;
}

.card-3d-wrapper {
    width: 100%;
    height: 100%;
    position:absolute;    
    top: 0;
    left: 0;  
    -webkit-transform-style: preserve-3d;
    transform-style: preserve-3d;
    transition: all 600ms ease-out; 
}

.card-front, .card-back {
  width: 100%;
  height: 100%;
  background: rgba(255, 255, 255, 0.1);
  backdrop-filter: blur(5px);
  -webkit-backdrop-filter: blur(5px);
  position: absolute;
  border-radius: 6px;
  left: 0;
  top: 0;
  -webkit-transform-style: preserve-3d;
  transform-style: preserve-3d;
  backface-visibility: hidden;
  border: 1px solid rgba(255, 255, 255, 0.2);
  overflow-y: auto;
}

.card-back {
    transform: rotateY(180deg);
}
.checkbox:checked ~ .card-3d-wrap .card-3d-wrapper {
    transform: rotateY(180deg);
}

.center-wrap{
    position: relative;
    width: 100%;
    padding: 0 35px;
    top: 0;
    left: 0;
    transform: none;
    z-index: 20;
    display: block;
    min-height: 100%;
    box-sizing: border-box;
}

.card-front::-webkit-scrollbar,
.card-back::-webkit-scrollbar {
    width: 5px;
}

.card-front::-webkit-scrollbar-track,
.card-back::-webkit-scrollbar-track {
    background: rgba(255,255,255,0.1);
    border-radius: 10px;
}

.card-front::-webkit-scrollbar-thumb,
.card-back::-webkit-scrollbar-thumb {
    background: rgba(255,255,255,0.3);
    border-radius: 10px;
}

.card-front::-webkit-scrollbar-thumb:hover,
.card-back::-webkit-scrollbar-thumb:hover {
    background: rgba(255,255,255,0.5);
}

.form-group{ 
    position: relative;
    display: block;
    margin: 0;
    padding: 0;
}
.form-style {
    padding: 13px 20px;
    padding-left: 55px;
    height: 48px;
    width: 100%;
    font-weight: 500;
    border-radius: 4px;
    font-size: 14px;
    line-height: 22px;
    letter-spacing: 0.5px;
    outline: none;
    color: #9486e4;
    background-color: #1f2029;
    border: none;
    transition: all 200ms linear;
    box-shadow: 0 4px 8px 0 rgba(21,21,21,.2);
}
.form-style:focus,
.form-style:active {
    border: none;
    outline: none;
    box-shadow: 0 4px 8px 0 rgba(21,21,21,.2);
}

.input-icon {
    position: absolute;
    top: 0;
    left: 18px;
    height: 48px;
    font-size: 24px;
    line-height: 48px;
    text-align: left;
    color: #12f8ad;
    transition: all 200ms linear;
}

.role-form {
    display: none;
    margin-top: 20px;
    padding-bottom: 20px;
}

.btn{  
    border-radius: 4px;
    height: 44px;
    font-size: 13px;
    font-weight: 600;
    text-transform: uppercase;
    transition: all 200ms linear;
    padding: 0 30px;
    letter-spacing: 1px;
    display: inline-flex;
    align-items: center;
    justify-content: center;
    -ms-flex-pack: center;
    text-align: center;
    border: none;
    background-color: #283634;
    color: #fff;
    box-shadow: 0 8px 24px 0 rgba(18, 248, 173,.2);
}
.btn:active,
.btn:focus{  
  background-color: #fff;
  color: #12f8ad;
  box-shadow: 0 8px 24px 0 rgba(255,255,255,.2);
}
.btn:hover{  
  background-color: #fff;
  color:#0c0e0d;
  box-shadow: 0 8px 24px 0 rgba(255,255,255,.2);
}
.image-preview {
    width: 100px;
    height: 100px;
    border-radius: 50%;
    background-color: #1f2029;
    margin: 10px auto;
    overflow: hidden;
    display: flex;
    justify-content: center;
    align-items: center;
}

.image-preview img {
    max-width: 100%;
    max-height: 100%;
}

/* Map styles */
.map-container {
    height: 300px;
    width: 100%;
    margin: 15px 0;
    border-radius: 4px;
    overflow: hidden;
    background-color: #1f2029;
}

#map {
    height: 100%;
    width: 100%;
}

.location-buttons {
    display: flex;
    gap: 10px;
    margin-bottom: 10px;
}

.location-buttons .btn {
    flex: 1;
}

.modal {
    display: none;
    position: fixed;
    z-index: 1000;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0,0,0,0.7);
}

.modal-content {
    background-color: rgba(255,255,255,0.1);
    backdrop-filter: blur(10px);
    margin: 5% auto;
    padding: 20px;
    border: 1px solid rgba(255,255,255,0.2);
    width: 80%;
    max-width: 800px;
    border-radius: 8px;
    color: white;
}

.close-modal {
    color: #aaa;
    float: right;
    font-size: 28px;
    font-weight: bold;
    cursor: pointer;
}

.close-modal:hover {
    color: white;
}

.search-container {
    margin: 10px 0;
}

.search-container .form-style {
    padding-left: 20px;
}

.search-container .input-icon {
    display: none;
}

.password-error {
    color: #ff6b6b;
    font-size: 12px;
    margin-top: 5px;
    display: none;
}

/* Disabled button style */
.btn:disabled {
    background-color: #3a3f45;
    color: #aaa;
    box-shadow: none;
    cursor: not-allowed;
}

/* Password toggle */
.password-toggle {
    position: absolute;
    right: 15px;
    top: 12px;
    cursor: pointer;
    color: #777;
    z-index: 10;
}

.form-group.password-field {
    position: relative;
}

/* Form validation styling */
.valid {
    border-left: 3px solid #12f8ad !important;
}

.invalid {
    border-left: 3px solid #ff6b6b !important;
}







/* registraion successfull animation =============================== */

 /* Add this toast CSS to your existing styles */
        .toast-container {
            position: fixed;
            bottom: 30px;
            right: 30px;
            z-index: 9999;
            max-width: 350px;
            width: 100%;
        }

        .toast {
            display: none;
            position: relative;
            padding: 20px;
            margin-bottom: 15px;
            border-radius: 12px;
            background: linear-gradient(135deg, #ff9a9e 0%, #fad0c4 100%);
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.15);
            color: #fff;
            font-family: 'Poppins', sans-serif;
            overflow: hidden;
            transform: translateY(20px);
            opacity: 0;
            transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
        }

        .toast.show {
            display: block;
            transform: translateY(0);
            opacity: 1;
        }

        .toast::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: linear-gradient(135deg, rgba(255,255,255,0.1) 0%, rgba(255,255,255,0.05) 100%);
            z-index: -1;
        }

        .toast-header {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 10px;
        }

        .toast-title {
            font-weight: 600;
            font-size: 18px;
            display: flex;
            align-items: center;
        }

        .toast-title span {
            margin-right: 10px;
            font-size: 22px;
        }

        .toast-close {
            background: none;
            border: none;
            color: #fff;
            font-size: 20px;
            cursor: pointer;
            opacity: 0.7;
            transition: opacity 0.2s;
        }

        .toast-close:hover {
            opacity: 1;
        }

        .toast-body {
            font-size: 14px;
            line-height: 1.5;
        }




















    </style>
</head>
<body>
    <div class="section">
		<div class="container">
		    <div class="row full-height justify-content-center">
				<div class="col-12 text-center align-self-center py-5">
					<div class="section pb-5 pt-5 pt-sm-2 text-center">
						<h6 class="mb-0 pb-3"><span>Log In </span><span>Sign Up</span></h6>
			          	<input class="checkbox" type="checkbox" id="reg-log" name="reg-log"/>
			          	<label for="reg-log"></label>
						<div class="card-3d-wrap mx-auto">
							<div class="card-3d-wrapper">
							
							<div class="card-front">
  <div class="center-wrap">
    <div class="section text-center">
      <h4 class="mb-4 pb-3">Log In</h4>
      <form action="/api/auth/login" method="post">
        <!-- Email -->
        <div class="form-group">
          <input type="email" name="email" class="form-style" placeholder="Your Email" id="loginEmail" autocomplete="none" required>
          <i class="input-icon uil uil-at"></i>
        </div>

        <!-- Password -->
        <div class="form-group password-field mt-2">
          <input type="password" name="password" class="form-style" placeholder="Your Password" id="loginPassword" autocomplete="none" required>
          <i class="input-icon uil uil-lock-alt"></i>
          <span class="password-toggle" onclick="togglePassword('loginPassword', this)">👁️</span>
        </div>

        <!-- CAPTCHA -->
        <div class="form-group mt-3">
          <div style="display: flex; justify-content: space-between; align-items: center;">
            <input type="text" id="captchaText" readonly style="width: 50%; text-align: center; font-weight: bold; background: #f1f1f1; border: none; border-radius: 4px;">
            <button type="button" onclick="generateCaptcha()" style="margin-left: 10px;" class="btn btn-sm">↻</button>
          </div>
          <input type="text" id="captchaInput" class="form-style mt-2" placeholder="Enter CAPTCHA" required>
        </div>
        
        <!-- Submit Button -->
        <button type="submit" class="btn mt-4">Submit</button>
      </form>
      <!-- Forgot -->
      <p class="mb-0 mt-4 text-center">
        <a href="#0" class="link">FORGOT ACCOUNT DETAILS</a>
      </p>
    </div>
  </div>
</div>
<div class="card-back">
    <div class="center-wrap">
        <div class="section text-center">
            <h4 class="mb-4 pb-3">Sign Up</h4>
            
            <!-- Initial Registration Form -->
            <div id="initial-registration">
                <form id="basicInfoForm">
                    <div class="form-group">
                        <input type="text" name="fullname" class="form-style" placeholder="Your Full Name" id="signupFullname" autocomplete="none" required>
                        <i class="input-icon uil uil-user"></i>
                    </div>	
                    <div class="form-group mt-2">
                        <input type="email" name="email" class="form-style" placeholder="Your Email" id="signupEmail" autocomplete="none" required>
                        <i class="input-icon uil uil-at"></i>
                    </div>	
                    <div class="form-group password-field mt-2">
                        <input type="password" name="password" class="form-style" placeholder="Your Password" id="signupPassword" autocomplete="none" required>
                        <i class="input-icon uil uil-lock-alt"></i>
                        <span class="password-toggle" onclick="togglePassword('signupPassword', this)">👁️</span>
                    </div>
                    <div class="form-group password-field mt-2">
                        <input type="password" name="confirm_password" class="form-style" placeholder="Confirm Password" id="signupConfirmPassword" autocomplete="none" required>
                        <i class="input-icon uil uil-lock-alt"></i>
                        <span class="password-toggle" onclick="togglePassword('signupConfirmPassword', this)">👁️</span>
                    </div>
                    <div class="password-error" id="passwordError">Passwords do not match!</div>
                    
                    <!-- Role Selection Dropdown -->
                    <div class="form-group mt-3 role-selection">
                        <select id="roleSelect" class="form-style" required>
                            <option value="">Select Your Role</option>
                            <option value="chef">Chef</option>
                            <option value="kitchen">Kitchen</option>
                            <option value="customer">Customer</option>
                            <option value="delivery">Delivery Boy</option>
                        </select>
                        <i class="input-icon uil uil-user-md"></i>
                    </div>
                    
                    <button type="button" id="proceedBtn" class="btn mt-4" disabled>Proceed</button>
                </form>
            </div>
            
            <!-- Role-Specific Forms -->
            <div id="roleForms">
                <!-- Chef Form -->
                <div id="chefForm" class="role-form">
                    <form id="chefRegistrationForm" action="/api/auth/register/chef" method="Post" enctype="multipart/form-data">
                        <input type="hidden" name="fullname" id="chefFullname">
                        <input type="hidden" name="email" id="chefEmail">
                        <input type="hidden" name="password" id="chefPassword">
                        <input type="hidden" name="role" id="chefRole">
                        
                        <div class="image-preview" id="chefImagePreview">
                            <span>Profile Image</span>
                        </div>
                        <input type="file" id="chefImage" name="profile_image" accept="image/*" style="display: none;">
                        <button type="button" class="btn" onclick="document.getElementById('chefImage').click()">Upload Image</button>
                        
                        <div class="form-group mt-2">
                            <input type="text" name="speciality" class="form-style" placeholder="Speciality Cuisine" required>
                            <i class="input-icon uil uil-utensils"></i>
                        </div>
                        <div class="form-group mt-2">
                            <input type="number" name="experience" class="form-style" placeholder="Experience Years" required>
                            <i class="input-icon uil uil-clock"></i>
                        </div>
                        <div class="form-group mt-2">
                            <input type="text" name="city" class="form-style" placeholder="City" required>
                            <i class="input-icon uil uil-map-marker"></i>
                        </div>
                        <div class="form-group mt-2">
                            <input type="text" name="location" class="form-style" placeholder="Approx Location" required>
                            <i class="input-icon uil uil-location-point"></i>
                        </div>
                        <div class="form-group mt-2">
                            <input type="text" name="languages" class="form-style" placeholder="Languages Spoken" required>
                            <i class="input-icon uil uil-language"></i>
                        </div>
                        <div class="form-group mt-2">
                            <input type="text" name="availability" class="form-style" placeholder="Availability" required>
                            <i class="input-icon uil uil-calendar-alt"></i>
                        </div>
                        <div class="form-group mt-2">
                            <input type="number" name="hygiene_score" class="form-style" placeholder="Hygiene Score" step="0.1" min="0" max="5" required>
                            <i class="input-icon uil uil-shield"></i>
                        </div>
                        <div class="form-group mt-2">
                            <input type="text" name="certifications" class="form-style" placeholder="Certifications">
                            <i class="input-icon uil uil-award"></i>
                        </div>
                        
                        <!-- Location Section -->
                        <div class="location-section mt-3">
                            <h5>Location Details</h5>
                            <div class="location-buttons">
                                <button type="button" class="btn" onclick="getCurrentLocation('chef')">Use Current Location</button>
                                <button type="button" class="btn" onclick="showMap('chef')">Pick on Map</button>
                            </div>
                            <div class="form-group mt-2">
                                <input type="text" id="chefLatitude" name="latitude" class="form-style" placeholder="Latitude" readonly>
                                <i class="input-icon uil uil-map-pin-alt"></i>
                            </div>
                            <div class="form-group mt-2">
                                <input type="text" id="chefLongitude" name="longitude" class="form-style" placeholder="Longitude" readonly>
                                <i class="input-icon uil uil-map-pin-alt"></i>
                            </div>
                            <div id="chefMapContainer" class="map-container" style="display: none;">
                                <!-- Map will be loaded here -->
                            </div>
                        </div>
                        
                        <button type="submit" class="btn mt-4">Register as Chef</button>
                    </form>
                </div>
                
                <!-- Kitchen Form -->
                <div id="kitchenForm" class="role-form">
                    <form id="kitchenRegistrationForm" action="/api/auth/register/kitchen" method="post" enctype="multipart/form-data">
                        <input type="hidden" name="fullname" id="kitchenFullname">
                        <input type="hidden" name="email" id="kitchenEmail">
                        <input type="hidden" name="password" id="kitchenPassword">
                        <input type="hidden" name="role" id="kitchenRole">
                        
                        <div class="image-preview" id="kitchenImagePreview">
                            <span>Kitchen Image</span>
                        </div>
                        <input type="file" id="kitchenImage" name="kitchen_image" accept="image/*" style="display: none;">
                        <button type="button" class="btn" onclick="document.getElementById('kitchenImage').click()">Upload Image</button>
                        
                        <div class="form-group mt-2">
                            <input type="text" name="kitchen_name" class="form-style" placeholder="Kitchen Name" required>
                            <i class="input-icon uil uil-store"></i>
                        </div>
                        <div class="form-group mt-2">
                            <input type="text" name="address" class="form-style" placeholder="Address" required>
                            <i class="input-icon uil uil-location-point"></i>
                        </div>
                        <div class="form-group mt-2">
                            <input type="tel" name="phone" class="form-style" placeholder="Phone Number" required>
                            <i class="input-icon uil uil-phone"></i>
                        </div>
                        <div class="form-group mt-2">
                            <input type="number" name="rating" class="form-style" placeholder="Rating" step="0.1" min="0" max="5">
                            <i class="input-icon uil uil-star"></i>
                        </div>
                        
                        <!-- Location Section -->
                        <div class="location-section mt-3">
                            <h5>Location Details</h5>
                            <div class="location-buttons">
                                <button type="button" class="btn" onclick="getCurrentLocation('kitchen')">Use Current Location</button>
                                <button type="button" class="btn" onclick="showMap('kitchen')">Pick on Map</button>
                            </div>
                            <div class="form-group mt-2">
                                <input type="text" id="kitchenLatitude" name="latitude" class="form-style" placeholder="Latitude" readonly>
                                <i class="input-icon uil uil-map-pin-alt"></i>
                            </div>
                            <div class="form-group mt-2">
                                <input type="text" id="kitchenLongitude" name="longitude" class="form-style" placeholder="Longitude" readonly>
                                <i class="input-icon uil uil-map-pin-alt"></i>
                            </div>
                            <div id="kitchenMapContainer" class="map-container" style="display: none;">
                                <!-- Map will be loaded here -->
                            </div>
                        </div>
                        
                        <button type="submit" class="btn mt-4">Register Kitchen</button>
                    </form>
                </div>
                
                <!-- Customer Form -->
                <div id="customerForm" class="role-form">
                    <form id="customerRegistrationForm" action="/api/auth/register/customer" method="post" enctype="multipart/form-data">
                        <input type="hidden" name="fullname" id="customerFullname">
                        <input type="hidden" name="email" id="customerEmail">
                        <input type="hidden" name="password" id="customerPassword">
                        <input type="hidden" name="role" id="customerRole">
                        
                        <div class="image-preview" id="customerImagePreview">
                            <span>Profile Image</span>
                        </div>
                        <input type="file" id="customerImage" name="profile_image" accept="image/*" style="display: none;">
                        <button type="button" class="btn" onclick="document.getElementById('customerImage').click()">Upload Image</button>
                        
                        <div class="form-group mt-2">
                            <input type="tel" name="mobile" class="form-style" placeholder="Mobile Number" required>
                            <i class="input-icon uil uil-phone"></i>
                        </div>
                        <div class="form-group mt-2">
                            <input type="text" name="address" class="form-style" placeholder="Address" required>
                            <i class="input-icon uil uil-location-point"></i>
                        </div>
                        
                        <!-- Location Section -->
                        <div class="location-section mt-3">
                            <h5>Location Details</h5>
                            <div class="location-buttons">
                                <button type="button" class="btn" onclick="getCurrentLocation('customer')">Use Current Location</button>
                                <button type="button" class="btn" onclick="showMap('customer')">Pick on Map</button>
                            </div>
                            <div class="form-group mt-2">
                                <input type="text" id="customerLatitude" name="latitude" class="form-style" placeholder="Latitude" readonly>
                                <i class="input-icon uil uil-map-pin-alt"></i>
                            </div>
                            <div class="form-group mt-2">
                                <input type="text" id="customerLongitude" name="longitude" class="form-style" placeholder="Longitude" readonly>
                                <i class="input-icon uil uil-map-pin-alt"></i>
                            </div>
                            <div id="customerMapContainer" class="map-container" style="display: none;">
                                <!-- Map will be loaded here -->
                            </div>
                        </div>
                        
                        <button type="submit" class="btn mt-4">Register as Customer</button>
                    </form>
                </div>
                
                <!-- Delivery Boy Form -->
                <div id="deliveryForm" class="role-form">
                    <form id="deliveryRegistrationForm" action="/api/auth/register/delivery" method="post" enctype="multipart/form-data">
                        <input type="hidden" name="fullname" id="deliveryFullname">
                        <input type="hidden" name="email" id="deliveryEmail">
                        <input type="hidden" name="password" id="deliveryPassword">
                        <input type="hidden" name="role" id="deliveryRole">
                        
                        <div class="image-preview" id="deliveryImagePreview">
                            <span>Profile Image</span>
                        </div>
                        <input type="file" id="deliveryImage" name="profile_image" accept="image/*" style="display: none;">
                        <button type="button" class="btn" onclick="document.getElementById('deliveryImage').click()">Upload Image</button>
                        
                        <div class="form-group mt-2">
                            <input type="date" name="dob" class="form-style" placeholder="Date of Birth" required>
                            <i class="input-icon uil uil-calendar-alt"></i>
                        </div>
                        <div class="form-group mt-2">
                            <input type="tel" name="mobile" class="form-style" placeholder="Mobile Number" required>
                            <i class="input-icon uil uil-phone"></i>
                        </div>
                        <div class="form-group mt-2">
                            <input type="text" name="address" class="form-style" placeholder="Address" required>
                            <i class="input-icon uil uil-location-point"></i>
                        </div>
                        
                        <button type="submit" class="btn mt-4">Register as Delivery Boy</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
			      			</div>
			      		</div>
			      	</div>
		      	</div>
	      	</div>
	    </div>
	</div>
	
	<!-- Map Modal -->
	<div id="mapModal" class="modal">
        <div class="modal-content">
            <span class="close-modal" onclick="closeMapModal()">&times;</span>
            <h3>Select Your Location</h3>
            <div id="map" class="map-container"></div>
            <div class="search-container">
                <input type="text" id="locationSearch" class="form-style" placeholder="Search for a location">
            </div>
            <button onclick="confirmLocation()" class="btn mt-2">Confirm Location</button>
        </div>
    </div>
    
    
    <div class="toast-container">
        <div class="toast" id="registrationToast">
            <div class="toast-header">
                <div class="toast-title">
                    <span>🥗</span>
                    <span>Registration Successful</span>
                </div>
                <button class="toast-close" onclick="hideToast()">&times;</button>
            </div>
            <div class="toast-body" id="toastMessage">
                Your account has been created successfully!
            </div>
        </div>
    </div>
    
    
    <!-- Leaflet JS -->
    <script src="https://unpkg.com/leaflet@1.7.1/dist/leaflet.js"></script>
    <!-- OpenRouteService JS -->
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
    
    <script>
        // Global variables
        let map;
        let marker;
        let currentRoleForMap = '';
        const ORS_API_KEY = 'eyJvcmciOiI1YjNjZTM1OTc4NTExMTAwMDFjZjYyNDgiLCJpZCI6IjdkMDQ4MGUyNGI5YTQ4NjA4MTU0ZTI0MjVkYjVmNDZkIiwiaCI6Im11cm11cjY0In0=';
        
        // Initialize when DOM is loaded
        document.addEventListener("DOMContentLoaded", function () {
            // CAPTCHA functionality
            let currentCaptcha = "";
            
            window.generateCaptcha = function () {
                const chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
                let captcha = "";
                for (let i = 0; i < 6; i++) {
                    captcha += chars.charAt(Math.floor(Math.random() * chars.length));
                }
                currentCaptcha = captcha;
                const captchaTextEl = document.getElementById("captchaText");
                if (captchaTextEl) {
                    captchaTextEl.value = captcha;
                }
            };
            
            // Password validation
            function validatePassword() {
                const password = document.getElementById('signupPassword').value;
                const confirmPassword = document.getElementById('signupConfirmPassword').value;
                const errorElement = document.getElementById('passwordError');
                
                if (password !== confirmPassword) {
                    errorElement.style.display = 'block';
                    return false;
                } else {
                    errorElement.style.display = 'none';
                    return true;
                }
            }
            
            // Toggle password visibility
            window.togglePassword = function(fieldId, element) {
                const field = document.getElementById(fieldId);
                if (field.type === "password") {
                    field.type = "text";
                    element.textContent = "👁️‍🗨️";
                } else {
                    field.type = "password";
                    element.textContent = "👁️";
                }
            };
            
            // Form validation for proceed button
            function validateForm() {
                const fullname = document.getElementById('signupFullname').value;
                const email = document.getElementById('signupEmail').value;
                const password = document.getElementById('signupPassword').value;
                const confirmPassword = document.getElementById('signupConfirmPassword').value;
                const role = document.getElementById('roleSelect').value;
                
                const isPasswordValid = validatePassword();
                const isFormFilled = fullname && email && password && confirmPassword && role;
                
                // Enable/disable proceed button
                document.getElementById('proceedBtn').disabled = !(isFormFilled && isPasswordValid);
                
                // Add visual feedback
                document.getElementById('signupFullname').classList.toggle('valid', fullname);
                document.getElementById('signupEmail').classList.toggle('valid', email);
                document.getElementById('signupPassword').classList.toggle('valid', password && isPasswordValid);
                document.getElementById('signupConfirmPassword').classList.toggle('valid', confirmPassword && isPasswordValid);
                document.getElementById('roleSelect').classList.toggle('valid', role);
                
                if (password && !isPasswordValid) {
                    document.getElementById('signupPassword').classList.add('invalid');
                    document.getElementById('signupConfirmPassword').classList.add('invalid');
                } else {
                    document.getElementById('signupPassword').classList.remove('invalid');
                    document.getElementById('signupConfirmPassword').classList.remove('invalid');
                }
            }
            
            // Initialize CAPTCHA
            generateCaptcha();
            
            // Add event listeners for form validation
            document.getElementById('signupFullname').addEventListener('input', validateForm);
            document.getElementById('signupEmail').addEventListener('input', validateForm);
            document.getElementById('signupPassword').addEventListener('input', validateForm);
            document.getElementById('signupConfirmPassword').addEventListener('input', validateForm);
            document.getElementById('roleSelect').addEventListener('change', validateForm);
            
            // Image Preview Handlers
            document.getElementById('chefImage').addEventListener('change', function(e) {
                const preview = document.getElementById('chefImagePreview');
                const file = e.target.files[0];
                if (file) {
                    const reader = new FileReader();
                    reader.onload = function(e) {
                        preview.innerHTML = '<img src="' + e.target.result + '" alt="Chef Profile">';
                    };
                    reader.readAsDataURL(file);
                }
            });
            
            document.getElementById('kitchenImage').addEventListener('change', function(e) {
                const preview = document.getElementById('kitchenImagePreview');
                const file = e.target.files[0];
                if (file) {
                    const reader = new FileReader();
                    reader.onload = function(e) {
                        preview.innerHTML = '<img src="' + e.target.result + '" alt="Kitchen Image">';
                    };
                    reader.readAsDataURL(file);
                }
            });
            
            document.getElementById('customerImage').addEventListener('change', function(e) {
                const preview = document.getElementById('customerImagePreview');
                const file = e.target.files[0];
                if (file) {
                    const reader = new FileReader();
                    reader.onload = function(e) {
                        preview.innerHTML = '<img src="' + e.target.result + '" alt="Customer Profile">';
                    };
                    reader.readAsDataURL(file);
                }
            });
            
            document.getElementById('deliveryImage').addEventListener('change', function(e) {
                const preview = document.getElementById('deliveryImagePreview');
                const file = e.target.files[0];
                if (file) {
                    const reader = new FileReader();
                    reader.onload = function(e) {
                        preview.innerHTML = '<img src="' + e.target.result + '" alt="Delivery Profile">';
                    };
                    reader.readAsDataURL(file);
                }
            });
            
            // Proceed Button Handler
            document.getElementById('proceedBtn').addEventListener('click', function() {
                const role = document.getElementById('roleSelect').value;
                const fullname = document.getElementById('signupFullname').value;
                const email = document.getElementById('signupEmail').value;
                const password = document.getElementById('signupPassword').value;
                
                // Validate inputs
                if (!role) {
                    alert('Please select a role');
                    return;
                }
                
                if (!validatePassword()) {
                    return;
                }
                
                // Populate all role forms' hidden fields
                const roles = ['chef', 'kitchen', 'customer', 'delivery'];
                roles.forEach(r => {
                    document.getElementById(r + 'Fullname').value = fullname;
                    document.getElementById(r + 'Email').value = email;
                    document.getElementById(r + 'Password').value = password;
                    document.getElementById(r + 'Role').value = r;
                });
                
                // UI Updates
                document.getElementById('initial-registration').style.display = 'none';
                document.querySelectorAll('.role-form').forEach(form => {
                    form.style.display = 'none';
                });
                document.getElementById(role + 'Form').style.display = 'block';
                document.querySelector('.card-back').scrollTop = 0;
            });
            
            // Initialize map modal close button
            document.querySelector('.close-modal').addEventListener('click', closeMapModal);
            
            // Close modal when clicking outside
            window.addEventListener('click', function(event) {
                if (event.target === document.getElementById('mapModal')) {
                    closeMapModal();
                }
            });
            
            // Initialize the map
            initMap();
        });

        // Initialize Leaflet map
        function initMap() {
            // Create a basic map centered on the world
            map = L.map('map').setView([20, 0], 2);
            
            // Add OpenStreetMap tiles
            L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
                attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
            }).addTo(map);
            
            // Initialize marker
            marker = L.marker([0, 0], {
                draggable: true
            }).addTo(map);
            
            // Add search control using OpenRouteService
            const searchControl = L.Control.geocoder({
                position: 'topright',
                geocoder: L.Control.Geocoder.nominatim(),
                defaultMarkGeocode: false
            }).on('markgeocode', function(e) {
                const center = e.geocode.center;
                map.setView(center, 15);
                marker.setLatLng(center);
            }).addTo(map);
            
            // Add click event to place marker
            map.on('click', function(e) {
                marker.setLatLng(e.latlng);
            });
        }

        // Get current location with high accuracy
        function getCurrentLocation(role) {
            if (navigator.geolocation) {
                const options = {
                    enableHighAccuracy: true,
                    timeout: 10000,
                    maximumAge: 0
                };
                
                navigator.geolocation.getCurrentPosition(
                    function(position) {
                        const lat = position.coords.latitude;
                        const lng = position.coords.longitude;
                        document.getElementById(role + 'Latitude').value = lat.toFixed(6);
                        document.getElementById(role + 'Longitude').value = lng.toFixed(6);
                        
                        // Reverse geocode to get address
                        reverseGeocode(lat, lng, role);
                        
                        alert('Accurate location captured successfully!');
                    },
                    function(error) {
                        let errorMessage = 'Error getting location: ';
                        switch(error.code) {
                            case error.PERMISSION_DENIED:
                                errorMessage += "User denied the request for Geolocation.";
                                break;
                            case error.POSITION_UNAVAILABLE:
                                errorMessage += "Location information is unavailable.";
                                break;
                            case error.TIMEOUT:
                                errorMessage += "The request to get user location timed out.";
                                break;
                            case error.UNKNOWN_ERROR:
                                errorMessage += "An unknown error occurred.";
                                break;
                        }
                        alert(errorMessage);
                    },
                    options
                );
            } else {
                alert('Geolocation is not supported by this browser.');
            }
        }

        // Reverse geocode using OpenRouteService
        function reverseGeocode(lat, lng, role) {
            const url = `https://api.openrouteservice.org/geocode/reverse?api_key=${ORS_API_KEY}&point.lon=${lng}&point.lat=${lat}`;
            
            axios.get(url)
                .then(response => {
                    const address = response.data.features[0]?.properties?.label;
                    if (address) {
                        // Update the address field if it exists for this role
                        const addressField = document.querySelector(`#${role}Form input[name="address"]`);
                        if (addressField && !addressField.value) {
                            addressField.value = address;
                        }
                    }
                })
                .catch(error => {
                    console.error('Reverse geocoding error:', error);
                });
        }

        // Show map modal
        function showMap(role) {
            currentRoleForMap = role;
            document.getElementById('mapModal').style.display = 'block';
            
            // Try to center the map on the user's current location if available
            if (navigator.geolocation) {
                navigator.geolocation.getCurrentPosition(
                    function(position) {
                        const lat = position.coords.latitude;
                        const lng = position.coords.longitude;
                        map.setView([lat, lng], 15);
                        marker.setLatLng([lat, lng]);
                    },
                    function() {
                        // Default to a central location if geolocation fails
                        map.setView([20, 0], 2);
                    }
                );
            }
        }

        function closeMapModal() {
            document.getElementById('mapModal').style.display = 'none';
        }

        function confirmLocation() {
            const latLng = marker.getLatLng();
            document.getElementById(currentRoleForMap + 'Latitude').value = latLng.lat.toFixed(6);
            document.getElementById(currentRoleForMap + 'Longitude').value = latLng.lng.toFixed(6);
            
            // Reverse geocode to get address
            reverseGeocode(latLng.lat, latLng.lng, currentRoleForMap);
            
            closeMapModal();
            alert('Location selected successfully!');
        }
        
        
        
        
        
        
        
        
        
        
        
        
        
      /*   registraion java script =====================================*/
        
        
        
        
         // Toast notification functions
        function showToast(message) {
            const toast = document.getElementById('registrationToast');
            const toastMessage = document.getElementById('toastMessage');
            
            // Set the message from backend
            if (message) {
                toastMessage.textContent = message;
            }
            
            // Show the toast with animation
            toast.classList.add('show');
            
            // Auto-hide after 4 seconds
            setTimeout(hideToast, 4000);
        }

        function hideToast() {
            const toast = document.getElementById('registrationToast');
            toast.classList.remove('show');
        }

        // Customer Registration Form
        document.getElementById('customerRegistrationForm').addEventListener('submit', function(e) {
            e.preventDefault();
            
            const formData = new FormData(this);
            
            fetch('/api/auth/register/customer', {
                method: 'POST',
                body: formData
            })
            .then(response => {
                if (!response.ok) {
                    throw new Error('Registration failed');
                }
                return response.text();
            })
            .then(message => {
                showToast(message);
                // Optional: Reset form or redirect
                // this.reset();
            })
            .catch(error => {
                console.error('Error:', error);
                alert('Registration failed: ' + error.message);
            });
        });

        // Chef Registration Form
        document.getElementById('chefRegistrationForm').addEventListener('submit', function(e) {
            e.preventDefault();
            
            const formData = new FormData(this);
            
            fetch('/api/auth/register/chef', {
                method: 'POST',
                body: formData
            })
            .then(response => {
                if (!response.ok) {
                    throw new Error('Registration failed');
                }
                return response.text();
            })
            .then(message => {
                showToast(message);
                // Optional: Reset form or redirect
                // this.reset();
            })
            .catch(error => {
                console.error('Error:', error);
                alert('Registration failed: ' + error.message);
            });
        });

        // Kitchen Registration Form
        document.getElementById('kitchenRegistrationForm').addEventListener('submit', function(e) {
            e.preventDefault();
            
            const formData = new FormData(this);
            
            fetch('/api/auth/register/kitchen', {
                method: 'POST',
                body: formData
            })
            .then(response => {
                if (!response.ok) {
                    throw new Error('Registration failed');
                }
                return response.text();
            })
            .then(message => {
                showToast(message);
                // Optional: Reset form or redirect
                // this.reset();
            })
            .catch(error => {
                console.error('Error:', error);
                alert('Registration failed: ' + error.message);
            });
        });

        // Delivery Registration Form
        document.getElementById('deliveryRegistrationForm').addEventListener('submit', function(e) {
            e.preventDefault();
            
            const formData = new FormData(this);
            
            fetch('/api/auth/register/delivery', {
                method: 'POST',
                body: formData
            })
            .then(response => {
                if (!response.ok) {
                    throw new Error('Registration failed');
                }
                return response.text();
            })
            .then(message => {
                showToast(message);
                setTimeout(() => {
                    window.location.href = '/dashboard'; // Redirect after delay
                }, 6000);
            })
            .catch(error => {
                console.error('Error:', error);
                alert('Registration failed: ' + error.message);
            });
        });

        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
    </script>
</body>
</html>