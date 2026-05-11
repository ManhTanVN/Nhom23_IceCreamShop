<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<%
    String queryString = "";
    Object sort = request.getAttribute("currentSort");
    Object q = request.getAttribute("searchQuery");
    String minP = request.getParameter("minPrice");
    String maxP = request.getParameter("maxPrice");

    if (sort != null && !sort.toString().isEmpty()) queryString += "&sort=" + sort;
    if (q != null && !q.toString().isEmpty()) queryString += "&q=" + q;
    if (minP != null && !minP.isEmpty()) queryString += "&minPrice=" + minP;
    if (maxP != null && !maxP.isEmpty()) queryString += "&maxPrice=" + maxP;
    
    request.setAttribute("query", queryString);
%>
<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tất cả sản phẩm - TasteOfJoy</title>
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/preloaderStyle.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"> 
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/style.css?v=2.2">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/custom.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/isw.css">
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/assets/nav.js"></script>

    <style>
        .collection-header {
            padding-top: 6rem;
            padding-bottom: 3rem;
            text-align: center;
            background-color: #ff7e5f;
        }
        .collection-header h1 { font-size: 4rem; color: #333; }
        .skeleton-box {
            background-color: #e0e0e0;
            height: 380px;
            border-radius: 8px;
            animation: pulse 1.5s infinite;
        }
        @keyframes pulse { 0%, 100% { opacity: 0.6; } 50% { opacity: 1; } }
    </style>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/product-grid-filter.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/profile-dropdown.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/isw.css?v=1.5">
</head>

<body>
    <jsp:include page="drawer-cart.jsp" />
    <jsp:include page="header.jsp" />
    <script src="${pageContext.request.contextPath}/assets/preloader.js"></script>
    
    <section class="collection-header">
        <h1>Thế Giới Kem Ngọt Ngào</h1>
        <p>Khám phá tất cả những hương vị kem tuyệt vời nhất của chúng tôi</p>
    </section>

    <div class="collection-container">
        <aside class="filter-sidebar">
            <h3>Bộ lọc tìm kiếm</h3>
            <form action="collections" method="GET">
                <div class="filter-group">
                    <h4>Tìm kiếm nhanh</h4>
                    <input type="text" name="q" value="${searchQuery}" placeholder="Nhập tên kem...">
                </div>

                <div class="filter-group">
                    <h4>Sắp xếp theo</h4>
                    <select name="sort" id="sort-order" class="filter-select" onchange="this.form.submit()">
                        <option value="manual" ${currentSort == 'manual' ? 'selected' : ''}>Mặc định</option>
                        <option value="newest" ${currentSort == 'newest' ? 'selected' : ''}>Mới nhất</option>
                        <option value="price-asc" ${currentSort == 'price-asc' ? 'selected' : ''}>Giá: Thấp đến Cao</option>
                        <option value="price-desc" ${currentSort == 'price-desc' ? 'selected' : ''}>Giá: Cao đến Thấp</option>
                        <option value="name-asc" ${currentSort == 'name-asc' ? 'selected' : ''}>Tên: A - Z</option>
                        <option value="name-desc" ${currentSort == 'name-desc' ? 'selected' : ''}>Tên: Z - A</option>
                    </select>
                </div>

                <div class="filter-group">
                    <h4>Giá tối thiểu</h4>
                    <input type="number" name="minPrice" value="${param.minPrice}" placeholder="đ">
                </div>

                <div class="filter-group">
                    <h4>Giá tối đa</h4>
                    <input type="number" name="maxPrice" value="${param.maxPrice}" placeholder="đ">
                </div>

                <button type="submit" class="btn" style="width: 100%; margin-top: 0;">Áp dụng bộ lọc</button>
                
                <a href="collections" class="btn" style="width: 100%; text-align: center; background: #eee; color: #333;">Xóa lọc</a>
            </form>
        </aside>

        <main class="product-content">
            <div class="results-info" data-aos="fade-down">
                Hiển thị <span>${totalProducts}</span> sản phẩm kem
                <c:if test="${not empty searchQuery}"> cho từ khóa "<span>${searchQuery}</span>"</c:if>
            </div>

            <div class="box-container" id="collection-list">
                <c:forEach items="${productList}" var="p">
                    <div class="product-item">
                  
                        <a class="product-item-link product-item-link__image" href="${pageContext.request.contextPath}/products/${p.handle}">
                            <div class="product-item-picture">
                                <img src="${p.image_url}" alt="${p.name}" style="cursor: pointer;" class="product-item--img">
                                <h3 class="product-item--name">${p.name}</h3>
                                <div class="flip">${p.description}</div>
                            </div>
                        </a>

                        <a class="product-item-link product-item-link__info" href="${pageContext.request.contextPath}/products/${p.handle}">
                            <div class="price">
                                <fmt:formatNumber value="${p.price}" type="number" groupingUsed="true"/>đ 
                                <span><fmt:formatNumber value="${p.original_price != null ? p.original_price : p.price + 50000}" type="number" groupingUsed="true"/>đ</span>
                            </div>
                        </a>
                        <div class="noofitems">
                            <button class="plus-minus" onclick="decreaseQuantity('${p.name}')">-</button>
                            <span id="itemQuantity-${p.name}">1</span>
                            <button class="plus-minus" onclick="increaseQuantity('${p.name}')">+</button>
                        </div>
                        
                        <button class="inbox" onclick="addToCart('${p.name}', ${p.price}, '${p.image_url}')">Thêm vào giỏ</button><br>
                        
                        <button class="my_style3 inbox" onclick="window.location.href='${pageContext.request.contextPath}/products/${p.handle}'">Xem thêm</button>
                    </div>
                </c:forEach>
            </div>

            <c:if test="${totalPages > 1}">
                <div class="pagination">
                    <c:forEach begin="1" end="${totalPages}" var="i">
                        <a href="collections?page=${i}${query}" 
                        class="page-link ${currentPage == i ? 'active' : ''}">
                        ${i}
                        </a>
                    </c:forEach>
                </div>
            </c:if>
        </main>
    </div>

    <jsp:include page="footer.jsp" />

    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
    <script>
        AOS.init();
    </script>
    <script src="${pageContext.request.contextPath}/assets/login.js"></script>
    <script>
        var contextPath = "${pageContext.request.contextPath}";
    </script>
    <script src="${pageContext.request.contextPath}/assets/script.js?version=4.1"></script>
</body>
</html>