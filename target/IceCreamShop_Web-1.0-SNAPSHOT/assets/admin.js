// ==========================================
// TASTE OF JOY - ADMIN DASHBOARD SCRIPT
// ==========================================

const PRODUCT_API = './api/products';
const USER_API = './api/users';

// --- BIẾN TOÀN CỤC CHO PHÂN TRANG SẢN PHẨM ---
let allProducts = [];
let currentProductPage = 1;
const productsPerPage = 50;

// ==========================================
// 1. LOGIC CHUYỂN TAB VÀ SUB-TAB
// ==========================================
function switchTab(tabName, event) {
    document.querySelectorAll('.panel').forEach(panel => panel.classList.remove('active'));
    document.querySelectorAll('.menu-btn').forEach(btn => btn.classList.remove('active'));
    
    document.getElementById(tabName + '-panel').classList.add('active');
    if (event) event.currentTarget.classList.add('active');

    if(tabName === 'products') loadProducts();
    if(tabName === 'orders') loadOrders();
    if(tabName === 'users') loadUsers();
}

function switchSubTab(subTabId) {
    document.querySelectorAll('.sub-view').forEach(v => v.classList.remove('active'));
    document.querySelectorAll('.sub-tab-btn').forEach(b => b.classList.remove('active'));
    
    document.getElementById(subTabId + '-view').classList.add('active');
    document.querySelector(`.sub-tab-btn[onclick*="${subTabId}"]`).classList.add('active');
}

// ==========================================
// 2. LOGIC QUẢN LÝ SẢN PHẨM (PHÂN TRANG 50/PAGE)
// ==========================================
async function loadProducts() {
    try {
        // THÊM CREDENTIALS ĐỂ GỬI KÈM SESSION
        const res = await fetch(PRODUCT_API, { credentials: 'include' });
        if (!res.ok) throw new Error("Không có quyền hoặc lỗi Server");
        allProducts = await res.json();
        renderProductsTable();
    } catch (e) { console.error("Lỗi load sản phẩm:", e); }
}

function renderProductsTable() {
    const tbody = document.getElementById('product-tbody');
    tbody.innerHTML = '';
    
    const totalProducts = allProducts.length;
    const totalPages = Math.ceil(totalProducts / productsPerPage) || 1;
    
    if (currentProductPage > totalPages) currentProductPage = totalPages;
    if (currentProductPage < 1) currentProductPage = 1;

    const startIndex = (currentProductPage - 1) * productsPerPage;
    const endIndex = Math.min(startIndex + productsPerPage, totalProducts);
    
    const productsToShow = allProducts.slice(startIndex, endIndex);

    productsToShow.forEach(p => {
        const shortDesc = p.description.length > 50 ? p.description.substring(0, 50) + '...' : p.description;

        tbody.innerHTML += `
            <tr>
                <td>#${p.id}</td>
                <td><img src="${p.image_url}" width="50" height="50" style="border-radius:5px; object-fit:cover;"></td>
                <td><strong>${p.name}</strong></td>
                <td>${shortDesc}</td>
                <td style="color:var(--primary); font-weight:bold;">${p.price.toLocaleString('vi-VN')}đ</td>
                <td class="action-btns">
                    <button class="btn btn-success" onclick="prepareEdit(${p.id})">
                        <i class="fas fa-edit"></i> Sửa
                    </button>
                    <button class="btn btn-danger" onclick="deleteProduct(${p.id})">
                        <i class="fas fa-trash"></i> Xóa
                    </button>
                </td>
            </tr>
        `;
    });
    
    renderPagination(totalPages);
}
function prepareEdit(id) {
    // 1. Tìm đối tượng sản phẩm trong mảng dữ liệu gốc
    const product = allProducts.find(p => p.id === id);
    
    if (!product) {
        alert("Không tìm thấy dữ liệu sản phẩm!");
        return;
    }

    // 2. Đổ dữ liệu vào Form (Dùng cách này cực kỳ an toàn, không lo dấu nháy)
    document.getElementById('form-title').innerText = "Sửa Món Kem #" + product.id;
    document.getElementById('pro-id').value = product.id;
    document.getElementById('pro-name').value = product.name;
    document.getElementById('pro-desc').value = product.description;
    document.getElementById('pro-img').value = product.image_url;
    document.getElementById('pro-price').value = product.price;
    document.getElementById('pro-old-price').value = product.original_price;
    document.getElementById('pro-allergies').value = product.allergies || '[]';
    
    // 3. Chuyển tab sang trang Form
    switchSubTab('product-form');
}
function renderPagination(totalPages) {
    const paginationContainer = document.getElementById('product-pagination');
    paginationContainer.innerHTML = '';
    
    paginationContainer.innerHTML += `<button class="page-btn" ${currentProductPage === 1 ? 'disabled' : ''} onclick="changeProductPage(${currentProductPage - 1})">&laquo; Trước</button>`;
    
    for (let i = 1; i <= totalPages; i++) {
        paginationContainer.innerHTML += `<button class="page-btn ${i === currentProductPage ? 'active' : ''}" onclick="changeProductPage(${i})">${i}</button>`;
    }
    
    paginationContainer.innerHTML += `<button class="page-btn" ${currentProductPage === totalPages ? 'disabled' : ''} onclick="changeProductPage(${currentProductPage + 1})">Sau &raquo;</button>`;
}

function changeProductPage(page) {
    currentProductPage = page;
    renderProductsTable();
}

async function saveProduct() {
    const id = document.getElementById('pro-id').value;
    const payload = {
        id: id ? parseInt(id) : null,
        name: document.getElementById('pro-name').value,
        description: document.getElementById('pro-desc').value,
        image_url: document.getElementById('pro-img').value,
        price: parseInt(document.getElementById('pro-price').value),
        original_price: parseInt(document.getElementById('pro-old-price').value),
        allergies: document.getElementById('pro-allergies').value
    };

    const method = id ? 'PUT' : 'POST';
    const res = await fetch(PRODUCT_API, {
        method: method,
        credentials: 'include', // QUAN TRỌNG: Gửi thẻ bài Admin
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(payload)
    });

    if (res.ok) {
        alert("Lưu sản phẩm thành công!");
        clearProductForm();
        loadProducts(); 
        switchSubTab('product-list'); 
    } else { 
        alert("Lưu thất bại! Hãy chắc chắn bạn có quyền Admin."); 
    }
}

async function deleteProduct(id) {
    if(confirm("Xóa món kem này?")) {
        const res = await fetch(PRODUCT_API + "?id=" + id, { 
            method: 'DELETE',
            credentials: 'include' // QUAN TRỌNG: Gửi thẻ bài Admin
        });
        if (res.ok) { 
            alert("Xóa thành công!"); 
            loadProducts(); 
        } else {
            alert("Xóa thất bại! Lỗi phân quyền.");
        }
    }
}

function editProduct(id, name, desc, img, price, oldPrice, allergies) {
    document.getElementById('form-title').innerText = "Sửa Món Kem #" + id;
    document.getElementById('pro-id').value = id;
    document.getElementById('pro-name').value = name;
    document.getElementById('pro-desc').value = desc;
    document.getElementById('pro-img').value = img;
    document.getElementById('pro-price').value = price;
    document.getElementById('pro-old-price').value = oldPrice;
    document.getElementById('pro-allergies').value = allergies || '[]';
    
    switchSubTab('product-form'); 
}

function clearProductForm() {
    document.getElementById('form-title').innerText = "Thêm Món Kem Mới";
    document.getElementById('pro-id').value = '';
    document.getElementById('pro-name').value = '';
    document.getElementById('pro-desc').value = '';
    document.getElementById('pro-img').value = '';
    document.getElementById('pro-price').value = '';
    document.getElementById('pro-old-price').value = '';
    document.getElementById('pro-allergies').value = '[]';
}

// ==========================================
// 3. LOGIC QUẢN LÝ NGƯỜI DÙNG (USERS)
// ==========================================
async function loadUsers() {
    try {
        const res = await fetch(USER_API, { credentials: 'include' });
        if (!res.ok) throw new Error("Lỗi xác thực");
        const data = await res.json();
        let tbody = document.getElementById('user-tbody');
        tbody.innerHTML = '';
        data.forEach(u => {
            const roleText = u.role === 1 ? '<span class="badge pending">Admin</span>' : '<span class="badge completed">Khách hàng</span>';
            tbody.innerHTML += `
                <tr>
                    <td>#${u.id}</td>
                    <td><strong>${u.fullname}</strong></td>
                    <td>${u.email}</td>
                    <td>${roleText}</td>
                    <td class="action-btns">
                        <button class="btn btn-success" onclick="editUser(${u.id}, '${u.fullname}', '${u.email}', '${u.password}', ${u.role})"><i class="fas fa-edit"></i> Sửa</button>
                        <button class="btn btn-danger" onclick="deleteUser(${u.id})"><i class="fas fa-trash"></i> Xóa</button>
                    </td>
                </tr>
            `;
        });
    } catch (e) { console.error("Lỗi load users:", e); }
}

async function saveUser() {
    const id = document.getElementById('user-id').value;
    const payload = {
        id: id ? parseInt(id) : null,
        fullname: document.getElementById('user-fullname').value,
        email: document.getElementById('user-email').value,
        password: document.getElementById('user-password').value,
        role: parseInt(document.getElementById('user-role').value)
    };

    const method = id ? 'PUT' : 'POST';
    const res = await fetch(USER_API, {
        method: method,
        credentials: 'include', // QUAN TRỌNG
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(payload)
    });

    if (res.ok) {
        alert("Lưu người dùng thành công!");
        clearUserForm();
        loadUsers();
    } else { alert("Lưu thất bại! Email có thể đã tồn tại."); }
}

async function deleteUser(id) {
    if(confirm("Xóa người dùng này vĩnh viễn?")) {
        const res = await fetch(USER_API + "?id=" + id, { 
            method: 'DELETE',
            credentials: 'include' // QUAN TRỌNG
        });
        if (res.ok) { alert("Xóa thành công!"); loadUsers(); }
    }
}

function editUser(id, fullname, email, password, role) {
    document.getElementById('user-form-title').innerText = "Sửa Người Dùng #" + id;
    document.getElementById('user-id').value = id;
    document.getElementById('user-fullname').value = fullname;
    document.getElementById('user-email').value = email;
    document.getElementById('user-password').value = password;
    document.getElementById('user-role').value = role;
    window.scrollTo(0, 0);
}

function clearUserForm() {
    document.getElementById('user-form-title').innerText = "Thêm Người Dùng Mới";
    document.getElementById('user-id').value = '';
    document.getElementById('user-fullname').value = '';
    document.getElementById('user-email').value = '';
    document.getElementById('user-password').value = '';
    document.getElementById('user-role').value = '0';
}

// ==========================================
// 4. LOGIC QUẢN LÝ ĐƠN HÀNG (ORDERS) - MOCK DATA
// ==========================================
async function loadOrders() {
    const tbody = document.getElementById('order-tbody');
    tbody.innerHTML = `
        <tr>
            <td>#ORD-001</td><td>Nguyễn Văn A</td><td>07/04/2026</td><td>1.100.000đ</td>
            <td><span class="badge pending">Chờ xử lý</span></td>
            <td class="action-btns">
                <button class="btn btn-info">Chi tiết</button>
                <button class="btn btn-success">Duyệt</button>
            </td>
        </tr>
        <tr>
            <td>#ORD-002</td><td>Trần Thị B</td><td>06/04/2026</td><td>450.000đ</td>
            <td><span class="badge completed">Đã giao</span></td>
            <td class="action-btns"><button class="btn btn-info">Chi tiết</button></td>
        </tr>
    `;
}

// ==========================================
// KHỞI CHẠY KHI TẢI TRANG
// ==========================================
window.onload = function() {
    loadProducts(); 
};