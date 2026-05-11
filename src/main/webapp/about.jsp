<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Về Chúng Tôi - TasteOfJoy Team</title>
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/style.css?v=1.9">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/profile-dropdown.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/isw.css?v=1.5">
    <script src="${pageContext.request.contextPath}/assets/nav.js"></script>
    
    <style>
        :root {
            --primary-color: #ff7e5f;
            --text-color: #333;
            --bg-light: #f9f9f9;
        }

        .about-page {
            padding: 15rem 7% 5rem;
            background: var(--bg-light);
            text-align: center;
        }

        .about-header {
            margin-bottom: 5rem;
        }

        .about-header h1 {
            font-size: 4rem;
            color: var(--text-color);
            text-transform: uppercase;
        }

        .about-header p {
            font-size: 1.8rem;
            color: #666;
            margin-top: 1rem;
        }

        /* Container cho các thành viên */
        .team-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(25rem, 1fr));
            gap: 3rem;
            align-items: start;
        }

        /* Style cho từng Card thành viên */
        .member-card {
            background: #fff;
            padding: 3rem;
            border-radius: 2rem;
            box-shadow: 0 1rem 2rem rgba(0,0,0,0.05);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            position: relative;
            overflow: hidden;
        }

        .member-card:hover {
            transform: translateY(-1rem);
            box-shadow: 0 1.5rem 3rem rgba(0,0,0,0.1);
        }

        /* Highlight cho Leader */
        .member-card.leader {
            border: 2px solid var(--primary-color);
        }

        .leader-badge {
            position: absolute;
            top: 1rem;
            right: -3rem;
            background: var(--primary-color);
            color: #fff;
            padding: 0.5rem 4rem;
            transform: rotate(45deg);
            font-size: 1.2rem;
            font-weight: bold;
        }

        .member-img {
            width: 12rem;
            height: 12rem;
            border-radius: 50%;
            background: #eee;
            margin: 0 auto 2rem;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 5rem;
            color: var(--primary-color);
        }

        .member-info h3 {
            font-size: 2.2rem;
            color: var(--text-color);
            margin-bottom: 0.5rem;
        }

        .member-info p {
            font-size: 1.6rem;
            color: #ff7e5f;
            font-weight: bold;
            margin-bottom: 1rem;
        }

        .mssv {
            font-size: 1.4rem;
            color: #999;
            background: #f0f0f0;
            padding: 0.5rem 1rem;
            border-radius: 0.5rem;
            display: inline-block;
        }

        .social-links {
            margin-top: 2rem;
            display: flex;
            justify-content: center;
            gap: 1.5rem;
        }

        .social-links a {
            font-size: 2rem;
            color: #666;
            transition: color 0.3s;
        }

        .social-links a:hover {
            color: var(--primary-color);
        }
        .about-page .heading span {
            color: #ff7e5f;
        }
    </style>
</head>
<body>

    <jsp:include page="drawer-cart.jsp" />
    <jsp:include page="header.jsp" />

    <section class="about-page">
        <div class="about-header">
            <h1 class="heading">Đội ngũ <span>phát triển</span></h1>
            <p>Dự án Website bán kem TasteOfJoy - Nhóm học phần Công nghệ Web</p>
        </div>

        <div class="team-container">
            
            <div class="member-card leader">
                <div class="leader-badge">LEADER</div>
                <div class="member-img">
                    <i class="fas fa-user-tie"></i>
                </div>
                <div class="member-info">
                    <h3>Nguyễn Văn Tân</h3>
                    <p>Trưởng Nhóm / Fullstack</p>
                    <span class="mssv">MSSV: K25DTCN306</span>
                </div>
                <div class="social-links">
                    <a href="#"><i class="fab fa-facebook"></i></a>
                    <a href="#"><i class="fab fa-github"></i></a>
                    <a href="#"><i class="fas fa-envelope"></i></a>
                </div>
            </div>

            <div class="member-card">
                <div class="member-img">
                    <i class="fas fa-user"></i>
                </div>
                <div class="member-info">
                    <h3>Nguyễn Cảnh Tuấn</h3>
                    <p>Backend Developer</p>
                    <span class="mssv">MSSV: K25DTCN310</span>
                </div>
                <div class="social-links">
                    <a href="#"><i class="fab fa-facebook"></i></a>
                    <a href="#"><i class="fab fa-github"></i></a>
                </div>
            </div>

            <div class="member-card">
                <div class="member-img">
                    <i class="fas fa-user"></i>
                </div>
                <div class="member-info">
                    <h3>Phạm Tiến Long</h3>
                    <p>Frontend Developer</p>
                    <span class="mssv">MSSV: K25DTCN284</span>
                </div>
                <div class="social-links">
                    <a href="#"><i class="fab fa-facebook"></i></a>
                    <a href="#"><i class="fab fa-github"></i></a>
                </div>
            </div>

            <div class="member-card">
                <div class="member-img">
                    <i class="fas fa-user"></i>
                </div>
                <div class="member-info">
                    <h3>Trịnh Văn Chung</h3>
                    <p>Database Designer</p>
                    <span class="mssv">MSSV: K25DTCN280</span>
                </div>
                <div class="social-links">
                    <a href="#"><i class="fab fa-facebook"></i></a>
                    <a href="#"><i class="fab fa-github"></i></a>
                </div>
            </div>

            <div class="member-card">
                <div class="member-img">
                    <i class="fas fa-user-nurse"></i>
                </div>
                <div class="member-info">
                    <h3>Nguyễn Thanh Thủy</h3>
                    <p>UI/UX Designer</p>
                    <span class="mssv">MSSV: K25DTCN317</span>
                </div>
                <div class="social-links">
                    <a href="#"><i class="fab fa-facebook"></i></a>
                    <a href="#"><i class="fab fa-instagram"></i></a>
                </div>
            </div>

        </div>
    </section>

    <jsp:include page="footer.jsp" />

    <script src="${pageContext.request.contextPath}/assets/login.js"></script>
    <script>
        var contextPath = "${pageContext.request.contextPath}";
    </script>
    <script src="${pageContext.request.contextPath}/assets/script.js?version=3.8"></script>
</body>
</html>