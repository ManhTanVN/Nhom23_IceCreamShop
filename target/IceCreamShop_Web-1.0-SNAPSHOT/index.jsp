<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TasteOfJoy</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/preloaderStyle.css">
    <link rel="icon" href="https://purepng.com/public/uploads/large/purepng.com-ice-creamice-creamcreamfrozensweet-1411527617895aiuhx.png" type="image/x-icon">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"> 

    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/style.css?v=2.1">
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">

    <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.12.2/gsap.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/custom.css">
    <script src="${pageContext.request.contextPath}/assets/nav.js"></script>
    
    <style>
        .skeleton-box {
            background-color: #e0e0e0;
            border-radius: 8px;
            width: 100%;
            min-height: 380px;
            animation: pulse 1.5s infinite ease-in-out;
            margin-bottom: 20px;
        }
        @keyframes pulse {
            0% { opacity: 0.6; }
            50% { opacity: 1; }
            100% { opacity: 0.6; }
        }
    </style>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/profile-dropdown.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/isw.css?v=1.5">
</head>

<body>

    <jsp:include page="drawer-cart.jsp" />

    <jsp:include page="header.jsp" />
    <script src="${pageContext.request.contextPath}/assets/preloader.js"></script>

    <section class="home" id="home" data-aos="fade-up" data-aos-anchor-placement="top-bottom">
        <div class="content">
            <h3>Trọn vị ngọt ngào</h3>
            <p>Kem tuyệt ngon giao tận tay bạn! Thưởng thức những hương vị tươi mát, mát lạnh, được làm bằng cả trái tim.</p>
            <button class="animated-button"><a href="#menu"><span style="font-size: 16px;">Đặt hàng ngay!</span></a></button>
        </div>
    </section>
    
    

    <section class="menu" id="menu">
        <div class="box-container" id="product-list">
        </div>
        <h1 class="heading" data-aos="fade-up">Thực đơn <span>tiêu biểu</span></h1>
        
        <div class="box-container">
          
          
          <c:forEach items="${productList}" var="p">
              <div class="product-item box aos-init aos-animate" data-aos="fade-up" data-aos-duration="1200" data-aos-delay="200" data-aos-anchor-placement="top-bottom">
                  
                  <a class="product-link product-link__image" href="${pageContext.request.contextPath}/products/${p.handle}">
                      <div class="picture">
                          <img src="${p.image_url}" alt="${p.name}" style="cursor: pointer;">
                          <h3 class="pro-name">${p.name}</h3>
                          <div class="flip">${p.description}</div>
                      </div>
                  </a>

                  <a class="product-link product-link__info" href="${pageContext.request.contextPath}/products/${p.handle}">
                      <div class="price">
                          <fmt:formatNumber value="${p.price}" type="number" groupingUsed="true"/>đ 
                          <span><fmt:formatNumber value="${p.original_price != null ? p.original_price : p.price + 50000}" type="number" groupingUsed="true"/>đ</span>
                      </div>
                  </a>
                  <button class="inbox" onclick="addToCart('${p.name}', ${p.price}, '${p.image_url}')">Thêm vào giỏ</button><br>
                  <div class="noofitems">
                      <button class="plus-minus" onclick="decreaseQuantity('${p.name}')">-</button>
                      <span id="itemQuantity-${p.name}">1</span>
                      <button class="plus-minus" onclick="increaseQuantity('${p.name}')">+</button>
                  </div>
                  
                  
                  <button class="my_style3 inbox" onclick="window.location.href='${pageContext.request.contextPath}/products/${p.handle}'">Xem thêm</button>
              </div>
          </c:forEach>
        </div>

        <div style="text-align: center; margin-top: 4rem;">
            <a href="${pageContext.request.contextPath}/collections" class="btn" style="padding: 1.5rem 5rem; font-size: 2rem;">
                Xem toàn bộ Menu <i class="fas fa-arrow-right"></i>
            </a>
        </div>
    </section>

    <section class="blogs" id="blogs">
      <h1 class="heading" data-aos="fade-up" data-aos-duration="1200" data-aos-delay="200" data-aos-anchor-placement="top-bottom">Bài viết <span style="color: orangered;">của chúng tôi</span></h1>
      <div class="blog-container">

        <c:forEach items="${blogList}" var="b" varStatus="status">
          <div class="blog aos-init aos-animate" 
              data-aos="${status.index == 4 ? 'zoom-out-down' : (status.index % 2 == 0 ? 'fade-up-right' : 'fade-up-left')}" 
              data-aos-duration="1200" 
              data-aos-delay="200">
              
              <img src="${b.imageUrl}" alt="${b.title}" class="blog-image" >
              
              <h3>${b.title}</h3>
              <p>${b.summary}</p>
              
              <a href="${pageContext.request.contextPath}/blog-detail?id=${b.id}" class="btn">Đọc thêm</a>
          </div>
        </c:forEach>

      </div>
    </section>
    <br><br>
    
    <div class="container">
      <div class="container__left">
        <h1 data-aos="zoom-out-down" >Khách hàng nói gì về kem của chúng tôi</h1>
        <p data-aos="zoom-out-down" data-aos-duration="1200" data-aos-delay="200">
          Hơn 200 người yêu thích kem từ khắp nơi đã thưởng thức các hương vị độc đáo và không thể ngừng khen ngợi các sản phẩm của chúng tôi.
        </p>
        <p data-aos="zoom-out-down" data-aos-duration="1200" data-aos-delay="200">
          Chúng tôi biến mỗi viên kem thành một kỷ niệm đáng nhớ, mang lại nụ cười và niềm vui qua từng tuyệt tác kem thủ công.
        </p>
        <button data-aos="zoom-out-down" data-aos-duration="1200" data-aos-delay="200" class="custom-btn">Đọc thêm các câu chuyện</button>
      </div>
      <div class="container__right">
        <style>
          .my_style1:hover {
            background-color: orange;
            box-shadow: 0 0 20px orange;
          }
        </style>
        <div class="card my_style1" data-aos="zoom-out-down" data-aos-duration="1200" data-aos-delay="200">
          <img src="https://images.unsplash.com/photo-1482961674540-0b0e8363a005?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjB8fG1hbnxlbnwwfHwwfHx8MA%3D%3D" alt="customer" />
          <div class="card__content">
            <span><i class="ri-double-quotes-l"></i></span>
            <div class="card__details" >
              <p>"Vị caramel muối thật tuyệt đỉnh! Kết cấu mềm mịn và hương vị đậm đà đã hoàn toàn chinh phục tôi."</p>
              <h4>- Marnus Stephen</h4>
            </div>
          </div>
        </div>
        <div class="card my_style1" data-aos="zoom-out-down" data-aos-duration="1200" data-aos-delay="200">
          <img src="https://plus.unsplash.com/premium_photo-1689539137236-b68e436248de?q=80&w=2071&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" alt="customer" width="400"/>
          <div class="card__content">
            <span><i class="ri-double-quotes-l"></i></span>
            <div class="card__details">
              <p>"Tôi đã thử sorbet xoài, giống hệt như đang cắn một trái xoài tươi vậy! Chắc chắn tôi sẽ quay lại."</p>
              <h4>- Andrew Jettpace</h4>
            </div>
          </div>
        </div>
        <div class="card my_style1" data-aos="zoom-out-down" data-aos-duration="1200" data-aos-delay="200">
          <img src="https://plus.unsplash.com/premium_photo-1688385848467-781c5394c017?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTd8fHdvbWFufGVufDB8fDB8fHww" alt="customer" />
          <div class="card__content">
            <span><i class="ri-double-quotes-l"></i></span>
            <div class="card__details">
              <p>"Không nghi ngờ gì nữa, đây là loại kem ngon nhất tôi từng ăn! Vị cheesecake dâu tây đúng là đỉnh của chóp!"</p>
              <h4>- Stacy Stone</h4>
            </div>
          </div>
        </div>
      </div>
    </div>
    <section class="review-section" id="review-section">
      <div class="review-container">
        <div class="review-left">
          <img data-aos="zoom-out-down" data-aos-duration="1200" data-aos-delay="200" src="https://images.unsplash.com/photo-1505394033641-40c6ad1178d7?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8aWNlY3JlYW18ZW58MHx8MHx8fDA%3D" alt="Delicious Ice Cream" class="ice-cream-image">
        </div>
        <div class="review-right">
          <h2 data-aos="zoom-out-down" data-aos-duration="1200" data-aos-delay="200">Chia sẻ cảm nhận của bạn!</h2>
          <form id="review-form" onsubmit="storeReview(event)">
            <label for="user-name" data-aos="zoom-out-down" data-aos-duration="1200" data-aos-delay="200">Tên của bạn:</label>
            <input type="text" id="user-name" name="user-name" data-aos="zoom-out-down" required>
            <label for="user-review" data-aos="zoom-out-down" data-aos-duration="1200" data-aos-delay="200">Đánh giá của bạn:</label>
            <textarea id="user-review" name="user-review" rows="5" required data-aos="zoom-out-down" style="resize: none;"></textarea>
            <style>.my_style4 { font-size: 1.6rem; height: 50px; }</style>
            <button class="my_style4 submit-button" type="submit" data-aos="zoom-out-down">Gửi đánh giá</button>
          </form>
          <script>
            function storeReview(event) {
              event.preventDefault(); 
              const userName = document.getElementById('user-name').value.trim();
              const userReview = document.getElementById('user-review').value.trim();
              if (userName === '' || userReview === '') { alert('Điền đủ tên!'); return; }
              const newReview = { name: userName, review: userReview };
              let reviews = JSON.parse(localStorage.getItem('reviews')) || [];
              reviews.unshift(newReview); 
              localStorage.setItem('reviews', JSON.stringify(reviews));
              alert('Cảm ơn!'); 
            }
          </script>
        </div>
      </div>
    </section>

    <jsp:include page="footer.jsp" />
    
    <script>
        document.addEventListener('DOMContentLoaded', () => {
            gsap.from(".search-form", { opacity: 0, x: -100, duration: 1, ease: "power2.out" });
            gsap.from(".home .content h3", { opacity: 0, x: -100, duration: 1.5, delay :0.1, ease: "power2.out" });
            const buttons = document.querySelectorAll("button");
            buttons.forEach(button => {
                button.addEventListener('mouseover', () => { gsap.to(button, { scale: 1.1, duration: 0.2 }); });
                button.addEventListener('mouseout', () => { gsap.to(button, { scale: 1, duration: 0.2 }); });
            });
        });
    </script>
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
    <script>AOS.init();</script>
    <script src="${pageContext.request.contextPath}/assets/login.js"></script>
    <script>
        var contextPath = "${pageContext.request.contextPath}";
    </script>
    <script src="${pageContext.request.contextPath}/assets/script.js?version=3.8"></script>
</body>
</html>
<!-- git config --global --add safe.directory 'D:/PTIT2/All Courses From School/hoc_ky-3/ltweb/IceCreamShop_Web' -->