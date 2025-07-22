<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="en">
<head>



<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<meta name="_csrf" content="${_csrf.token}" />
<meta name="_csrf_header" content="${_csrf.headerName}" />
<title>Dashboard | Premium Chef Booking</title>
<!-- Bootstrap 5 CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Bootstrap Icons -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
	rel="stylesheet">
<style>
:root {
	--primary: #FF6B6B;
	--primary-dark: #E55C5C;
	--secondary: #FFA502;
	--dark: #2F3542;
	--light: #F1F2F6;
	--success: #4BB543;
	--glass: rgba(255, 255, 255, 0.85);
	--card-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
}

* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	font-family: 'Poppins', sans-serif;
	background-color: #f8f9fa;
	color: var(--dark);
	overflow-x: hidden;
}

/* Navbar Styles */
.dashboard-navbar {
	background: white;
	box-shadow: 0 2px 15px rgba(0, 0, 0, 0.1);
	padding: 0.8rem 2rem;
	position: sticky;
	top: 0;
	z-index: 1030;
}

.navbar-brand {
	font-weight: 700;
	font-size: 1.5rem;
	color: var(--primary);
	display: flex;
	align-items: center;
	gap: 10px;
}

.navbar-brand img {
	height: 40px;
}

.nav-link {
	color: var(--dark);
	font-weight: 500;
	padding: 0.5rem 1rem;
	transition: all 0.3s ease;
	border-radius: 8px;
}

.nav-link:hover, .nav-link.active {
	color: var(--primary);
	background: rgba(255, 107, 107, 0.1);
}

.nav-link i {
	margin-right: 8px;
}

.user-dropdown {
	cursor: pointer;
}

.user-avatar {
	width: 40px;
	height: 40px;
	border-radius: 50%;
	object-fit: cover;
	border: 2px solid var(--primary);
}

.dropdown-menu {
	border: none;
	box-shadow: 0 5px 20px rgba(0, 0, 0, 0.1);
	border-radius: 12px;
	padding: 0.5rem;
}

.dropdown-item {
	border-radius: 8px;
	padding: 0.5rem 1rem;
	font-weight: 500;
	transition: all 0.3s ease;
}

.dropdown-item:hover {
	background: rgba(255, 107, 107, 0.1);
	color: var(--primary);
}

/* Main Content Styles */
.dashboard-container {
	padding: 2rem 0;
}

.section-header {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-bottom: 1.5rem;
}

.section-title {
	font-weight: 600;
	font-size: 1.5rem;
	color: var(--dark);
	position: relative;
	padding-left: 15px;
}

.section-title::before {
	content: '';
	position: absolute;
	left: 0;
	top: 50%;
	transform: translateY(-50%);
	height: 70%;
	width: 5px;
	background: var(--primary);
	border-radius: 5px;
}

.view-all {
	color: var(--primary);
	font-weight: 500;
	text-decoration: none;
	transition: all 0.3s ease;
}

.view-all:hover {
	color: var(--primary-dark);
	text-decoration: underline;
}

/* Category Tabs */
.category-tabs {
	background: white;
	border-radius: 15px;
	padding: 1rem;
	box-shadow: var(--card-shadow);
	margin-bottom: 2rem;
	overflow-x: auto;
	white-space: nowrap;
}

.category-tabs::-webkit-scrollbar {
	height: 5px;
}

.category-tabs::-webkit-scrollbar-thumb {
	background: rgba(255, 107, 107, 0.3);
	border-radius: 10px;
}

.category-tab {
	display: inline-block;
	padding: 0.5rem 1.2rem;
	margin-right: 0.8rem;
	background: rgba(255, 107, 107, 0.1);
	color: var(--primary-dark);
	border-radius: 30px;
	font-weight: 500;
	cursor: pointer;
	transition: all 0.3s ease;
	border: none;
}

.category-tab:hover, .category-tab.active {
	background: var(--primary);
	color: white;
}

/* Kitchen Cards */
.kitchen-card {
	background: white;
	border-radius: 15px;
	overflow: hidden;
	box-shadow: var(--card-shadow);
	transition: all 0.3s ease;
	margin-bottom: 1.5rem;
	border: none;
}

.kitchen-card:hover {
	transform: translateY(-5px);
	box-shadow: 0 10px 25px rgba(0, 0, 0, 0.12);
}

.kitchen-img {
	height: 180px;
	object-fit: cover;
	width: 100%;
}

.kitchen-card-body {
	padding: 1.5rem;
}

.kitchen-title {
	font-weight: 600;
	font-size: 1.2rem;
	margin-bottom: 0.5rem;
	color: var(--dark);
}

.kitchen-location {
	color: #6c757d;
	font-size: 0.9rem;
	margin-bottom: 1rem;
	display: flex;
	align-items: center;
}

.kitchen-location i {
	margin-right: 5px;
	color: var(--primary);
}

.kitchen-rating {
	display: flex;
	align-items: center;
	margin-bottom: 1rem;
}

.rating-stars {
	color: #FFD700;
	margin-right: 5px;
}

.rating-text {
	font-size: 0.9rem;
	color: #6c757d;
}

.view-menu-btn {
	background: linear-gradient(to right, var(--primary), var(--secondary));
	color: white;
	border: none;
	padding: 8px 20px;
	border-radius: 8px;
	font-weight: 500;
	transition: all 0.3s ease;
	width: 100%;
}

.view-menu-btn:hover {
	transform: translateY(-2px);
	box-shadow: 0 5px 15px rgba(255, 107, 107, 0.3);
}

/* Menu Modal */
.menu-modal {
	border-radius: 20px;
	overflow: hidden;
}

.modal-header {
	background: linear-gradient(to right, var(--primary), var(--secondary));
	color: white;
	border-bottom: none;
	padding: 1.5rem;
}

.modal-title {
	font-weight: 600;
}

.close-btn {
	background: none;
	border: none;
	color: white;
	font-size: 1.5rem;
}

.menu-category {
	margin-bottom: 2rem;
}

.menu-category-title {
	font-weight: 600;
	color: var(--primary);
	margin-bottom: 1rem;
	padding-bottom: 0.5rem;
	border-bottom: 2px dashed rgba(255, 107, 107, 0.3);
}

.menu-item {
	display: flex;
	justify-content: space-between;
	margin-bottom: 1rem;
	padding-bottom: 1rem;
	border-bottom: 1px solid rgba(0, 0, 0, 0.05);
	align-items: center;
}

.menu-item:last-child {
	border-bottom: none;
}

.menu-item-name {
	font-weight: 500;
}

.menu-item-price {
	font-weight: 600;
	color: var(--primary);
}

.menu-item-desc {
	font-size: 0.85rem;
	color: #6c757d;
	margin-top: 3px;
}

.order-item-btn {
	background: var(--primary);
	color: white;
	border: none;
	border-radius: 6px;
	padding: 5px 12px;
	font-size: 0.8rem;
	transition: all 0.3s;
}

.order-item-btn:hover {
	background: var(--primary-dark);
	transform: translateY(-2px);
}

/* Quantity Modal */
.quantity-modal {
	border-radius: 20px;
	overflow: hidden;
}

.quantity-control {
	display: flex;
	align-items: center;
	justify-content: center;
	margin: 1.5rem 0;
}

.quantity-btn {
	width: 40px;
	height: 40px;
	border-radius: 50%;
	background: var(--light);
	border: none;
	font-size: 1.2rem;
	display: flex;
	align-items: center;
	justify-content: center;
	cursor: pointer;
}

.quantity-input {
	width: 60px;
	text-align: center;
	font-size: 1.2rem;
	border: none;
	background: transparent;
	margin: 0 10px;
}

.location-option {
	display: flex;
	align-items: center;
	padding: 0.8rem;
	border: 1px solid #ddd;
	border-radius: 10px;
	margin-bottom: 0.8rem;
	cursor: pointer;
	transition: all 0.3s;
}

.location-option:hover {
	border-color: var(--primary);
}

.location-option.selected {
	border-color: var(--primary);
	background: rgba(255, 107, 107, 0.05);
}

.location-radio {
	margin-right: 10px;
}

.location-label {
	flex: 1;
}

.location-icon {
	color: var(--primary);
	font-size: 1.2rem;
	margin-right: 10px;
}

.total-price {
	font-size: 1.2rem;
	font-weight: 600;
	color: var(--primary);
	margin: 1.5rem 0;
	text-align: center;
}

.confirm-order-btn {
	background: linear-gradient(to right, var(--primary), var(--secondary));
	color: white;
	border: none;
	padding: 10px;
	border-radius: 10px;
	font-weight: 500;
	width: 100%;
	transition: all 0.3s;
}

.confirm-order-btn:hover {
	transform: translateY(-2px);
	box-shadow: 0 5px 15px rgba(255, 107, 107, 0.3);
}

/* Responsive Styles */
@media ( max-width : 992px) {
	.kitchen-img {
		height: 150px;
	}
}

@media ( max-width : 768px) {
	.dashboard-navbar {
		padding: 0.8rem 1rem;
	}
	.navbar-brand {
		font-size: 1.2rem;
	}
	.navbar-brand img {
		height: 30px;
	}
	.section-title {
		font-size: 1.3rem;
	}
	.kitchen-card-body {
		padding: 1rem;
	}
	.kitchen-title {
		font-size: 1.1rem;
	}
}

/* Animation */
@
keyframes fadeIn {from { opacity:0;
	transform: translateY(20px);
}

to {
	opacity: 1;
	transform: translateY(0);
}

}
.fade-in {
	animation: fadeIn 0.5s ease forwards;
}

/* Custom Scrollbar */
::-webkit-scrollbar {
	width: 8px;
	height: 8px;
}

::-webkit-scrollbar-track {
	background: #f1f1f1;
}

::-webkit-scrollbar-thumb {
	background: rgba(255, 107, 107, 0.5);
	border-radius: 10px;
}

::-webkit-scrollbar-thumb:hover {
	background: var(--primary);
}
</style>
</head>
<body>
	<!-- Navbar -->
	<nav class="navbar navbar-expand-lg dashboard-navbar">
		<div class="container-fluid">
			<!-- Logo and Brand Name -->
			<a class="navbar-brand" href="#"> <img
				src="https://via.placeholder.com/40" alt="Logo"> ChefAtHome
			</a>

			<!-- Navbar Toggler for Mobile -->
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarContent">
				<i class="bi bi-list"
					style="font-size: 1.5rem; color: var(--primary);"></i>
			</button>

			<!-- Navbar Content -->
			<div class="collapse navbar-collapse" id="navbarContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link active" href="#"><i
							class="bi bi-house-door"></i> Home</a></li>
					<li class="nav-item">
						<form method="GET" action="/customer/bookChef"
							class="nav-link-form" style="display: inline;">
							<button type="submit" class="nav-link">
								<i class="bi bi-bookmark-star"></i> Book a Chef
							</button>
						</form>
					</li>

					<li class="nav-item">
						<form method="GET" action="/customer/OrderHistory"
							class="nav-link-form" style="display: inline;">
							<button type="submit" class="nav-link">
								<i class="bi bi-bookmark-star"></i> Order History
							</button>
						</form>
					</li>



				</ul>

				<!-- User Profile or Login/Register -->
				<div class="d-flex align-items-center">
					<!-- For logged in users -->
					<div class="dropdown">
						<div class="user-dropdown" data-bs-toggle="dropdown"
							aria-expanded="false">
							<c:if test="${not empty profileImageBase64}">
								<img src="data:image/jpeg;base64,${profileImageBase64}"
									alt="Profile" class="user-avatar">
							</c:if>
							<c:if test="${empty profileImageBase64}">
								<img src="/images/default-avatar.jpg" alt="Profile"
									class="user-avatar">
							</c:if>
						</div>
						<ul class="dropdown-menu dropdown-menu-end">
							<li><a class="dropdown-item" href="#"><i
									class="bi bi-person"></i> Profile</a></li>
							<li><a class="dropdown-item" href="#"><i
									class="bi bi-gear"></i> Settings</a></li>
							<li>
								<!-- Change your form from POST to GET -->
								<form method="POST" action="/customer/editprofile">
									<input type="hidden" name="customerId"
										value="${customer.customerId}" /> <input type="hidden"
										name="email" value="${customer.email}" />
									<button type="submit">Edit Profile</button>
								</form>
							</li>
							<li>

								<form method="POST" action="/customer/test-csrf">
									<input type="hidden" name="${_csrf.parameterName}"
										value="${_csrf.token}" />
									<button>Test CSRF</button>
								</form>
							</li>
							<li><hr class="dropdown-divider"></li>
							<li><a class="dropdown-item text-danger" href="#"><i
									class="bi bi-box-arrow-right"></i> Logout</a></li>
						</ul>
					</div>
				</div>

			</div>
		</div>
	</nav>

	<!-- Main Content -->
	<div class="dashboard-container container">
		<!-- Category Tabs -->
		<div class="category-tabs mb-4">
			<button class="category-tab active">All</button>
			<button class="category-tab">Biryani</button>
			<button class="category-tab">Burger</button>
			<button class="category-tab">Shawarma</button>
			<button class="category-tab">Pizza</button>
			<button class="category-tab">Chinese</button>
			<button class="category-tab">Rice Plate</button>
			<button class="category-tab">North Indian</button>
			<button class="category-tab">South Indian</button>
			<button class="category-tab">Desserts</button>
		</div>

		<!-- Top Home Kitchens Section -->
		<div class="mb-5">
			<div class="section-header">
				<h2 class="section-title">Top Home Kitchens in Bengaluru</h2>
				<a href="#" class="view-all">View All</a>
			</div>

			<div class="row">
				<!-- Kitchen Card 1 -->
				<div class="col-md-6 col-lg-4 col-xl-3 fade-in"
					style="animation-delay: 0.1s;">
					<div class="kitchen-card">
						<img
							src="https://images.unsplash.com/photo-1559847844-5315695dadae?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=800&q=80"
							alt="Kitchen" class="kitchen-img">
						<div class="kitchen-card-body">
							<h3 class="kitchen-title">Spice Heaven</h3>
							<p class="kitchen-location">
								<i class="bi bi-geo-alt"></i> Koramangala, 2.5 km away
							</p>
							<div class="kitchen-rating">
								<div class="rating-stars">
									<i class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
									<i class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
									<i class="bi bi-star-half"></i>
								</div>
								<span class="rating-text">(142 reviews)</span>
							</div>
							<button class="view-menu-btn" data-bs-toggle="modal"
								data-bs-target="#menuModal">
								<i class="bi bi-menu-button-wide"></i> View Menu
							</button>
						</div>
					</div>
				</div>

				<!-- Kitchen Card 2 -->
				<div class="col-md-6 col-lg-4 col-xl-3 fade-in"
					style="animation-delay: 0.2s;">
					<div class="kitchen-card">
						<img
							src="https://images.unsplash.com/photo-1601050690597-df0568f70950?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=800&q=80"
							alt="Kitchen" class="kitchen-img">
						<div class="kitchen-card-body">
							<h3 class="kitchen-title">Biryani Blues</h3>
							<p class="kitchen-location">
								<i class="bi bi-geo-alt"></i> Indiranagar, 3.1 km away
							</p>
							<div class="kitchen-rating">
								<div class="rating-stars">
									<i class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
									<i class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
									<i class="bi bi-star-fill"></i>
								</div>
								<span class="rating-text">(256 reviews)</span>
							</div>
							<button class="view-menu-btn" data-bs-toggle="modal"
								data-bs-target="#menuModal">
								<i class="bi bi-menu-button-wide"></i> View Menu
							</button>
						</div>
					</div>
				</div>

				<!-- Kitchen Card 3 -->
				<div class="col-md-6 col-lg-4 col-xl-3 fade-in"
					style="animation-delay: 0.3s;">
					<div class="kitchen-card">
						<img
							src="https://images.unsplash.com/photo-1513104890138-7c749659a591?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=800&q=80"
							alt="Kitchen" class="kitchen-img">
						<div class="kitchen-card-body">
							<h3 class="kitchen-title">Pizza Paradise</h3>
							<p class="kitchen-location">
								<i class="bi bi-geo-alt"></i> Whitefield, 5.7 km away
							</p>
							<div class="kitchen-rating">
								<div class="rating-stars">
									<i class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
									<i class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
									<i class="bi bi-star"></i>
								</div>
								<span class="rating-text">(98 reviews)</span>
							</div>
							<button class="view-menu-btn" data-bs-toggle="modal"
								data-bs-target="#menuModal">
								<i class="bi bi-menu-button-wide"></i> View Menu
							</button>
						</div>
					</div>
				</div>

				<!-- Kitchen Card 4 -->
				<div class="col-md-6 col-lg-4 col-xl-3 fade-in"
					style="animation-delay: 0.4s;">
					<div class="kitchen-card">
						<img
							src="https://images.unsplash.com/photo-1551504734-5ee1c4a1479b?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=800&q=80"
							alt="Kitchen" class="kitchen-img">
						<div class="kitchen-card-body">
							<h3 class="kitchen-title">Dosa Delight</h3>
							<p class="kitchen-location">
								<i class="bi bi-geo-alt"></i> Jayanagar, 1.8 km away
							</p>
							<div class="kitchen-rating">
								<div class="rating-stars">
									<i class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
									<i class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
									<i class="bi bi-star-half"></i>
								</div>
								<span class="rating-text">(187 reviews)</span>
							</div>
							<button class="view-menu-btn" data-bs-toggle="modal"
								data-bs-target="#menuModal">
								<i class="bi bi-menu-button-wide"></i> View Menu
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- Recently Added Section -->
		<div class="mb-5">
			<div class="section-header">
				<h2 class="section-title">Recently Added</h2>
				<a href="#" class="view-all">View All</a>
			</div>

			<div class="row">
				<!-- Kitchen Card 5 -->
				<div class="col-md-6 col-lg-4 col-xl-3 fade-in"
					style="animation-delay: 0.1s;">
					<div class="kitchen-card">
						<img
							src="https://images.unsplash.com/photo-1544025162-d76694265947?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=800&q=80"
							alt="Kitchen" class="kitchen-img">
						<div class="kitchen-card-body">
							<h3 class="kitchen-title">Burger Barn</h3>
							<p class="kitchen-location">
								<i class="bi bi-geo-alt"></i> HSR Layout, 4.2 km away
							</p>
							<div class="kitchen-rating">
								<div class="rating-stars">
									<i class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
									<i class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
									<i class="bi bi-star"></i>
								</div>
								<span class="rating-text">(76 reviews)</span>
							</div>
							<button class="view-menu-btn" data-bs-toggle="modal"
								data-bs-target="#menuModal">
								<i class="bi bi-menu-button-wide"></i> View Menu
							</button>
						</div>
					</div>
				</div>

				<!-- Kitchen Card 6 -->
				<div class="col-md-6 col-lg-4 col-xl-3 fade-in"
					style="animation-delay: 0.2s;">
					<div class="kitchen-card">
						<img
							src="https://images.unsplash.com/photo-1565557623262-b51c2513a641?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=800&q=80"
							alt="Kitchen" class="kitchen-img">
						<div class="kitchen-card-body">
							<h3 class="kitchen-title">Chinese Wok</h3>
							<p class="kitchen-location">
								<i class="bi bi-geo-alt"></i> Bellandur, 6.5 km away
							</p>
							<div class="kitchen-rating">
								<div class="rating-stars">
									<i class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
									<i class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
									<i class="bi bi-star-half"></i>
								</div>
								<span class="rating-text">(112 reviews)</span>
							</div>
							<button class="view-menu-btn" data-bs-toggle="modal"
								data-bs-target="#menuModal">
								<i class="bi bi-menu-button-wide"></i> View Menu
							</button>
						</div>
					</div>
				</div>

				<!-- Kitchen Card 7 -->
				<div class="col-md-6 col-lg-4 col-xl-3 fade-in"
					style="animation-delay: 0.3s;">
					<div class="kitchen-card">
						<img
							src="https://images.unsplash.com/photo-1601050690597-df0568f70950?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=800&q=80"
							alt="Kitchen" class="kitchen-img">
						<div class="kitchen-card-body">
							<h3 class="kitchen-title">Shawarma Street</h3>
							<p class="kitchen-location">
								<i class="bi bi-geo-alt"></i> MG Road, 3.8 km away
							</p>
							<div class="kitchen-rating">
								<div class="rating-stars">
									<i class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
									<i class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
									<i class="bi bi-star-fill"></i>
								</div>
								<span class="rating-text">(203 reviews)</span>
							</div>
							<button class="view-menu-btn" data-bs-toggle="modal"
								data-bs-target="#menuModal">
								<i class="bi bi-menu-button-wide"></i> View Menu
							</button>
						</div>
					</div>
				</div>

				<!-- Kitchen Card 8 -->
				<div class="col-md-6 col-lg-4 col-xl-3 fade-in"
					style="animation-delay: 0.4s;">
					<div class="kitchen-card">
						<img
							src="https://images.unsplash.com/photo-1563805042-7684c019e1cb?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=800&q=80"
							alt="Kitchen" class="kitchen-img">
						<div class="kitchen-card-body">
							<h3 class="kitchen-title">Sweet Tooth</h3>
							<p class="kitchen-location">
								<i class="bi bi-geo-alt"></i> Malleshwaram, 5.2 km away
							</p>
							<div class="kitchen-rating">
								<div class="rating-stars">
									<i class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
									<i class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
									<i class="bi bi-star-half"></i>
								</div>
								<span class="rating-text">(89 reviews)</span>
							</div>
							<button class="view-menu-btn" data-bs-toggle="modal"
								data-bs-target="#menuModal">
								<i class="bi bi-menu-button-wide"></i> View Menu
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Menu Modal -->
	<div class="modal fade" id="menuModal" tabindex="-1"
		aria-labelledby="menuModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered modal-lg">
			<div class="modal-content menu-modal">
				<div class="modal-header">
					<h5 class="modal-title" id="menuModalLabel">Spice Heaven -
						Full Menu</h5>
					<button type="button" class="close-btn" data-bs-dismiss="modal"
						aria-label="Close">
						<i class="bi bi-x-lg"></i>
					</button>
				</div>
				<div class="modal-body p-4">
					<!-- Biryani Category -->
					<div class="menu-category">
						<h4 class="menu-category-title">Biryani</h4>
						<div class="menu-item">
							<div>
								<div class="menu-item-name">Chicken Biryani</div>
								<div class="menu-item-desc">Fragrant basmati rice cooked
									with tender chicken pieces and aromatic spices</div>
							</div>
							<div>
								<div class="menu-item-price">₹250</div>
								<button class="order-item-btn mt-2" data-item="Chicken Biryani"
									data-price="250">
									<i class="bi bi-cart-plus"></i> Order
								</button>
							</div>
						</div>
						<div class="menu-item">
							<div>
								<div class="menu-item-name">Mutton Biryani</div>
								<div class="menu-item-desc">Slow-cooked mutton with long
									grain rice and secret spice blend</div>
							</div>
							<div>
								<div class="menu-item-price">₹320</div>
								<button class="order-item-btn mt-2" data-item="Mutton Biryani"
									data-price="320">
									<i class="bi bi-cart-plus"></i> Order
								</button>
							</div>
						</div>
						<div class="menu-item">
							<div>
								<div class="menu-item-name">Veg Biryani</div>
								<div class="menu-item-desc">Colorful vegetables cooked
									with fragrant rice and mild spices</div>
							</div>
							<div>
								<div class="menu-item-price">₹180</div>
								<button class="order-item-btn mt-2" data-item="Veg Biryani"
									data-price="180">
									<i class="bi bi-cart-plus"></i> Order
								</button>
							</div>
						</div>
					</div>

					<!-- Rice Category -->
					<div class="menu-category">
						<h4 class="menu-category-title">Rice Plates</h4>
						<div class="menu-item">
							<div>
								<div class="menu-item-name">Chicken Fried Rice</div>
								<div class="menu-item-desc">Stir-fried rice with chicken,
									eggs and vegetables</div>
							</div>
							<div>
								<div class="menu-item-price">₹200</div>
								<button class="order-item-btn mt-2"
									data-item="Chicken Fried Rice" data-price="200">
									<i class="bi bi-cart-plus"></i> Order
								</button>
							</div>
						</div>
						<div class="menu-item">
							<div>
								<div class="menu-item-name">Egg Fried Rice</div>
								<div class="menu-item-desc">Classic fried rice with
									scrambled eggs and veggies</div>
							</div>
							<div>
								<div class="menu-item-price">₹160</div>
								<button class="order-item-btn mt-2" data-item="Egg Fried Rice"
									data-price="160">
									<i class="bi bi-cart-plus"></i> Order
								</button>
							</div>
						</div>
					</div>

					<!-- North Indian -->
					<div class="menu-category">
						<h4 class="menu-category-title">North Indian Specials</h4>
						<div class="menu-item">
							<div>
								<div class="menu-item-name">Butter Chicken</div>
								<div class="menu-item-desc">Tandoori chicken in rich
									tomato and butter gravy</div>
							</div>
							<div>
								<div class="menu-item-price">₹280</div>
								<button class="order-item-btn mt-2" data-item="Butter Chicken"
									data-price="280">
									<i class="bi bi-cart-plus"></i> Order
								</button>
							</div>
						</div>
						<div class="menu-item">
							<div>
								<div class="menu-item-name">Dal Makhani</div>
								<div class="menu-item-desc">Creamy black lentils
									slow-cooked overnight</div>
							</div>
							<div>
								<div class="menu-item-price">₹180</div>
								<button class="order-item-btn mt-2" data-item="Dal Makhani"
									data-price="180">
									<i class="bi bi-cart-plus"></i> Order
								</button>
							</div>
						</div>
					</div>

					<!-- Desserts -->
					<div class="menu-category">
						<h4 class="menu-category-title">Desserts</h4>
						<div class="menu-item">
							<div>
								<div class="menu-item-name">Gulab Jamun</div>
								<div class="menu-item-desc">2 pieces of warm milk
									dumplings in sugar syrup</div>
							</div>
							<div>
								<div class="menu-item-price">₹80</div>
								<button class="order-item-btn mt-2" data-item="Gulab Jamun"
									data-price="80">
									<i class="bi bi-cart-plus"></i> Order
								</button>
							</div>
						</div>
						<div class="menu-item">
							<div>
								<div class="menu-item-name">Kheer</div>
								<div class="menu-item-desc">Traditional rice pudding with
									nuts</div>
							</div>
							<div>
								<div class="menu-item-price">₹90</div>
								<button class="order-item-btn mt-2" data-item="Kheer"
									data-price="90">
									<i class="bi bi-cart-plus"></i> Order
								</button>
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary">Book This
						Chef</button>
				</div>
			</div>
		</div>
	</div>

	<!-- Quantity Selection Modal -->
	<div class="modal fade" id="quantityModal" tabindex="-1"
		aria-labelledby="quantityModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content quantity-modal">
				<div class="modal-header">
					<h5 class="modal-title" id="quantityModalLabel">Order Details</h5>
					<button type="button" class="close-btn" data-bs-dismiss="modal"
						aria-label="Close">
						<i class="bi bi-x-lg"></i>
					</button>
				</div>
				<div class="modal-body p-4">
					<div class="order-item-details mb-4">
						<h5 id="orderItemName">Chicken Biryani</h5>
						<div
							class="d-flex justify-content-between align-items-center mt-2">
							<span class="text-muted" id="orderItemPrice">₹250</span>
						</div>
					</div>

					<div class="quantity-control">
						<button class="quantity-btn" id="decreaseQuantity">-</button>
						<input type="number" class="quantity-input" id="quantity"
							value="1" min="1" max="10">
						<button class="quantity-btn" id="increaseQuantity">+</button>
					</div>

					<h6 class="mt-4 mb-3">Select Delivery Location:</h6>
					<div class="location-option selected">
						<input type="radio" class="location-radio" name="deliveryLocation"
							id="currentLocation" checked> <label
							for="currentLocation" class="location-label"> <i
							class="bi bi-geo-alt-fill location-icon"></i>
							<div>
								<div class="fw-bold">Current Location</div>
								<div class="text-muted small">123 Main St, Bengaluru</div>
							</div>
						</label>
					</div>

					<div class="location-option">
						<input type="radio" class="location-radio" name="deliveryLocation"
							id="otherLocation"> <label for="otherLocation"
							class="location-label"> <i
							class="bi bi-geo-alt location-icon"></i>
							<div>
								<div class="fw-bold">Other Location</div>
								<div class="text-muted small">Choose different address</div>
							</div>
						</label>
					</div>

					<div class="total-price">
						Total: <span id="totalPrice">₹250</span>
					</div>

					<button class="confirm-order-btn" id="confirmOrderBtn">
						<i class="bi bi-check-circle"></i> Confirm Order
					</button>
				</div>
			</div>
		</div>
	</div>

	<!-- Bootstrap 5 JS Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

	<script>
        document.addEventListener('DOMContentLoaded', function() {
            // Category tab switching
            const categoryTabs = document.querySelectorAll('.category-tab');
            categoryTabs.forEach(tab => {
                tab.addEventListener('click', function() {
                    categoryTabs.forEach(t => t.classList.remove('active'));
                    this.classList.add('active');
                    
                    // In a real implementation, this would filter the kitchen cards
                    // For demo, we'll just animate the cards
                    const cards = document.querySelectorAll('.kitchen-card');
                    cards.forEach((card, index) => {
                        card.style.animation = 'none';
                        void card.offsetWidth; // Trigger reflow
                        card.style.animation = `fadeIn 0.5s ease forwards ${index * 0.1}s`;
                    });
                });
            });
            
            // Order buttons in menu modal
            const orderButtons = document.querySelectorAll('.order-item-btn');
            const menuModal = document.getElementById('menuModal');
            const quantityModal = new bootstrap.Modal(document.getElementById('quantityModal'));
            
            orderButtons.forEach(button => {
                button.addEventListener('click', function() {
                    const itemName = this.getAttribute('data-item');
                    const itemPrice = this.getAttribute('data-price');
                    
                    // Set values in quantity modal
                    document.getElementById('orderItemName').textContent = itemName;
                    document.getElementById('orderItemPrice').textContent = `₹${itemPrice}`;
                    document.getElementById('quantity').value = 1;
                    document.getElementById('totalPrice').textContent = `₹${itemPrice}`;
                    
                    // Close menu modal and open quantity modal
                    bootstrap.Modal.getInstance(menuModal).hide();
                    quantityModal.show();
                });
            });
            
            // Quantity control
            const quantityInput = document.getElementById('quantity');
            const decreaseBtn = document.getElementById('decreaseQuantity');
            const increaseBtn = document.getElementById('increaseQuantity');
            
            decreaseBtn.addEventListener('click', function() {
                let value = parseInt(quantityInput.value);
                if (value > 1) {
                    quantityInput.value = value - 1;
                    updateTotalPrice();
                }
            });
            



            
            increaseBtn.addEventListener('click', function() {
                let value = parseInt(quantityInput.value);
                if (value < 10) {
                    quantityInput.value = value + 1;
                    updateTotalPrice();
                }
            });
            
            quantityInput.addEventListener('change', function() {
                let value = parseInt(this.value);
                if (isNaN(value) || value < 1) {
                    this.value = 1;
                } else if (value > 10) {
                    this.value = 10;
                }
                updateTotalPrice();
            });
            
            function updateTotalPrice() {
                const quantity = parseInt(quantityInput.value);
                const priceText = document.getElementById('orderItemPrice').textContent;
                const price = parseInt(priceText.replace('₹', ''));
                const total = quantity * price;
                document.getElementById('totalPrice').textContent = `₹${total}`;
            }
            
            // Location selection
            const locationOptions = document.querySelectorAll('.location-option');
            locationOptions.forEach(option => {
                option.addEventListener('click', function() {
                    locationOptions.forEach(opt => opt.classList.remove('selected'));
                    this.classList.add('selected');
                    const radio = this.querySelector('input[type="radio"]');
                    radio.checked = true;
                });
            });
            
            // Confirm order button
            const confirmOrderBtn = document.getElementById('confirmOrderBtn');
            confirmOrderBtn.addEventListener('click', function() {
                const itemName = document.getElementById('orderItemName').textContent;
                const quantity = document.getElementById('quantity').value;
                const totalPrice = document.getElementById('totalPrice').textContent;
                const location = document.querySelector('input[name="deliveryLocation"]:checked').nextElementSibling.querySelector('.fw-bold').textContent;
                
                // In a real app, this would submit the order to the server
                alert(`Order confirmed!\n\nItem: ${itemName}\nQuantity: ${quantity}\nTotal: ${totalPrice}\nLocation: ${location}`);
                
                // Close the modal
                quantityModal.hide();
            });
            
            // Book chef button in menu modal
            const bookChefBtn = document.querySelector('.modal-footer .btn-primary');
            if (bookChefBtn) {
                bookChefBtn.addEventListener('click', function() {
                    // In a real app, this would redirect to booking form with chef ID
                    window.location.href = '/bookchef?chefId=123';
                });
            }
        });
        
        
        
        
        
        /* function editProfile(customerId, email) {
            const csrfToken = document.querySelector('meta[name="_csrf"]').content;
            const csrfHeader = document.querySelector('meta[name="_csrf_header"]').content;

            fetch('/api/customer/editprofile', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                    [csrfHeader]: csrfToken
                },
                body: JSON.stringify({
                    customerId: customerId,
                    email: email
                })
            }).then(response => {
                if (response.ok) {
                    // Optionally redirect or show success
                    console.log("Profile edit request sent successfully.");
                } else {
                    console.error("CSRF failed or request blocked.");
                }
            }).catch(error => {
                console.error("Error occurred: ", error);
            });
        } */

        
        
        fetch("/api/secure/data")
        .then(res => {
          if (res.status === 401) {
            alert("Session expired. Please log in again.");
            window.location.href = "/login";
          }
          return res.json();
        });
        
        
        
        
        document.getElementById('editProfileForm').addEventListener('submit', function(e) {
            // Get CSRF token from cookie
            const csrfCookie = document.cookie.split('; ')
                .find(row => row.startsWith('XSRF-TOKEN='))
                ?.split('=')[1];
            
            // Add to form if found
            if (csrfCookie) {
                const csrfInput = document.createElement('input');
                csrfInput.type = 'hidden';
                csrfInput.name = '_csrf';
                csrfInput.value = csrfCookie;
                e.target.appendChild(csrfInput);
            }
        });
        
        
    </script>
</body>
</html>