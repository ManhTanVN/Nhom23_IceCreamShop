<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Blog Kem - TasteOfJoy</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/style.css?v=1.9">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/profile-dropdown.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/isw.css">
    <script src="${pageContext.request.contextPath}/assets/nav.js"></script>
    <style>
        .blog-section { padding: 15rem 7% 5rem; }
        .blog-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(30rem, 1fr));
            gap: 2.5rem;
        }
        .blog-card {
            background: #fff;
            border-radius: 1.5rem;
            overflow: hidden;
            box-shadow: 0 0.5rem 1.5rem rgba(0,0,0,0.1);
            transition: 0.3s;
            display: flex;
            flex-direction: column;
        }
        .blog-card:hover { transform: translateY(-1rem); }
        .blog-card .image { height: 20rem; width: 100%; overflow: hidden; }
        .blog-card .image img { height: 100%; width: 100%; object-fit: cover; }
        .blog-card .content { padding: 2rem; flex-grow: 1; display: flex; flex-direction: column; }
        .blog-card .content h3 { font-size: 2rem; color: #333; margin-bottom: 1rem; }
        .blog-card .content p { 
            font-size: 1.5rem; color: #666; line-height: 1.6;
            display: -webkit-box; -webkit-line-clamp: 3; -webkit-box-orient: vertical;
            overflow: hidden; margin-bottom: 1rem;
        }
        .blog-card .info {
            display: flex; justify-content: space-between;
            margin-top: auto; padding-top: 1.5rem; border-top: 1px solid #eee;
            font-size: 1.3rem; color: #999;
        }
        .blog-card .info span i { color: #ff7e5f; margin-right: 0.5rem; }
    </style>
</head>
<body>
    <jsp:include page="header.jsp" />
    <jsp:include page="drawer-cart.jsp" />

    <section class="blog-section">
        <h1 class="heading">Bài viết <span>mới nhất</span></h1>

        <div class="blog-container">
            <c:forEach items="${blogList}" var="b">
                <div class="blog-card">
                    <div class="image">
                        <img src="${b.imageUrl}" alt="${b.title}">
                    </div>
                    <div class="content">
                        <h3>${b.title}</h3>
                        <p>${b.summary}</p>
                        <div class="info">
                            <span><i class="fas fa-user"></i> ${b.author}</span>
                            <span><i class="fas fa-calendar"></i> 
                                <fmt:formatDate value="${b.createdAt}" pattern="dd/MM/yyyy" />
                            </span>
                        </div>
                        <a href="blog-detail?id=${b.id}" class="btn" style="margin-top: 1.5rem;">Đọc thêm</a>
                    </div>
                </div>
            </c:forEach>
        </div>
    </section>

    <jsp:include page="footer.jsp" />
    
    <script src="${pageContext.request.contextPath}/assets/login.js"></script>
    <script>
        var contextPath = "${pageContext.request.contextPath}";
    </script>
    <script src="${pageContext.request.contextPath}/assets/script.js"></script>
</body>
</html>