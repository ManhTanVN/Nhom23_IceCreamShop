<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chính Sách Bảo Mật - TasteOfJoy</title>
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/style.css?v=1.9">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/profile-dropdown.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/isw.css?v=1.5">
    <script src="${pageContext.request.contextPath}/assets/nav.js"></script>
    
    <style>
        .privacy-page {
            padding: 15rem 10% 15rem;
            line-height: 1.8;
            background: #fff;
        }

        .privacy-container {
            max-width: 1000px;
            margin: 0 auto;
            background: #fdfdfd;
            padding: 4rem;
            border-radius: 1.5rem;
            box-shadow: 0 0.5rem 2rem rgba(0,0,0,0.05);
        }

        .privacy-container h1 {
            font-size: 3.5rem;
            color: #333;
            margin-bottom: 2rem;
            text-align: center;
        }

        .privacy-container h2 {
            font-size: 2.2rem;
            color: #ff7e5f;
            margin-top: 3rem;
            margin-bottom: 1.5rem;
            border-left: 5px solid #ff7e5f;
            padding-left: 1.5rem;
        }

        .privacy-container p, .privacy-container li {
            font-size: 1.6rem;
            color: #666;
            margin-bottom: 1.5rem;
        }

        .privacy-container ul {
            margin-left: 2rem;
            margin-bottom: 2rem;
        }

        .last-updated {
            font-style: italic;
            color: #999;
            text-align: center;
            margin-bottom: 4rem;
            font-size: 1.4rem;
        }

        .contact-box {
            background: #fff5f2;
            padding: 2rem;
            border-radius: 1rem;
            margin-top: 4rem;
            border: 1px dashed #ff7e5f;
        }
    </style>
</head>
<body>

    <jsp:include page="drawer-cart.jsp" />
    <jsp:include page="header.jsp" />

    <section class="privacy-page">
        <div class="privacy-container">
            <h1>Chính Sách Bảo Mật</h1>
            <p class="last-updated">Cập nhật lần cuối: Ngày 9 tháng 5, năm 2026</p>

            <p>Chào mừng bạn đến với <strong>TasteOfJoy</strong>. Chúng tôi tôn trọng quyền riêng tư của bạn và cam kết bảo vệ thông tin cá nhân mà bạn cung cấp. Chính sách này mô tả cách chúng tôi thu thập, sử dụng và bảo mật thông tin của bạn.</p>

            <h2>1. Thông tin chúng tôi thu thập</h2>
            <p>Khi bạn sử dụng website, chúng tôi có thể thu thập các thông tin sau:</p>
            <ul>
                <li><strong>Thông tin cá nhân:</strong> Tên, địa chỉ email, số điện thoại và địa chỉ giao hàng khi bạn đăng ký tài khoản hoặc đặt hàng.</li>
                <li><strong>Dữ liệu giao dịch:</strong> Chi tiết về các loại kem bạn đã mua và lịch sử thanh toán.</li>
                <li><strong>Dữ liệu kỹ thuật:</strong> Địa chỉ IP, loại trình duyệt và thông tin về phiên làm việc (Session) để duy trì giỏ hàng.</li>
            </ul>

            <h2>2. Cách chúng tôi sử dụng thông tin</h2>
            <p>Thông tin của bạn được sử dụng cho các mục đích:</p>
            <ul>
                <li>Xử lý và giao đơn hàng kem đến tận tay bạn.</li>
                <li>Duy trì trạng thái đăng nhập và giỏ hàng cá nhân hóa.</li>
                <li>Gửi thông báo về tình trạng đơn hàng hoặc các chương trình khuyến mãi (nếu bạn đăng ký).</li>
                <li>Cải thiện trải nghiệm người dùng trên website.</li>
            </ul>

            <h2>3. Bảo mật dữ liệu</h2>
            <p>Chúng tôi thực hiện các biện pháp bảo mật nghiêm ngặt để bảo vệ dữ liệu của bạn:</p>
            <ul>
                <li>Mật khẩu của bạn được mã hóa an toàn trong cơ sở dữ liệu.</li>
                <li>Chúng tôi sử dụng <strong>HttpSession</strong> để quản lý phiên làm việc, đảm bảo giỏ hàng của người dùng này không bị lẫn lộn với người dùng khác.</li>
                <li>Dữ liệu thanh toán được xử lý qua các cổng bảo mật (nếu có).</li>
            </ul>

            <h2>4. Quyền lợi của người dùng</h2>
            <p>Bạn có quyền truy cập, chỉnh sửa hoặc yêu cầu xóa thông tin cá nhân của mình bất kỳ lúc nào bằng cách đăng nhập vào tài khoản hoặc liên hệ với đội ngũ quản trị viên của chúng tôi.</p>

            <h2>5. Thay đổi chính sách</h2>
            <p>TasteOfJoy có quyền cập nhật chính sách bảo mật này để phù hợp với các thay đổi về pháp luật hoặc dịch vụ của chúng tôi. Mọi thay đổi sẽ được thông báo công khai trên trang web.</p>

            <div class="contact-box">
                <p style="font-weight: bold; color: #ff7e5f; margin-bottom: 0.5rem;">Bạn có thắc mắc?</p>
                <p>Mọi câu hỏi liên quan đến chính sách bảo mật, vui lòng liên hệ với Leader <strong>Nguyễn Văn Tân</strong> hoặc đội ngũ hỗ trợ qua email: <a href="mailto:support@tasteofjoy.com" style="color: #333;">support@tasteofjoy.com</a></p>
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