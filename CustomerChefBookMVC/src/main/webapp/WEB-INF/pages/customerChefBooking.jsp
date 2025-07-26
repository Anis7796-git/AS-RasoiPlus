<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Premium Chef Booking</title>
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary: #FF6B6B;
            --primary-dark: #E55C5C;
            --secondary: #FFA502;
            --dark: #2F3542;
            --light: #F1F2F6;
            --success: #4BB543;
            --glass: rgba(255, 255, 255, 0.85);
        }
        
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: 'Poppins', sans-serif;
            background: url('https://images.unsplash.com/photo-1547592180-85f173990554?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80') no-repeat center center fixed;
            background-size: cover;
            min-height: 100vh;
            color: var(--dark);
            display: flex;
            flex-direction: column;
            overflow-x: hidden;
        }
        
        .glass-container {
            background: var(--glass);
            backdrop-filter: blur(10px);
            -webkit-backdrop-filter: blur(10px);
            border-radius: 20px;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
            border: 1px solid rgba(255, 255, 255, 0.18);
            overflow: hidden;
            transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.1);
        }
        
        .glass-container:hover {
            transform: translateY(-5px);
            box-shadow: 0 12px 40px rgba(0, 0, 0, 0.15);
        }
        
        .hero-section {
            height: 40vh;
            display: flex;
            align-items: center;
            justify-content: center;
            position: relative;
            margin-bottom: 3rem;
            background: linear-gradient(135deg, rgba(255, 107, 107, 0.9) 0%, rgba(255, 165, 2, 0.9) 100%);
            clip-path: polygon(0 0, 100% 0, 100% 85%, 0 100%);
        }
        
        .hero-content {
            text-align: center;
            color: white;
            position: relative;
            z-index: 2;
            padding: 2rem;
        }
        
        .hero-title {
            font-size: 3.5rem;
            font-weight: 700;
            margin-bottom: 1rem;
            text-shadow: 2px 2px 8px rgba(0, 0, 0, 0.2);
        }
        
        .hero-subtitle {
            font-size: 1.2rem;
            font-weight: 300;
            max-width: 700px;
            margin: 0 auto;
        }
        
        .form-section {
            padding: 3rem 0;
        }
        
        .form-header {
            background: linear-gradient(to right, var(--primary), var(--secondary));
            color: white;
            padding: 1.5rem;
            font-weight: 600;
            display: flex;
            align-items: center;
            gap: 12px;
            border-radius: 15px 15px 0 0 !important;
        }
        
        .form-body {
            padding: 2.5rem;
        }
        
        .form-label {
            font-weight: 500;
            margin-bottom: 0.5rem;
            display: flex;
            align-items: center;
            gap: 8px;
        }
        
        .form-control, .form-select {
            border-radius: 12px;
            padding: 14px 16px;
            border: 1px solid rgba(0, 0, 0, 0.1);
            background: rgba(255, 255, 255, 0.8);
            transition: all 0.3s ease;
        }
        
        .form-control:focus, .form-select:focus {
            border-color: var(--primary);
            box-shadow: 0 0 0 0.25rem rgba(255, 107, 107, 0.2);
            background: white;
            transform: translateY(-2px);
        }
        
        .input-group-text {
            background: rgba(255, 255, 255, 0.8);
            border: 1px solid rgba(0, 0, 0, 0.1);
            border-right: none;
            font-weight: 500;
        }
        
        .btn-primary {
            background: linear-gradient(to right, var(--primary), var(--secondary));
            border: none;
            padding: 14px 28px;
            font-weight: 600;
            border-radius: 12px;
            color: white;
            transition: all 0.4s ease;
            position: relative;
            overflow: hidden;
            width: 100%;
            margin-top: 1rem;
            box-shadow: 0 4px 15px rgba(255, 107, 107, 0.3);
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }
        
        .btn-primary:hover {
            background: linear-gradient(to right, var(--primary-dark), var(--secondary));
            transform: translateY(-3px);
            box-shadow: 0 6px 20px rgba(255, 107, 107, 0.4);
        }
        
        .btn-primary:active {
            transform: translateY(0);
        }
        
        .btn-primary::before {
            content: "";
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.2), transparent);
            transition: 0.5s;
        }
        
        .btn-primary:hover::before {
            left: 100%;
        }
        
        .icon-highlight {
            color: var(--primary);
            transition: all 0.3s ease;
        }
        
        .form-floating>label {
            padding: 1rem 1.5rem;
        }
        
        .success-message {
            display: none;
            background: var(--success);
            color: white;
            padding: 1.5rem;
            border-radius: 12px;
            text-align: center;
            margin-top: 2rem;
            animation: fadeInUp 0.6s ease;
        }
        
        .btn-home {
            background: white;
            color: var(--primary);
            border: 2px solid white;
            padding: 10px 25px;
            font-weight: 600;
            border-radius: 8px;
            margin-top: 1.5rem;
            transition: all 0.3s ease;
        }
        
        .btn-home:hover {
            background: transparent;
            color: white;
        }
        
        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
        
        .floating-icon {
            position: absolute;
            right: 16px;
            top: 50%;
            transform: translateY(-50%);
            color: var(--primary);
            opacity: 0.7;
            transition: all 0.3s ease;
        }
        
        .form-control:focus ~ .floating-icon {
            opacity: 1;
            transform: translateY(-50%) scale(1.1);
        }
        
        .price-display {
            font-weight: 600;
            font-size: 1.1rem;
            color: var(--primary);
        }
        
        .transport-note {
            display: inline-flex;
            align-items: center;
            background: rgba(255, 107, 107, 0.1);
            color: var(--primary-dark);
            padding: 4px 12px;
            border-radius: 20px;
            font-size: 0.85rem;
            margin-left: 10px;
            border: 1px dashed var(--primary);
        }
        
        .transport-note i {
            margin-right: 5px;
            font-size: 0.9rem;
        }
        
        .price-breakdown {
            display: flex;
            gap: 8px;
            margin-top: 8px;
            font-size: 0.85rem;
            color: #666;
            flex-wrap: wrap;
        }
        
        .price-breakdown span {
            background: rgba(0, 0, 0, 0.05);
            padding: 2px 8px;
            border-radius: 4px;
        }
        
        .price-breakdown .total {
            font-weight: 600;
            color: var(--primary);
        }
        
        @media (max-width: 992px) {
            .hero-title {
                font-size: 2.8rem;
            }
            
            .form-body {
                padding: 1.5rem;
            }
        }
        
        @media (max-width: 768px) {
            .hero-title {
                font-size: 2.2rem;
            }
            
            .hero-subtitle {
                font-size: 1rem;
            }
            
            .form-header {
                padding: 1rem;
            }
            
            .transport-note {
                display: block;
                margin-left: 0;
                margin-top: 5px;
            }
        }
        
        /* Custom checkbox */
        .form-check-input:checked {
            background-color: var(--primary);
            border-color: var(--primary);
        }
        
        /* Floating labels animation */
        .form-floating>.form-control:not(:placeholder-shown)~label {
            transform: scale(0.85) translateY(-0.5rem) translateX(0.15rem);
            color: var(--primary);
        }
        
        /* Animated border for focus */
        .input-group:focus-within {
            position: relative;
        }
        
        .input-group:focus-within::after {
            content: '';
            position: absolute;
            top: -2px;
            left: -2px;
            right: -2px;
            bottom: -2px;
            border: 2px solid var(--primary);
            border-radius: 14px;
            pointer-events: none;
            animation: borderPulse 2s infinite;
            z-index: 5;
        }
        
        @keyframes borderPulse {
            0% { opacity: 0.7; }
            50% { opacity: 0.3; }
            100% { opacity: 0.7; }
        }
    </style>
</head>
<body>
    <!-- Hero Section -->
    <section class="hero-section">
        <div class="hero-content">
            <h1 class="hero-title">Book Your Personal Chef</h1>
            <p class="hero-subtitle">Experience gourmet dining in the comfort of your home with our professional chef services</p>
        </div>
    </section>
    
    <!-- Booking Form Section -->
    <section class="form-section container">
        <div class="row justify-content-center">
            <div class="col-lg-8">
                <div class="glass-container">
                    <div class="form-header">
                        <i class="bi bi-journal-text" style="font-size: 1.5rem;"></i>
                        <h2 class="mb-0">Chef Booking Details</h2>
                    </div>
                    <div class="form-body">
                        <form id="chefBookingForm" action="/bookchef" method="POST" novalidate>
                            <!-- Hidden fields -->
                            <input type="hidden" id="chefId" name="chefId" value="123">
                            <input type="hidden" id="customerid" name="customerid" value="456">
                            
                            <div class="row g-4">
                                <!-- Recipe Field -->
                                <div class="col-md-6">
                                    <label for="recipe" class="form-label">
                                        <i class="bi bi-journal-bookmark-fill icon-highlight"></i>Recipe
                                    </label>
                                    <div class="input-group">
                                        <input type="text" class="form-control" id="recipe" name="recipe" placeholder="Enter recipe name" required>
                                        <span class="floating-icon"><i class="bi bi-egg-fried"></i></span>
                                    </div>
                                    <div class="invalid-feedback">
                                        Please provide a recipe name.
                                    </div>
                                </div>
                                
                                <!-- Number of People -->
                                <div class="col-md-6">
                                    <label for="people" class="form-label">
                                        <i class="bi bi-people-fill icon-highlight"></i>Number of Guests
                                    </label>
                                    <input type="number" class="form-control" id="people" name="people" min="1" value="2" required>
                                    <div class="invalid-feedback">
                                        Minimum 1 guest required.
                                    </div>
                                </div>
                                
                                <!-- Deadline -->
                                <div class="col-md-6">
                                    <label for="deadline" class="form-label">
                                        <i class="bi bi-clock-fill icon-highlight"></i>Event Date & Time
                                    </label>
                                    <input type="datetime-local" class="form-control" id="deadline" name="deadline" required>
                                    <div class="invalid-feedback">
                                        Please select a date and time.
                                    </div>
                                </div>
                                
                                <!-- Location -->
                                <div class="col-md-6">
                                    <label for="location" class="form-label">
                                        <i class="bi bi-geo-alt-fill icon-highlight"></i>Service Location
                                    </label>
                                    <div class="input-group">
                                        <input type="text" class="form-control" id="location" name="location" placeholder="Delivery location" required>
                                        <span class="floating-icon"><i class="bi bi-house-door"></i></span>
                                    </div>
                                    <div class="invalid-feedback">
                                        Please provide a service location.
                                    </div>
                                </div>
                                
                                <!-- Phone Number -->
                                <div class="col-md-6">
                                    <label for="customerNumber" class="form-label">
                                        <i class="bi bi-telephone-fill icon-highlight"></i>Contact Number
                                    </label>
                                    <input type="tel" class="form-control" id="customerNumber" name="customerNumber" pattern="[0-9]{10,15}" required>
                                    <div class="invalid-feedback">
                                        Please provide a valid phone number (10-15 digits).
                                    </div>
                                </div>
                                
                                <!-- Price (Auto-calculated) -->
                                <div class="col-12">
                                    <div class="d-flex flex-wrap align-items-center mb-2">
                                        <label for="price" class="form-label mb-0">
                                            <i class="bi bi-cash-stack icon-highlight"></i>Total Price
                                        </label>
                                        <span class="transport-note">
                                            <i class="bi bi-info-circle"></i>Includes transport costs
                                        </span>
                                    </div>
                                    <div class="input-group">
                                        <span class="input-group-text">₹</span>
                                        <input type="number" class="form-control price-display" id="price" name="price" readonly>
                                        <span class="input-group-text bg-success text-white">AUTO-CALCULATED</span>
                                    </div>
                                    <div class="price-breakdown">
                                        <span id="basePriceText">Base: ₹200</span>
                                        <span>+</span>
                                        <span id="transportPriceText">Transport: ₹0</span>
                                        <span>=</span>
                                        <span class="total" id="totalPriceText">Total: ₹200</span>
                                    </div>
                                </div>
                                
                                <!-- Submit Button -->
                                <div class="col-12 mt-4">
                                    <button class="btn btn-primary" type="submit">
                                        <i class="bi bi-check-circle-fill me-2"></i>Confirm Booking
                                    </button>
                                </div>
                            </div>
                        </form>
                        
                        <div id="successMessage" class="success-message">
                            <i class="bi bi-check-circle-fill me-2" style="font-size: 1.5rem;"></i>
                            <h4 class="mb-2">Booking Confirmed!</h4>
                            <p class="mb-0">Our chef will contact you shortly to finalize the details.</p>
                            <button class="btn btn-home" id="homeButton">
                                <i class="bi bi-house-door me-2"></i>Return Home
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Bootstrap 5 JS Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    
  <script>
    document.addEventListener('DOMContentLoaded', function() {
        // Set default deadline to tomorrow at 6 PM
        const tomorrow = new Date();
        tomorrow.setDate(tomorrow.getDate() + 1);
        tomorrow.setHours(18, 0, 0, 0);
        document.getElementById('deadline').value = tomorrow.toISOString().slice(0, 16);
        
        // Get form elements
        const form = document.getElementById('chefBookingForm');
        const successMessage = document.getElementById('successMessage');
        const peopleInput = document.getElementById('people');
        const priceInput = document.getElementById('price');
        const homeButton = document.getElementById('homeButton');
        
        // Calculate initial price
        calculatePrice();
        
        // Event listeners for live price calculation
        peopleInput.addEventListener('input', calculatePrice);
        
        // Home button event listener
        homeButton.addEventListener('click', function() {
            window.location.href = '/'; // Redirect to home page
        });
        
        // Price calculation function
        function calculatePrice() {
            const people = parseInt(peopleInput.value) || 0;
            const transport = 0; // Fixed transport cost
            let basePrice = 0;
            
            if (people < 5) {
                basePrice = 200;
            } else if (people >= 5 && people < 10) {
                basePrice = 300;
            } else {
                basePrice = people * 50;
            }
            
            const totalPrice = basePrice + transport;
            priceInput.value = totalPrice.toFixed(2);
            
            // Update price breakdown
            document.getElementById('basePriceText').textContent = `Base: ₹${basePrice.toFixed(2)}`;
            document.getElementById('transportPriceText').textContent = `Transport: ₹`;
            document.getElementById('totalPriceText').textContent = `Total: ₹${totalPrice.toFixed(2)} + Transport Charge`;
        }
        
        // Form submission handler - UPDATED to properly submit to backend
        form.addEventListener('submit', async function(event) {
            event.preventDefault();
            
            if (!form.checkValidity()) {
                event.stopPropagation();
                form.classList.add('was-validated');
                return;
            }
            
            try {
                // Disable submit button to prevent multiple submissions
                const submitButton = form.querySelector('button[type="submit"]');
                submitButton.disabled = true;
                submitButton.innerHTML = '<span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span> Processing...';
                
                // Create form data object
                const formData = new FormData(form);
                
                // Convert to JSON
                const jsonData = {};
                formData.forEach((value, key) => {
                    jsonData[key] = value;
                });
                
                // Send data to server
                const response = await fetch('/bookchef', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json',
                        'X-Requested-With': 'XMLHttpRequest'
                    },
                    body: JSON.stringify(jsonData)
                });
                
                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }
                
                // Show success message
                form.style.display = 'none';
                successMessage.style.display = 'block';
                successMessage.scrollIntoView({ behavior: 'smooth' });
                
            } catch (error) {
                console.error('Error submitting form:', error);
                alert('There was an error submitting your booking. Please try again.');
                
                // Re-enable submit button
                const submitButton = form.querySelector('button[type="submit"]');
                submitButton.disabled = false;
                submitButton.innerHTML = '<i class="bi bi-check-circle-fill me-2"></i>Confirm Booking';
            }
        });
        
        // Add animation to form controls on focus
        const formControls = document.querySelectorAll('.form-control, .form-select');
        formControls.forEach(control => {
            control.addEventListener('focus', function() {
                const icon = this.parentElement.querySelector('.icon-highlight');
                if (icon) {
                    icon.style.transform = 'scale(1.2)';
                    icon.style.color = 'var(--primary-dark)';
                }
            });
            
            control.addEventListener('blur', function() {
                const icon = this.parentElement.querySelector('.icon-highlight');
                if (icon) {
                    icon.style.transform = 'scale(1)';
                    icon.style.color = 'var(--primary)';
                }
            });
        });
    });
</script>
</body>
</html>