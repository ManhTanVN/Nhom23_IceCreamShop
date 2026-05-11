package controller;

import dao.BlogDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet(name = "BlogServlet", urlPatterns = {"/blog", "/blog-detail"})
public class BlogServlet extends HttpServlet {
    private BlogDAO blogDAO = new BlogDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String path = request.getServletPath();

        if ("/blog".equals(path)) {
            request.setAttribute("blogList", blogDAO.getAllBlogs());
            request.getRequestDispatcher("/blog.jsp").forward(request, response);
        } else if ("/blog-detail".equals(path)) {
            int id = Integer.parseInt(request.getParameter("id"));
            request.setAttribute("blog", blogDAO.getBlogById(id));
            request.getRequestDispatcher("/blog-detail.jsp").forward(request, response);
        }
    }
}