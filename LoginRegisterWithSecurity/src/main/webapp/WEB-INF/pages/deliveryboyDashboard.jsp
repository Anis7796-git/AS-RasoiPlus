<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>DeliverPro Elite | Partner Dashboard</title>
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <!-- AOS Animation -->
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
    <style>
        :root {
            --primary: #FF6B6B;
            --primary-dark: #E55C5C;
            --secondary: #FFA502;
            --dark: #2F3542;
            --light: #F1F2F6;
            --success: #4BB543;
            --glass: rgba(255, 255, 255, 0.92);
            --card-bg: rgba(255, 255, 255, 0.95);
            --text-dark: #2F3542;
            --text-light: #57606F;
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
            color: var(--text-dark);
            overflow-x: hidden;
            min-height: 100vh;
        }

        /* Glass Morphism Effects */
        .glass-container {
            background: var(--glass);
            backdrop-filter: blur(12px);
            -webkit-backdrop-filter: blur(12px);
            border-radius: 24px;
            box-shadow: 0 12px 40px rgba(0, 0, 0, 0.12);
            border: 1px solid rgba(255, 255, 255, 0.2);
            overflow: hidden;
            transition: all 0.5s cubic-bezier(0.175, 0.885, 0.32, 1.275);
        }

        .glass-container:hover {
            transform: translateY(-8px);
            box-shadow: 0 16px 48px rgba(0, 0, 0, 0.18);
        }

        /* Floating Neon Effect */
        @keyframes float {
            0% { transform: translateY(0px); }
            50% { transform: translateY(-10px); }
            100% { transform: translateY(0px); }
        }

        .floating {
            animation: float 6s ease-in-out infinite;
        }

        /* Navbar - Ultra Premium */
        .navbar-elite {
            background: var(--glass);
            backdrop-filter: blur(16px);
            padding: 1rem 2rem;
            box-shadow: 0 4px 30px rgba(0, 0, 0, 0.1);
            border-bottom: 1px solid rgba(255, 255, 255, 0.2);
        }

        .logo-elite {
            display: flex;
            align-items: center;
            gap: 0.75rem;
        }

        .logo-elite img {
            height: 42px;
            filter: drop-shadow(0 4px 6px rgba(0, 0, 0, 0.1));
        }

        .logo-text-elite {
            font-size: 1.6rem;
            font-weight: 700;
            background: linear-gradient(to right, var(--primary), var(--secondary));
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            text-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .nav-item-elite {
            display: flex;
            align-items: center;
            gap: 0.5rem;
            font-weight: 500;
            color: var(--text-dark);
            text-decoration: none;
            padding: 0.75rem 1.25rem;
            border-radius: 16px;
            transition: all 0.3s ease;
            margin: 0 0.25rem;
            position: relative;
            overflow: hidden;
        }

        .nav-item-elite::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.3), transparent);
            transition: 0.5s;
        }

        .nav-item-elite:hover::before {
            left: 100%;
        }

        .nav-item-elite:hover, .nav-item-elite.active {
            background: rgba(255, 107, 107, 0.12);
            color: var(--primary);
        }

        .notification-btn-elite {
            position: relative;
            width: 42px;
            height: 42px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            background: rgba(255, 255, 255, 0.8);
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
            transition: all 0.3s ease;
        }

        .notification-btn-elite:hover {
            transform: translateY(-3px);
            box-shadow: 0 6px 16px rgba(0, 0, 0, 0.12);
        }

        .notification-badge-elite {
            position: absolute;
            top: -2px;
            right: -2px;
            background: var(--primary);
            color: white;
            width: 20px;
            height: 20px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 0.7rem;
            font-weight: 600;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.15);
        }

        .profile-btn-elite {
            display: flex;
            align-items: center;
            gap: 0.75rem;
            padding: 0.5rem 1rem;
            border-radius: 50px;
            background: rgba(255, 255, 255, 0.8);
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
            transition: all 0.3s ease;
        }

        .profile-btn-elite:hover {
            transform: translateY(-3px);
            box-shadow: 0 6px 16px rgba(0, 0, 0, 0.12);
        }

        .profile-img-elite {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            object-fit: cover;
            border: 2px solid var(--primary);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        /* Mobile Menu Button */
        .mobile-menu-btn {
            width: 42px;
            height: 42px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            background: rgba(255, 255, 255, 0.8);
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
            border: none;
            transition: all 0.3s ease;
        }

        .mobile-menu-btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 6px 16px rgba(0, 0, 0, 0.12);
        }

        /* Main Content */
        .main-content-elite {
            padding: 2rem;
            margin-top: 20px;
        }

        /* Dashboard Header */
        .dashboard-header-elite {
            margin-bottom: 2.5rem;
            position: relative;
            overflow: hidden;
            border-radius: 16px;
            padding: 2rem;
            /* background: linear-gradient(135deg, rgba(255, 107, 107, 0.15) 0%, rgba(255, 165, 2, 0.15) 100%);
            */
           background: url('texture.png') center center/cover no-repeat;
            backdrop-filter: blur(100px);
        }

        .dashboard-header-elite::before {
            content: '';
            position: absolute;
            top: -50%;
            left: -50%;
            width: 200%;
            height: 200%;
            background: radial-gradient(circle, rgba(255,255,255,0.1) 0%, rgba(255,255,255,0) 70%);
            animation: rotate 20s linear infinite;
            z-index: 0;
        }

        @keyframes rotate {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }

        .dashboard-title-elite {
            font-size: 2.8rem;
            font-weight: 700;
            background: linear-gradient(to right, var(--primary), var(--secondary));
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            text-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            position: relative;
            z-index: 1;
            line-height: 1.2;
        }

        .dashboard-subtitle-elite {
            color: var(--text-light);
            opacity: 0.9;
            font-size: 1.1rem;
            position: relative;
            z-index: 1;
            max-width: 600px;
        }

        /* Stats Cards - Premium 3D Effect */
        .stats-grid-elite {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: 1.5rem;
            margin-bottom: 3rem;
        }

        .stat-card-elite {
            background: var(--card-bg);
            padding: 2rem;
            border-radius: 20px;
            box-shadow: 0 12px 30px rgba(0, 0, 0, 0.08);
            transition: all 0.5s cubic-bezier(0.175, 0.885, 0.32, 1.275);
            position: relative;
            overflow: hidden;
            border: 1px solid rgba(255, 255, 255, 0.3);
        }

        .stat-card-elite::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 4px;
            height: 100%;
            background: linear-gradient(to bottom, var(--primary), var(--secondary));
        }

        .stat-card-elite:hover {
            transform: translateY(-10px) rotateX(5deg) rotateY(2deg);
            box-shadow: 0 20px 50px rgba(0, 0, 0, 0.15);
        }

        .stat-header-elite {
            display: flex;
            justify-content: space-between;
            margin-bottom: 1.5rem;
            align-items: flex-start;
        }

        .stat-icon-elite {
            width: 60px;
            height: 60px;
            border-radius: 16px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.8rem;
            background: linear-gradient(135deg, rgba(255, 107, 107, 0.1) 0%, rgba(255, 165, 2, 0.1) 100%);
            color: var(--primary);
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
        }

        .stat-value-elite {
            font-size: 2.5rem;
            font-weight: 700;
            margin-bottom: 0.5rem;
            background: linear-gradient(to right, var(--primary), var(--secondary));
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            line-height: 1;
        }

        .stat-title-elite {
            color: var(--text-light);
            font-size: 1rem;
            font-weight: 500;
        }

        .stat-trend-elite {
            display: flex;
            align-items: center;
            gap: 0.5rem;
            font-size: 0.9rem;
            margin-top: 1rem;
            padding: 0.5rem 0.75rem;
            border-radius: 50px;
            background: rgba(75, 181, 67, 0.1);
            width: fit-content;
        }

        .stat-trend-elite.up {
            color: var(--success);
        }

        .stat-trend-elite.down {
            background: rgba(255, 107, 107, 0.1);
            color: var(--primary);
        }

        /* Active Order - Premium Card */
        .active-order-elite {
            background: var(--card-bg);
            border-radius: 20px;
            box-shadow: 0 12px 30px rgba(0, 0, 0, 0.08);
            margin-bottom: 3rem;
            overflow: hidden;
            border: 1px solid rgba(255, 255, 255, 0.3);
            position: relative;
        }

        .active-order-elite::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 6px;
            background: linear-gradient(to right, var(--primary), var(--secondary));
        }

        .order-header-elite {
            padding: 1.75rem;
            background: linear-gradient(135deg, rgba(255, 107, 107, 0.08) 0%, rgba(255, 165, 2, 0.08) 100%);
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-bottom: 1px solid rgba(0, 0, 0, 0.05);
        }

        .order-title-elite {
            font-size: 1.5rem;
            font-weight: 600;
            color: var(--primary);
            display: flex;
            align-items: center;
            gap: 0.75rem;
        }

        .order-time-elite {
            display: flex;
            align-items: center;
            gap: 0.5rem;
            font-weight: 500;
            padding: 0.5rem 1rem;
            border-radius: 50px;
            background: rgba(255, 107, 107, 0.1);
            color: var(--primary);
        }

        .order-body-elite {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 2rem;
            padding: 2rem;
        }

        @media (max-width: 992px) {
            .order-body-elite {
                grid-template-columns: 1fr;
            }
        }

        .order-info-elite {
            display: flex;
            flex-direction: column;
            gap: 1.5rem;
        }

        .info-group-elite {
            margin-bottom: 1rem;
        }

        .info-label-elite {
            font-size: 0.8rem;
            color: var(--text-light);
            text-transform: uppercase;
            letter-spacing: 1px;
            margin-bottom: 0.5rem;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .info-value-elite {
            font-weight: 500;
            font-size: 1.1rem;
        }

        .distance-elite {
            color: var(--primary);
            font-weight: 600;
        }

        .order-items-elite {
            background: rgba(0, 0, 0, 0.03);
            padding: 1.5rem;
            border-radius: 16px;
        }

        .items-title-elite {
            font-size: 0.9rem;
            color: var(--text-light);
            margin-bottom: 1rem;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .item-list-elite {
            list-style: none;
        }

        .item-list-elite li {
            padding: 0.75rem 0;
            border-bottom: 1px dashed rgba(0, 0, 0, 0.08);
            display: flex;
            justify-content: space-between;
            align-items: center;
            transition: all 0.3s ease;
        }

        .item-list-elite li:hover {
            transform: translateX(5px);
        }

        .item-list-elite li:last-child {
            border-bottom: none;
        }

        .item-price-elite {
            color: var(--text-light);
            font-weight: 500;
        }

        .order-total-elite {
            font-weight: 600;
            font-size: 1.2rem;
            border-top: 1px solid rgba(0, 0, 0, 0.1);
            padding-top: 1rem;
            margin-top: 1rem;
            display: flex;
            justify-content: space-between;
        }

        /* Google Maps Integration - Premium Styled */
        .order-map-elite {
            height: 100%;
            min-height: 300px;
            border-radius: 16px;
            overflow: hidden;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.1);
            position: relative;
        }

        .order-map-elite::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: linear-gradient(135deg, rgba(255, 107, 107, 0.05) 0%, rgba(255, 165, 2, 0.05) 100%);
            z-index: 1;
            pointer-events: none;
        }

        #deliveryMapElite {
            height: 100%;
            width: 100%;
            border-radius: 16px;
        }

        /* Order Actions - Animated Buttons */
        .order-actions-elite {
            display: flex;
            justify-content: space-between;
            padding: 1.75rem;
            border-top: 1px solid rgba(0, 0, 0, 0.05);
            flex-wrap: wrap;
            gap: 1rem;
            background: rgba(0, 0, 0, 0.02);
        }

        .btn-elite {
            padding: 1rem 1.75rem;
            border-radius: 16px;
            border: none;
            font-weight: 500;
            cursor: pointer;
            display: inline-flex;
            align-items: center;
            gap: 0.75rem;
            transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
            position: relative;
            overflow: hidden;
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.1);
            font-size: 1rem;
            flex: 1;
            min-width: 200px;
            justify-content: center;
        }

        .btn-primary-elite {
            background: linear-gradient(135deg, var(--primary) 0%, var(--secondary) 100%);
            color: white;
            box-shadow: 0 8px 20px rgba(255, 107, 107, 0.3);
        }

        .btn-primary-elite:hover {
            transform: translateY(-5px);
            box-shadow: 0 12px 25px rgba(255, 107, 107, 0.4);
        }

        .btn-primary-elite:active {
            transform: translateY(0);
        }

        .btn-outline-elite {
            background: transparent;
            border: 1px solid var(--primary);
            color: var(--primary);
        }

        .btn-outline-elite:hover {
            background: rgba(255, 107, 107, 0.1);
            transform: translateY(-5px);
            box-shadow: 0 8px 20px rgba(255, 107, 107, 0.2);
        }

        .btn-success-elite {
            background: linear-gradient(135deg, var(--success) 0%, #3AA73D 100%);
            color: white;
            box-shadow: 0 8px 20px rgba(75, 181, 67, 0.3);
        }

        .btn-success-elite:hover {
            transform: translateY(-5px);
            box-shadow: 0 12px 25px rgba(75, 181, 67, 0.4);
        }

        .btn-elite i {
            font-size: 1.2rem;
            transition: all 0.3s ease;
        }

        .btn-elite:hover i {
            transform: scale(1.2);
        }

        /* Order Queue - Premium Styled */
        .order-queue-elite {
            background: var(--card-bg);
            border-radius: 20px;
            box-shadow: 0 12px 30px rgba(0, 0, 0, 0.08);
            padding: 2rem;
            margin-bottom: 3rem;
            border: 1px solid rgba(255, 255, 255, 0.3);
        }

        .queue-header-elite {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 2rem;
            flex-wrap: wrap;
            gap: 1rem;
        }

        .queue-title-elite {
            font-size: 1.5rem;
            font-weight: 600;
            color: var(--text-dark);
            display: flex;
            align-items: center;
            gap: 0.75rem;
        }

        .queue-tabs-elite {
            display: flex;
            gap: 0.5rem;
            background: rgba(0, 0, 0, 0.05);
            padding: 0.5rem;
            border-radius: 50px;
        }

        .tab-btn-elite {
            padding: 0.75rem 1.25rem;
            border-radius: 50px;
            border: none;
            background: transparent;
            font-size: 0.9rem;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .tab-btn-elite.active {
            background: linear-gradient(to right, var(--primary), var(--secondary));
            color: white;
            box-shadow: 0 4px 12px rgba(255, 107, 107, 0.3);
        }

        .queue-list-elite {
            list-style: none;
        }

        .queue-item-elite {
            display: grid;
            grid-template-columns: 1fr 1fr 180px;
            align-items: center;
            padding: 1.5rem;
            border-radius: 16px;
            margin-bottom: 1rem;
            background: rgba(0, 0, 0, 0.03);
            transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
            border: 1px solid rgba(255, 255, 255, 0.3);
        }

        @media (max-width: 768px) {
            .queue-item-elite {
                grid-template-columns: 1fr;
                gap: 1.5rem;
            }
        }

        .queue-item-elite:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
            background: rgba(255, 255, 255, 0.6);
        }

        .queue-item-info-elite {
            display: flex;
            flex-direction: column;
            gap: 0.5rem;
        }

        .queue-item-id-elite {
            font-weight: 600;
            font-size: 1.1rem;
            color: var(--primary);
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .queue-item-restaurant-elite, .queue-item-customer-elite {
            font-size: 0.95rem;
            color: var(--text-dark);
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .queue-item-restaurant-elite i, .queue-item-customer-elite i {
            color: var(--text-light);
            font-size: 1rem;
        }

        .queue-item-time-elite {
            display: flex;
            align-items: center;
            gap: 0.5rem;
            color: var(--secondary);
            font-weight: 500;
            padding: 0.5rem 1rem;
            border-radius: 50px;
            background: rgba(255, 165, 2, 0.1);
            width: fit-content;
        }

        .queue-item-actions-elite {
            display: flex;
            justify-content: flex-end;
            gap: 0.75rem;
        }

        @media (max-width: 768px) {
            .queue-item-actions-elite {
                justify-content: flex-start;
            }
        }

        .btn-sm-elite {
            padding: 0.75rem 1.25rem;
            font-size: 0.9rem;
            min-width: auto;
        }

        /* Earnings Chart - Premium Styled */
        .earnings-card-elite {
            background: var(--card-bg);
            border-radius: 20px;
            box-shadow: 0 12px 30px rgba(0, 0, 0, 0.08);
            padding: 2rem;
            border: 1px solid rgba(255, 255, 255, 0.3);
        }

        .earnings-header-elite {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 2rem;
            flex-wrap: wrap;
            gap: 1rem;
        }

        .earnings-title-elite {
            font-size: 1.5rem;
            font-weight: 600;
            color: var(--text-dark);
            display: flex;
            align-items: center;
            gap: 0.75rem;
        }

        .earnings-filter-elite {
            display: flex;
            gap: 0.5rem;
            background: rgba(0, 0, 0, 0.05);
            padding: 0.5rem;
            border-radius: 50px;
        }

        .filter-btn-elite {
            padding: 0.75rem 1.25rem;
            border-radius: 50px;
            border: none;
            background: transparent;
            font-size: 0.9rem;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .filter-btn-elite.active {
            background: linear-gradient(to right, var(--primary), var(--secondary));
            color: white;
            box-shadow: 0 4px 12px rgba(255, 107, 107, 0.3);
        }

        .chart-container-elite {
            height: 350px;
            position: relative;
        }

        #earningsChartElite {
            width: 100%;
            height: 100%;
        }

        /* Pulse Animation for New Orders */
        @keyframes pulse {
            0% { box-shadow: 0 0 0 0 rgba(255, 107, 107, 0.4); }
            70% { box-shadow: 0 0 0 15px rgba(255, 107, 107, 0); }
            100% { box-shadow: 0 0 0 0 rgba(255, 107, 107, 0); }
        }

        .pulse-elite {
            animation: pulse 2s infinite;
            position: relative;
        }

        .pulse-elite::after {
            content: 'NEW';
            position: absolute;
            top: -8px;
            right: -8px;
            background: var(--primary);
            color: white;
            font-size: 0.7rem;
            font-weight: 600;
            padding: 0.25rem 0.5rem;
            border-radius: 50px;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.15);
        }

        /* Responsive Adjustments */
        @media (max-width: 1200px) {
            .dashboard-title-elite {
                font-size: 2.4rem;
            }
            
            .stat-card-elite {
                padding: 1.5rem;
            }
            
            .order-body-elite {
                gap: 1.5rem;
                padding: 1.5rem;
            }
        }

        @media (max-width: 992px) {
            .dashboard-title-elite {
                font-size: 2rem;
            }
            
            .dashboard-header-elite {
                padding: 1.5rem;
            }
            
            .stat-value-elite {
                font-size: 2rem;
            }
            
            .stat-icon-elite {
                width: 50px;
                height: 50px;
                font-size: 1.5rem;
            }
            
            .btn-elite {
                min-width: 160px;
            }
        }

        @media (max-width: 768px) {
            .navbar-elite {
                padding: 1rem;
            }
            
            .dashboard-title-elite {
                font-size: 1.8rem;
            }
            
            .dashboard-subtitle-elite {
                font-size: 1rem;
            }
            
            .stats-grid-elite {
                grid-template-columns: 1fr;
            }
            
            .order-header-elite {
                flex-direction: column;
                align-items: flex-start;
                gap: 1rem;
                padding: 1.5rem;
            }
            
            .order-title-elite {
                font-size: 1.3rem;
            }
            
            .order-actions-elite {
                flex-direction: column;
            }
            
            .btn-elite {
                width: 100%;
            }
            
            .queue-header-elite {
                flex-direction: column;
                align-items: flex-start;
            }
            
            .queue-tabs-elite, .earnings-filter-elite {
                width: 100%;
                justify-content: space-between;
            }
            
            .tab-btn-elite, .filter-btn-elite {
                flex: 1;
                text-align: center;
            }
        }

        @media (max-width: 576px) {
            .main-content-elite {
                padding: 1.5rem 1rem;
            }
            
            .dashboard-header-elite {
                padding: 1.5rem 1rem;
            }
            
            .dashboard-title-elite {
                font-size: 1.6rem;
            }
            
            .order-body-elite, .order-actions-elite {
                padding: 1.25rem;
            }
            
            .order-queue-elite, .earnings-card-elite {
                padding: 1.5rem;
            }
        }
    </style>
</head>
<body>
    <!-- Navbar - Ultra Premium -->
    <nav class="navbar navbar-expand-lg navbar-elite">
        <div class="container-fluid">
            <div class="logo-elite">
                <img src="https://via.placeholder.com/40x40" alt="DeliverPro Elite Logo">
                <span class="logo-text-elite">DeliverPro Elite</span>
            </div>
            
            <button class="mobile-menu-btn d-lg-none" type="button" data-bs-toggle="collapse" data-bs-target="#navbarElite">
                <i class="bi bi-list"></i>
            </button>
            
            <div class="collapse navbar-collapse" id="navbarElite">
                <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a href="#" class="nav-item-elite active">
                            <i class="bi bi-speedometer2"></i> Dashboard
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="#" class="nav-item-elite">
                            <i class="bi bi-map"></i> Deliveries
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="#" class="nav-item-elite">
                            <i class="bi bi-cash-coin"></i> Earnings
                        </a>
                    </li>
                    <li class="nav-item">
                        <div class="notification-btn-elite" id="notificationBtnElite">
                            <i class="bi bi-bell"></i>
                            <span class="notification-badge-elite">3</span>
                        </div>
                    </li>
                    <li class="nav-item">
                        <div class="profile-btn-elite" id="profileBtnElite">
                            <img src="https://randomuser.me/api/portraits/men/32.jpg" alt="Profile" class="profile-img-elite">
                            <span>Rahul S.</span>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Main Content -->
    <div class="main-content-elite container-fluid">
        <!-- Dashboard Header -->
        <div class="dashboard-header-elite" data-aos="fade-up">
            <h1 class="dashboard-title-elite">Delivery Dashboard</h1>
            <p class="dashboard-subtitle-elite">Welcome back, Rahul! You have <strong>3 active deliveries</strong> with <strong>2 new orders</strong> available</p>
        </div>

        <!-- Stats Grid -->
        <div class="stats-grid-elite">
            <div class="stat-card-elite" data-aos="fade-up" data-aos-delay="100">
                <div class="stat-header-elite">
                    <div>
                        <div class="stat-value-elite">₹12,850</div>
                        <div class="stat-title-elite">Total Earnings</div>
                        <div class="stat-trend-elite up">
                            <i class="bi bi-arrow-up"></i> 12% from last week
                        </div>
                    </div>
                    <div class="stat-icon-elite">
                        <i class="bi bi-cash-stack"></i>
                    </div>
                </div>
            </div>

            <div class="stat-card-elite" data-aos="fade-up" data-aos-delay="200">
                <div class="stat-header-elite">
                    <div>
                        <div class="stat-value-elite">87</div>
                        <div class="stat-title-elite">Completed Deliveries</div>
                        <div class="stat-trend-elite up">
                            <i class="bi bi-arrow-up"></i> 5% from last week
                        </div>
                    </div>
                    <div class="stat-icon-elite">
                        <i class="bi bi-check-circle"></i>
                    </div>
                </div>
            </div>

            <div class="stat-card-elite" data-aos="fade-up" data-aos-delay="300">
                <div class="stat-header-elite">
                    <div>
                        <div class="stat-value-elite">4.8</div>
                        <div class="stat-title-elite">Average Rating</div>
                        <div class="stat-trend-elite down">
                            <i class="bi bi-arrow-down"></i> 0.1 from last week
                        </div>
                    </div>
                    <div class="stat-icon-elite">
                        <i class="bi bi-star"></i>
                    </div>
                </div>
            </div>

            <div class="stat-card-elite" data-aos="fade-up" data-aos-delay="400">
                <div class="stat-header-elite">
                    <div>
                        <div class="stat-value-elite">96%</div>
                        <div class="stat-title-elite">On-Time Rate</div>
                        <div class="stat-trend-elite up">
                            <i class="bi bi-arrow-up"></i> 2% from last week
                        </div>
                    </div>
                    <div class="stat-icon-elite">
                        <i class="bi bi-clock"></i>
                    </div>
                </div>
            </div>
        </div>

        <!-- Active Order -->
        <div class="active-order-elite" data-aos="fade-up">
            <div class="order-header-elite">
                <h3 class="order-title-elite">
                    <i class="bi bi-truck"></i> Active Delivery: #DP-7842
                </h3>
                <div class="order-time-elite">
                    <i class="bi bi-clock"></i>
                    <span>Deliver by 7:45 PM (32 mins left)</span>
                </div>
            </div>

            <div class="order-body-elite">
                <div class="order-info-elite">
                    <div class="info-group-elite">
                        <div class="info-label-elite">
                            <i class="bi bi-shop"></i> Pickup From
                        </div>
                        <div class="info-value-elite">Burger King, MG Road <span class="distance-elite">(1.2 km away)</span></div>
                    </div>

                    <div class="info-group-elite">
                        <div class="info-label-elite">
                            <i class="bi bi-person"></i> Customer
                        </div>
                        <div class="info-value-elite">Amit Patel - 9876543210</div>
                        <div class="info-value-elite">201, Sunshine Apartments, Brigade Road</div>
                        <div class="info-value-elite"><span class="distance-elite">(3.5 km from restaurant)</span></div>
                    </div>

                    <div class="info-group-elite">
                        <div class="info-label-elite">
                            <i class="bi bi-credit-card"></i> Payment Method
                        </div>
                        <div class="info-value-elite">Prepaid (Online Payment)</div>
                    </div>

                    <div class="order-items-elite">
                        <div class="items-title-elite">
                            <i class="bi bi-basket"></i> ITEMS (3)
                        </div>
                        <ul class="item-list-elite">
                            <li>
                                <span>1 x Whopper Meal</span>
                                <span class="item-price-elite">₹259</span>
                            </li>
                            <li>
                                <span>2 x Chicken Cheeseburger</span>
                                <span class="item-price-elite">₹179 each</span>
                            </li>
                            <li>
                                <span>1 x Fries (Large)</span>
                                <span class="item-price-elite">₹99</span>
                            </li>
                            <li class="order-total-elite">
                                <span>Total</span>
                                <span>₹716</span>
                            </li>
                        </ul>
                    </div>
                </div>

                <div class="order-map-elite">
                    <div id="deliveryMapElite"></div>
                </div>
            </div>

            <div class="order-actions-elite">
                <button class="btn btn-outline-elite" id="contactCustomerElite">
                    <i class="bi bi-telephone"></i> Contact Customer
                </button>
                <button class="btn btn-outline-elite" id="contactRestaurantElite">
                    <i class="bi bi-shop"></i> Contact Restaurant
                </button>
                <button class="btn btn-primary-elite" id="navigateBtnElite">
                    <i class="bi bi-geo-alt"></i> Navigate
                </button>
                <button class="btn btn-success-elite" id="orderStatusBtnElite">
                    <i class="bi bi-check-circle"></i> Picked Up
                </button>
            </div>
        </div>

        <!-- Order Queue -->
        <div class="order-queue-elite" data-aos="fade-up" data-aos-delay="100">
            <div class="queue-header-elite">
                <h3 class="queue-title-elite">
                    <i class="bi bi-list-task"></i> Available Orders
                </h3>
                <div class="queue-tabs-elite">
                    <button class="tab-btn-elite active">All</button>
                    <button class="tab-btn-elite">Nearby</button>
                    <button class="tab-btn-elite">High Value</button>
                </div>
            </div>

            <ul class="queue-list-elite">
                <li class="queue-item-elite pulse-elite" data-aos="fade-up">
                    <div class="queue-item-info-elite">
                        <span class="queue-item-id-elite">
                            <i class="bi bi-hash"></i> #DP-7843
                        </span>
                        <span class="queue-item-restaurant-elite">
                            <i class="bi bi-shop"></i> Pizza Hut, Indiranagar
                        </span>
                        <span class="queue-item-customer-elite">
                            <i class="bi bi-person"></i> Riya Sharma, Koramangala
                        </span>
                    </div>
                    <div class="queue-item-time-elite">
                        <i class="bi bi-clock"></i> Ready in 10-15 mins
                    </div>
                    <div class="queue-item-actions-elite">
                        <button class="btn btn-primary-elite btn-sm-elite accept-btn-elite">
                            <i class="bi bi-check-circle"></i> Accept
                        </button>
                        <button class="btn btn-outline-elite btn-sm-elite reject-btn-elite">
                            <i class="bi bi-x-circle"></i> Reject
                        </button>
                    </div>
                </li>

                <li class="queue-item-elite" data-aos="fade-up" data-aos-delay="50">
                    <div class="queue-item-info-elite">
                        <span class="queue-item-id-elite">
                            <i class="bi bi-hash"></i> #DP-7844
                        </span>
                        <span class="queue-item-restaurant-elite">
                            <i class="bi bi-shop"></i> Dominos, Whitefield
                        </span>
                        <span class="queue-item-customer-elite">
                            <i class="bi bi-person"></i> Vikram Singh, Marathahalli
                        </span>
                    </div>
                    <div class="queue-item-time-elite">
                        <i class="bi bi-clock"></i> Ready in 20-25 mins
                    </div>
                    <div class="queue-item-actions-elite">
                        <button class="btn btn-primary-elite btn-sm-elite accept-btn-elite">
                            <i class="bi bi-check-circle"></i> Accept
                        </button>
                        <button class="btn btn-outline-elite btn-sm-elite reject-btn-elite">
                            <i class="bi bi-x-circle"></i> Reject
                        </button>
                    </div>
                </li>
            </ul>
        </div>

        <!-- Earnings Chart -->
        <div class="earnings-card-elite" data-aos="fade-up" data-aos-delay="150">
            <div class="earnings-header-elite">
                <h3 class="earnings-title-elite">
                    <i class="bi bi-graph-up"></i> Earnings Analytics
                </h3>
                <div class="earnings-filter-elite">
                    <button class="filter-btn-elite active">Week</button>
                    <button class="filter-btn-elite">Month</button>
                    <button class="filter-btn-elite">Year</button>
                </div>
            </div>
            <div class="chart-container-elite">
                <canvas id="earningsChartElite"></canvas>
            </div>
        </div>
    </div>

    <!-- Bootstrap 5 JS Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <!-- AOS Animation -->
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
    <!-- Chart.js -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    
    <script>
        // Initialize AOS Animation
        AOS.init({
            duration: 800,
            easing: 'ease-in-out',
            once: false
        });

        // Initialize Google Maps
        function initMap() {
            const map = new google.maps.Map(document.getElementById("deliveryMapElite"), {
                center: { lat: 12.9716, lng: 77.5946 }, // Bangalore coordinates
                zoom: 13,
                mapTypeControl: false,
                streetViewControl: false,
                styles: [
                    {
                        featureType: "poi",
                        stylers: [{ visibility: "off" }] // Hide POIs
                    },
                    {
                        featureType: "transit",
                        stylers: [{ visibility: "off" }] // Hide transit
                    },
                    {
                        featureType: "road",
                        stylers: [{ "color": "#ffffff" }] // White roads
                    },
                    {
                        featureType: "landscape",
                        stylers: [{ "color": "#f5f5f5" }] // Light landscape
                    }
                ]
            });

            // Restaurant Marker
            const restaurantMarker = new google.maps.Marker({
                position: { lat: 12.975, lng: 77.61 },
                map: map,
                title: "Burger King, MG Road",
                icon: {
                    url: "https://maps.google.com/mapfiles/ms/icons/red-dot.png"
                }
            });

            // Customer Marker
            const customerMarker = new google.maps.Marker({
                position: { lat: 12.968, lng: 77.58 },
                map: map,
                title: "Amit Patel, Sunshine Apartments",
                icon: {
                    url: "https://maps.google.com/mapfiles/ms/icons/green-dot.png"
                }
            });

            // Draw Route
            const deliveryPath = new google.maps.Polyline({
                path: [
                    { lat: 12.975, lng: 77.61 }, // Restaurant
                    { lat: 12.968, lng: 77.58 }  // Customer
                ],
                geodesic: true,
                strokeColor: "#FF6B6B",
                strokeOpacity: 1.0,
                strokeWeight: 4,
                map: map
            });

            // Fit map to markers
            const bounds = new google.maps.LatLngBounds();
            bounds.extend(restaurantMarker.getPosition());
            bounds.extend(customerMarker.getPosition());
            map.fitBounds(bounds);
        }

        // Initialize Earnings Chart
        function initChart() {
            const ctx = document.getElementById('earningsChartElite').getContext('2d');
            new Chart(ctx, {
                type: 'bar',
                data: {
                    labels: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
                    datasets: [{
                        label: 'Earnings (₹)',
                        data: [1250, 1890, 1820, 2180, 1750, 2350, 1950],
                        backgroundColor: '#FF6B6B',
                        borderRadius: 8,
                        borderSkipped: false,
                    }]
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: false,
                    plugins: {
                        legend: { display: false },
                        tooltip: {
                            backgroundColor: '#2F3542',
                            titleFont: { family: 'Poppins', size: 14 },
                            bodyFont: { family: 'Poppins', size: 12 },
                            padding: 12,
                            cornerRadius: 12,
                            displayColors: false,
                            callbacks: {
                                label: (context) => '₹' + context.raw.toLocaleString()
                            }
                        }
                    },
                    scales: {
                        x: {
                            grid: { display: false },
                            ticks: { font: { family: 'Poppins' } }
                        },
                        y: {
                            grid: { color: 'rgba(0, 0, 0, 0.05)' },
                            ticks: { 
                                font: { family: 'Poppins' },
                                callback: (value) => '₹' + value
                            }
                        }
                    }
                }
            });
        }

        // Order Status Button
        document.getElementById('orderStatusBtnElite').addEventListener('click', function() {
            if (this.textContent.includes('Picked Up')) {
                if (confirm('Mark order as picked up?')) {
                    this.innerHTML = '<i class="bi bi-check-circle-fill"></i> Delivered';
                    this.style.background = 'linear-gradient(135deg, #4BB543 0%, #3AA73D 100%)';
                    
                    // Add confetti effect
                    const confetti = document.createElement('div');
                    confetti.innerHTML = `
                        <div style="position: fixed; top: 0; left: 0; width: 100%; height: 100%; pointer-events: none; z-index: 1000;">
                            <div style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); font-size: 3rem; color: #4BB543; opacity: 0; animation: fadeInOut 2s ease-in-out;">
                                <i class="bi bi-check-circle-fill"></i>
                            </div>
                        </div>
                    `;
                    document.body.appendChild(confetti);
                    
                    setTimeout(() => {
                        confetti.remove();
                    }, 2000);
                }
            } else {
                if (confirm('Mark order as delivered?')) {
                    this.innerHTML = '<i class="bi bi-check-all"></i> Completed';
                    this.style.background = 'linear-gradient(135deg, #2ECC71 0%, #27AE60 100%)';
                    
                    // Simulate new order assignment
                    setTimeout(() => {
                        alert('New order assigned: #DP-7845 from KFC');
                        document.querySelector('.active-order-elite .order-title-elite').textContent = 'Active Delivery: #DP-7845';
                        document.querySelector('.active-order-elite .order-time-elite').innerHTML = '<i class="bi bi-clock"></i> Deliver by 8:30 PM (45 mins left)';
                        document.getElementById('orderStatusBtnElite').innerHTML = '<i class="bi bi-check-circle"></i> Picked Up';
                        document.getElementById('orderStatusBtnElite').style.background = 'linear-gradient(135deg, var(--primary) 0%, var(--secondary) 100%)';
                    }, 1500);
                }
            }
        });

        // Navigate Button (Google Maps)
        document.getElementById('navigateBtnElite').addEventListener('click', function() {
            const restaurant = "12.975,77.61";
            const customer = "12.968,77.58";
            const mapsUrl = `https://www.google.com/maps/dir/?api=1&origin=${restaurant}&destination=${customer}&travelmode=driving`;
            
            // Show animated modal
            const modal = document.createElement('div');
            modal.innerHTML = `
                <div style="position: fixed; top: 0; left: 0; width: 100%; height: 100%; background: rgba(0,0,0,0.7); display: flex; justify-content: center; align-items: center; z-index: 2000;">
                    <div style="background: white; padding: 2rem; border-radius: 16px; text-align: center; max-width: 90%; width: 400px;">
                        <i class="bi bi-geo-alt-fill" style="font-size: 3rem; color: #FF6B6B; margin-bottom: 1rem;"></i>
                        <h3 style="margin-bottom: 1rem;">Opening Navigation</h3>
                        <p style="margin-bottom: 1.5rem;">You'll be redirected to Google Maps for directions</p>
                        <button id="confirmNav" style="padding: 0.75rem 1.5rem; background: #FF6B6B; color: white; border: none; border-radius: 8px; cursor: pointer; font-weight: 500;">Continue</button>
                    </div>
                </div>
            `;
            document.body.appendChild(modal);
            
            document.getElementById('confirmNav').addEventListener('click', function() {
                modal.remove();
                // window.open(mapsUrl, '_blank'); // Uncomment in production
                alert(`In production, this would open: ${mapsUrl}`);
            });
        });

        // Accept/Reject Orders
        document.querySelectorAll('.accept-btn-elite').forEach(btn => {
            btn.addEventListener('click', function() {
                const orderItem = this.closest('.queue-item-elite');
                if (confirm('Accept this delivery order?')) {
                    // Add animation
                    orderItem.style.transform = 'scale(0.95)';
                    orderItem.style.opacity = '0.5';
                    
                    setTimeout(() => {
                        orderItem.remove();
                        // Show success notification
                        const notification = document.createElement('div');
                        notification.innerHTML = `
                            <div style="position: fixed; bottom: 20px; right: 20px; background: #4BB543; color: white; padding: 1rem; border-radius: 12px; box-shadow: 0 4px 20px rgba(0,0,0,0.15); z-index: 1000; animation: slideIn 0.5s ease-out;">
                                <i class="bi bi-check-circle-fill" style="margin-right: 0.5rem;"></i>
                                Order accepted successfully!
                            </div>
                        `;
                        document.body.appendChild(notification);
                        
                        setTimeout(() => {
                            notification.style.animation = 'slideOut 0.5s ease-in';
                            setTimeout(() => notification.remove(), 500);
                        }, 3000);
                    }, 300);
                }
            });
        });

        document.querySelectorAll('.reject-btn-elite').forEach(btn => {
            btn.addEventListener('click', function() {
                const orderItem = this.closest('.queue-item-elite');
                if (confirm('Reject this delivery order?')) {
                    // Add animation
                    orderItem.style.transform = 'translateX(100px)';
                    orderItem.style.opacity = '0';
                    
                    setTimeout(() => {
                        orderItem.remove();
                    }, 300);
                }
            });
        });

        // Notification Button
        document.getElementById('notificationBtnElite').addEventListener('click', function() {
            // Show notification panel
            const panel = document.createElement('div');
            panel.innerHTML = `
                <div style="position: fixed; top: 0; right: 0; width: 100%; max-width: 400px; height: 100%; background: white; box-shadow: -5px 0 30px rgba(0,0,0,0.1); z-index: 1000; transform: translateX(100%); animation: slideIn 0.4s ease-out forwards;">
                    <div style="padding: 1.5rem; border-bottom: 1px solid #eee; display: flex; justify-content: space-between; align-items: center;">
                        <h4 style="margin: 0; font-weight: 600;">Notifications</h4>
                        <button id="closeNotifPanel" style="background: none; border: none; font-size: 1.5rem; cursor: pointer;">×</button>
                    </div>
                    <div style="padding: 1rem; overflow-y: auto; height: calc(100% - 60px);">
                        <div style="padding: 1rem; background: #f9f9f9; border-radius: 12px; margin-bottom: 1rem;">
                            <div style="display: flex; align-items: center; margin-bottom: 0.5rem;">
                                <i class="bi bi-bell-fill" style="color: #FF6B6B; margin-right: 0.5rem;"></i>
                                <span style="font-weight: 500;">New order available</span>
                            </div>
                            <p style="margin: 0; color: #666;">Order #DP-7845 from KFC is ready for pickup</p>
                            <div style="font-size: 0.8rem; color: #999; margin-top: 0.5rem;">2 minutes ago</div>
                        </div>
                        <!-- More notifications would go here -->
                    </div>
                </div>
            `;
            document.body.appendChild(panel);
            
            document.getElementById('closeNotifPanel').addEventListener('click', function() {
                panel.querySelector('div').style.animation = 'slideOut 0.4s ease-in forwards';
                setTimeout(() => panel.remove(), 400);
            });
        });

        // Initialize on load
        document.addEventListener('DOMContentLoaded', function() {
            initChart();
            
            // Add CSS for animations
            const style = document.createElement('style');
            style.textContent = `
                @keyframes slideIn {
                    from { transform: translateX(100%); }
                    to { transform: translateX(0); }
                }
                @keyframes slideOut {
                    from { transform: translateX(0); }
                    to { transform: translateX(100%); }
                }
                @keyframes fadeInOut {
                    0% { opacity: 0; transform: translate(-50%, -50%) scale(0.5); }
                    50% { opacity: 1; transform: translate(-50%, -50%) scale(1.2); }
                    100% { opacity: 0; transform: translate(-50%, -50%) scale(0.8); }
                }
            `;
            document.head.appendChild(style);
        });
    </script>
</body>
</html>