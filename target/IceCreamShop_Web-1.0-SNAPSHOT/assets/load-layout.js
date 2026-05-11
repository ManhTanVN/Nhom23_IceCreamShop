document.addEventListener("DOMContentLoaded", function() {
    const path = "/IceCreamShop_Web";

    // Tải Header
    fetch(`${path}/header.html`)
        .then(res => res.text())
        .then(data => {
            document.getElementById("header-placeholder").innerHTML = data;
            // Kích hoạt lại các nút menu sau khi HTML đã xuất hiện
            rebindHeaderEvents();
        });

    // Tải Footer
    fetch(`${path}/footer.html`)
        .then(res => res.text())
        .then(data => {
            document.getElementById("footer-placeholder").innerHTML = data;
        });
});

function rebindHeaderEvents() {
    // Menu mobile toggle
    const menuBtn = document.querySelector('#menu-btn');
    const navbar = document.querySelector('.navbar');
    if(menuBtn) menuBtn.onclick = () => navbar.classList.toggle('active');

    // Kiểm tra Login để hiện Profile
    const user = JSON.parse(localStorage.getItem('currentUser'));
    if(user) {
        document.getElementById('guest-menu').style.display = 'none';
        document.getElementById('user-profile').style.display = 'block';
        document.getElementById('display-fullname').innerText = user.fullname;
        if(user.role === 1) document.getElementById('admin-link').style.display = 'flex';
    }
}