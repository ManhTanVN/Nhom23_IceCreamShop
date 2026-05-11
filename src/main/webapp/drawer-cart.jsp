<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<div id="cart-overlay" class="cart-overlay" onclick="closeCartDrawer()"></div>

<div id="cart-drawer" class="cart-drawer">
    <div class="cart-header">
        <h2>Giỏ hàng của bạn</h2>
        <button class="close-drawer" onclick="closeCartDrawer()">&times;</button>
    </div>

    <div id="cart-items-container" class="cart-items-body">
        <div class="empty-cart-msg">Giỏ hàng đang trống!</div>
    </div>

    <div class="cart-footer">
        <div class="total-price">
            <span>Tổng cộng:</span>
            <span id="drawer-total-amount">0đ</span>
        </div>
        <button class="checkout-btn" onclick="goToCheckout()">Thanh toán ngay</button>
        <button class="view-cart-btn" onclick="location.href='${pageContext.request.contextPath}/cart.jsp'">Xem giỏ hàng</button>
    </div>
</div>

<style>
    /* --- CSS CHO DRAWER CART --- */
    .cart-drawer {
        position: fixed; top: 0; right: -400px; /* Ban đầu ẩn bên phải */
        width: 400px; height: 100%; background: white;
        z-index: 2000; transition: 0.4s ease;
        box-shadow: -5px 0 15px rgba(0,0,0,0.1);
        display: flex; flex-direction: column;
    }
    .cart-drawer.active { right: 0; }

    .cart-overlay {
        position: fixed; top: 0; left: 0; width: 100%; height: 100%;
        background: rgba(0,0,0,0.5); z-index: 1999;
        display: none; opacity: 0; transition: 0.3s;
    }
    .cart-overlay.active { display: block; opacity: 1; }

    .cart-header {
        padding: 20px; border-bottom: 1px solid #eee;
        display: flex; justify-content: space-between; align-items: center;
        background:#ff7e5f; color: white;
    }
    .close-drawer { font-size: 2rem; background: none; border: none; color: white; cursor: pointer; }

    .cart-items-body { flex: 1; overflow-y: auto; padding: 20px; }
    
    /* Style cho từng item trong drawer */
    .drawer-item {
        display: flex; gap: 15px; margin-bottom: 20px;
        padding-bottom: 15px; border-bottom: 1px solid #f9f9f9;
    }
    .drawer-item img { width: 70px; height: 70px; object-fit: cover; border-radius: 8px; }
    .drawer-item-info { flex: 1; }
    .drawer-item-info h4 { font-size: 1.1rem; margin-bottom: 5px; }
    .drawer-item-qty { display: flex; align-items: center; gap: 10px; margin-top: 5px; }
    .drawer-item-qty button { width: 25px; height: 25px; border: 1px solid #ddd; background: white; cursor: pointer; margin: 0; display: flex; justify-content: center; align-items: center; }

    .cart-footer { padding: 20px; border-top: 1px solid #eee; background: #fafafa; }
    .total-price { display: flex; justify-content: space-between; font-weight: bold; font-size: 1.3rem; margin-bottom: 20px; }
    
    .checkout-btn, .view-cart-btn {
        width: 100%; padding: 15px; border: none; border-radius: 5px;
        font-weight: bold; cursor: pointer; margin-bottom: 10px; transition: 0.3s;
    }
    .checkout-btn { background: #ff7e5f; color: white; }
    .checkout-btn:hover { background: #feb47b; }
    .view-cart-btn { background: #eee; color: #333; }

    @media (max-width: 450px) { .cart-drawer { width: 100%; right: -100%; } }
</style>