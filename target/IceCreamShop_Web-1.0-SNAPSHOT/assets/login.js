// 1. Logic ẩn/hiện bảng Dropdown
function toggleProfileDropdown() {
    document.getElementById('profile-dropdown').classList.toggle('active');
}

window.addEventListener('click', function(e) {
    const profile = document.getElementById('user-profile');
    const dropdown = document.getElementById('profile-dropdown');
    if (profile && !profile.contains(e.target) && dropdown) {
        dropdown.classList.remove('active');
    }
});

// 2. Logic Đăng xuất
function handleLogout() {
    if(confirm("Bạn có chắc chắn muốn đăng xuất?")) {
        localStorage.removeItem('currentUser');
        window.location.reload(); 
    }
}

// 3. Logic Kiểm tra đăng nhập (CHẠY NGAY LẬP TỨC & CHỐNG LỖI)
(function checkLoginStatus() {
    try {
        const userStr = localStorage.getItem('currentUser');
        const guestMenu = document.getElementById('guest-menu');
        const userProfile = document.getElementById('user-profile');

        // Nếu chưa tìm thấy HTML (do paste thiếu) thì dừng lại, không báo lỗi
        if (!guestMenu || !userProfile) return; 

        if (userStr) {
            const user = JSON.parse(userStr);
            guestMenu.style.display = 'none'; // Giấu 2 nút cũ
            userProfile.style.display = 'block'; // Hiện Profile
            
            const nameDisplay = document.getElementById('display-fullname');
            if(nameDisplay) nameDisplay.innerText = user.fullname;

            const adminLink = document.getElementById('admin-link');
            if(user.role === 1 && adminLink) adminLink.style.display = 'flex'; 
        } else {
            guestMenu.style.display = 'block';
            userProfile.style.display = 'none';
        }
    } catch (error) {
        console.error("Lỗi khi load Profile:", error);
    }
})(); // Thêm ngoặc () để hàm này tự kích hoạt ngay lập tức!