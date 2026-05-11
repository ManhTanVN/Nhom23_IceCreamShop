<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Thanh toán đơn hàng - TasteOfJoy</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/style.css?v=1.9">
    <style>
        .checkout-section { padding: 15rem 10% 5rem; display: flex; flex-wrap: wrap; gap: 3rem; align-items: flex-start; }
        .shipping-form { flex: 1 1 50rem; background: #fff; padding: 3rem; border: 1px solid #eee; border-radius: 1rem; box-shadow: 0 0.5rem 1rem rgba(0,0,0,0.05); }
        .order-summary-box { flex: 1 1 35rem; background: #fafafa; padding: 3rem; border-radius: 1rem; }
        .input-box { margin-bottom: 2rem; }
        .input-box span { display: block; font-size: 1.6rem; margin-bottom: 1rem; }
        .input-box input { width: 100%; padding: 1.2rem; font-size: 1.5rem; border: 1px solid #ddd; border-radius: 0.5rem; }
        .summary-item { display: flex; justify-content: space-between; font-size: 1.6rem; margin-bottom: 1.5rem; border-bottom: 1px solid #eee; padding-bottom: 1rem; }
    </style>
    <link rel="icon" href="https://purepng.com/public/uploads/large/purepng.com-ice-creamice-creamcreamfrozensweet-1411527617895aiuhx.png" type="image/x-icon">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"> 
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/custom.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/profile-dropdown.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/isw.css?v=1.5">
</head>
<body>
    <jsp:include page="header.jsp" />

    <section class="checkout-section">
        <div class="shipping-form">
            <h2 style="font-size: 2.5rem; margin-bottom: 2rem;">Thông tin giao hàng</h2>
            <form action="${pageContext.request.contextPath}/api/orders" method="POST">
                <div class="input-box">
                    <span>Họ và tên người nhận</span>
                    <input type="text" name="receiver_name" value="${user.fullName}" required>
                </div>
                <div class="input-box">
                    <span>Số điện thoại</span>
                    <input type="tel" name="phone" required placeholder="Nhập số điện thoại...">
                </div>
                <div class="input-box">
                    <span>Địa chỉ nhận kem</span>
                    <input type="text" name="address" required placeholder="Số nhà, tên đường, phường/xã...">
                </div>
                <div class="input-box">
                    <span>Ghi chú cho shipper</span>
                    <input type="text" name="note" placeholder="Ví dụ: Giao giờ hành chính...">
                </div>
                <button type="submit" class="btn" style="width: 100%; margin-top: 2rem;">Xác nhận đặt hàng</button>
            </form>
        </div>

        <div class="order-summary-box">
            <h2 style="font-size: 2.2rem; margin-bottom: 2rem;">Tóm tắt đơn hàng</h2>
            <div id="checkout-items-list">
                </div>
            <div class="summary-item" style="border:none; margin-top: 2rem; font-weight: bold; font-size: 2rem;">
                <span>Tổng cộng</span>
                <span id="checkout-total-money" style="color: #ff7e5f;">0đ</span>
            </div>
        </div>
    </section>

    <jsp:include page="footer.jsp" />

    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
    <script>AOS.init();</script>

    <script src="${pageContext.request.contextPath}/assets/login.js"></script>
    <script>
        var contextPath = "${pageContext.request.contextPath}";
    </script>

    <script src="${pageContext.request.contextPath}/assets/script.js?version=3.8"></script>
    <script>
        const checkoutUpdateUI = updateCartUI;
        updateCartUI = function(cart) {
            checkoutUpdateUI(cart);
            renderCheckoutSummary(cart);
        };

        function renderCheckoutSummary(cart) {
            const listContainer = document.getElementById('checkout-items-list');
            const totalContainer = document.getElementById('checkout-total-money');
            if (!listContainer) return;

            let html = "";
            let total = 0;

            cart.forEach(item => {
                total += (item.price * item.quantity);
                const subtotalFmt = new Intl.NumberFormat('vi-VN').format(item.price * item.quantity);
                
                // LƯU Ý: Dùng \${ } để tránh lỗi JSP EL 500
                html += `
                    <div class="summary-item">
                        <span>\${item.name} (x\${item.quantity})</span>
                        <span>\${subtotalFmt}đ</span>
                    </div>`;
            });

            listContainer.innerHTML = html || '<p>Không có sản phẩm nào!</p>';
            totalContainer.innerText = new Intl.NumberFormat('vi-VN').format(total) + "đ";
        }
    </script>
</body>
</html>