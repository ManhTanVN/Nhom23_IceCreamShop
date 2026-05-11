<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>${blog.title} - TasteOfJoy Blog</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/style.css?v=1.9">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
    <script src="${pageContext.request.contextPath}/assets/nav.js"></script>
    <style>
        .blog-detail-container { padding: 15rem 15% 5rem; line-height: 1.8; }
        .blog-header { text-align: center; margin-bottom: 4rem; }
        .blog-header h1 { font-size: 4rem; color: #333; margin-bottom: 2rem; }
        .blog-meta { font-size: 1.6rem; color: #999; }
        .main-image { width: 100%; height: 45rem; object-fit: cover; border-radius: 2rem; margin-bottom: 4rem; }
        .blog-content { font-size: 1.8rem; color: #444; white-space: pre-line; }
        .back-btn { display: inline-block; margin-top: 4rem; font-size: 1.6rem; color: #ff7e5f; }
    </style>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/profile-dropdown.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/isw.css">
</head>
<body>
    <jsp:include page="header.jsp" />

    <article class="blog-detail-container">
        <div class="blog-header">
            <div class="blog-meta">
                <span><i class="fas fa-user"></i> ${blog.author}</span> | 
                <span><i class="fas fa-calendar"></i> <fmt:formatDate value="${blog.createdAt}" pattern="dd/MM/yyyy" /></span>
            </div>
            <h1>${blog.title}</h1>
        </div>

        <img src="${blog.imageUrl}" class="main-image" alt="${blog.title}">

        <div class="blog-content">
            ${blog.content}
        </div>

        <a href="blog" class="back-btn"><i class="fas fa-arrow-left"></i> Quay lại danh sách bài viết</a>
    </article>

    <jsp:include page="footer.jsp" />
    <script src="${pageContext.request.contextPath}/assets/login.js"></script>
    <script>
        var contextPath = "${pageContext.request.contextPath}";
    </script>
    <script src="${pageContext.request.contextPath}/assets/script.js"></script>
</body>
</html>