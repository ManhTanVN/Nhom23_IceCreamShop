// ==========================================
// 1. BIẾN TOÀN CỤC (GLOBAL)
// ==========================================
if (typeof quantities === 'undefined') { var quantities = {}; }
let serverCartData = []; // Lưu trữ dữ liệu giỏ hàng từ server để dùng chung cho Checkout
const safeContextPath = typeof contextPath !== 'undefined' ? contextPath : "/IceCreamShop_Web";

// ==========================================
// 2. KHỞI TẠO KHI LOAD TRANG
// ==========================================
document.addEventListener('DOMContentLoaded', () => {
    // Khởi tạo các sự kiện UI
    initUIEvents();
    // Lấy giỏ hàng từ server ngay khi vào trang
    initCartFromServer();
});

function initUIEvents() {
    const navbar = document.querySelector('.navbar');
    const searchForm = document.querySelector('.search-form');
    const cartBtn = document.querySelector('#cart-btn');
    const menuBtn = document.querySelector('#menu-btn');

    if (menuBtn) {
        menuBtn.onclick = () => {
            navbar.classList.toggle('active');
            searchForm.classList.remove('active');
            closeCartDrawer();
        };
    }

    if (cartBtn) {
        cartBtn.onclick = (e) => {
            e.preventDefault();
            openCartDrawer();
        };
    }
}

// ==========================================
// 3. LOGIC SỐ LƯỢNG (UI +/- trên thẻ sản phẩm)
// ==========================================
function increaseQuantity(itemName) {
    quantities[itemName] = (quantities[itemName] || 1) + 1;
    updateQtyUI(itemName);
}

function decreaseQuantity(itemName) {
    if ((quantities[itemName] || 1) > 1) {
        quantities[itemName]--;
        updateQtyUI(itemName);
    }
}

function updateQtyUI(itemName) {
    const qtyElement = document.getElementById(`itemQuantity-${itemName}`);
    if (qtyElement) qtyElement.innerText = quantities[itemName];
}

// ==========================================
// 4. GIAO TIẾP SERVER (API CART)
// ==========================================
async function initCartFromServer() {
    try {
        const response = await fetch(`${safeContextPath}/api/cart`);
        if (response.ok) {
            serverCartData = await response.json();
            updateCartUI(serverCartData);
        }
    } catch (err) { console.error("Lỗi sync cart:", err); }
}

async function addToCart(name, price, image) {
    const qty = quantities[name] || 1;
    const params = new URLSearchParams({ action: 'add', name, price, image, quantity: qty });

    try {
        const response = await fetch(`${safeContextPath}/api/cart`, { method: 'POST', body: params });
        if (response.status === 401) {
            alert("Vui lòng đăng nhập!");
            const modal = document.getElementById('login-modal');
            if (modal) modal.style.display = 'block';
            return;
        }
        serverCartData = await response.json();
        updateCartUI(serverCartData);
        openCartDrawer();
        
        // Reset UI số lượng
        quantities[name] = 1;
        updateQtyUI(name);
    } catch (err) { console.error("Lỗi addToCart:", err); }
}

async function updateCartItemServer(name, change) {
    console.log(`Cập nhật giỏ hàng: ${name}, change: ${change}`);
    const params = new URLSearchParams({ action: 'update', name, change });
    console.log("params sent to server:", params.toString());
    try {
        const response = await fetch(`${safeContextPath}/api/cart`, { method: 'POST', body: params });
        serverCartData = await response.json();
        updateCartUI(serverCartData);
    } catch (err) { console.error("Lỗi update cart:", err); }
}

// ==========================================
// 5. RENDER UI (VẼ GIỎ HÀNG VÀO DRAWER)
// ==========================================
function updateCartUI(cart) {
    const container = document.getElementById('cart-items-container');
    const totalAmount = document.getElementById('drawer-total-amount');
    const cartCount = document.getElementById('cart-count');

    let totalQty = 0;
    let totalMoney = 0;
    let html = "";

    if (!cart || cart.length === 0) {
        if (container) container.innerHTML = '<div class="empty-cart-msg">Giỏ hàng đang trống!</div>';
        if (totalAmount) totalAmount.innerText = "0đ";
        if (cartCount) cartCount.innerText = "(0)";
        return;
    }

    cart.forEach(item => {
        totalQty += item.quantity;
        totalMoney += (item.price * item.quantity);
        const priceFmt = new Intl.NumberFormat('vi-VN').format(item.price);

        html += `
            <div class="drawer-item">
                <img src="${item.image}" alt="${item.name}">
                <div class="drawer-item-info">
                    <h4>${item.name}</h4>
                    <p>${priceFmt}đ</p>
                    <div class="drawer-item-qty">
                        <button onclick="updateCartItemServer('${item.name}', -1)">-</button>
                        <span>${item.quantity}</span>
                        <button onclick="updateCartItemServer('${item.name}', 1)">+</button>
                    </div>
                </div>
                <span style="cursor:pointer; color:red;" onclick="updateCartItemServer('${item.name}', -${item.quantity})">
                    <i class="fas fa-trash"></i>
                </span>
            </div>`;
    });

    if (container) container.innerHTML = html;
    if (totalAmount) totalAmount.innerText = new Intl.NumberFormat('vi-VN').format(totalMoney) + "đ";
    if (cartCount) cartCount.innerText = `(${totalQty})`;
}

// ==========================================
// 6. ĐÓNG/MỞ DRAWER
// ==========================================
function openCartDrawer() {
    const drawer = document.getElementById('cart-drawer');
    const overlay = document.getElementById('cart-overlay');
    if (drawer && overlay) {
        drawer.classList.add('active');
        overlay.classList.add('active');
    }
}

function closeCartDrawer() {
    const drawer = document.getElementById('cart-drawer');
    const overlay = document.getElementById('cart-overlay');
    if (drawer && overlay) {
        drawer.classList.remove('active');
        overlay.classList.remove('active');
    }
}

// ==========================================
// 7. SEARCH LOGIC (GIỮ NGUYÊN - ĐÃ CHUẨN)
// ==========================================
// function goToSearchPage(query) {
//     if (!query || query.trim() === "") return;
//     window.location.href = `${safeContextPath}/search?q=${encodeURIComponent(query.trim())}`;
// }
// ==========================================
// 9. LOGIC ĐI ĐẾN TRANG THANH TOÁN
// ==========================================
function goToCheckout() {
    // 1. Kiểm tra xem giỏ hàng có trống không
    if (!serverCartData || serverCartData.length === 0) {
        alert("Giỏ hàng của bạn đang trống. Hãy chọn món kem yêu thích trước khi thanh toán nhé!");
        closeCartDrawer();
        return;
    }

    // 2. Chuyển hướng người dùng đến trang checkout
    // Bạn có thể tạo CheckoutServlet hoặc đơn giản là checkout.jsp
    window.location.href = `${safeContextPath}/checkout`;
}
// ==========================================
// 8. CÁC HIỆU ỨNG KHÁC (SCROLL, BACK TO TOP)
// ==========================================
document.addEventListener('DOMContentLoaded', () => {
    const backToTopBtn = document.getElementById('backToTop');

    if (backToTopBtn) {
        // 1. Xử lý ẩn hiện khi scroll
        window.onscroll = function () {
            if (document.body.scrollTop > 100 || document.documentElement.scrollTop > 100) {
                backToTopBtn.style.display = "block";
            } else {
                backToTopBtn.style.display = "none";
            }
        };

        // 2. Gán sự kiện click trực tiếp tại đây
        backToTopBtn.onclick = function() {
            window.scrollTo({
                top: 0,
                behavior: 'smooth' // Cuộn mượt mà
            });
        };
    }
});


// ==========================================
// 9. LOGIC INSTANT SEARCH (ISW)
// ==========================================
// Tách logic gọi API ra một hàm riêng để dùng chung cho cả 'onclick' và 'input'

// Đưa hàm này ra ngoài Global để các thuộc tính onclick trong HTML String có thể gọi được
function goToSearchPage(query) {
    const safeContextPath = typeof contextPath !== 'undefined' ? contextPath : "/IceCreamShop_Web";
    if (!query || query.trim() === "") return;

    // Chỉ giữ lại tham số q trên URL cho sạch đẹp
    const targetUrl = `${safeContextPath}/search?q=${encodeURIComponent(query.trim())}`;
    window.location.href = targetUrl;
}

document.addEventListener('DOMContentLoaded', () => {
    const searchBtn = document.querySelector('#search-btn');
    const searchForm = document.querySelector('.search-form');
    const searchInput = document.getElementById('search-box');
    const iswResults = document.getElementById('isw-results');
    
    const safeContextPath = typeof contextPath !== 'undefined' ? contextPath : "/IceCreamShop_Web";
    
    if (searchForm) {
        searchForm.onsubmit = (e) => {
            e.preventDefault(); 
            goToSearchPage(searchInput.value);
        };
    }

    if (searchBtn && searchForm) {
        searchBtn.onclick = () => {
            searchForm.classList.toggle('active');
            if (searchInput) {
                searchInput.focus();
                // Chỉ gọi API nếu có chữ, tránh gọi rỗng làm tốn tài nguyên
                if (searchInput.value.trim() !== "") {
                    handleSearchRequest(searchInput.value.trim());
                }
            }
        };
    }
    
    if (searchInput && iswResults) {
        searchInput.addEventListener('input', async () => {
            const query = searchInput.value.trim();
            if (query === "") {
                iswResults.style.display = "none";
                return;
            }
            handleSearchRequest(query);
        });
    }
    
    async function handleSearchRequest(query) {
        try {
            const response = await fetch(`${safeContextPath}/api/search`, {
                method: 'POST',
                headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
                body: `keyword=${encodeURIComponent(query)}`
            });
    
            if (!response.ok) throw new Error('Network response was not ok');
            const data = await response.json();
            console.log("Kết quả ISW:", data);
            renderISW(data, safeContextPath, iswResults);
    
        } catch (err) {
            console.error("Lỗi thực thi Search:", err);
        }
    }

    function renderISW(data, ctx, container) {
        if (data.products.length > 0) {
            let html = "";
            data.products.forEach(p => {
                const formattedPrice = new Intl.NumberFormat('vi-VN').format(p.price) + 'đ';
                html += `
                <div class="isw-item" onclick="window.location.href='${ctx}/products/${p.handle}'">
                    <img src="${p.image_url}" alt="${p.name}">
                    <div class="isw-info">
                        <h4>${p.name}</h4>
                        <p>${formattedPrice}</p>
                    </div>
                </div>`;
            });

            // SỬA TẠI ĐÂY: Gọi đúng hàm goToSearchPage để có đủ params
            const queryValue = searchInput.value.replace(/'/g, "\\'"); // Tránh lỗi dấu nháy đơn
            html += `
                <div class="isw-show-all" onclick="goToSearchPage('${queryValue}')">
                    <button class="btn-show-results">Xem tất cả <span class="isw-total">${data.totalCount}</span> kết quả</button>
                </div>`;
            
            container.innerHTML = html;
            container.style.display = "block";
        } else {
            container.innerHTML = '<div class="isw-no-result">Không tìm thấy món kem nào...</div>';
            container.style.display = "block";
        }
    }

    document.addEventListener('click', (e) => {
        if (searchForm && !searchForm.contains(e.target)) {
            if (iswResults) iswResults.style.display = "none";
        }
    });
});