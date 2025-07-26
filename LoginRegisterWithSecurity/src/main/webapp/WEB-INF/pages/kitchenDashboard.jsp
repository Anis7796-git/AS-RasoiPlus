<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Anhee Kitchen Dashboard</title>
<!-- Bootstrap 5 CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Bootstrap Icons -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&family=Playfair+Display:wght@400;500;600&display=swap"
	rel="stylesheet">
<style>
:root {
	--primary: #FF6B6B;
	--primary-light: #FF8E8E;
	--secondary: #4ECDC4;
	--dark: #292F36;
	--light: #F7FFF7;
	--accent: #FFE66D;
	--glass: rgba(255, 255, 255, 0.85);
}

body {
	font-family: 'Poppins', sans-serif;
	background:
		url('https://images.unsplash.com/photo-1414235077428-338989a2e8c0?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80')
		no-repeat center center fixed;
	background-size: cover;
	min-height: 100vh;
	color: var(--dark);
}

/* Glassmorphism Effect */
.glass-card {
	background: var(--glass);
	backdrop-filter: blur(10px);
	-webkit-backdrop-filter: blur(10px);
	border-radius: 16px;
	box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
	border: 1px solid rgba(255, 255, 255, 0.2);
	transition: all 0.3s ease;
}

.glass-card:hover {
	box-shadow: 0 8px 32px rgba(0, 0, 0, 0.2);
	transform: translateY(-5px);
}

/* Modern Navbar */
.navbar {
	background: rgba(255, 255, 255, 0.9);
	backdrop-filter: blur(10px);
	-webkit-backdrop-filter: blur(10px);
	box-shadow: 0 4px 30px rgba(0, 0, 0, 0.1);
	padding: 0.8rem 2rem;
}

.navbar-brand {
	font-family: 'Playfair Display', serif;
	font-weight: 600;
	font-size: 1.5rem;
	color: var(--primary);
}

.nav-link {
	font-weight: 500;
	padding: 0.5rem 1rem;
	border-radius: 8px;
	transition: all 0.3s ease;
}

.nav-link:hover {
	background: rgba(255, 107, 107, 0.1);
	color: var(--primary);
}

.nav-link.active {
	color: var(--primary);
	font-weight: 600;
}

/* User Profile */
.user-profile {
	position: relative;
}

.profile-img {
	width: 40px;
	height: 40px;
	border-radius: 50%;
	object-fit: cover;
	border: 2px solid var(--primary);
	cursor: pointer;
	transition: all 0.3s ease;
}

.profile-img:hover {
	transform: scale(1.1);
	box-shadow: 0 0 0 3px rgba(255, 107, 107, 0.3);
}

.profile-dropdown {
	position: absolute;
	right: 0;
	top: 50px;
	width: 220px;
	background: white;
	border-radius: 12px;
	box-shadow: 0 10px 30px rgba(0, 0, 0, 0.15);
	padding: 1rem;
	z-index: 1000;
	opacity: 0;
	visibility: hidden;
	transform: translateY(-10px);
	transition: all 0.3s ease;
}

.profile-dropdown.active {
	opacity: 1;
	visibility: visible;
	transform: translateY(0);
}

/* Stats Cards */
.stat-card {
	border-radius: 16px;
	padding: 1.5rem;
	color: white;
	position: relative;
	overflow: hidden;
	transition: all 0.3s ease;
	border: none;
}

.stat-card:hover {
	transform: translateY(-5px);
	box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
}

.stat-card i {
	font-size: 2.5rem;
	opacity: 0.9;
}

.stat-card h3 {
	font-size: 2rem;
	font-weight: 700;
}

.stat-card p {
	font-weight: 500;
	opacity: 0.9;
}

/* Order Cards */
.order-card {
	transition: all 0.3s ease;
	border: none;
	border-radius: 12px;
	overflow: hidden;
}

.order-card.new {
	border-left: 4px solid var(--primary);
}

.order-card .card-header {
	background: linear-gradient(135deg, var(--primary) 0%,
		var(--primary-light) 100%);
	color: white;
	font-weight: 600;
	border-bottom: none;
}

.order-detail {
	display: flex;
	align-items: center;
	margin-bottom: 0.8rem;
}

.order-detail i {
	width: 24px;
	color: var(--primary);
	margin-right: 10px;
	font-size: 1.1rem;
}

.order-detail span {
	flex: 1;
}

.order-detail strong {
	font-weight: 600;
}

/* Buttons */
.btn-primary {
	background-color: var(--primary);
	border: none;
	border-radius: 8px;
	padding: 0.5rem 1.25rem;
	font-weight: 500;
	transition: all 0.3s ease;
}

.btn-primary:hover {
	background-color: #e05555;
	transform: translateY(-2px);
	box-shadow: 0 4px 15px rgba(255, 107, 107, 0.4);
}

.btn-outline-primary {
	border-color: var(--primary);
	color: var(--primary);
	border-radius: 8px;
	font-weight: 500;
	transition: all 0.3s ease;
}

.btn-outline-primary:hover {
	background-color: var(--primary);
	transform: translateY(-2px);
}

/* Badges */
.badge {
	font-weight: 500;
	padding: 0.35rem 0.65rem;
	border-radius: 8px;
}

/* Animations */
@
keyframes float { 0% {
	transform: translateY(0px);
}

50








%
{
transform








:








translateY






(








-8px








)






;
}
100








%
{
transform








:








translateY






(








0px








)






;
}
}
.floating {
	animation: float 3s ease-in-out infinite;
}

@
keyframes pulse { 0% {
	transform: scale(1);
}

50








%
{
transform








:








scale






(








1






.05








)






;
}
100








%
{
transform








:








scale






(








1








)






;
}
}
.pulse {
	animation: pulse 2s infinite;
}

/* Form Styles */
.form-control, .form-select {
	border-radius: 8px;
	padding: 0.75rem 1rem;
	border: 1px solid #e9ecef;
	transition: all 0.3s ease;
}

.form-control:focus, .form-select:focus {
	border-color: var(--primary);
	box-shadow: 0 0 0 0.25rem rgba(255, 107, 107, 0.15);
}

/* Overlay to enhance text readability */
.content-overlay {
	background-color: rgba(255, 255, 255, 0.85);
	backdrop-filter: blur(5px);
	-webkit-backdrop-filter: blur(5px);
	border-radius: 16px;
	padding: 2rem;
}

/* Responsive Adjustments */
@media ( max-width : 768px) {
	.stat-card {
		margin-bottom: 1rem;
	}
}




/* Notification Styles */
#notificationContainer .toast {
    background-color: rgba(0, 0, 0, 0.85);
    backdrop-filter: blur(10px);
    -webkit-backdrop-filter: blur(10px);
    border-radius: 12px;
    box-shadow: 0 4px 30px rgba(0, 0, 0, 0.1);
    animation: slideIn 0.5s forwards, fadeOut 0.5s forwards 3s;
}

#notificationContainer .toast.success {
    background-color: rgba(40, 167, 69, 0.9);
}

#notificationContainer .toast.error {
    background-color: rgba(220, 53, 69, 0.9);
}

@keyframes slideIn {
    from { transform: translateX(100%); opacity: 0; }
    to { transform: translateX(0); opacity: 1; }
}

@keyframes fadeOut {
    from { opacity: 1; }
    to { opacity: 0; }
}

</style>
</head>
<body>
	<!-- Modern Navbar -->
	<nav class="navbar navbar-expand-lg sticky-top">
		<div class="container-fluid">
			<a class="navbar-brand" href="#"> <i class="bi bi-egg-fried me-2"></i>Anhee
				Kitchen
			</a>

			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNav">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav me-auto">






					<li class="nav-item">
						<form action="" method="get" class="">
							<input type="hidden" name="param" value="">
							<button type="submit" class="nav-link">
								<i class="bi bi-speedometer2 me-1"></i> Dashboard
							</button>
						</form>
					</li>






					<li class="nav-item">
						<form action="/kitchen/menu" method="get" class="">
							<input type="hidden" name="param" value="">
							<button type="submit" class="nav-link">
								<i class="bi bi-menu-button me-1"></i> Menu
							</button>
						</form>
					</li>



					<!-- 	<li class="nav-item"><a class="nav-link" href="#"><i
							class="bi bi-menu-button me-1"></i> Menu</a></li> -->







					<li class="nav-item">
						<form action="/kitchen/orders" method="get" class="">
							<input type="hidden" name="param" value="">
							<button type="submit" class="nav-link">
								<i class="bi bi-cart me-1"></i> Orders
							</button>
						</form>
					</li>






					<li class="nav-item">
						<form action="/kitchen/staff" method="get" class="">
							<input type="hidden" name="param" value="">
							<button type="submit" class="nav-link">
								<i class="bi bi-people me-1"></i> Staff
							</button>
						</form>
					</li>
				</ul>

				<div class="user-profile">
					<img
						src="${profileImageBase64 != null ? 'data:image/jpeg;base64,'.concat(profileImageBase64) : 'https://randomuser.me/api/portraits/women/44.jpg'}"
						alt="User" class="profile-img" id="profileToggle">

					<div class="profile-dropdown" id="profileDropdown">
						<div class="text-center mb-3">
							<img
								src="${profileImageBase64 != null ? 'data:image/jpeg;base64,'.concat(profileImageBase64) : 'https://randomuser.me/api/portraits/women/44.jpg'}"
								alt="User" class="rounded-circle mb-2" width="60" height="60">
							<h6 class="mb-0">${sessionScope.kitchen.fullname != null ? sessionScope.kitchen.fullname : 'Chef Maria'}</h6>
							<small class="text-muted">${sessionScope.kitchen.email != null ? sessionScope.kitchen.email : 'maria@gourmethub.com'}</small>
						</div>
						<div class="d-grid gap-2">
							<button class="btn btn-outline-primary btn-sm">
								<i class="bi bi-pencil-square me-1"></i> Update Profile
							</button>
							<button class="btn btn-outline-danger btn-sm">
								<i class="bi bi-box-arrow-right me-1"></i> Logout
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</nav>

	<!-- Main Content -->
	<div class="container my-4">
		<div class="content-overlay glass-card">
			<!-- Welcome and Stats Row -->
			<div class="row mb-4">
				<div class="col-md-6">
					<div class="p-4">
						<h2 class="mb-3">
							Welcome back, <span class="text-primary">${sessionScope.kitchen.fullname != null ? sessionScope.kitchen.fullname : 'Chef Maria'}</span>
							👩‍🍳
						</h2>
						<p class="lead">
							You've prepared <strong>42 orders</strong> this week with <strong>98%</strong>
							satisfaction rate.
						</p>
						<div class="d-flex flex-wrap gap-2 mt-3">
							<span class="badge bg-primary"><i
								class="bi bi-star-fill me-1"></i> Top Chef</span> <span
								class="badge bg-success"><i
								class="bi bi-lightning-fill me-1"></i> Fast Prep</span> <span
								class="badge bg-warning text-dark"><i
								class="bi bi-award-fill me-1"></i> 5-Star Rating</span>
						</div>
					</div>
				</div>
				<div class="col-md-3">
					<div class="stat-card h-100"
						style="background: linear-gradient(135deg, #FF6B6B 0%, #FF8E8E 100%);">
						<div class="d-flex align-items-center">
							<i class="bi bi-clock-history"></i>
							<div class="ms-3">
								<h3 class="mb-0">18</h3>
								<p class="mb-0">Pending Orders</p>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-3">
					<div class="stat-card h-100"
						style="background: linear-gradient(135deg, #4ECDC4 0%, #84DCC6 100%);">
						<div class="d-flex align-items-center">
							<i class="bi bi-currency-dollar"></i>
							<div class="ms-3">
								<h3 class="mb-0">$7,845</h3>
								<p class="mb-0">This Month</p>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- Current Orders Section -->
			<div class="row mb-4">
				<div class="col-12">
					<div class="card glass-card mb-3">
						<div
							class="card-header bg-transparent border-bottom d-flex justify-content-between align-items-center">
							<h5 class="mb-0">
								<i class="bi bi-list-check me-2"></i>Current Orders
							</h5>
							<button class="btn btn-sm btn-light position-relative">
								<i class="bi bi-bell-fill me-1"></i> <span>3 New Orders</span> <span
									class="position-absolute top-0 start-100 translate-middle p-1 bg-danger border border-light rounded-circle"></span>
							</button>
						</div>
						<div class="card-body">
							<div class="row">
								<!-- Order 1 -->
								<div class="col-md-4 mb-3">
									<div class="card order-card new h-100">
										<div
											class="card-header d-flex justify-content-between align-items-center">
											<span>Truffle Pasta</span> <span class="badge bg-warning">NEW</span>
										</div>
										<div class="card-body">
											<div class="order-detail">
												<i class="bi bi-box-seam"></i> <span>Quantity: <strong>2</strong></span>
											</div>
											<div class="order-detail">
												<i class="bi bi-currency-dollar"></i> <span>Total: <strong>$32.50</strong></span>
											</div>
											<div class="order-detail">
												<i class="bi bi-geo-alt"></i> <span>Table: <strong>7</strong></span>
											</div>
											<div class="order-detail">
												<i class="bi bi-clock"></i> <span>Ordered: <strong>8
														min ago</strong></span>
											</div>
											<button class="btn btn-primary w-100 mt-3 take-order-btn">
												<i class="bi bi-check-circle me-1"></i> Accept Order
											</button>
										</div>
									</div>
								</div>

								<!-- Order 2 -->
								<div class="col-md-4 mb-3">
									<div class="card order-card h-100">
										<div
											class="card-header d-flex justify-content-between align-items-center">
											<span>Beef Wellington</span> <span
												class="badge bg-light text-dark">Preparing</span>
										</div>
										<div class="card-body">
											<div class="order-detail">
												<i class="bi bi-box-seam"></i> <span>Quantity: <strong>1</strong></span>
											</div>
											<div class="order-detail">
												<i class="bi bi-currency-dollar"></i> <span>Total: <strong>$45.00</strong></span>
											</div>
											<div class="order-detail">
												<i class="bi bi-geo-alt"></i> <span>Table: <strong>3</strong></span>
											</div>
											<div class="order-detail">
												<i class="bi bi-clock"></i> <span>Ordered: <strong>15
														min ago</strong></span>
											</div>
											<button class="btn btn-secondary w-100 mt-3" disabled>
												<i class="bi bi-hourglass-split me-1"></i> In Progress
											</button>
										</div>
									</div>
								</div>

								<!-- Order 3 -->
								<div class="col-md-4 mb-3">
									<div class="card order-card new h-100">
										<div
											class="card-header d-flex justify-content-between align-items-center">
											<span>Crème Brûlée</span> <span class="badge bg-warning">NEW</span>
										</div>
										<div class="card-body">
											<div class="order-detail">
												<i class="bi bi-box-seam"></i> <span>Quantity: <strong>4</strong></span>
											</div>
											<div class="order-detail">
												<i class="bi bi-currency-dollar"></i> <span>Total: <strong>$28.00</strong></span>
											</div>
											<div class="order-detail">
												<i class="bi bi-geo-alt"></i> <span>Table: <strong>12</strong></span>
											</div>
											<div class="order-detail">
												<i class="bi bi-clock"></i> <span>Ordered: <strong>3
														min ago</strong></span>
											</div>
											<button class="btn btn-primary w-100 mt-3 take-order-btn">
												<i class="bi bi-check-circle me-1"></i> Accept Order
											</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- Add Menu Item Section -->
			<div class="row">
				<div class="col-12">
					<div class="card glass-card">
						<div class="card-header bg-transparent border-bottom">
							<h5 class="mb-0">
								<i class="bi bi-plus-circle me-2"></i>Add Menu Item
							</h5>
						</div>
						<div class="card-body">
							<form action="/addMenu" method="POST"
								enctype="multipart/form-data">



								<input type="hidden" name="kithcenId"
									value="${sessionScope.kitchen.kitchenId}">
								<div class="row">
									<div class="col-md-6">
										<div class="mb-3">
											<label class="form-label">Category</label> <select
												class="form-select" name="category">
												<option>Select Category</option>
												<option>Appetizers</option>
												<option>Main Courses</option>
												<option>Desserts</option>
												<option>Beverages</option>
											</select>
										</div>
										<div class="mb-3">
											<label class="form-label">Item Name</label> <input
												type="text" name="itemName" class="form-control"
												placeholder="e.g., Truffle Pasta">

										</div>
										<div class="mb-3">
											<label class="form-label">Description</label>
											<textarea name="description" class="form-control" rows="3"
												placeholder="Brief description..."></textarea>

										</div>
									</div>
									<div class="col-md-6">
										<div class="mb-3">
											<label class="form-label">Price</label> <input type="number"
												name="price" class="form-control" placeholder="0.00">

										</div>
										<div class="mb-3">
											<label class="form-label">Item Image</label> <input
												type="file" name="itemImage" class="form-control"> <small
												class="text-muted">Recommended size: 500x500px</small>
										</div>
										<div class="d-grid mt-4">
											<button type="submit" class="btn btn-primary">
												<i class="bi bi-plus-circle me-1"></i> Add Menu Item
											</button>
										</div>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
	<!-- Notification Container -->
<div id="notificationContainer" class="position-fixed top-0 end-0 p-3" style="z-index: 1100; display: none;">
    <div class="toast align-items-center text-white border-0" role="alert" aria-live="assertive" aria-atomic="true">
        <div class="d-flex">
            <div class="toast-body">
                <span id="notificationMessage"></span>
            </div>
            <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
        </div>
    </div>
</div>

	<!-- Bootstrap JS Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
	<script>
        // Profile Dropdown Toggle
        const profileToggle = document.getElementById('profileToggle');
        const profileDropdown = document.getElementById('profileDropdown');
        
        profileToggle.addEventListener('click', (e) => {
            e.stopPropagation();
            profileDropdown.classList.toggle('active');
        });
        
        // Close dropdown when clicking outside
        document.addEventListener('click', () => {
            profileDropdown.classList.remove('active');
        });
        
        // Prevent dropdown from closing when clicking inside it
        profileDropdown.addEventListener('click', (e) => {
            e.stopPropagation();
        });
        
        // Take Order Button Functionality
        document.querySelectorAll('.take-order-btn').forEach(btn => {
            btn.addEventListener('click', function() {
                const card = this.closest('.order-card');
                const orderName = card.querySelector('.card-header span:first-child').textContent;
                
                // Remove new badge
                const badge = card.querySelector('.badge.bg-warning');
                if (badge) badge.remove();
                
                // Update button state
                this.innerHTML = '<i class="bi bi-hourglass-split me-1"></i> In Progress';
                this.classList.remove('btn-primary');
                this.classList.add('btn-secondary');
                this.disabled = true;
                
                // Remove new order indicator
                card.classList.remove('new');
                
                // Show confirmation
                console.log(`Order taken: ${orderName}`);
            });
        });
        
        // Simulate new orders
        setInterval(() => {
            const newOrderIndicator = document.querySelector('.btn-light.position-relative .rounded-circle');
            newOrderIndicator.style.display = 'block';
            
            setTimeout(() => {
                newOrderIndicator.style.display = 'none';
            }, 2000);
        }, 10000);
        
        
        
        
        
        
        
     // Notification function
        function showNotification(message, isSuccess) {
            const container = document.getElementById('notificationContainer');
            const toast = container.querySelector('.toast');
            const messageElement = document.getElementById('notificationMessage');
            
            // Set message and style
            messageElement.textContent = message;
            toast.className = 'toast align-items-center text-white border-0';
            toast.classList.add(isSuccess ? 'success' : 'error');
            
            // Show container
            container.style.display = 'block';
            
            // Animation to show
            setTimeout(() => {
                container.style.opacity = '1';
            }, 10);
            
            // Auto-hide after 3 seconds
            setTimeout(() => {
                container.style.opacity = '0';
                setTimeout(() => {
                    container.style.display = 'none';
                }, 500);
            }, 3000);
        }

        // Check for messages from server on page load
        window.addEventListener('DOMContentLoaded', () => {
            // Check for success message
            const successMessage = "${menuSaveSuccess}";
            if (successMessage && successMessage !== "") {
                showNotification(successMessage, true);
            }
            
            // Check for error message
            const errorMessage = "${menuSaveError}";
            if (errorMessage && errorMessage !== "") {
                showNotification(errorMessage, false);
            }
            
            // Check for exception message
            const exceptionMessage = "${MenuSaveEXception}";
            if (exceptionMessage && exceptionMessage !== "") {
                showNotification(exceptionMessage, false);
            }
        });
    </script>
</body>
</html>