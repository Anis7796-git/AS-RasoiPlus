<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Anhee Rasoi</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
<style>
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
	background-color: #fff;
}

.navbar {
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 18px 45px;
	border-bottom: 1px solid #eaeaea;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.05);
	position: relative;
	z-index: 1001;
	background: white;
}

.navbar-left, .navbar-right {
	display: flex;
	align-items: center;
	gap: 25px;
}

.logo {
	height: 40px;
	width: 40px;
	background-color: #ff6600;
	border-radius: 10px;
	display: flex;
	align-items: center;
	justify-content: center;
	color: white;
	font-size: 22px;
	font-weight: bold;
}

.location-select {
	font-weight: bold;
	cursor: pointer;
	position: relative;
}

.location-select::after {
	content: '\f078';
	font-family: "Font Awesome 6 Free";
	font-weight: 900;
	font-size: 10px;
	color: #ff6600;
	margin-left: 5px;
}

.nav-item {
	display: flex;
	align-items: center;
	cursor: pointer;
	font-weight: bold;
	color: #333;
	font-size: 18px;
}

.nav-item i {
	margin-right: 8px;
	font-size: 16px;
}

.nav-item:hover {
	color: #ff6600;
}

.cart-count {
	font-size: 13px;
	padding: 2px 6px;
	background-color: #eee;
	border-radius: 5px;
	margin-left: 5px;
}

.new-badge {
	color: orange;
	font-size: 14px;
	font-weight: bold;
	margin-left: 5px;
}

/* Main container */
.container1 {
	max-width: 1300px;
	margin: 40px auto;
	padding: 24px;
	background: transparent;
	border-radius: 8px;
	box-shadow: none;
}

/* Title + buttons in one line */
.title-row {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-bottom: 15px;
}

.section-title {
	font-size: 20px;
	font-weight: bold;
	color: #333;
}

.scroll-buttons {
	display: flex;
	gap: 8px;
}

.scroll-btn {
	background: white;
	border: 1px solid #ccc;
	border-radius: 50%;
	width: 35px;
	height: 35px;
	cursor: pointer;
	display: flex;
	align-items: center;
	justify-content: center;
	font-size: 16px;
	color: #333;
}

.scroll-btn:hover {
	background-color: #f5f5f5;
	border-color: #999;
}

/* Scrollable row */
.item-row {
	display: flex;
	overflow-x: auto;
	scroll-behavior: smooth;
	gap: 20px;
	padding: 10px 0;
}

.item-row::-webkit-scrollbar {
	display: none;
}

.item-card {
	flex: 0 0 auto;
	width: 120px;
	text-align: center;
	background: #fff;
	border-radius: 8px;
	text-decoration: none;
	transition: box-shadow 0.2s;
}

.item-card:hover {
	box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
}

.item-card img {
	width: 100%;
	height: 100px;
	object-fit: cover;
	border-radius: 8px;
}

.item-name {
	margin-top: 8px;
	font-size: 14px;
	color: #333;
}

/* Sticky Navbar Styles */
.sticky-navbar {
	position: fixed;
	top: 0;
	left: 0;
	right: 0;
	background-color: white;
	z-index: 1000;
	padding: 15px 45px;
	border-bottom: 1px solid #eaeaea;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
	transition: transform 0.3s ease, opacity 0.3s ease;
	transform: translateY(-100%);
	opacity: 0;
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.sticky-navbar.visible {
	transform: translateY(0);
	opacity: 1;
}

.sticky-navbar-left, .sticky-navbar-right {
	display: flex;
	align-items: center;
	gap: 15px;
}

.sticky-logo {
	height: 30px;
	width: 30px;
	background-color: #ff6600;
	border-radius: 8px;
	display: flex;
	align-items: center;
	justify-content: center;
	color: white;
	font-size: 18px;
	font-weight: bold;
}

.sticky-nav-item {
	font-size: 16px;
	cursor: pointer;
	color: #333;
	white-space: nowrap;
}

.sticky-nav-item:hover {
	color: #ff6600;
}

.sticky-nav-item i {
	margin-right: 5px;
	font-size: 14px;
}

.main-heading-container {
	max-width: 1300px;
	margin: 40px auto 0 auto;
	padding: 0 24px 24px 24px;
	background: transparent;
}

.main-heading-content {
	display: flex;
	align-items: center;
	gap: 18px;
}

.main-heading-img {
	width: 48px;
	height: 48px;
	border-radius: 12px;
	background: #fff7f0;
	object-fit: cover;
	box-shadow: 0 2px 8px rgba(0, 0, 0, 0.04);
}

.main-heading-title {
	font-size: 26px;
	font-weight: bold;
	color: #222;
	letter-spacing: -0.5px;
	line-height: 1.2;
}

.all-kitech-container {
	max-width: 1300px;
	margin: 0 auto 40px auto;
	padding: 0 24px;
	background: transparent;
	border-radius: 8px;
	box-shadow: none;
	position: relative;
	max-height: 420px; /* Initial height */
	overflow: hidden;
	transition: max-height 0.7s cubic-bezier(.4, 0, .2, 1);
}

.all-kitech-list {
	display: flex;
	flex-wrap: wrap;
	gap: 24px;
	padding: 24px 0 0 0;
}

.all-kitech-container.expanded {
	max-height: 2000px; /* Large enough to show all items */
}

.all-kitech-fade {
	content: "";
	position: absolute;
	left: 0;
	right: 0;
	bottom: 0;
	height: 60px;
	background: linear-gradient(to bottom, rgba(255, 255, 255, 0) 0%, #fff
		100%);
	pointer-events: none;
	transition: opacity 0.4s;
}

.all-kitech-container.expanded .all-kitech-fade {
	opacity: 0;
}

.footer-container {
	background: #f6f6f8;
	padding: 40px 0 0 0;
	margin-top: 60px;
	font-family: inherit;
}

.footer-top {
	max-width: 1300px;
	margin: 0 auto;
	padding: 0 24px 32px 24px;
	display: flex;
	align-items: center;
	justify-content: space-between;
	border-bottom: 1px solid #eaeaea;
}

.footer-experience {
	font-size: 26px;
	font-weight: bold;
	color: #333;
}

.footer-apps {
	display: flex;
	gap: 18px;
}

.footer-app-img {
	height: 48px;
	border-radius: 10px;
	background: #fff;
	box-shadow: 0 2px 8px rgba(0, 0, 0, 0.04);
}

.footer-main {
	max-width: 1300px;
	margin: 0 auto;
	padding: 32px 24px 24px 24px;
	display: flex;
	gap: 60px;
	flex-wrap: wrap;
}

.footer-logo-section {
	min-width: 160px;
	display: flex;
	flex-direction: column;
	align-items: flex-start;
	gap: 12px;
}

.footer-logo {
	height: 40px;
}

.footer-links {
	display: flex;
	gap: 60px;
	flex-wrap: wrap;
	flex: 1;
}

.footer-title {
	font-weight: bold;
	font-size: 17px;
	margin-bottom: 8px;
	margin-top: 8px;
}

.footer-social i {
	font-size: 18px;
	margin-right: 10px;
	color: #333;
	cursor: pointer;
}

.footer-social i:hover {
	color: #ff6600;
}

@media ( max-width : 900px) {
	.footer-main, .footer-top {
		flex-direction: column;
		gap: 24px;
		align-items: flex-start;
	}
	.footer-links {
		gap: 24px;
	}
}
</style>
</head>
<body>

	<div class="navbar">
		<div class="navbar-left">
			<div class="logo">A</div>
			<div class="location-select">Other</div>
		</div>
		<div class="navbar-right">
			<div class="nav-item">
				<i class="fas fa-briefcase"></i>Swiggy Corporate
			</div>
			<div class="nav-item">
				<i class="fas fa-search"></i>Search
			</div>
			<div class="nav-item">
				<i class="fas fa-gift"></i>Offers <span class="new-badge">NEW</span>
			</div>
			<div class="nav-item">
				<i class="fas fa-question-circle"></i>Help
			</div>
			<div class="nav-item">
				<i class="fas fa-user"></i>Sign In
			</div>
			<div class="nav-item">
				<i class="fas fa-shopping-cart"></i>Cart <span class="cart-count">0</span>
			</div>
		</div>
	</div>

	<div class="sticky-navbar" id="stickyNavbar">
		<div class="sticky-navbar-left">
			<div class="sticky-logo">A</div>
			<div class="sticky-nav-item">Other</div>
		</div>
		<div class="sticky-navbar-right">
			<div class="sticky-nav-item">
				<i class="fas fa-search"></i>Search
			</div>
			<div class="sticky-nav-item">
				<i class="fas fa-gift"></i>Offers <span class="new-badge">NEW</span>
			</div>
			<div class="sticky-nav-item">
				<i class="fas fa-user"></i>Sign In
			</div>
			<div class="sticky-nav-item">
				<i class="fas fa-shopping-cart"></i>Cart <span class="cart-count">0</span>
			</div>
		</div>
	</div>

	<div class="container1">
		<div class="title-row">
			<span class="section-title">What's on your mind?</span>
			<div class="scroll-buttons">
				<button class="scroll-btn" onclick="scrollLeft()">
					<i class="fas fa-chevron-left"></i>
				</button>
				<button class="scroll-btn" onclick="scrollRight()">
					<i class="fas fa-chevron-right"></i>
				</button>
			</div>
		</div>

		<div class="item-row" id="itemRow">
			<c:forEach var="item" items="${menu}">
				<a class="item-card"
					href="/getCategory?id=${item.id}&name=${item.itemName}"> <img
					src="data:image/jpeg;base64,${item.imageBase64}"
					alt="${item.itemName}">
					<div class="item-name">${item.itemName}</div>
				</a>
			</c:forEach>

		</div>
	</div>

	<div class="container1">
		<div class="title-row">
			<span class="section-title"> Top Kitchen Chains in <c:out
					value="${location}" />
			</span>
			<div class="scroll-buttons">
				<button class="scroll-btn" onclick="scrollLeft2()">
					<i class="fas fa-chevron-left"></i>
				</button>
				<button class="scroll-btn" onclick="scrollRight2()">
					<i class="fas fa-chevron-right"></i>
				</button>
			</div>
		</div>

		<div class="item-row" id="itemRow2">
			<c:forEach var="k" items="${nearestKitech}">
				<a class="item-card" href="#">
					<div style="position: relative;">
						<img src="${k.image}" alt="${k.name}">
						<div
							style="position: absolute; bottom: 0; left: 0; right: 0; background: rgba(0, 0, 0, 0.6); color: #fff; font-size: 14px; padding: 4px 6px; border-radius: 0 0 8px 8px;">
							<c:out value="${k.offer}" />
						</div>
					</div>
					<div class="item-name" style="font-weight: bold;">
						<c:out value="${k.name}" />
					</div>
					<div class="item-name" style="color: #666; font-size: 13px;">
						<i class="fas fa-star" style="color: green;"></i>
						<c:out value="${k.dilveryTime}" />
					</div>
					<div class="item-name" style="color: #666; font-size: 13px;">
						<c:out value="${k.kitechName}" />
					</div>
					<div class="item-name" style="color: #999; font-size: 12px;">
						<c:out value="${k.location}" />
					</div>
				</a>
			</c:forEach>
		</div>
	</div>

	<div class="main-heading-container">
		<div class="main-heading-content">
			<img src="https://cdn-icons-png.flaticon.com/512/3075/3075977.png"
				alt="Restaurant" class="main-heading-img"> <span
				class="main-heading-title"> Restaurants with online food
				delivery in <c:out value="${location}" />
			</span>
		</div>
	</div>
	<div class="all-kitech-container" id="allKitechContainer">
		<div class="all-kitech-list">
			<c:forEach var="k" items="${allKitech}">
				<a class="item-card" href="#">
					<div style="position: relative;">
						<img src="${k.image}" alt="${k.name}">
						<div
							style="position: absolute; bottom: 0; left: 0; right: 0; background: rgba(0, 0, 0, 0.6); color: #fff; font-size: 14px; padding: 4px 6px; border-radius: 0 0 8px 8px;">
							<c:out value="${k.offer}" />
						</div>
					</div>
					<div class="item-name" style="font-weight: bold;">
						<c:out value="${k.name}" />
					</div>
					<div class="item-name" style="color: #666; font-size: 13px;">
						<i class="fas fa-star" style="color: green;"></i>
						<c:out value="${k.dilveryTime}" />
					</div>
					<div class="item-name" style="color: #666; font-size: 13px;">
						<c:out value="${k.kitechName}" />
					</div>
					<div class="item-name" style="color: #999; font-size: 12px;">
						<c:out value="${k.location}" />
					</div>
				</a>
			</c:forEach>
		</div>
		<div class="all-kitech-fade"></div>
	</div>
	<div class="footer-container">
		<div class="footer-top">
			<span class="footer-experience"> For better experience, <b>download
					the Swiggy app now</b>
			</span>
			<div class="footer-apps">
				<img
					src="https://res.cloudinary.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,h_60/icon-AppStore_lg30tv"
					alt="App Store" class="footer-app-img"> <img
					src="https://res.cloudinary.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,h_60/icon-GooglePlay_1_zixjxl"
					alt="Google Play" class="footer-app-img">
			</div>
		</div>
		<div class="footer-main">
			<div class="footer-logo-section">
				<img src="https://cdn.worldvectorlogo.com/logos/swiggy-1.svg"
					alt="Swiggy" class="footer-logo" style="height: 40px;">
				<div class="footer-copyright">© 2025 Swiggy Limited</div>
			</div>
			<div class="footer-links">
				<div>
					<div class="footer-title">Company</div>
					<div>About Us</div>
					<div>Swiggy Corporate</div>
					<div>Careers</div>
					<div>Team</div>
					<div>Swiggy One</div>
					<div>Swiggy Instamart</div>
					<div>Swiggy Dineout</div>
					<div>Swiggy Genie</div>
					<div>Minis</div>
					<div>Pyng</div>
				</div>
				<div>
					<div class="footer-title">Contact us</div>
					<div>Help & Support</div>
					<div>Partner with us</div>
					<div>Ride with us</div>
				</div>
				<div>
					<div class="footer-title">Available in:</div>
					<div>Bangalore</div>
					<div>Gurgaon</div>
					<div>Hyderabad</div>
					<div>Delhi</div>
					<div>Mumbai</div>
					<div>Pune</div>
					<div>
						<select
							style="margin-top: 4px; border-radius: 4px; padding: 2px 8px;">
							<option>679 cities</option>
						</select>
					</div>
				</div>
				<div>
					<div class="footer-title">Life at Swiggy</div>
					<div>Explore with Swiggy</div>
					<div>Swiggy News</div>
					<div>Snackables</div>
				</div>
				<div>
					<div class="footer-title">Legal</div>
					<div>Terms & Conditions</div>
					<div>Cookie Policy</div>
					<div>Privacy Policy</div>
					<div>Investor Relations</div>
				</div>
				<div>
					<div class="footer-title">Social Links</div>
					<div class="footer-social">
						<i class="fab fa-linkedin"></i> <i class="fab fa-instagram"></i> <i
							class="fab fa-facebook"></i> <i class="fab fa-pinterest"></i> <i
							class="fab fa-twitter"></i>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
        function scrollLeft() {
            document.getElementById('itemRow').scrollBy({ left: -200, behavior: 'smooth' });
        }

        function scrollRight() {
            document.getElementById('itemRow').scrollBy({ left: 200, behavior: 'smooth' });
        }

        function scrollLeft2() {
            document.getElementById('itemRow2').scrollBy({ left: -200, behavior: 'smooth' });
        }

        function scrollRight2() {
            document.getElementById('itemRow2').scrollBy({ left: 200, behavior: 'smooth' });
        }

        // Improved sticky navbar functionality with throttle
        document.addEventListener('DOMContentLoaded', function() {
            const container1 = document.querySelector('.container1');
            const stickyNavbar = document.getElementById('stickyNavbar');
            const navbar = document.querySelector('.navbar');
            
            // Calculate the scroll position where sticky navbar should appear
            const stickyPoint = container1.offsetTop - navbar.offsetHeight;
            
            function handleScroll() {
                const scrollPosition = window.pageYOffset || document.documentElement.scrollTop;
                
                if (scrollPosition > stickyPoint) {
                    stickyNavbar.classList.add('visible');
                } else {
                    stickyNavbar.classList.remove('visible');
                }
            }
            
            // Throttle the scroll event for better performance
            let isScrolling;
            window.addEventListener('scroll', function() {
                window.clearTimeout(isScrolling);
                isScrolling = setTimeout(handleScroll, 50);
            }, false);
            
            // Initial check in case page loads with scroll position
            handleScroll();
        });




        document.addEventListener('DOMContentLoaded', function() {
        const container = document.getElementById('allKitechContainer');
        let expanded = false;

        function checkExpand() {
            if (expanded) return;
            const rect = container.getBoundingClientRect();
            if (rect.bottom - 100 < window.innerHeight) {
                container.classList.add('expanded');
                expanded = true;
            }
        }


         window.addEventListener('scroll', checkExpand);
        // Also check on load in case already in view
        checkExpand();
    </script>
</body>
</html>