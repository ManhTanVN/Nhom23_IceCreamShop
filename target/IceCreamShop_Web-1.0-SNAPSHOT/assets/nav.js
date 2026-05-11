function initNavigationActive() {
    // 1. Lấy đường dẫn hiện tại (Ví dụ: /IceCream/collections)
    const currentPath = window.location.pathname;
    
    // 2. Lấy tất cả các thẻ menu
    const navItems = document.querySelectorAll('.navbar .nav--item');

    navItems.forEach(item => {
        // Xóa class active cũ (nếu có) để đảm bảo sạch sẽ
        item.classList.remove('active');

        // Lấy đường dẫn từ thuộc tính href của thẻ a
        // item.pathname sẽ trả về phần đường dẫn (không bao gồm http://domain)
        const itemPath = item.pathname;

        // Trường hợp 1: Khớp chính xác hoàn toàn (cho Menu, Blog, About...)
        if (currentPath === itemPath) {
            item.classList.add('active');
        }

        // Trường hợp 2: Xử lý đặc biệt cho Trang chủ
        // Nếu đường dẫn hiện tại là "/" hoặc kết thúc bằng "/index.jsp"
        const isHome = currentPath === '/' || currentPath.endsWith('/index.jsp') || currentPath.endsWith('/home');
        if (isHome && item.getAttribute('data') === 'home') {
            item.classList.add('active');
        }

        const blogPaths = ['blog', 'blog-detail'];
        if (blogPaths.includes(currentPath.split('/').pop().trim()) && item.getAttribute('data') === 'blog') {
            item.classList.add('active');
        }
    });
}

// Chạy khi trang web load xong
document.addEventListener('DOMContentLoaded', initNavigationActive);