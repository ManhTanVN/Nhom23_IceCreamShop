<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Giỏ hàng của bạn - TasteOfJoy</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
    <style>
        .cart-page-section { padding: 15rem 10% 5rem; min-height: 80vh; margin-bottom: 10rem; }
        .cart-table { width: 100%; border-collapse: collapse; margin-top: 2rem; font-size: 1.6rem; }
        .cart-table th { background: #ff7e5f; color: white; padding: 1.5rem; text-align: left; }
        .cart-table td { padding: 2rem; border-bottom: 1px dotted #ccc; }
        .cart-img { width: 80px; height: 80px; object-fit: cover; border-radius: 1rem; }
        .quantity-controls { display: flex; align-items: center; gap: 1rem; }
        .quantity-controls button { padding: 0.5rem 1rem; cursor: pointer; background: #eee; border: 1px solid #ddd; }
        .cart-summary { margin-top: 3rem; display: flex; justify-content: flex-end; align-items: center; gap: 3rem; }
        .total-price-text { font-size: 2.5rem; font-weight: bold; color: #ff7e5f; }
    </style>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/profile-dropdown.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/isw.css?v=1.5">
</head>
<body>
    <jsp:include page="header.jsp" />
    <jsp:include page="drawer-cart.jsp" />

    <section class="cart-page-section">
        <h1 class="heading">Giỏ hàng <span>chi tiết</span></h1>

        <table class="cart-table">
            <thead>
                <tr>
                    <th>Sản phẩm</th>
                    <th>Giá</th>
                    <th>Số lượng</th>
                    <th>Tổng tiền</th>
                    <th>Hành động</th>
                </tr>
            </thead>
            <tbody id="cart-page-body">
                </tbody>
        </table>

        <div class="cart-summary">
            <div class="total-price-text">Tổng thanh toán: <span id="cart-page-total">0đ</span></div>
            <button class="btn" onclick="goToCheckout()">Thanh toán ngay</button>
        </div>
    </section>

    <jsp:include page="footer.jsp" />

    <script src="${pageContext.request.contextPath}/assets/login.js"></script>

    <script src="${pageContext.request.contextPath}/assets/script.js"></script>
    <script>
        // Override hàm updateCartUI để vẽ thêm dữ liệu vào bảng trang Cart
        const defaultUpdateUI = updateCartUI;
        updateCartUI = function(cart) {
            defaultUpdateUI(cart); // Vẫn cập nhật drawer và icon giỏ hàng
            renderCartPage(cart);
        };

        function renderCartPage(cart) {
            const body = document.getElementById('cart-page-body');
            const totalDisplay = document.getElementById('cart-page-total');
            if (!body) return;

            let html = "";
            let totalMoney = 0;

            if (!cart || cart.length === 0) {
                body.innerHTML = '<tr><td colspan="5" style="text-align:center; padding: 5rem;">Giỏ hàng của bạn đang trống!</td></tr>';
                totalDisplay.innerText = "0đ";
                return;
            }

            cart.forEach(item => {
                const subtotal = item.price * item.quantity;
                totalMoney += subtotal;
                const priceFmt = new Intl.NumberFormat('vi-VN').format(item.price);
                const subtotalFmt = new Intl.NumberFormat('vi-VN').format(subtotal);

                // LƯU Ý: Dùng \${ } để tránh lỗi JSP EL 500
                html += `
                    <tr>
                        <td>
                            <div style="display:flex; align-items:center; gap:2rem;">
                                <img src="\${item.image}" class="cart-img">
                                <span style="font-weight:bold;">\${item.name}</span>
                            </div>
                        </td>
                        <td>\${priceFmt}đ</td>
                        <td>
                            <div class="quantity-controls">
                                <button onclick="updateCartItemServer('\${item.name}', -1)">-</button>
                                <span>\${item.quantity}</span>
                                <button onclick="updateCartItemServer('\${item.name}', 1)">+</button>
                            </div>
                        </td>
                        <td style="color:#ff7e5f; font-weight:bold;">\${subtotalFmt}đ</td>
                        <td>
                            <i class="fas fa-trash" style="color:red; cursor:pointer;" 
                               onclick="updateCartItemServer('\${item.name}', -\${item.quantity})"></i>
                        </td>
                    </tr>`;
            });

            body.innerHTML = html;
            totalDisplay.innerText = new Intl.NumberFormat('vi-VN').format(totalMoney) + "đ";
        }
    </script>
</body>
</html>