<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Anhee Chef Dashboard</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <!-- Animate.css -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">
    <style>
        :root {
            --chef-primary: #FF6B6B;
            --chef-secondary: #4ECDC4;
            --chef-dark: #292F36;
            --chef-light: #F7FFF7;
            --chef-accent: #FFE66D;
        }
        
        body {
            background-color: #f8f9fa;
            font-family: 'Poppins', sans-serif;
        }
        
        .chef-header {
            background: linear-gradient(135deg, #2c3e50 0%, #4ca1af 100%);
            color: white;
            padding: 1.5rem 0;
            margin-bottom: 2rem;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
        }
        
        .chef-logo {
            width: 60px;
            height: 60px;
            background-color: white;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 15px;
        }
        
        .chef-logo i {
            color: var(--chef-primary);
            font-size: 1.8rem;
        }
        
        .welcome-card {
            background: white;
            border-radius: 15px;
            border-left: 5px solid var(--chef-primary);
            transition: transform 0.3s;
        }
        
        .welcome-card:hover {
            transform: translateY(-5px);
        }
        
        .stats-card {
            border-radius: 15px;
            color: white;
            padding: 1.5rem;
            margin-bottom: 1.5rem;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            position: relative;
            overflow: hidden;
        }
        
        .stats-card::after {
            content: '';
            position: absolute;
            top: 0;
            right: 0;
            width: 100px;
            height: 100px;
            background: rgba(255,255,255,0.1);
            border-radius: 50%;
        }
        
        .stats-card .icon {
            font-size: 2.5rem;
            opacity: 0.8;
        }
        
        .booking-card {
            border-radius: 15px;
            margin-bottom: 1.5rem;
            border: none;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            transition: all 0.3s;
            overflow: hidden;
        }
        
        .booking-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 16px rgba(0,0,0,0.1);
        }
        
        .booking-card .card-header {
            background-color: var(--chef-primary);
            color: white;
            font-weight: bold;
            border-bottom: none;
        }
        
        .booking-detail {
            margin-bottom: 0.5rem;
            display: flex;
            align-items: center;
        }
        
        .booking-detail i {
            width: 25px;
            color: var(--chef-primary);
            text-align: center;
            margin-right: 10px;
        }
        
        .food-graphic {
            position: absolute;
            opacity: 0.1;
            z-index: 0;
        }
        
        .graphic-1 {
            top: 20px;
            right: 20px;
            font-size: 5rem;
            color: var(--chef-primary);
        }
        
        .graphic-2 {
            bottom: 20px;
            left: 20px;
            font-size: 4rem;
            color: var(--chef-secondary);
        }
        
        .revenue-chart {
            background: white;
            border-radius: 15px;
            padding: 1.5rem;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }
        
        .pulse {
            animation: pulse 2s infinite;
        }
        
        @keyframes pulse {
            0% { transform: scale(1); }
            50% { transform: scale(1.05); }
            100% { transform: scale(1); }
        }
        
        .floating {
            animation: floating 3s ease-in-out infinite;
        }
        
        @keyframes floating {
            0% { transform: translateY(0px); }
            50% { transform: translateY(-10px); }
            100% { transform: translateY(0px); }
        }
        
        .btn-chef-primary {
            background-color: var(--chef-primary);
            color: white;
            border: none;
            padding: 8px 20px;
            border-radius: 30px;
            font-weight: 500;
        }
        
        .btn-chef-primary:hover {
            background-color: #e05555;
            color: white;
        }
        
        .btn-chef-secondary {
            background-color: var(--chef-secondary);
            color: white;
            border: none;
            padding: 8px 20px;
            border-radius: 30px;
            font-weight: 500;
        }
        
        .order-form {
            background: white;
            border-radius: 15px;
            padding: 2rem;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
            display: none;
        }
        
        .form-icon {
            color: var(--chef-primary);
            font-size: 1.2rem;
            margin-right: 10px;
        }
        
        .ingredient-badge {
            background-color: #e9f7ef;
            color: #28a745;
            padding: 5px 10px;
            border-radius: 20px;
            margin-right: 5px;
            margin-bottom: 5px;
            display: inline-block;
            font-size: 0.8rem;
        }
    </style>
</head>
<body>
    <!-- Header Section -->
    <header class="chef-header">
        <div class="container">
            <div class="d-flex align-items-center">
                <div class="chef-logo animate__animated animate__bounceIn">
                    <i class="fas fa-utensils"></i>
                </div>
                <div>
                    <h1 class="mb-0">Anhee Chef Dashboard</h1>
                    <p class="mb-0">Professional kitchen management system</p>
                </div>
            </div>
        </div>
    </header>

    <div class="container">
        <!-- Welcome and Stats Row -->
        <div class="row mb-4">
            <div class="col-md-6">
                <div class="welcome-card p-4 animate__animated animate__fadeInLeft">
                    <h3>Welcome back, Chef <span class="text-primary">Alexandre</span>!</h3>
                    <p class="mb-0">You have <span class="fw-bold">12</span> completed orders this week with <span class="fw-bold">98%</span> satisfaction rate.</p>
                    <div class="mt-3">
                        <span class="ingredient-badge"><i class="fas fa-star"></i> Top Rated Chef</span>
                        <span class="ingredient-badge"><i class="fas fa-bolt"></i> Fastest Prep Time</span>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="row">
                    <div class="col-md-6 mb-3 mb-md-0">
                        <div class="stats-card bg-primary animate__animated animate__fadeInDown">
                            <div class="icon mb-2">
                                <i class="fas fa-clock"></i>
                            </div>
                            <h3 class="mb-1">8</h3>
                            <p class="mb-0">Pending Orders</p>
                            <i class="fas fa-pepper-hot food-graphic graphic-1"></i>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="stats-card bg-success animate__animated animate__fadeInDown animate__delay-1s">
                            <div class="icon mb-2">
                                <i class="fas fa-dollar-sign"></i>
                            </div>
                            <h3 class="mb-1">$3,845</h3>
                            <p class="mb-0">This Month</p>
                            <i class="fas fa-ice-cream food-graphic graphic-2"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Revenue Chart -->
        <div class="row mb-4">
            <div class="col-12">
                <div class="revenue-chart animate__animated animate__fadeInUp">
                    <h4 class="d-flex align-items-center">
                        <i class="fas fa-chart-line text-primary me-2"></i>
                        Monthly Revenue
                    </h4>
                    <div class="mt-3" style="height: 250px;">
                        <canvas id="revenueChart"></canvas>
                    </div>
                </div>
            </div>
        </div>

        <!-- Bookings Section -->
        <h3 class="d-flex align-items-center mb-3 animate__animated animate__fadeIn">
            <i class="fas fa-list-alt text-primary me-2"></i>
            Current Bookings
        </h3>
        
        <div class="row" id="bookings-container">
            <!-- Booking Card 1 -->
            <div class="col-md-6 col-lg-4 animate__animated animate__fadeInUp">
                <div class="card booking-card pulse">
                    <div class="card-header d-flex justify-content-between align-items-center">
                        <span>Beef Wellington</span>
                        <span class="badge bg-warning">NEW</span>
                    </div>
                    <div class="card-body position-relative">
                        <div class="booking-detail">
                            <i class="fas fa-users"></i>
                            <span>4 people</span>
                        </div>
                        <div class="booking-detail">
                            <i class="fas fa-clock"></i>
                            <span>Deadline: <strong>7:30 PM</strong></span>
                        </div>
                        <div class="booking-detail">
                            <i class="fas fa-map-marker-alt"></i>
                            <span>123 Anhee St, Foodville</span>
                        </div>
                        <div class="booking-detail">
                            <i class="fas fa-phone"></i>
                            <span>+1 (555) 123-4567</span>
                        </div>
                        <div class="mt-3">
                            <button class="btn btn-chef-primary w-100 view-order-btn"
                                    data-recipe="Beef Wellington"
                                    data-people="4"
                                    data-deadline="7:30 PM"
                                    data-location="123 Gourmet St, Foodville"
                                    data-phone="+1 (555) 123-4567">
                                <i class="fas fa-eye me-2"></i>View / Accept
                            </button>
                        </div>
                        <i class="fas fa-drumstick-bite food-graphic graphic-1"></i>
                    </div>
                </div>
            </div>
            
            <!-- Booking Card 2 -->
            <div class="col-md-6 col-lg-4 animate__animated animate__fadeInUp animate__delay-1s">
                <div class="card booking-card">
                    <div class="card-header">
                        Vegetable Lasagna
                    </div>
                    <div class="card-body position-relative">
                        <div class="booking-detail">
                            <i class="fas fa-users"></i>
                            <span>2 people</span>
                        </div>
                        <div class="booking-detail">
                            <i class="fas fa-clock"></i>
                            <span>Deadline: <strong>6:15 PM</strong></span>
                        </div>
                        <div class="booking-detail">
                            <i class="fas fa-map-marker-alt"></i>
                            <span>456 Pasta Ave, Flavortown</span>
                        </div>
                        <div class="booking-detail">
                            <i class="fas fa-phone"></i>
                            <span>+1 (555) 987-6543</span>
                        </div>
                        <div class="mt-3">
                            <button class="btn btn-chef-primary w-100 view-order-btn"
                                    data-recipe="Vegetable Lasagna"
                                    data-people="2"
                                    data-deadline="6:15 PM"
                                    data-location="456 Pasta Ave, Flavortown"
                                    data-phone="+1 (555) 987-6543">
                                <i class="fas fa-eye me-2"></i>View / Accept
                            </button>
                        </div>
                        <i class="fas fa-cheese food-graphic graphic-2"></i>
                    </div>
                </div>
            </div>
            
            <!-- Booking Card 3 -->
            <div class="col-md-6 col-lg-4 animate__animated animate__fadeInUp animate__delay-2s">
                <div class="card booking-card">
                    <div class="card-header">
                        Sushi Platter
                    </div>
                    <div class="card-body position-relative">
                        <div class="booking-detail">
                            <i class="fas fa-users"></i>
                            <span>6 people</span>
                        </div>
                        <div class="booking-detail">
                            <i class="fas fa-clock"></i>
                            <span>Deadline: <strong>8:45 PM</strong></span>
                        </div>
                        <div class="booking-detail">
                            <i class="fas fa-map-marker-alt"></i>
                            <span>789 Ocean Dr, Sushiville</span>
                        </div>
                        <div class="booking-detail">
                            <i class="fas fa-phone"></i>
                            <span>+1 (555) 456-7890</span>
                        </div>
                        <div class="mt-3">
                            <button class="btn btn-chef-primary w-100 view-order-btn"
                                    data-recipe="Sushi Platter"
                                    data-people="6"
                                    data-deadline="8:45 PM"
                                    data-location="789 Ocean Dr, Sushiville"
                                    data-phone="+1 (555) 456-7890">
                                <i class="fas fa-eye me-2"></i>View / Accept
                            </button>
                        </div>
                        <i class="fas fa-fish food-graphic graphic-1"></i>
                    </div>
                </div>
            </div>
        </div>

        <!-- Accept Order Form -->
        <div class="order-form mt-4 animate__animated animate__fadeIn" id="accept-order-form">
            <div class="row">
                <div class="col-md-6">
                    <h3 class="mb-4">
                        <i class="fas fa-clipboard-check text-primary me-2"></i>
                        Accept Order
                    </h3>
                    <form method="post" action="/chef/accept-order">
                        <input type="hidden" id="form-recipe" name="recipe">
                        <input type="hidden" id="form-people" name="people">
                        <input type="hidden" id="form-deadline" name="deadline">
                        <input type="hidden" id="form-location" name="location">
                        <input type="hidden" id="form-phone" name="phone">
                        
                        <div class="mb-3">
                            <label for="instruments" class="form-label">
                                <i class="fas fa-tools form-icon"></i>Instruments Needed:
                            </label>
                            <textarea class="form-control" id="instruments" name="instruments" rows="3" required></textarea>
                        </div>
                        
                        <div class="mb-3">
                            <label for="ingredients" class="form-label">
                                <i class="fas fa-carrot form-icon"></i>Ingredients Needed:
                            </label>
                            <textarea class="form-control" id="ingredients" name="ingredients" rows="3" required></textarea>
                        </div>
                        
                        <div class="d-flex gap-2">
                            <button type="submit" class="btn btn-chef-primary flex-grow-1">
                                <i class="fas fa-check-circle me-2"></i>Accept Order
                            </button>
                            <button type="button" class="btn btn-danger flex-grow-1" id="reject-btn">
                                <i class="fas fa-times-circle me-2"></i>Reject Order
                            </button>
                        </div>
                    </form>
                </div>
                <div class="col-md-6 d-flex align-items-center justify-content-center">
                    <div class="text-center">
                        <img src="https://cdn.pixabay.com/photo/2017/06/28/11/15/chef-2451160_640.png" alt="Chef" class="img-fluid floating" style="max-height: 250px;">
                        <h4 class="mt-3" id="form-recipe-display">Beef Wellington</h4>
                        <p class="mb-1"><i class="fas fa-users me-2"></i><span id="form-people-display">4</span> people</p>
                        <p class="mb-1"><i class="fas fa-clock me-2"></i><span id="form-deadline-display">7:30 PM</span></p>
                        <p class="mb-1"><i class="fas fa-map-marker-alt me-2"></i><span id="form-location-display">123 Gourmet St</span></p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Chart.js -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script>
        // Initialize Revenue Chart
        const ctx = document.getElementById('revenueChart').getContext('2d');
        const revenueChart = new Chart(ctx, {
            type: 'bar',
            data: {
                labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul'],
                datasets: [{
                    label: 'Monthly Revenue ($)',
                    data: [3200, 2900, 3500, 4100, 3800, 4200, 3845],
                    backgroundColor: [
                        'rgba(255, 107, 107, 0.7)',
                        'rgba(78, 205, 196, 0.7)',
                        'rgba(255, 230, 109, 0.7)',
                        'rgba(107, 185, 255, 0.7)',
                        'rgba(200, 162, 200, 0.7)',
                        'rgba(255, 178, 102, 0.7)',
                        'rgba(102, 178, 255, 0.7)'
                    ],
                    borderColor: [
                        'rgba(255, 107, 107, 1)',
                        'rgba(78, 205, 196, 1)',
                        'rgba(255, 230, 109, 1)',
                        'rgba(107, 185, 255, 1)',
                        'rgba(200, 162, 200, 1)',
                        'rgba(255, 178, 102, 1)',
                        'rgba(102, 178, 255, 1)'
                    ],
                    borderWidth: 1
                }]
            },
            options: {
                responsive: true,
                plugins: {
                    legend: {
                        display: false
                    }
                },
                scales: {
                    y: {
                        beginAtZero: true,
                        grid: {
                            color: 'rgba(0, 0, 0, 0.05)'
                        }
                    },
                    x: {
                        grid: {
                            display: false
                        }
                    }
                }
            }
        });

        // Show accept order form when a booking is clicked
        document.querySelectorAll('.view-order-btn').forEach(btn => {
            btn.addEventListener('click', function() {
                // Populate hidden form fields
                document.getElementById('form-recipe').value = this.dataset.recipe;
                document.getElementById('form-people').value = this.dataset.people;
                document.getElementById('form-deadline').value = this.dataset.deadline;
                document.getElementById('form-location').value = this.dataset.location;
                document.getElementById('form-phone').value = this.dataset.phone;
                
                // Update displayed values
                document.getElementById('form-recipe-display').textContent = this.dataset.recipe;
                document.getElementById('form-people-display').textContent = this.dataset.people;
                document.getElementById('form-deadline-display').textContent = this.dataset.deadline;
                document.getElementById('form-location-display').textContent = this.dataset.location;
                
                // Show the form with animation
                const form = document.getElementById('accept-order-form');
                form.style.display = 'block';
                form.classList.remove('animate__fadeIn');
                void form.offsetWidth; // Trigger reflow
                form.classList.add('animate__fadeIn');
                
                // Scroll to form
                form.scrollIntoView({ behavior: 'smooth' });
            });
        });
        
        // Simple reject button action
        document.getElementById('reject-btn').addEventListener('click', function() {
            if(confirm('Are you sure you want to reject this order?')) {
                // In a JSP implementation, this would redirect to a rejection endpoint
                alert('Order rejected (in a real app this would submit to server)');
                document.getElementById('accept-order-form').style.display = 'none';
            }
        });

        // Add pulse animation to new orders periodically
        setInterval(() => {
            const cards = document.querySelectorAll('.booking-card');
            cards.forEach(card => {
                if (Math.random() > 0.7) {
                    card.classList.add('pulse');
                    const badge = card.querySelector('.badge');
                    if (badge) badge.classList.remove('d-none');
                    
                    setTimeout(() => {
                        card.classList.remove('pulse');
                    }, 2000);
                }
            });
        }, 5000);
    </script>
</body>
</html>