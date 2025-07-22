<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>404 - Page Not Found</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;700&display=swap');
        
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            overflow: hidden;
            color: #333;
        }
        
        .error-container {
            text-align: center;
            max-width: 600px;
            padding: 2rem;
            background: rgba(255, 255, 255, 0.9);
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            position: relative;
            z-index: 10;
        }
        
        .error-code {
            font-size: 6rem;
            font-weight: 700;
            color: #ff4757;
            margin: 0;
            line-height: 1;
        }
        
        .error-title {
            font-size: 2rem;
            margin: 0.5rem 0;
            color: #2f3542;
        }
        
        .error-message {
            font-size: 1.2rem;
            color: #57606f;
            margin-bottom: 2rem;
        }
        
        .home-btn {
            background: #ff4757;
            color: white;
            border: none;
            padding: 12px 30px;
            font-size: 1rem;
            border-radius: 50px;
            cursor: pointer;
            transition: all 0.3s;
            text-decoration: none;
            display: inline-block;
            box-shadow: 0 4px 15px rgba(255, 71, 87, 0.3);
        }
        
        .home-btn:hover {
            background: #ff6b81;
            transform: translateY(-3px);
            box-shadow: 0 6px 20px rgba(255, 71, 87, 0.4);
        }
        
        /* ===== ANIMATED BACKGROUND ===== */
        .animation-container {
            position: absolute;
            width: 100%;
            height: 100%;
            top: 0;
            left: 0;
            z-index: 1;
        }
        
        /* Lost Delivery Guy Animation */
        .delivery-guy {
            position: absolute;
            width: 120px;
            height: 180px;
            bottom: -50px;
            left: 50%;
            transform: translateX(-50%);
            animation: walkCycle 15s linear infinite;
        }
        
        .delivery-body {
            width: 80px;
            height: 120px;
            background: #ff7f50;
            border-radius: 40px 40px 10px 10px;
            position: absolute;
            bottom: 0;
            left: 50%;
            transform: translateX(-50%);
            animation: bodyBounce 2s infinite;
        }
        
        .delivery-head {
            width: 60px;
            height: 60px;
            background: #ffd166;
            border-radius: 50%;
            position: absolute;
            top: -20px;
            left: 50%;
            transform: translateX(-50%);
        }
        
        .eyes {
            position: absolute;
            top: 20px;
            width: 100%;
            display: flex;
            justify-content: center;
            gap: 10px;
        }
        
        .eye {
            width: 10px;
            height: 10px;
            background: #333;
            border-radius: 50%;
            animation: blink 4s infinite;
        }
        
        .mouth {
            width: 25px;
            height: 8px;
            background: #ff8c8c;
            border-radius: 0 0 15px 15px;
            position: absolute;
            top: 40px;
            left: 50%;
            transform: translateX(-50%);
            animation: mouthMove 3s infinite;
        }
        
        .delivery-bag {
            width: 50px;
            height: 60px;
            background: #06d6a0;
            border-radius: 8px;
            position: absolute;
            bottom: 20px;
            right: -25px;
            transform: rotate(15deg);
            animation: bagSwing 2s infinite;
        }
        
        .legs {
            position: absolute;
            bottom: -15px;
            left: 50%;
            transform: translateX(-50%);
            display: flex;
            gap: 5px;
        }
        
        .leg {
            width: 12px;
            height: 25px;
            background: #ff7f50;
            border-radius: 0 0 8px 8px;
            animation: legsMove 1s infinite;
        }
        
        .leg:nth-child(2) {
            animation-delay: 0.5s;
        }
        
        /* Search Magnifying Glass Animation */
        .search-animation {
            position: absolute;
            width: 100px;
            height: 100px;
            top: 20%;
            left: 20%;
            animation: searchMove 20s linear infinite;
        }
        
        .magnifying-glass {
            width: 50px;
            height: 50px;
            border: 5px solid #ff4757;
            border-radius: 50%;
            position: absolute;
            animation: glassPulse 3s infinite;
        }
        
        .glass-handle {
            width: 30px;
            height: 5px;
            background: #ff4757;
            position: absolute;
            top: 35px;
            left: 35px;
            transform: rotate(45deg);
            animation: handlePulse 3s infinite;
        }
        
        /* Floating Food Items */
        .floating-food {
            position: absolute;
            font-size: 24px;
            animation: floatAround 20s linear infinite;
        }
        
        /* ===== KEYFRAME ANIMATIONS ===== */
        @keyframes walkCycle {
            0% { left: -100px; }
            100% { left: calc(100% + 100px); }
        }
        
        @keyframes bodyBounce {
            0%, 100% { transform: translateX(-50%) translateY(0); }
            50% { transform: translateX(-50%) translateY(-5px); }
        }
        
        @keyframes blink {
            0%, 45%, 55%, 100% { height: 10px; }
            50% { height: 2px; }
        }
        
        @keyframes mouthMove {
            0%, 100% { height: 8px; }
            50% { height: 12px; width: 20px; }
        }
        
        @keyframes bagSwing {
            0%, 100% { transform: rotate(15deg); }
            50% { transform: rotate(25deg); }
        }
        
        @keyframes legsMove {
            0%, 100% { transform: translateY(0); }
            50% { transform: translateY(-5px); }
        }
        
        @keyframes searchMove {
            0% { transform: translate(0, 0); }
            25% { transform: translate(50vw, 20vh); }
            50% { transform: translate(30vw, -10vh); }
            75% { transform: translate(-20vw, 15vh); }
            100% { transform: translate(0, 0); }
        }
        
        @keyframes glassPulse {
            0%, 100% { transform: scale(1); }
            50% { transform: scale(1.1); }
        }
        
        @keyframes handlePulse {
            0%, 100% { width: 30px; }
            50% { width: 35px; }
        }
        
        @keyframes floatAround {
            0% { transform: translate(0, 0) rotate(0deg); opacity: 0.8; }
            25% { transform: translate(50px, -30px) rotate(90deg); }
            50% { transform: translate(100px, 0) rotate(180deg); }
            75% { transform: translate(50px, 30px) rotate(270deg); }
            100% { transform: translate(0, 0) rotate(360deg); opacity: 0.8; }
        }
    </style>
</head>
<body>
    <div class="animation-container">
        <!-- Animated Delivery Guy Walking Across Screen -->
        <div class="delivery-guy">
            <div class="delivery-head">
                <div class="eyes">
                    <div class="eye"></div>
                    <div class="eye"></div>
                </div>
                <div class="mouth"></div>
            </div>
            <div class="delivery-body"></div>
            <div class="delivery-bag"></div>
            <div class="legs">
                <div class="leg"></div>
                <div class="leg"></div>
            </div>
        </div>
        
        <!-- Searching Magnifying Glass -->
        <div class="search-animation">
            <div class="magnifying-glass"></div>
            <div class="glass-handle"></div>
        </div>
        
        <!-- Floating Food Items -->
        <div class="floating-food" style="top: 30%; left: 10%; animation-delay: 0s;">🍔</div>
        <div class="floating-food" style="top: 20%; left: 80%; animation-delay: 2s;">🍕</div>
        <div class="floating-food" style="top: 70%; left: 15%; animation-delay: 4s;">🍟</div>
        <div class="floating-food" style="top: 60%; left: 70%; animation-delay: 6s;">🍣</div>
    </div>
    
   <div class="error-container">
    <h1 class="error-code">${statusCode}</h1>
    <h2 class="error-title">${errorTitle}</h2>
    <p class="error-message">${errorMessage}</p>
    <p>Request URI: ${requestUri}</p>
    <p>Exception: ${exception}</p>
    <a href="/" class="home-btn">Take Me Home</a>
</div>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // Add more floating food items dynamically
            const container = document.querySelector('.animation-container');
            const foods = ['🍔', '🍕', '🍟', '🌮', '🍣', '🍩', '🍪', '🍦'];
            
            for (let i = 0; i < 8; i++) {
                const food = document.createElement('div');
                food.className = 'floating-food';
                food.textContent = foods[i];
                food.style.left = Math.random() * 90 + '%';
                food.style.top = Math.random() * 90 + '%';
                food.style.animationDelay = Math.random() * 10 + 's';
                food.style.animationDuration = (Math.random() * 20 + 15) + 's';
                container.appendChild(food);
            }
        });
    </script>
</body>
</html>