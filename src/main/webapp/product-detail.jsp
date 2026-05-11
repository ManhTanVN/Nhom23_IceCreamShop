<!-- fix lỗi "vỡ font" (Encoding) -->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chi tiết món kem - TasteOfJoy</title>
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/style.css?v=1.7">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
    
    <style>
        /* CSS riêng cho trang chi tiết (Giữ nguyên từ file html cũ) */
        .product-container { display: flex; gap: 50px; padding: 50px 7%; align-items: start; min-height: 80vh; }
        .product-image img { width: 100%; max-width: 500px; border-radius: 20px; box-shadow: 0 10px 30px rgba(0,0,0,0.1); }
        .product-info h1 { font-size: 3rem; color: #333; margin-bottom: 10px; }
        .product-info .price { font-size: 2.5rem; color: #ff7e5f; font-weight: bold; margin: 20px 0; }
        .product-info .desc { font-size: 1.2rem; color: #666; line-height: 1.6; margin-bottom: 30px; }
        .purchase-box { display: flex; align-items: center; gap: 20px; }
        .qty-input { display: flex; align-items: center; border: 1px solid #ddd; border-radius: 5px; overflow: hidden; }
        .qty-input button { padding: 10px 15px; border: none; background: #eee; cursor: pointer; }
        .qty-input span { padding: 0 20px; font-weight: bold; }
        .add-btn { background: #ff7e5f; color: white; padding: 15px 40px; border: none; border-radius: 30px; cursor: pointer; font-size: 1.1rem; }
    </style>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/profile-dropdown.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/isw.css">
</head>
<body>
    <jsp:include page="drawer-cart.jsp" />
    <jsp:include page="header.jsp" />
    <script src="${pageContext.request.contextPath}/assets/login.js"></script>
    <div id="content-area">
        <section class="product-container">
            <div class="product-image">
                <img id="p-img" src="" alt="Loading...">
            </div>
            <div class="product-info">
                <h1 id="p-name">Đang tải...</h1>
                <div class="price" id="p-price">0đ</div>
                <p class="desc" id="p-desc"></p>
                
                <div class="purchase-box">
                    <div class="qty-input">
                        <button onclick="changeQty(-1)">-</button>
                        <span id="p-qty">1</span>
                        <button onclick="changeQty(1)">+</button>
                    </div>
                    <button class="add-btn" onclick="handleAddToCart()">Thêm vào giỏ hàng</button>
                </div>
            </div>
        </section>
    </div>

    <script>
        let productData = null;
        let quantity = 1;

        document.addEventListener('DOMContentLoaded', () => {
            const pathSegments = window.location.pathname.split('/');
            const handle = pathSegments[pathSegments.length - 1];
            if (handle) fetchDetail(handle);
        });

        async function fetchDetail(handle) {
            try {
                const res = await fetch(`${pageContext.request.contextPath}/api/products?handle=` + handle);
                productData = await res.json();
                
                document.getElementById('p-name').innerText = productData.name;
                document.getElementById('p-img').src = productData.image_url;
                document.getElementById('p-price').innerText = productData.price.toLocaleString('vi-VN') + "đ";
                document.getElementById('p-desc').innerText = productData.description;
                document.title = productData.name + " - TasteOfJoy";
            } catch (e) {
                console.error("Lỗi tải data", e);
            }
        }

        function changeQty(n) {
            quantity += n;
            if (quantity < 1) quantity = 1;
            document.getElementById('p-qty').innerText = quantity;
        }

        function handleAddToCart() {
            if (!productData) return;
            // Tận dụng hàm addToCart sẵn có trong script.js của bạn
            addToCart(productData.name, productData.price, productData.image_url, quantity);
        }
    </script>
    <jsp:include page="footer.jsp" />

    <script src="${pageContext.request.contextPath}/assets/preloader.js"></script>
    <script src="${pageContext.request.contextPath}/assets/script.js"></script>
    
</body>
</html>