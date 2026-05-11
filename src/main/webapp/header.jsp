<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>

<div id="preloader">
    <div class="wrapper">
        <div class="box-wrap">
            <div class="box one"></div>
            <div class="box two"></div>
            <div class="box three"></div>
            <div class="box four"></div>
            <div class="box five"></div>
            <div class="box six"></div>
        </div>
    </div>
</div>

<button id="backToTop" style="font-size: 30px; font-weight: bold;">&#8673;</button>

<header class="header">
    <a href="${pageContext.request.contextPath}" class="logo">
        <img src="https://purepng.com/public/uploads/large/purepng.com-ice-creamice-creamcreamfrozensweet-1411527617895aiuhx.png" alt="Logo">
    </a>
    <div class="menu-btn" id="menu-btn">
        <span class="fas fa-bars"></span>
    </div>
    <a href="${pageContext.request.contextPath}" class="logo-mobile" style="list-style: none; font-weight: bold; color: #ff7e5f;">
        <h1 class="site-title">Taste Of Joy</h1> 
    </a>

    <nav class="navbar">
        <a class="nav--item" data="home" href="${pageContext.request.contextPath}">Trang chủ</a>
        <a class="nav--item" data="collections" href="${pageContext.request.contextPath}/collections">Menu</a>
        <a class="nav--item" data="blog" href="${pageContext.request.contextPath}/blog">Bài viết</a>
        <a class="nav--item" data="privacy" href="${pageContext.request.contextPath}/privacy.jsp">Bảo mật</a>
        <a class="nav--item" data="about" href="${pageContext.request.contextPath}/about.jsp">Giới thiệu</a>
    </nav>

    <div class="icons">
        <div class="fas fa-search" id="search-btn"></div>
        <div class="fas fa-shopping-cart" id="cart-btn" onclick="openCartDrawer()">
            <span id="cart-count">0</span> 
        </div>
    </div>
    <style>
        /* --- CSS LÀM ĐẸP MENU ICONS --- */
        .header .icons {
            display: flex;
            align-items: center;
            gap: 15px; /* Khoảng cách đều nhau giữa các nút */
        }

        .header .icons .fas {
            position: relative;
            width: 45px;
            height: 45px;
            display: flex;
            justify-content: center;
            align-items: center;
            font-size: 1.2rem;
            color: #555;
            background: #f4f4f9; /* Nền xám nhạt */
            border-radius: 50%; /* Bo tròn xoe */
            cursor: pointer;
            transition: all 0.3s ease;
        }

        /* Hiệu ứng khi đưa chuột vào (Hover) */
        .header .icons .fas:hover {
            background: #ff7e5f; /* Đổi sang nền cam đào */
            color: white; /* Đổi icon sang màu trắng */
            transform: translateY(-4px); /* Nảy nhẹ lên trên */
            box-shadow: 0 5px 15px rgba(255, 126, 95, 0.4); /* Tỏa hào quang */
        }

        /* Tút lại số lượng giỏ hàng thành Chấm đỏ thông báo (Badge) */
        #cart-count {
            position: absolute;
            top: -6px;
            right: -6px;
            background: #f44336; /* Màu đỏ nổi bật */
            color: white;
            font-size: 0.75rem;
            font-weight: bold;
            height: 22px;
            min-width: 22px;
            display: flex;
            justify-content: center;
            align-items: center;
            border-radius: 50%; /* Bo tròn chấm đỏ */
            border: 2px solid white; /* Viền trắng để tách biệt khỏi icon */
            font-family: Arial, sans-serif;
            box-shadow: 0 2px 5px rgba(0,0,0,0.2);
        }
        .nav--item.active {
            color: #ff7e5f !important; 
            font-weight: 700;
            position: relative;
        }

        .nav--item.active::after {
            content: "";
            position: absolute;
            bottom: -5px;
            left: 0;
            width: 100%;
            height: 2px;
            background-color: #ff7e5f;
            border-radius: 2px;
        }
    </style>
    <div class="search-form">
        <form class="boost-pfs-search-form" action="search" method="get" role="search">
			<input class="boost-pfs-search-input" type="search" name="q" id="search-box" placeholder="Tìm kiếm...">
        <button type="submit" class="boost-pfs-search-btn" aria-label="Submit">
            <svg width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
            <path fill-rule="evenodd" clip-rule="evenodd" d="M3.33335 9.16601C3.33335 5.94435 5.94503 3.33268 9.16669 3.33268C12.3883 3.33268 15 5.94435 15 9.16601C15 10.7377 14.3784 12.1642 13.3677 13.2132C13.3392 13.235 13.3119 13.259 13.2858 13.2851C13.2597 13.3112 13.2357 13.3386 13.2138 13.367C12.1649 14.3778 10.7384 14.9993 9.16669 14.9993C5.94503 14.9993 3.33335 12.3877 3.33335 9.16601ZM13.8481 15.0259C12.565 16.0523 10.9375 16.666 9.16669 16.666C5.02455 16.666 1.66669 13.3082 1.66669 9.16601C1.66669 5.02388 5.02455 1.66602 9.16669 1.66602C13.3088 1.66602 16.6667 5.02388 16.6667 9.16601C16.6667 10.9369 16.053 12.5644 15.0266 13.8474L18.0893 16.9101C18.4147 17.2356 18.4147 17.7632 18.0893 18.0886C17.7639 18.4141 17.2362 18.4141 16.9108 18.0886L13.8481 15.0259Z" fill="white"/>
            </svg>
        </button>
            </form>
        <div id="isw-results" class="isw-container"></div>
    </div>
    <div class="wishlist-container">
        <ul id="wishlistItems"></ul>
        <button class="clear-from-wishlist-btn" onclick="clearWishlist()">Xóa danh sách</button>
    </div>
    <div class="my-order-container">
        <h2>Đơn hàng của tôi</h2>
        <div id="order-details"></div>
        <div class="order-actions">
            <button onclick="trackOrder()">Theo dõi đơn</button>
            <button onclick="editOrder()">Chỉnh sửa đơn</button>
        </div>
    </div>
    <div class="user-auth-section">
        <div class="guest-menu" id="guest-menu">
            <a href="${pageContext.request.contextPath}/login/login.html" class="auth-btn">Đăng nhập</a>
            <a href="${pageContext.request.contextPath}/signup/signup.html" class="auth-btn">Đăng ký</a>
        </div>

        <div class="user-profile" id="user-profile" style="display: none;">
            <div class="profile-trigger" id="profile-trigger" onclick="toggleProfileDropdown()">
                <img src="https://cdn-icons-png.flaticon.com/512/3135/3135715.png" alt="Avatar" class="avatar">
                <span id="display-fullname">Tên User</span>
                <i class="fas fa-chevron-down"></i>
            </div>
            <div class="profile-dropdown" id="profile-dropdown">
                <a href="${pageContext.request.contextPath}/profile/profile.html"><i class="fas fa-user-circle"></i> Thông tin cá nhân</a>
                <a href="${pageContext.request.contextPath}/profile/edit-profile.html"><i class="fas fa-user-edit"></i> Chỉnh sửa hồ sơ</a>
                <a href="${pageContext.request.contextPath}/profile/change-password.html"><i class="fas fa-key"></i> Đổi mật khẩu</a>
                <a href="${pageContext.request.contextPath}/admin.html" id="admin-link" style="display:none;"><i class="fas fa-cogs"></i> Trang Quản trị</a>
                <hr>
                <a href="#" onclick="handleLogout()"><i class="fas fa-sign-out-alt"></i> Đăng xuất</a>
            </div>
        </div>
    </div>
</header>